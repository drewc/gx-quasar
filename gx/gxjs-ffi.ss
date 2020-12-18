namespace: js
(export @method @@method)

(import
  (prefix-in (only-in <MOP> @method) @))

(defsyntax (@method stx)
  (syntax-case stx ()
    ((_ kv ...)
     #'(js#jso kv ...))))

(def (console.log . objs)
  (##inline-host-statement "console.log.apply(this, (@1@))" (##list->vector objs)))

(def (debug . args) (##apply console.log (map scm->js args)))

(def (console.error . objs)
  (##inline-host-statement "console.error.apply(this, (@1@))" (##list->vector objs)))
(def (undefined? thing)
  (##inline-host-expression "(() => { res = @1@ === undefined ; return g_host2scm(res); })()" thing))

(def (new-plist->jso plist)
  (def alist [])
  (let lp ((pl plist))
    (if (null? pl)
      (let ((jso ((lambda () (##inline-host-expression "(() => { foo = (@1@);  return g_host2foreign(g_scm2host(foo)); })();"
                                            (reverse alist))))))
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

(def (jso . plist)
  (if (null? plist) (##inline-host-expression "g_host2scm({});")
  (new-plist->jso plist)))


(def (ref obj key . keys)
  (let ((v
         (##inline-host-expression "((obj, ref) => {
   if (obj instanceof G_Foreign) {
      obj = g_foreign2host(obj);
   } else if (typeof obj != 'object') {
     return;
   };
 return g_host2scm(obj[ref]);

})(@1@, @2@);" obj key)))
    (if (null? keys) v
        (##apply ref v keys))))
(def (ref-set! obj ref . refs-and-val)
  ;; (js#console.log 1765 obj ref (null? (cdr refs-and-val))(car refs-and-val) (cdr refs-and-val))
  (if (null? (cdr refs-and-val))
      (##inline-host-expression "((obj, ref, val) => {
   if (obj instanceof G_Foreign) {
      obj = g_foreign2host(obj);
   }

   if (val instanceof G_Foreign) {
      val = g_foreign2host(val);
   }
 // if (typeof ref !== 'number') { console.log('setting', obj, 'key', ref, 'to', val) };
 obj[ref] = val;
 return g_host2scm(val);

})(@1@, @2@, @3@);" obj ref (car refs-and-val))
      ;; We want an object to set something in
      (let* ((nobj (js#ref obj ref))
             (nobj (if (js#undefined? nobj)
                    (js#ref-set! obj ref (js#jso (car refs-and-val) nobj))
                    nobj)))
        ;; (js#console.log 765 obj ref nobj)
        (apply js#ref-set! nobj refs-and-val))))



(def (Object.keys obj)
  (def js-obj (if (##foreign? obj) (js#scm->js obj) obj))
  (def vkeys (##inline-host-expression "g_host2scm(Object.keys(@1@))" js-obj))
  vkeys)

(def (map-object fn obj)
  (vector-map (lambda (k) (fn k (js#ref obj k))) (js#Object.keys obj)))


(def (alert thing) (##inline-host-statement "var foo = (@1@);
  var bar = typeof foo === 'string' ? foo : g_scm2host(foo)
  alert(bar);" thing))

;; (alert "New FFi")

(def (js->foreign obj)
  (##inline-host-expression "g_host2foreign(@1@);" obj))
(def (foreign->js obj)
  (if (not (##foreign? obj))
    (##error "Not a foreign object"))
  (##inline-host-expression "g_foreign2host(@1@);" obj))


(def (scm->js obj)
  (begin
    (##inline-host-statement "var result;")
    (##inline-host-statement "try {result = g_scm2host(@1@);} catch (e) {result = Error(e);}" obj)
    (let ((result (##inline-host-expression "result;")))
      (if (js->scm (##inline-host-expression "@1@ instanceof Error;" result))
          (##error result)
          result))))

(def (js->scm obj)
  (##inline-host-expression "g_host2scm(@1@);" obj))

(def (JSON.stringify jso (f2host #t))
  (let ((obj (if (and f2host (##foreign? jso)) (js#foreign->js jso) jso)))
    (##inline-host-expression "g_host2scm(JSON.stringify(@1@));" obj)))

(def (plist->jso plist)
  (def jso (##make-vector 0))
  (def (p->o p)
    (if (null? p) jso
        (begin ; (console.log p)
               (set! jso (##vector-set!
                          jso (##car p)
                          (let ((obj (##cadr p)))
                            (if (##foreign? obj)
                              (##inline-host-expression "g_foreign2host(@1@);" obj)
                             ; (if (##procedure? obj) obj
                              (##inline-host-expression "g_scm2host(@1@);" obj)))))
               (p->o (##cddr p)))))
  (##inline-host-expression "Object.fromEntries(Object.entries(@1@));" (p->o plist)))
