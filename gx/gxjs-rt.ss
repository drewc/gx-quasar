namespace: "#"
(declare (extended-bindings))
(declare (not inline))

(def (alert thing) (##inline-host-statement "var foo = (@1@);
  var bar = typeof foo === 'string' ? foo : g_scm2host(foo)
  alert(bar);" thing))
(def (console.log obj) (##inline-host-statement "console.log((@1@))" obj))

;; (define (apply proc arg1 . rest)
;;   (if (##pair? rest)

;;       (let loop ((prev arg1) (lst rest))
;;         (let ((temp (##car lst)))
;;           (##set-car! lst prev)
;;           (let ((tail (##cdr lst)))
;;             (if (##pair? tail)
;;                 (loop temp tail)
;;                 (begin
;;                   (##set-cdr! lst temp)
;;                   (##apply proc rest))))))

;;       (##apply proc arg1)))

(def (plist->jso plist)
  (def jso (##make-vector 0))
  (def (p->o p)
    (if (null? p) jso
        (begin ; (console.log p)
               (set! jso (##vector-set!
                          jso (car p)
                          (##inline-host-expression "g_scm2host(@1@);" (cadr p))))
               (p->o (cddr p)))))
  (##inline-host-expression "Object.fromEntries(Object.entries(@1@));" (p->o plist)))

(def (length lst)
  (if (null? lst) 0 (+ 1 (length (##cdr lst)))))

(def (list->vector lst)
  (def n (##length lst))
  (def vec (##make-vector n))

  (let loop ((i 0) (l lst))
    (if (not (null? l))
      (begin
        (##vector-set! vec i (##car l))
        (loop (+ i 1) (##cdr l)))))
  vec)

(def (gambit-module-name mod)
  (def obj (##vector-ref (##vector-ref mod 0) 0))
  (##inline-host-expression "(@1@).name" obj))

(def (init-gambit-module mod)
  (let ((init (##vector-ref mod 4)))
    (if (not (##procedure? init)) (error "No init for " mod)
      (init))))

(define (init-gambit-program)
  (declare (extended-bindings) (not safe))
    (let ((mods (##vector-ref ##program-descr 0)))
      (let loop ((i 1)) ;; start at module after the current one
        (if (##fx< i (##vector-length mods))
            (let ((mod (##vector-ref mods i)))
              (init-gambit-module mod) ;; call module's init procedure
              (loop (##fx+ i 1)))))))

(init-gambit-program)

(##inline-host-declaration "
gx_old_module_register = g_module_register;

gx_gambit_module_table = [];

gx_gambit_module_init = function (m) { alert('gx_gambit_module_init undefined') }

gx_gambit_module_register = function (module_descr) {
  gx_gambit_module_table.push(module_descr);
  typeof g_glo['##program-descr'] === 'object' ? gx_gambit_module_init(module_descr)
    : gx_old_module_register(module_descr)
}

g_module_register = gx_gambit_module_register;

// console.log(g_module_register);
")

(##inline-host-statement "gx_gambit_module_init = (g_scm2host(@1@)); " (lambda (mod) (init-gambit-module mod)))
