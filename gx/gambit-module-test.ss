(##inline-host-statement
 "exports.Test = (arg) => {
   var hello_fn = g_scm2host(@1@)
   hello_fn('Test' + arg)
}

console.log('init gambit-module-test');

"
 (lambda (str)
   (let* ((mod (##inline-host-expression "g_module_name(gx_gambit_module_table[1]);")))
     (js#console.log mod)
     (js#alert str))))
