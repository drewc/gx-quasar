(import :gerbil/gambit)
(declare (extended-bindings))

(##inline-host-statement
 "exports.evalElement = (arg) => {
  alert('Lazy? This is working without the reset Hello ' + arg)
}"
)

(define (document.getElementById id)
  (##inline-host-expression "g_host2foreign(document.getElementById(g_scm2host(@1@)))" id))

(define (Element.innerText-ref elem)
  (##inline-host-expression "g_host2scm(g_foreign2host(@1@).innerText)" elem))

(define (g-sourceCodeRun id)
  (let* ((elem (document.getElementById id))
         (code (Element.innerText-ref elem)))
    (let ((expr (cons '##begin (with-input-from-string code read-all))))
      (eval expr))

    ))

(##inline-host-declaration "g_sourceCodeRun = function () { alert('sourceCodeRun'); };")

(##inline-host-statement "
g_sourceCodeRun = g_scm2host(@1@);
exports.sourceCodeRun = g_sourceCodeRun;" g-sourceCodeRun)
