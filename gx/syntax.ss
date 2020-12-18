namespace: #f


(import
  (prefix-in (only-in <MOP> @method) @))

(defsyntax (@method stx)
  (syntax-case stx ()
    ((_ kv ...)
     #'(js#jso kv ...))))

(export js#function js#this js#++)

(export @method @@method)
(def js#this (##inline-host-expression "window;"))

(defsyntax (js#function stx)
  (syntax-case stx ()
    ((macro _args body ...)
     (let* ((args (syntax->datum #'_args))
            (binds (let lp ((bs args) (n 0))
                     (if (null? bs) bs
                         (cons (list (car bs) `(##vector-ref js#arguments ,n))
                               (lp (cdr bs) (+ n 1)))))))
       (with-syntax ((lbinds (datum->syntax #'macro binds))
                     (this
                      (datum->syntax #'macro 'js#this))
                     (args (datum->syntax #'macro 'js#arguments)))
           #'(let ((fn (lambda (this args)
                         (let lbinds
                             (begin (##inline-host-expression "undefined") body ...)))))
               (js#js->foreign (##inline-host-expression
                              "function (...args) { let scmProc = g_scm2host(@1@);
  return scmProc(this, args);
   };" fn))))))))

(defsyntax (js#++ stx)
  (syntax-case stx ()
    ((macro place number)
       #'(let ((val place))
           (set! place (+ val number))))
    ((macro place)
     #'(macro place 1))))
