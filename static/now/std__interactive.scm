(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/interactive#enter-module!
    (lambda (_mod40376_)
      (call-with-parameters
       (lambda () (let () (declare (not safe)) (##repl)))
       gx#current-expander-context
       (gx#import-module _mod40376_ '#f '#t))))
  (define std/interactive#macro-expand__%
    (lambda (_expr40361_ _expand-e40362_)
      (let ((_expr*40364_ (_expand-e40362_ _expr40361_)))
        (pretty-print (gx#syntax->datum _expr*40364_))
        _expr*40364_)))
  (define std/interactive#macro-expand__0
    (lambda (_expr40369_)
      (let ((_expand-e40371_ gx#core-expand*))
        (std/interactive#macro-expand__% _expr40369_ _expand-e40371_))))
  (define std/interactive#macro-expand
    (lambda _g270830_
      (let ((_g270829_ (let () (declare (not safe)) (##length _g270830_))))
        (cond ((let () (declare (not safe)) (##fx= _g270829_ 1))
               (apply std/interactive#macro-expand__0 _g270830_))
              ((let () (declare (not safe)) (##fx= _g270829_ 2))
               (apply std/interactive#macro-expand__% _g270830_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/interactive#macro-expand
                _g270830_))))))
  (define std/interactive#macro-expand1
    (lambda (_expr40358_)
      (std/interactive#macro-expand__% _expr40358_ gx#core-expand1))))
