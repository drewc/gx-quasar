(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/146/vector-edit#vector-without
    (lambda (_v108796_ _start108797_ _end108798_)
      (let* ((_size108800_ (vector-length _v108796_))
             (_gap-size108802_ (- _end108798_ _start108797_))
             (_new-size108804_ (- _size108800_ _gap-size108802_))
             (_result108806_ (make-vector _new-size108804_)))
        (vector-copy! _result108806_ '0 _v108796_ '0 _start108797_)
        (vector-copy!
         _result108806_
         _start108797_
         _v108796_
         _end108798_
         _size108800_)
        _result108806_)))
  (define std/srfi/146/vector-edit#vector-replace-one
    (lambda (_v108790_ _i108791_ _e108792_)
      (let ((_result108794_ (vector-copy _v108790_)))
        (vector-set! _result108794_ _i108791_ _e108792_)
        _result108794_))))
