(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/124#ephemeron::t
    (make-struct-type
     'std/srfi/124#ephemeron::t
     '#f
     '3
     'ephemeron
     '((final: . #t))
     ':init!
     '(key datum broken?)))
  (define std/srfi/124#ephemeron?
    (make-struct-predicate std/srfi/124#ephemeron::t))
  (define std/srfi/124#make-ephemeron
    (lambda _$args94621_
      (apply make-struct-instance std/srfi/124#ephemeron::t _$args94621_)))
  (define std/srfi/124#ephemeron-key
    (make-struct-field-accessor std/srfi/124#ephemeron::t '0))
  (define std/srfi/124#ephemeron-datum
    (make-struct-field-accessor std/srfi/124#ephemeron::t '1))
  (define std/srfi/124#ephemeron-broken?
    (make-struct-field-accessor std/srfi/124#ephemeron::t '2))
  (define std/srfi/124#ephemeron-key-set!
    (make-struct-field-mutator std/srfi/124#ephemeron::t '0))
  (define std/srfi/124#ephemeron-datum-set!
    (make-struct-field-mutator std/srfi/124#ephemeron::t '1))
  (define std/srfi/124#ephemeron-broken?-set!
    (make-struct-field-mutator std/srfi/124#ephemeron::t '2))
  (define std/srfi/124#ephemeron:::init!
    (lambda (_self94617_ _key94618_ _datum94619_)
      (if (let ((__tmp278811
                 (let () (declare (not safe)) (##vector-length _self94617_))))
            (declare (not safe))
            (##fx< '2 __tmp278811))
          (begin
            (let ()
              (declare (not safe))
              (##vector-set! _self94617_ '1 _key94618_))
            (let ()
              (declare (not safe))
              (##vector-set! _self94617_ '2 _datum94619_)))
          (error '"struct-instance-init!: too many arguments for struct"
                 _self94617_))))
  (bind-method!
   std/srfi/124#ephemeron::t
   ':init!
   std/srfi/124#ephemeron:::init!
   '#f)
  (define std/srfi/124#reference-barrier (lambda (_key94492_) '#!void)))
