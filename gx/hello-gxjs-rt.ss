namespace: gxjs
(declare (extended-bindings))

(def (alert thing) (##inline-host-statement "var foo = (@1@);
  var bar = typeof foo === 'string' ? foo : g_scm2host(foo)
  alert(bar);" thing))
(def (console.log obj) (##inline-host-statement "console.log((@1@))" obj))

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

console.log(g_module_register);

")

(##inline-host-statement "gx_gambit_module_init = (g_scm2host(@1@))" (lambda (mod) (init-gambit-module mod)))
