(declare (extended-bindings))
(extern namespace: gxjs alert)

(##inline-host-statement
 "exports.Hello = (arg) => {
   var hello_fn = g_scm2host(@1@)
   hello_fn('Hello ' + arg)
}"
 (lambda (str) (alert str)))
