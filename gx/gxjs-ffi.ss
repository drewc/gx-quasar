namespace: js

(def (alert thing) (##inline-host-statement "var foo = (@1@);
  var bar = typeof foo === 'string' ? foo : g_scm2host(foo)
  alert(bar);" thing))
(def (console.log obj) (##inline-host-statement "console.log((@1@))" obj))
(def (console.error obj) (##inline-host-statement "console.error((@1@))" obj))

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
