namespace: vue

(def (component . plist)
  (def rlist [])
  (let loop ((pl plist))
    (if (not (null? pl))
      (let ((key (car pl))
            (val (cadr pl))
            (rst (cddr pl)))
        (cond ((eq? data: key)
               (set! val (let ((v (js#js->foreign (js#plist->jso val))))
                            v)))
              ((and (eq? template: key) (##symbol? val))
               (set! val (##symbol->string val))))
        (set! rlist (cons key (cons val rlist)))
        (loop rst))))
  (let ((jso (js#plist->jso rlist)))
    (##inline-host-expression "comp = (@1@); const data = comp.data;
         comp.data = function () { return data } ; comp;" jso)))

(##inline-host-statement
 "exports.ButtonCounter = (@1@);"
 (component
  name: "button-counter"
  data: [ count: 0 ]
  template: '|<button v-on:click="count++"> Gerbil!! You clicked me {{ count }} times.</button>|))
