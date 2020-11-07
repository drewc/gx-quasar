(declare (extended-bindings))
(extern namespace: gxjs alert console.log)

(##inline-host-statement
 "exports.Test = (arg) => {
   var hello_fn = g_scm2host(@1@)
   hello_fn('Test' + arg)
}"
 (lambda (str)
   (let* ((mod (##inline-host-expression "gx_gambit_module_table[1];"))
          (name (gxjs#gambit-module-name mod)))
     (console.log mod)

     (alert str) (alert name))))
