namespace: #f
(export js#function js#this)

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
           #'(let ((fn (lambda (this args) (let lbinds body ...))))
               (js#js->foreign (##inline-host-expression
                              "function (...args) { let scmProc = g_scm2host(@1@);
  return scmProc(this, args);
   };" fn))))))))
