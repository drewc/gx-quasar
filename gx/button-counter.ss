(import :js/syntax)

(def (js#new-plist->jso plist)
  (def alist [])
  (let lp ((pl plist))
    (if (null? pl)
      (let ((jso ((lambda () (##inline-host-expression "(() => { foo = (@1@);  return g_host2foreign(g_scm2host(foo)); })();"
                                            alist)))))
        ;; (js#console.log jso)
        jso)
        (let* ((key (##car pl))
               (key (if (or (keyword? key) (symbol? key))
                      (##symbol->string key)
                      key))
               (val (##cadr pl))
               (rest (##cddr pl)))
        (set! alist (##cons (##cons key val) alist))
        (lp rest)))))

(def (js#jso . plist)
  (js#new-plist->jso plist))

(def (js#ref obj ref)
  (##inline-host-expression "((obj, ref) => {
   if (obj instanceof G_Foreign) {
      obj = g_foreign2host(obj);
   }
return obj[ref];

})(@1@, @2@);" obj ref))

(def (js#ref-set! obj ref val)
  (##inline-host-expression "((obj, ref, val) => {
   if (obj instanceof G_Foreign) {
      obj = g_foreign2host(obj);
   }
return (obj[ref] = val);

})(@1@, @2@, @3@);" obj ref val))

(def (##number->string n)
  (##inline-host-expression "(() => { n = g_scm2host(@1@) ; return g_host2scm(n.toString()); })();" n))

(defsyntax (js#++ stx)
  (syntax-case stx ()
    ((macro place number)
       #'(let ((val place))
           (set! place (+ val number))))
    ((macro place)
     #'(macro place 1))))

(def render-button-counter
    (js#jso
     name: "ButtonCounter"
     data: (lambda _ (js#jso count: 0))
     render: (js#function (createElement)
              (createElement
               "button"
               (js#jso
                on: (js#jso
                     click: (lambda _ (js#++ (js#ref js#this count:)))))
               (##string-append "Scheme Render?: You clicked me " (##number->string (js#ref js#this count:)) " times")))))

(def render-button-counter-js
  (vue#component
   name: "ButtonCounter"
   data: [count: 0]
   render: #;(lambda (create-element) (create-element "button" "here"))
   (js#js->foreign (##inline-host-expression "function (createElement) {
    return createElement(
      'button',
      {
        on: {
          click: () => { this.count++ }
        }
      },
        'Gerbil Render: You clicked me ' + this.count + ' times.');
  }"))
   ))

(##inline-host-statement
 "exports.lazyButtonCounter = (@1@);
  exports.renderButtonCounter = g_scm2host(@2@);
  window.renb = exports.renderButtonCounter;
   console.log('lazy init!! button!!');"
(vue#component
  name: "button-counter"
  data: [ count: 0 ]
  template: '|<button v-on:click="count++"> LAZYYY!!!! You clicked me {{ count }} times.</button>|)

  render-button-counter)
