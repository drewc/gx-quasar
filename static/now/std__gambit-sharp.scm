(declare (block) (standard-bindings) (extended-bindings))
(call-with-parameters
 (lambda () (eval '(include "~~lib/_gambit#.scm")))
 _gx#loading-scheme-source
 '#t)
