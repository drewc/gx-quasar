(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/lazy#lazy::t
    (make-struct-type
     'std/lazy#lazy::t
     '#f
     '1
     'lazy
     '((final: . #t))
     '#f
     '(e)))
  (define std/lazy#lazy? (make-struct-predicate std/lazy#lazy::t))
  (define std/lazy#make-lazy
    (lambda _$args52978_
      (apply make-struct-instance std/lazy#lazy::t _$args52978_)))
  (define std/lazy#lazy-e (make-struct-field-accessor std/lazy#lazy::t '0))
  (define std/lazy#lazy-e-set! (make-struct-field-mutator std/lazy#lazy::t '0))
  (define std/lazy#&lazy-e
    (make-struct-field-unchecked-accessor std/lazy#lazy::t '0))
  (define std/lazy#&lazy-e-set!
    (make-struct-field-unchecked-mutator std/lazy#lazy::t '0))
  (define std/lazy#eager
    (lambda (_expr52976_)
      (if (let ()
            (declare (not safe))
            (##structure-direct-instance-of? _expr52976_ 'std/lazy#lazy::t))
          _expr52976_
          (if (promise? _expr52976_)
              (let ((__tmp272751 (cons 'eager _expr52976_)))
                (declare (not safe))
                (##structure std/lazy#lazy::t __tmp272751))
              (let ((__tmp272752 (cons 'resolved _expr52976_)))
                (declare (not safe))
                (##structure std/lazy#lazy::t __tmp272752))))))
  (define std/lazy#force*
    (lambda (_obj52972_)
      (let ((_res52974_ (force _obj52972_)))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of? _res52974_ 'std/lazy#lazy::t))
            (std/lazy#force-lazy _res52974_)
            _res52974_))))
  (define std/lazy#force-lazy
    (lambda (_p52955_)
      (declare (not safe))
      (let* ((_content52958_
              (##unchecked-structure-ref _p52955_ '1 std/lazy#lazy::t '#f))
             (_$e52960_ (car _content52958_)))
        (if (eq? 'resolved _$e52960_)
            (cdr _content52958_)
            (if (eq? 'eager _$e52960_)
                (let ((_val52963_ (std/lazy#force* (cdr _content52958_))))
                  (if (eq? (car _content52958_) 'eager)
                      (begin
                        (set-car! _content52958_ 'resolved)
                        (set-cdr! _content52958_ _val52963_)
                        _val52963_)
                      (cdr _content52958_)))
                (if (eq? 'lazy _$e52960_)
                    (let* ((_p*52965_ ((cdr _content52958_)))
                           (_content52967_
                            (##unchecked-structure-ref
                             _p52955_
                             '1
                             std/lazy#lazy::t
                             '#f)))
                      (if (eq? (car _content52967_) 'lazy)
                          (if (##structure-direct-instance-of?
                               _p*52965_
                               'std/lazy#lazy::t)
                              (let ((_content*52970_
                                     (##unchecked-structure-ref
                                      _p*52965_
                                      '1
                                      std/lazy#lazy::t
                                      '#f)))
                                (set-car! _content52967_ (car _content*52970_))
                                (set-cdr! _content52967_ (cdr _content*52970_))
                                (##unchecked-structure-set!
                                 _p*52965_
                                 _content52967_
                                 '1
                                 std/lazy#lazy::t
                                 '#f))
                              (begin
                                (set-car! _content52967_ 'eager)
                                (set-cdr! _content52967_ _p*52965_)))
                          '#!void)
                      (std/lazy#force-lazy _p52955_))
                    '#!void)))))))
