(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/19#time-tai 'time-tai)
  (define std/srfi/19#time-utc 'time-utc)
  (define std/srfi/19#time-monotonic 'time-monotonic)
  (define std/srfi/19#time-thread 'time-thread)
  (define std/srfi/19#time-process 'time-process)
  (define std/srfi/19#time-duration 'time-duration)
  (define std/srfi/19#tm:locale-number-separator '".")
  (define std/srfi/19#tm:locale-abbr-weekday-vector
    (vector '"Sun" '"Mon" '"Tue" '"Wed" '"Thu" '"Fri" '"Sat"))
  (define std/srfi/19#tm:locale-long-weekday-vector
    (vector '"Sunday"
            '"Monday"
            '"Tuesday"
            '"Wednesday"
            '"Thursday"
            '"Friday"
            '"Saturday"))
  (define std/srfi/19#tm:locale-abbr-month-vector
    (vector '""
            '"Jan"
            '"Feb"
            '"Mar"
            '"Apr"
            '"May"
            '"Jun"
            '"Jul"
            '"Aug"
            '"Sep"
            '"Oct"
            '"Nov"
            '"Dec"))
  (define std/srfi/19#tm:locale-long-month-vector
    (vector '""
            '"January"
            '"February"
            '"March"
            '"April"
            '"May"
            '"June"
            '"July"
            '"August"
            '"September"
            '"October"
            '"November"
            '"December"))
  (define std/srfi/19#tm:locale-pm '"PM")
  (define std/srfi/19#tm:locale-am '"AM")
  (define std/srfi/19#tm:locale-date-time-format '"~a ~b ~d ~H:~M:~S~z ~Y")
  (define std/srfi/19#tm:locale-short-date-format '"~m/~d/~y")
  (define std/srfi/19#tm:locale-time-format '"~H:~M:~S")
  (define std/srfi/19#tm:iso-8601-date-time-format '"~Y-~m-~dT~H:~M:~S~z")
  (define std/srfi/19#tm:nano (expt '10 '9))
  (define std/srfi/19#tm:sid '86400)
  (define std/srfi/19#tm:sihd '43200)
  (define std/srfi/19#tm:tai-epoch-in-jd '4881175/2)
  (define std/srfi/19#tm:time-error-types
    '(invalid-clock-type
      unsupported-clock-type
      incompatible-time-types
      not-duration
      dates-are-immutable
      bad-date-format-string
      bad-date-template-string
      invalid-month-specification))
  (define std/srfi/19#tm:time-error
    (lambda (_caller47050_ _type47051_ _value47052_)
      (if (member _type47051_ std/srfi/19#tm:time-error-types)
          (if _value47052_
              (error '"TIME-ERROR type" _caller47050_ _type47051_ _value47052_)
              (error '"TIME-ERROR type" _caller47050_ _type47051_))
          (error '"TIME-ERROR unsupported error type"
                 _caller47050_
                 _type47051_))))
  (define std/srfi/19#tm:read-tai-utc-data
    (lambda (_filename47025_)
      (letrec ((_convert-jd47027_
                (lambda (_jd47048_)
                  (* (- (inexact->exact _jd47048_)
                        std/srfi/19#tm:tai-epoch-in-jd)
                     std/srfi/19#tm:sid)))
               (_convert-sec47028_
                (lambda (_sec47046_) (inexact->exact _sec47046_))))
        (let ((_port47030_ (open-input-file _filename47025_))
              (_table47031_ '()))
          (let _loop47033_ ((_line47035_ (read-line _port47030_)))
            (if (not (eof-object? _line47035_))
                (let* ((_data47037_
                        (read (open-input-string
                               (string-append '"(" _line47035_ '")"))))
                       (_year47039_ (car _data47037_))
                       (_jd47041_ (cadddr (cdr _data47037_)))
                       (_secs47043_ (cadddr (cdddr _data47037_))))
                  (if (>= _year47039_ '1972)
                      (set! _table47031_
                            (cons (cons (_convert-jd47027_ _jd47041_)
                                        (inexact->exact _secs47043_))
                                  _table47031_))
                      '#!void)
                  (_loop47033_ (read-line _port47030_)))
                '#!void))
          _table47031_))))
  (define std/srfi/19#tm:leap-second-table
    '((1483228800 . 37)
      (1435708800 . 36)
      (1341100800 . 35)
      (1230768000 . 34)
      (1136073600 . 33)
      (915148800 . 32)
      (867715200 . 31)
      (820454400 . 30)
      (773020800 . 29)
      (741484800 . 28)
      (709948800 . 27)
      (662688000 . 26)
      (631152000 . 25)
      (567993600 . 24)
      (489024000 . 23)
      (425865600 . 22)
      (394329600 . 21)
      (362793600 . 20)
      (315532800 . 19)
      (283996800 . 18)
      (252460800 . 17)
      (220924800 . 16)
      (189302400 . 15)
      (157766400 . 14)
      (126230400 . 13)
      (94694400 . 12)
      (78796800 . 11)
      (63072000 . 10)))
  (define std/srfi/19#read-leap-second-table
    (lambda (_filename47023_)
      (set! std/srfi/19#tm:leap-second-table
            (std/srfi/19#tm:read-tai-utc-data _filename47023_))
      '#!void))
  (define std/srfi/19#tm:leap-second-delta
    (lambda (_utc-seconds47017_)
      (letrec ((_lsd47019_
                (lambda (_table47021_)
                  (if (>= _utc-seconds47017_ (caar _table47021_))
                      (cdar _table47021_)
                      (_lsd47019_ (cdr _table47021_))))))
        (if (< _utc-seconds47017_ (* (- '1972 '1970) '365 std/srfi/19#tm:sid))
            '0
            (_lsd47019_ std/srfi/19#tm:leap-second-table)))))
  (define std/srfi/19#tm:leap-second-neg-delta
    (lambda (_tai-seconds47011_)
      (letrec ((_lsd47013_
                (lambda (_table47015_)
                  (if (null? _table47015_)
                      '0
                      (if (<= (cdar _table47015_)
                              (- _tai-seconds47011_ (caar _table47015_)))
                          (cdar _table47015_)
                          (_lsd47013_ (cdr _table47015_)))))))
        (if (< _tai-seconds47011_ (* (- '1972 '1970) '365 std/srfi/19#tm:sid))
            '0
            (_lsd47013_ std/srfi/19#tm:leap-second-table)))))
  (define std/srfi/19#time::t
    (make-struct-type
     'std/srfi/19#time::t
     '#f
     '3
     'time
     '((transparent: . #t))
     '#f
     '(type nanosecond second)))
  (define std/srfi/19#time? (make-struct-predicate std/srfi/19#time::t))
  (define std/srfi/19#make-time
    (lambda _$args47008_
      (apply make-struct-instance std/srfi/19#time::t _$args47008_)))
  (define std/srfi/19#time-type
    (make-struct-field-accessor std/srfi/19#time::t '0))
  (define std/srfi/19#time-nanosecond
    (make-struct-field-accessor std/srfi/19#time::t '1))
  (define std/srfi/19#time-second
    (make-struct-field-accessor std/srfi/19#time::t '2))
  (define std/srfi/19#time-type-set!
    (make-struct-field-mutator std/srfi/19#time::t '0))
  (define std/srfi/19#time-nanosecond-set!
    (make-struct-field-mutator std/srfi/19#time::t '1))
  (define std/srfi/19#time-second-set!
    (make-struct-field-mutator std/srfi/19#time::t '2))
  (define std/srfi/19#make-time%
    (lambda (_type46986_ _nanosecond46987_ _second46988_)
      (let ((_$e46990_ _type46986_))
        (if (or (eq? 'time-tai _$e46990_)
                (eq? 'time-utc _$e46990_)
                (eq? 'time-monotonic _$e46990_)
                (eq? 'time-thread _$e46990_)
                (eq? 'time-process _$e46990_)
                (eq? 'time-duration _$e46990_))
            '#t
            (error '"Wrong time type" _type46986_)))
      (if (exact-integer? _second46988_)
          '#!void
          (error '"Invalid time second" _second46988_))
      (if (and (exact-integer? _nanosecond46987_)
               (<= (if (eq? _type46986_ std/srfi/19#time-duration)
                       '-999999999
                       '0)
                   _nanosecond46987_
                   '999999999))
          '#!void
          (error '"Invalid time nanosecond" _nanosecond46987_))
      (let ()
        (declare (not safe))
        (##structure
         std/srfi/19#time::t
         _type46986_
         _nanosecond46987_
         _second46988_))))
  (define std/srfi/19#copy-time
    (lambda (_time46984_)
      (let ((__tmp273056
             (##structure-ref _time46984_ '1 std/srfi/19#time::t '#f))
            (__tmp273055
             (##structure-ref _time46984_ '2 std/srfi/19#time::t '#f))
            (__tmp273054
             (##structure-ref _time46984_ '3 std/srfi/19#time::t '#f)))
        (declare (not safe))
        (##structure
         std/srfi/19#time::t
         __tmp273056
         __tmp273055
         __tmp273054))))
  (define std/srfi/19#current-seconds
    (lambda ()
      (inexact->exact
       (floor (let () (declare (not safe)) (##current-time-point))))))
  (define std/srfi/19#current-milliseconds
    (lambda ()
      (inexact->exact
       (floor (fl* '1000.
                   (let () (declare (not safe)) (##current-time-point)))))))
  (define std/srfi/19#tm:get-time-of-day
    (lambda ()
      (let* ((_now46977_ (let () (declare (not safe)) (##current-time-point)))
             (_sec46979_ (floor _now46977_)))
        (values (inexact->exact _sec46979_)
                (inexact->exact
                 (floor (fl* (fl- _now46977_ _sec46979_) '1000000000.)))))))
  (define std/srfi/19#tm:current-time-utc
    (lambda ()
      (let ((_g273057_ (std/srfi/19#tm:get-time-of-day)))
        (begin
          (let ((_g273058_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g273057_) (##vector-length _g273057_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g273058_ 2)))
                (error "Context expects 2 values" _g273058_)))
          (let ((_seconds46973_
                 (let () (declare (not safe)) (##vector-ref _g273057_ 0)))
                (_ns46974_
                 (let () (declare (not safe)) (##vector-ref _g273057_ 1))))
            (let ()
              (declare (not safe))
              (##structure
               std/srfi/19#time::t
               std/srfi/19#time-utc
               _ns46974_
               _seconds46973_)))))))
  (define std/srfi/19#tm:current-time-tai
    (lambda ()
      (let ((_g273059_ (std/srfi/19#tm:get-time-of-day)))
        (begin
          (let ((_g273060_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g273059_) (##vector-length _g273059_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g273060_ 2)))
                (error "Context expects 2 values" _g273060_)))
          (let ((_seconds46969_
                 (let () (declare (not safe)) (##vector-ref _g273059_ 0)))
                (_ns46970_
                 (let () (declare (not safe)) (##vector-ref _g273059_ 1))))
            (let ((__tmp273061
                   (+ _seconds46969_
                      (std/srfi/19#tm:leap-second-delta _seconds46969_))))
              (declare (not safe))
              (##structure
               std/srfi/19#time::t
               std/srfi/19#time-tai
               _ns46970_
               __tmp273061)))))))
  (define std/srfi/19#tm:current-time-monotonic
    (lambda ()
      (let ((_g273062_ (std/srfi/19#tm:get-time-of-day)))
        (begin
          (let ((_g273063_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g273062_) (##vector-length _g273062_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g273063_ 2)))
                (error "Context expects 2 values" _g273063_)))
          (let ((_seconds46965_
                 (let () (declare (not safe)) (##vector-ref _g273062_ 0)))
                (_ns46966_
                 (let () (declare (not safe)) (##vector-ref _g273062_ 1))))
            (let ((__tmp273064
                   (+ _seconds46965_
                      (std/srfi/19#tm:leap-second-delta _seconds46965_))))
              (declare (not safe))
              (##structure
               std/srfi/19#time::t
               std/srfi/19#time-monotonic
               _ns46966_
               __tmp273064)))))))
  (define std/srfi/19#tm:current-time-thread
    (lambda () (error '"Unimplemented")))
  (define std/srfi/19#tm:current-time-process
    (lambda () (error '"Unimplemented")))
  (define std/srfi/19#current-time
    (lambda _clock-type46955_
      (let ((_clock-type46960_
             (let ((_maybe-arg46957_ _clock-type46955_))
               (if (null? _maybe-arg46957_)
                   std/srfi/19#time-utc
                   (if (null? (cdr _maybe-arg46957_))
                       (car _maybe-arg46957_)
                       (error '"too many optional arguments"
                              _maybe-arg46957_))))))
        (if (eq? _clock-type46960_ std/srfi/19#time-tai)
            (std/srfi/19#tm:current-time-tai)
            (if (eq? _clock-type46960_ std/srfi/19#time-utc)
                (std/srfi/19#tm:current-time-utc)
                (if (eq? _clock-type46960_ std/srfi/19#time-monotonic)
                    (std/srfi/19#tm:current-time-monotonic)
                    (if (eq? _clock-type46960_ std/srfi/19#time-thread)
                        (std/srfi/19#tm:current-time-thread)
                        (if (eq? _clock-type46960_ std/srfi/19#time-process)
                            (std/srfi/19#tm:current-time-process)
                            (std/srfi/19#tm:time-error
                             'current-time
                             'invalid-clock-type
                             _clock-type46960_)))))))))
  (define std/srfi/19#time-resolution
    (lambda _clock-type46948_
      (let ((_clock-type46953_
             (let ((_maybe-arg46950_ _clock-type46948_))
               (if (null? _maybe-arg46950_)
                   std/srfi/19#time-utc
                   (if (null? (cdr _maybe-arg46950_))
                       (car _maybe-arg46950_)
                       (error '"too many optional arguments"
                              _maybe-arg46950_))))))
        (if (eq? _clock-type46953_ std/srfi/19#time-tai)
            '1
            (if (eq? _clock-type46953_ std/srfi/19#time-utc)
                '1
                (if (eq? _clock-type46953_ std/srfi/19#time-monotonic)
                    '1
                    (if (eq? _clock-type46953_ std/srfi/19#time-thread)
                        '1000
                        (if (eq? _clock-type46953_ std/srfi/19#time-process)
                            '1000
                            (std/srfi/19#tm:time-error
                             'time-resolution
                             'invalid-clock-type
                             _clock-type46953_)))))))))
  (define std/srfi/19#tm:time-compare-check
    (lambda (_time146941_ _time246942_ _caller46943_)
      (if (or (not (and (let ()
                          (declare (not safe))
                          (##structure-instance-of?
                           _time146941_
                           'std/srfi/19#time::t))
                        (let ()
                          (declare (not safe))
                          (##structure-instance-of?
                           _time246942_
                           'std/srfi/19#time::t))))
              (not (eq? (##structure-ref
                         _time146941_
                         '1
                         std/srfi/19#time::t
                         '#f)
                        (##structure-ref
                         _time246942_
                         '1
                         std/srfi/19#time::t
                         '#f))))
          (std/srfi/19#tm:time-error
           _caller46943_
           'incompatible-time-types
           '#f)
          '#t)))
  (define std/srfi/19#time=?
    (lambda (_time146938_ _time246939_)
      (std/srfi/19#tm:time-compare-check _time146938_ _time246939_ 'time=?)
      (if (= (##structure-ref _time146938_ '3 std/srfi/19#time::t '#f)
             (##structure-ref _time246939_ '3 std/srfi/19#time::t '#f))
          (= (##structure-ref _time146938_ '2 std/srfi/19#time::t '#f)
             (##structure-ref _time246939_ '2 std/srfi/19#time::t '#f))
          '#f)))
  (define std/srfi/19#time>?
    (lambda (_time146932_ _time246933_)
      (std/srfi/19#tm:time-compare-check _time146932_ _time246933_ 'time>?)
      (let ((_$e46935_
             (> (##structure-ref _time146932_ '3 std/srfi/19#time::t '#f)
                (##structure-ref _time246933_ '3 std/srfi/19#time::t '#f))))
        (if _$e46935_
            _$e46935_
            (if (= (##structure-ref _time146932_ '3 std/srfi/19#time::t '#f)
                   (##structure-ref _time246933_ '3 std/srfi/19#time::t '#f))
                (> (##structure-ref _time146932_ '2 std/srfi/19#time::t '#f)
                   (##structure-ref _time246933_ '2 std/srfi/19#time::t '#f))
                '#f)))))
  (define std/srfi/19#time<?
    (lambda (_time146926_ _time246927_)
      (std/srfi/19#tm:time-compare-check _time146926_ _time246927_ 'time<?)
      (let ((_$e46929_
             (< (##structure-ref _time146926_ '3 std/srfi/19#time::t '#f)
                (##structure-ref _time246927_ '3 std/srfi/19#time::t '#f))))
        (if _$e46929_
            _$e46929_
            (if (= (##structure-ref _time146926_ '3 std/srfi/19#time::t '#f)
                   (##structure-ref _time246927_ '3 std/srfi/19#time::t '#f))
                (< (##structure-ref _time146926_ '2 std/srfi/19#time::t '#f)
                   (##structure-ref _time246927_ '2 std/srfi/19#time::t '#f))
                '#f)))))
  (define std/srfi/19#time>=?
    (lambda (_time146920_ _time246921_)
      (std/srfi/19#tm:time-compare-check _time146920_ _time246921_ 'time>=?)
      (let ((_$e46923_
             (>= (##structure-ref _time146920_ '3 std/srfi/19#time::t '#f)
                 (##structure-ref _time246921_ '3 std/srfi/19#time::t '#f))))
        (if _$e46923_
            _$e46923_
            (if (= (##structure-ref _time146920_ '3 std/srfi/19#time::t '#f)
                   (##structure-ref _time246921_ '3 std/srfi/19#time::t '#f))
                (>= (##structure-ref _time146920_ '2 std/srfi/19#time::t '#f)
                    (##structure-ref _time246921_ '2 std/srfi/19#time::t '#f))
                '#f)))))
  (define std/srfi/19#time<=?
    (lambda (_time146914_ _time246915_)
      (std/srfi/19#tm:time-compare-check _time146914_ _time246915_ 'time<=?)
      (let ((_$e46917_
             (<= (##structure-ref _time146914_ '3 std/srfi/19#time::t '#f)
                 (##structure-ref _time246915_ '3 std/srfi/19#time::t '#f))))
        (if _$e46917_
            _$e46917_
            (if (= (##structure-ref _time146914_ '3 std/srfi/19#time::t '#f)
                   (##structure-ref _time246915_ '3 std/srfi/19#time::t '#f))
                (<= (##structure-ref _time146914_ '2 std/srfi/19#time::t '#f)
                    (##structure-ref _time246915_ '2 std/srfi/19#time::t '#f))
                '#f)))))
  (define std/srfi/19#tm:time->nanoseconds
    (lambda (_time46908_)
      (letrec ((_sign146910_
                (lambda (_n46912_) (if (negative? _n46912_) '-1 '1))))
        (+ (* (##structure-ref _time46908_ '3 std/srfi/19#time::t '#f)
              std/srfi/19#tm:nano)
           (##structure-ref _time46908_ '2 std/srfi/19#time::t '#f)))))
  (define std/srfi/19#tm:nanoseconds->time
    (lambda (_time-type46905_ _nanoseconds46906_)
      (let ((__tmp273066 (remainder _nanoseconds46906_ std/srfi/19#tm:nano))
            (__tmp273065 (quotient _nanoseconds46906_ std/srfi/19#tm:nano)))
        (declare (not safe))
        (##structure
         std/srfi/19#time::t
         _time-type46905_
         __tmp273066
         __tmp273065))))
  (define std/srfi/19#tm:nanoseconds->values
    (lambda (_nanoseconds46903_)
      (values (abs (remainder _nanoseconds46903_ std/srfi/19#tm:nano))
              (quotient _nanoseconds46903_ std/srfi/19#tm:nano))))
  (define std/srfi/19#tm:time-difference
    (lambda (_time146893_ _time246894_ _time346895_)
      (if (or (not (and (let ()
                          (declare (not safe))
                          (##structure-instance-of?
                           _time146893_
                           'std/srfi/19#time::t))
                        (let ()
                          (declare (not safe))
                          (##structure-instance-of?
                           _time246894_
                           'std/srfi/19#time::t))))
              (not (eq? (##structure-ref
                         _time146893_
                         '1
                         std/srfi/19#time::t
                         '#f)
                        (##structure-ref
                         _time246894_
                         '1
                         std/srfi/19#time::t
                         '#f))))
          (std/srfi/19#tm:time-error
           'time-difference
           'incompatible-time-types
           '#f)
          '#!void)
      (##structure-set!
       _time346895_
       std/srfi/19#time-duration
       '1
       std/srfi/19#time::t
       '#f)
      (if (std/srfi/19#time=? _time146893_ _time246894_)
          (begin
            (##structure-set! _time346895_ '0 '3 std/srfi/19#time::t '#f)
            (##structure-set! _time346895_ '0 '2 std/srfi/19#time::t '#f))
          (let ((_g273067_
                 (std/srfi/19#tm:nanoseconds->values
                  (- (std/srfi/19#tm:time->nanoseconds _time146893_)
                     (std/srfi/19#tm:time->nanoseconds _time246894_)))))
            (begin
              (let ((_g273068_
                     (let ()
                       (declare (not safe))
                       (if (##values? _g273067_)
                           (##vector-length _g273067_)
                           1))))
                (if (not (let () (declare (not safe)) (##fx= _g273068_ 2)))
                    (error "Context expects 2 values" _g273068_)))
              (let ((_nanos46900_
                     (let () (declare (not safe)) (##vector-ref _g273067_ 0)))
                    (_secs46901_
                     (let () (declare (not safe)) (##vector-ref _g273067_ 1))))
                (begin
                  (##structure-set!
                   _time346895_
                   _secs46901_
                   '3
                   std/srfi/19#time::t
                   '#f)
                  (##structure-set!
                   _time346895_
                   _nanos46900_
                   '2
                   std/srfi/19#time::t
                   '#f))))))
      _time346895_))
  (define std/srfi/19#time-difference
    (lambda (_time146890_ _time246891_)
      (std/srfi/19#tm:time-difference
       _time146890_
       _time246891_
       (let ()
         (declare (not safe))
         (##structure std/srfi/19#time::t '#f '#f '#f)))))
  (define std/srfi/19#time-difference!
    (lambda (_time146887_ _time246888_)
      (std/srfi/19#tm:time-difference _time146887_ _time246888_ _time146887_)))
  (define std/srfi/19#tm:add-duration
    (lambda (_time146877_ _duration46878_ _time346879_)
      (if (not (and (let ()
                      (declare (not safe))
                      (##structure-instance-of?
                       _time146877_
                       'std/srfi/19#time::t))
                    (let ()
                      (declare (not safe))
                      (##structure-instance-of?
                       _duration46878_
                       'std/srfi/19#time::t))))
          (std/srfi/19#tm:time-error
           'add-duration
           'incompatible-time-types
           '#f)
          '#!void)
      (if (not (eq? (##structure-ref
                     _duration46878_
                     '1
                     std/srfi/19#time::t
                     '#f)
                    std/srfi/19#time-duration))
          (std/srfi/19#tm:time-error
           'add-duration
           'not-duration
           _duration46878_)
          (let ((_sec-plus46881_
                 (+ (##structure-ref _time146877_ '3 std/srfi/19#time::t '#f)
                    (##structure-ref
                     _duration46878_
                     '3
                     std/srfi/19#time::t
                     '#f)))
                (_nsec-plus46882_
                 (+ (##structure-ref _time146877_ '2 std/srfi/19#time::t '#f)
                    (##structure-ref
                     _duration46878_
                     '2
                     std/srfi/19#time::t
                     '#f))))
            (let ((_r46884_ (remainder _nsec-plus46882_ std/srfi/19#tm:nano))
                  (_q46885_ (quotient _nsec-plus46882_ std/srfi/19#tm:nano)))
              (if (negative? _r46884_)
                  (begin
                    (##structure-set!
                     _time346879_
                     (+ _sec-plus46881_ _q46885_ '-1)
                     '3
                     std/srfi/19#time::t
                     '#f)
                    (##structure-set!
                     _time346879_
                     (+ std/srfi/19#tm:nano _r46884_)
                     '2
                     std/srfi/19#time::t
                     '#f))
                  (begin
                    (##structure-set!
                     _time346879_
                     (+ _sec-plus46881_ _q46885_)
                     '3
                     std/srfi/19#time::t
                     '#f)
                    (##structure-set!
                     _time346879_
                     _r46884_
                     '2
                     std/srfi/19#time::t
                     '#f)))
              _time346879_)))))
  (define std/srfi/19#add-duration
    (lambda (_time146874_ _duration46875_)
      (std/srfi/19#tm:add-duration
       _time146874_
       _duration46875_
       (let ((__tmp273069
              (##structure-ref _time146874_ '1 std/srfi/19#time::t '#f)))
         (declare (not safe))
         (##structure std/srfi/19#time::t __tmp273069 '#f '#f)))))
  (define std/srfi/19#add-duration!
    (lambda (_time146871_ _duration46872_)
      (std/srfi/19#tm:add-duration _time146871_ _duration46872_ _time146871_)))
  (define std/srfi/19#tm:subtract-duration
    (lambda (_time146861_ _duration46862_ _time346863_)
      (if (not (and (let ()
                      (declare (not safe))
                      (##structure-instance-of?
                       _time146861_
                       'std/srfi/19#time::t))
                    (let ()
                      (declare (not safe))
                      (##structure-instance-of?
                       _duration46862_
                       'std/srfi/19#time::t))))
          (std/srfi/19#tm:time-error
           'add-duration
           'incompatible-time-types
           '#f)
          '#!void)
      (if (not (eq? (##structure-ref
                     _duration46862_
                     '1
                     std/srfi/19#time::t
                     '#f)
                    std/srfi/19#time-duration))
          (std/srfi/19#tm:time-error
           'tm:subtract-duration
           'not-duration
           _duration46862_)
          (let ((_sec-minus46865_
                 (- (##structure-ref _time146861_ '3 std/srfi/19#time::t '#f)
                    (##structure-ref
                     _duration46862_
                     '3
                     std/srfi/19#time::t
                     '#f)))
                (_nsec-minus46866_
                 (- (##structure-ref _time146861_ '2 std/srfi/19#time::t '#f)
                    (##structure-ref
                     _duration46862_
                     '2
                     std/srfi/19#time::t
                     '#f))))
            (let ((_r46868_ (remainder _nsec-minus46866_ std/srfi/19#tm:nano))
                  (_q46869_ (quotient _nsec-minus46866_ std/srfi/19#tm:nano)))
              (if (negative? _r46868_)
                  (begin
                    (##structure-set!
                     _time346863_
                     (- _sec-minus46865_ _q46869_ '1)
                     '3
                     std/srfi/19#time::t
                     '#f)
                    (##structure-set!
                     _time346863_
                     (+ std/srfi/19#tm:nano _r46868_)
                     '2
                     std/srfi/19#time::t
                     '#f))
                  (begin
                    (##structure-set!
                     _time346863_
                     (- _sec-minus46865_ _q46869_)
                     '3
                     std/srfi/19#time::t
                     '#f)
                    (##structure-set!
                     _time346863_
                     _r46868_
                     '2
                     std/srfi/19#time::t
                     '#f)))
              _time346863_)))))
  (define std/srfi/19#subtract-duration
    (lambda (_time146858_ _duration46859_)
      (std/srfi/19#tm:subtract-duration
       _time146858_
       _duration46859_
       (let ((__tmp273070
              (##structure-ref _time146858_ '1 std/srfi/19#time::t '#f)))
         (declare (not safe))
         (##structure std/srfi/19#time::t __tmp273070 '#f '#f)))))
  (define std/srfi/19#subtract-duration!
    (lambda (_time146855_ _duration46856_)
      (std/srfi/19#tm:subtract-duration
       _time146855_
       _duration46856_
       _time146855_)))
  (define std/srfi/19#tm:time-tai->time-utc!
    (lambda (_time-in46851_ _time-out46852_ _caller46853_)
      (if (not (eq? (##structure-ref _time-in46851_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-tai))
          (std/srfi/19#tm:time-error
           _caller46853_
           'incompatible-time-types
           _time-in46851_)
          '#!void)
      (##structure-set!
       _time-out46852_
       std/srfi/19#time-utc
       '1
       std/srfi/19#time::t
       '#f)
      (##structure-set!
       _time-out46852_
       (##structure-ref _time-in46851_ '2 std/srfi/19#time::t '#f)
       '2
       std/srfi/19#time::t
       '#f)
      (##structure-set!
       _time-out46852_
       (- (##structure-ref _time-in46851_ '3 std/srfi/19#time::t '#f)
          (std/srfi/19#tm:leap-second-neg-delta
           (##structure-ref _time-in46851_ '3 std/srfi/19#time::t '#f)))
       '3
       std/srfi/19#time::t
       '#f)
      _time-out46852_))
  (define std/srfi/19#time-tai->time-utc
    (lambda (_time-in46849_)
      (std/srfi/19#tm:time-tai->time-utc!
       _time-in46849_
       (let ()
         (declare (not safe))
         (##structure std/srfi/19#time::t '#f '#f '#f))
       'time-tai->time-utc)))
  (define std/srfi/19#time-tai->time-utc!
    (lambda (_time-in46847_)
      (std/srfi/19#tm:time-tai->time-utc!
       _time-in46847_
       _time-in46847_
       'time-tai->time-utc!)))
  (define std/srfi/19#tm:time-utc->time-tai!
    (lambda (_time-in46843_ _time-out46844_ _caller46845_)
      (if (not (eq? (##structure-ref _time-in46843_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-utc))
          (std/srfi/19#tm:time-error
           _caller46845_
           'incompatible-time-types
           _time-in46843_)
          '#!void)
      (##structure-set!
       _time-out46844_
       std/srfi/19#time-tai
       '1
       std/srfi/19#time::t
       '#f)
      (##structure-set!
       _time-out46844_
       (##structure-ref _time-in46843_ '2 std/srfi/19#time::t '#f)
       '2
       std/srfi/19#time::t
       '#f)
      (##structure-set!
       _time-out46844_
       (+ (##structure-ref _time-in46843_ '3 std/srfi/19#time::t '#f)
          (std/srfi/19#tm:leap-second-delta
           (##structure-ref _time-in46843_ '3 std/srfi/19#time::t '#f)))
       '3
       std/srfi/19#time::t
       '#f)
      _time-out46844_))
  (define std/srfi/19#time-utc->time-tai
    (lambda (_time-in46841_)
      (std/srfi/19#tm:time-utc->time-tai!
       _time-in46841_
       (let ()
         (declare (not safe))
         (##structure std/srfi/19#time::t '#f '#f '#f))
       'time-utc->time-tai)))
  (define std/srfi/19#time-utc->time-tai!
    (lambda (_time-in46839_)
      (std/srfi/19#tm:time-utc->time-tai!
       _time-in46839_
       _time-in46839_
       'time-utc->time-tai!)))
  (define std/srfi/19#time-monotonic->time-utc
    (lambda (_time-in46835_)
      (if (not (eq? (##structure-ref _time-in46835_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-monotonic))
          (std/srfi/19#tm:time-error
           'time-monotonic->time-utc
           'incompatible-time-types
           _time-in46835_)
          '#!void)
      (let ((_ntime46837_ (std/srfi/19#copy-time _time-in46835_)))
        (##structure-set!
         _ntime46837_
         std/srfi/19#time-tai
         '1
         std/srfi/19#time::t
         '#f)
        (std/srfi/19#tm:time-tai->time-utc!
         _ntime46837_
         _ntime46837_
         'time-monotonic->time-utc))))
  (define std/srfi/19#time-monotonic->time-utc!
    (lambda (_time-in46833_)
      (if (not (eq? (##structure-ref _time-in46833_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-monotonic))
          (std/srfi/19#tm:time-error
           'time-monotonic->time-utc!
           'incompatible-time-types
           _time-in46833_)
          '#!void)
      (##structure-set!
       _time-in46833_
       std/srfi/19#time-tai
       '1
       std/srfi/19#time::t
       '#f)
      (std/srfi/19#tm:time-tai->time-utc!
       _time-in46833_
       _time-in46833_
       'time-monotonic->time-utc)))
  (define std/srfi/19#time-monotonic->time-tai
    (lambda (_time-in46829_)
      (if (not (eq? (##structure-ref _time-in46829_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-monotonic))
          (std/srfi/19#tm:time-error
           'time-monotonic->time-tai
           'incompatible-time-types
           _time-in46829_)
          '#!void)
      (let ((_ntime46831_ (std/srfi/19#copy-time _time-in46829_)))
        (##structure-set!
         _ntime46831_
         std/srfi/19#time-tai
         '1
         std/srfi/19#time::t
         '#f)
        _ntime46831_)))
  (define std/srfi/19#time-monotonic->time-tai!
    (lambda (_time-in46827_)
      (if (not (eq? (##structure-ref _time-in46827_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-monotonic))
          (std/srfi/19#tm:time-error
           'time-monotonic->time-tai!
           'incompatible-time-types
           _time-in46827_)
          '#!void)
      (##structure-set!
       _time-in46827_
       std/srfi/19#time-tai
       '1
       std/srfi/19#time::t
       '#f)
      _time-in46827_))
  (define std/srfi/19#time-utc->time-monotonic
    (lambda (_time-in46823_)
      (if (not (eq? (##structure-ref _time-in46823_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-utc))
          (std/srfi/19#tm:time-error
           'time-utc->time-monotonic
           'incompatible-time-types
           _time-in46823_)
          '#!void)
      (let ((_ntime46825_
             (std/srfi/19#tm:time-utc->time-tai!
              _time-in46823_
              (let ()
                (declare (not safe))
                (##structure std/srfi/19#time::t '#f '#f '#f))
              'time-utc->time-monotonic)))
        (##structure-set!
         _ntime46825_
         std/srfi/19#time-monotonic
         '1
         std/srfi/19#time::t
         '#f)
        _ntime46825_)))
  (define std/srfi/19#time-utc->time-monotonic!
    (lambda (_time-in46819_)
      (if (not (eq? (##structure-ref _time-in46819_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-utc))
          (std/srfi/19#tm:time-error
           'time-utc->time-montonic!
           'incompatible-time-types
           _time-in46819_)
          '#!void)
      (let ((_ntime46821_
             (std/srfi/19#tm:time-utc->time-tai!
              _time-in46819_
              _time-in46819_
              'time-utc->time-monotonic!)))
        (##structure-set!
         _ntime46821_
         std/srfi/19#time-monotonic
         '1
         std/srfi/19#time::t
         '#f)
        _ntime46821_)))
  (define std/srfi/19#time-tai->time-monotonic
    (lambda (_time-in46815_)
      (if (not (eq? (##structure-ref _time-in46815_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-tai))
          (std/srfi/19#tm:time-error
           'time-tai->time-monotonic
           'incompatible-time-types
           _time-in46815_)
          '#!void)
      (let ((_ntime46817_ (std/srfi/19#copy-time _time-in46815_)))
        (##structure-set!
         _ntime46817_
         std/srfi/19#time-monotonic
         '1
         std/srfi/19#time::t
         '#f)
        _ntime46817_)))
  (define std/srfi/19#time-tai->time-monotonic!
    (lambda (_time-in46813_)
      (if (not (eq? (##structure-ref _time-in46813_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-tai))
          (std/srfi/19#tm:time-error
           'time-tai->time-monotonic!
           'incompatible-time-types
           _time-in46813_)
          '#!void)
      (##structure-set!
       _time-in46813_
       std/srfi/19#time-monotonic
       '1
       std/srfi/19#time::t
       '#f)
      _time-in46813_))
  (define std/srfi/19#date::t
    (make-struct-type
     'std/srfi/19#date::t
     '#f
     '8
     'date
     '((transparent: . #t))
     '#f
     '(nanosecond second minute hour day month year zone-offset)))
  (define std/srfi/19#date? (make-struct-predicate std/srfi/19#date::t))
  (define std/srfi/19#make-date
    (lambda _$args46810_
      (apply make-struct-instance std/srfi/19#date::t _$args46810_)))
  (define std/srfi/19#date-nanosecond
    (make-struct-field-accessor std/srfi/19#date::t '0))
  (define std/srfi/19#date-second
    (make-struct-field-accessor std/srfi/19#date::t '1))
  (define std/srfi/19#date-minute
    (make-struct-field-accessor std/srfi/19#date::t '2))
  (define std/srfi/19#date-hour
    (make-struct-field-accessor std/srfi/19#date::t '3))
  (define std/srfi/19#date-day
    (make-struct-field-accessor std/srfi/19#date::t '4))
  (define std/srfi/19#date-month
    (make-struct-field-accessor std/srfi/19#date::t '5))
  (define std/srfi/19#date-year
    (make-struct-field-accessor std/srfi/19#date::t '6))
  (define std/srfi/19#date-zone-offset
    (make-struct-field-accessor std/srfi/19#date::t '7))
  (define std/srfi/19#date-nanosecond-set!
    (make-struct-field-mutator std/srfi/19#date::t '0))
  (define std/srfi/19#date-second-set!
    (make-struct-field-mutator std/srfi/19#date::t '1))
  (define std/srfi/19#date-minute-set!
    (make-struct-field-mutator std/srfi/19#date::t '2))
  (define std/srfi/19#date-hour-set!
    (make-struct-field-mutator std/srfi/19#date::t '3))
  (define std/srfi/19#date-day-set!
    (make-struct-field-mutator std/srfi/19#date::t '4))
  (define std/srfi/19#date-month-set!
    (make-struct-field-mutator std/srfi/19#date::t '5))
  (define std/srfi/19#date-year-set!
    (make-struct-field-mutator std/srfi/19#date::t '6))
  (define std/srfi/19#date-zone-offset-set!
    (make-struct-field-mutator std/srfi/19#date::t '7))
  (define std/srfi/19#tm:encode-julian-day-number
    (lambda (_day46799_ _month46800_ _year46801_)
      (let* ((_a46803_ (quotient (- '14 _month46800_) '12))
             (_y46805_
              (- (- (+ _year46801_ '4800) _a46803_)
                 (if (negative? _year46801_) '-1 '0)))
             (_m46807_ (- (+ _month46800_ (* '12 _a46803_)) '3)))
        (+ _day46799_
           (quotient (+ (* '153 _m46807_) '2) '5)
           (* '365 _y46805_)
           (quotient _y46805_ '4)
           (- (quotient _y46805_ '100))
           (quotient _y46805_ '400)
           '-32045))))
  (define std/srfi/19#tm:char-pos
    (lambda (_char46794_ _str46795_ _index46796_ _len46797_)
      (if (>= _index46796_ _len46797_)
          '#f
          (if (char=? (string-ref _str46795_ _index46796_) _char46794_)
              _index46796_
              (std/srfi/19#tm:char-pos
               _char46794_
               _str46795_
               (+ _index46796_ '1)
               _len46797_)))))
  (define std/srfi/19#tm:fractional-part
    (lambda (_r46788_)
      (if (integer? _r46788_)
          '"0"
          (let* ((_str46790_ (number->string (exact->inexact _r46788_)))
                 (_ppos46792_
                  (std/srfi/19#tm:char-pos
                   '#\.
                   _str46790_
                   '0
                   (string-length _str46790_))))
            (substring
             _str46790_
             (+ _ppos46792_ '1)
             (string-length _str46790_))))))
  (define std/srfi/19#tm:decode-julian-day-number
    (lambda (_jdn46769_)
      (let* ((_days46771_ (truncate _jdn46769_))
             (_a46773_ (+ _days46771_ '32044))
             (_b46775_ (quotient (+ (* '4 _a46773_) '3) '146097))
             (_c46777_ (- _a46773_ (quotient (* '146097 _b46775_) '4)))
             (_d46779_ (quotient (+ (* '4 _c46777_) '3) '1461))
             (_e46781_ (- _c46777_ (quotient (* '1461 _d46779_) '4)))
             (_m46783_ (quotient (+ (* '5 _e46781_) '2) '153))
             (_y46785_
              (+ (* '100 _b46775_) _d46779_ '-4800 (quotient _m46783_ '10))))
        (values (* (- _jdn46769_ _days46771_) std/srfi/19#tm:sid)
                (+ _e46781_ (- (quotient (+ (* '153 _m46783_) '2) '5)) '1)
                (+ _m46783_ '3 (* '-12 (quotient _m46783_ '10)))
                (if (>= '0 _y46785_) (- _y46785_ '1) _y46785_)))))
  (define std/srfi/19#tm:local-tz-offset (lambda () '0))
  (define std/srfi/19#tm:time->julian-day-number
    (lambda (_seconds46765_ _tz-offset46766_)
      (+ (/ (+ _seconds46765_ _tz-offset46766_ std/srfi/19#tm:sihd)
            std/srfi/19#tm:sid)
         std/srfi/19#tm:tai-epoch-in-jd)))
  (define std/srfi/19#tm:find
    (lambda (_proc46762_ _l46763_)
      (if (null? _l46763_)
          '#f
          (if (_proc46762_ (car _l46763_))
              '#t
              (std/srfi/19#tm:find _proc46762_ (cdr _l46763_))))))
  (define std/srfi/19#tm:tai-before-leap-second?
    (lambda (_second46758_)
      (std/srfi/19#tm:find
       (lambda (_x46760_)
         (= _second46758_ (- (+ (car _x46760_) (cdr _x46760_)) '1)))
       std/srfi/19#tm:leap-second-table)))
  (define std/srfi/19#tm:time->date
    (lambda (_time46734_ _tz-offset46735_ _ttype46736_)
      (if (not (eq? (##structure-ref _time46734_ '1 std/srfi/19#time::t '#f)
                    _ttype46736_))
          (std/srfi/19#tm:time-error
           'time->date
           'incompatible-time-types
           _time46734_)
          '#!void)
      (let ((_offset46741_
             (let ((_maybe-arg46738_ _tz-offset46735_))
               (if (null? _maybe-arg46738_)
                   (std/srfi/19#tm:local-tz-offset)
                   (if (null? (cdr _maybe-arg46738_))
                       (car _maybe-arg46738_)
                       (error '"too many optional arguments"
                              _maybe-arg46738_))))))
        (let ((_g273071_
               (std/srfi/19#tm:decode-julian-day-number
                (std/srfi/19#tm:time->julian-day-number
                 (##structure-ref _time46734_ '3 std/srfi/19#time::t '#f)
                 _offset46741_))))
          (begin
            (let ((_g273072_
                   (let ()
                     (declare (not safe))
                     (if (##values? _g273071_)
                         (##vector-length _g273071_)
                         1))))
              (if (not (let () (declare (not safe)) (##fx= _g273072_ 4)))
                  (error "Context expects 4 values" _g273072_)))
            (let ((_secs46744_
                   (let () (declare (not safe)) (##vector-ref _g273071_ 0)))
                  (_date46745_
                   (let () (declare (not safe)) (##vector-ref _g273071_ 1)))
                  (_month46746_
                   (let () (declare (not safe)) (##vector-ref _g273071_ 2)))
                  (_year46747_
                   (let () (declare (not safe)) (##vector-ref _g273071_ 3))))
              (let* ((_hours46749_ (quotient _secs46744_ (* '60 '60)))
                     (_rem46751_ (remainder _secs46744_ (* '60 '60)))
                     (_minutes46753_ (quotient _rem46751_ '60))
                     (_seconds46755_ (remainder _rem46751_ '60)))
                (let ((__tmp273073
                       (##structure-ref
                        _time46734_
                        '2
                        std/srfi/19#time::t
                        '#f)))
                  (declare (not safe))
                  (##structure
                   std/srfi/19#date::t
                   __tmp273073
                   _seconds46755_
                   _minutes46753_
                   _hours46749_
                   _date46745_
                   _month46746_
                   _year46747_
                   _offset46741_)))))))))
  (define std/srfi/19#time-tai->date
    (lambda (_time46729_ . _tz-offset46730_)
      (if (std/srfi/19#tm:tai-before-leap-second?
           (##structure-ref _time46729_ '3 std/srfi/19#time::t '#f))
          (let ((_d46732_
                 (std/srfi/19#tm:time->date
                  (std/srfi/19#subtract-duration!
                   (std/srfi/19#time-tai->time-utc _time46729_)
                   (let ()
                     (declare (not safe))
                     (##structure
                      std/srfi/19#time::t
                      std/srfi/19#time-duration
                      '0
                      '1)))
                  _tz-offset46730_
                  std/srfi/19#time-utc)))
            (##structure-set! _d46732_ '60 '2 std/srfi/19#date::t '#f)
            _d46732_)
          (std/srfi/19#tm:time->date
           (std/srfi/19#time-tai->time-utc _time46729_)
           _tz-offset46730_
           std/srfi/19#time-utc))))
  (define std/srfi/19#time-utc->date
    (lambda (_time46726_ . _tz-offset46727_)
      (std/srfi/19#tm:time->date
       _time46726_
       _tz-offset46727_
       std/srfi/19#time-utc)))
  (define std/srfi/19#time-monotonic->date
    (lambda (_time46723_ . _tz-offset46724_)
      (std/srfi/19#tm:time->date
       _time46723_
       _tz-offset46724_
       std/srfi/19#time-monotonic)))
  (define std/srfi/19#date->time-utc
    (lambda (_date46710_)
      (let ((_nanosecond46712_
             (##structure-ref _date46710_ '1 std/srfi/19#date::t '#f))
            (_second46713_
             (##structure-ref _date46710_ '2 std/srfi/19#date::t '#f))
            (_minute46714_
             (##structure-ref _date46710_ '3 std/srfi/19#date::t '#f))
            (_hour46715_
             (##structure-ref _date46710_ '4 std/srfi/19#date::t '#f))
            (_day46716_
             (##structure-ref _date46710_ '5 std/srfi/19#date::t '#f))
            (_month46717_
             (##structure-ref _date46710_ '6 std/srfi/19#date::t '#f))
            (_year46718_
             (##structure-ref _date46710_ '7 std/srfi/19#date::t '#f))
            (_offset46719_
             (##structure-ref _date46710_ '8 std/srfi/19#date::t '#f)))
        (let* ((_jdays46721_
                (- (std/srfi/19#tm:encode-julian-day-number
                    _day46716_
                    _month46717_
                    _year46718_)
                   std/srfi/19#tm:tai-epoch-in-jd))
               (__tmp273074
                (+ (* (- _jdays46721_ '1/2) '24 '60 '60)
                   (* _hour46715_ '60 '60)
                   (* _minute46714_ '60)
                   _second46713_
                   (- _offset46719_))))
          (declare (not safe))
          (##structure
           std/srfi/19#time::t
           std/srfi/19#time-utc
           _nanosecond46712_
           __tmp273074)))))
  (define std/srfi/19#date->time-tai
    (lambda (_d46708_)
      (if (= (##structure-ref _d46708_ '2 std/srfi/19#date::t '#f) '60)
          (std/srfi/19#subtract-duration!
           (std/srfi/19#time-utc->time-tai!
            (std/srfi/19#date->time-utc _d46708_))
           (let ()
             (declare (not safe))
             (##structure
              std/srfi/19#time::t
              std/srfi/19#time-duration
              '0
              '1)))
          (std/srfi/19#time-utc->time-tai!
           (std/srfi/19#date->time-utc _d46708_)))))
  (define std/srfi/19#date->time-monotonic
    (lambda (_date46706_)
      (std/srfi/19#time-utc->time-monotonic!
       (std/srfi/19#date->time-utc _date46706_))))
  (define std/srfi/19#tm:leap-year?
    (lambda (_year46701_)
      (let ((_$e46703_ (= (modulo _year46701_ '400) '0)))
        (if _$e46703_
            _$e46703_
            (if (= (modulo _year46701_ '4) '0)
                (not (= (modulo _year46701_ '100) '0))
                '#f)))))
  (define std/srfi/19#leap-year?
    (lambda (_date46699_)
      (std/srfi/19#tm:leap-year?
       (##structure-ref _date46699_ '7 std/srfi/19#date::t '#f))))
  (define std/srfi/19#tm:month-assoc
    '((0 . 0)
      (1 . 31)
      (2 . 59)
      (3 . 90)
      (4 . 120)
      (5 . 151)
      (6 . 181)
      (7 . 212)
      (8 . 243)
      (9 . 273)
      (10 . 304)
      (11 . 334)))
  (define std/srfi/19#tm:year-day
    (lambda (_day46693_ _month46694_ _year46695_)
      (let ((_days-pr46697_
             (assoc (- _month46694_ '1) std/srfi/19#tm:month-assoc)))
        (if (not _days-pr46697_)
            (std/srfi/19#tm:time-error
             'date-year-day
             'invalid-month-specification
             _month46694_)
            '#!void)
        (if (and (std/srfi/19#tm:leap-year? _year46695_) (> _month46694_ '2))
            (+ _day46693_ (cdr _days-pr46697_) '1)
            (+ _day46693_ (cdr _days-pr46697_))))))
  (define std/srfi/19#date-year-day
    (lambda (_date46691_)
      (std/srfi/19#tm:year-day
       (##structure-ref _date46691_ '5 std/srfi/19#date::t '#f)
       (##structure-ref _date46691_ '6 std/srfi/19#date::t '#f)
       (##structure-ref _date46691_ '7 std/srfi/19#date::t '#f))))
  (define std/srfi/19#tm:week-day
    (lambda (_day46680_ _month46681_ _year46682_)
      (let* ((_a46684_ (quotient (- '14 _month46681_) '12))
             (_y46686_ (- _year46682_ _a46684_))
             (_m46688_ (+ _month46681_ (* '12 _a46684_) '-2)))
        (modulo (+ _day46680_
                   _y46686_
                   (quotient _y46686_ '4)
                   (- (quotient _y46686_ '100))
                   (quotient _y46686_ '400)
                   (quotient (* '31 _m46688_) '12))
                '7))))
  (define std/srfi/19#date-week-day
    (lambda (_date46678_)
      (std/srfi/19#tm:week-day
       (##structure-ref _date46678_ '5 std/srfi/19#date::t '#f)
       (##structure-ref _date46678_ '6 std/srfi/19#date::t '#f)
       (##structure-ref _date46678_ '7 std/srfi/19#date::t '#f))))
  (define std/srfi/19#tm:days-before-first-week
    (lambda (_date46670_ _day-of-week-starting-week46671_)
      (let* ((_first-day46673_
              (let ((__tmp273075
                     (##structure-ref _date46670_ '7 std/srfi/19#date::t '#f)))
                (declare (not safe))
                (##structure
                 std/srfi/19#date::t
                 '0
                 '0
                 '0
                 '0
                 '1
                 '1
                 __tmp273075
                 '#f)))
             (_fdweek-day46675_ (std/srfi/19#date-week-day _first-day46673_)))
        (modulo (- _day-of-week-starting-week46671_ _fdweek-day46675_) '7))))
  (define std/srfi/19#date-week-number
    (lambda (_date46667_ _day-of-week-starting-week46668_)
      (quotient
       (- (std/srfi/19#date-year-day _date46667_)
          (std/srfi/19#tm:days-before-first-week
           _date46667_
           _day-of-week-starting-week46668_))
       '7)))
  (define std/srfi/19#current-date
    (lambda _tz-offset46662_
      (std/srfi/19#time-utc->date
       (std/srfi/19#current-time std/srfi/19#time-utc)
       (let ((_maybe-arg46664_ _tz-offset46662_))
         (if (null? _maybe-arg46664_)
             (std/srfi/19#tm:local-tz-offset)
             (if (null? (cdr _maybe-arg46664_))
                 (car _maybe-arg46664_)
                 (error '"too many optional arguments" _maybe-arg46664_)))))))
  (define std/srfi/19#tm:natural-year
    (lambda (_n46655_)
      (let* ((_current-year46657_
              (##structure-ref
               (std/srfi/19#current-date)
               '7
               std/srfi/19#date::t
               '#f))
             (_current-century46659_
              (* (quotient _current-year46657_ '100) '100)))
        (if (>= _n46655_ '100)
            _n46655_
            (if (< _n46655_ '0)
                _n46655_
                (if (<= (- (+ _current-century46659_ _n46655_)
                           _current-year46657_)
                        '50)
                    (+ _current-century46659_ _n46655_)
                    (+ (- _current-century46659_ '100) _n46655_)))))))
  (define std/srfi/19#date->julian-day
    (lambda (_date46644_)
      (let ((_nanosecond46646_
             (##structure-ref _date46644_ '1 std/srfi/19#date::t '#f))
            (_second46647_
             (##structure-ref _date46644_ '2 std/srfi/19#date::t '#f))
            (_minute46648_
             (##structure-ref _date46644_ '3 std/srfi/19#date::t '#f))
            (_hour46649_
             (##structure-ref _date46644_ '4 std/srfi/19#date::t '#f))
            (_day46650_
             (##structure-ref _date46644_ '5 std/srfi/19#date::t '#f))
            (_month46651_
             (##structure-ref _date46644_ '6 std/srfi/19#date::t '#f))
            (_year46652_
             (##structure-ref _date46644_ '7 std/srfi/19#date::t '#f))
            (_offset46653_
             (##structure-ref _date46644_ '8 std/srfi/19#date::t '#f)))
        (+ (std/srfi/19#tm:encode-julian-day-number
            _day46650_
            _month46651_
            _year46652_)
           (- '1/2)
           (+ (/ (/ (+ (* _hour46649_ '60 '60)
                       (* _minute46648_ '60)
                       _second46647_
                       (/ _nanosecond46646_ std/srfi/19#tm:nano))
                    std/srfi/19#tm:sid)
                 (- _offset46653_)))))))
  (define std/srfi/19#date->modified-julian-day
    (lambda (_date46642_)
      (- (std/srfi/19#date->julian-day _date46642_) '4800001/2)))
  (define std/srfi/19#time-utc->julian-day
    (lambda (_time46640_)
      (if (not (eq? (##structure-ref _time46640_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-utc))
          (std/srfi/19#tm:time-error
           'time-utc->julian-day
           'incompatible-time-types
           _time46640_)
          '#!void)
      (+ (/ (+ (##structure-ref _time46640_ '3 std/srfi/19#time::t '#f)
               (/ (##structure-ref _time46640_ '2 std/srfi/19#time::t '#f)
                  std/srfi/19#tm:nano))
            std/srfi/19#tm:sid)
         std/srfi/19#tm:tai-epoch-in-jd)))
  (define std/srfi/19#time-utc->modified-julian-day
    (lambda (_time46638_)
      (- (std/srfi/19#time-utc->julian-day _time46638_) '4800001/2)))
  (define std/srfi/19#time-tai->julian-day
    (lambda (_time46636_)
      (if (not (eq? (##structure-ref _time46636_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-tai))
          (std/srfi/19#tm:time-error
           'time-tai->julian-day
           'incompatible-time-types
           _time46636_)
          '#!void)
      (+ (/ (+ (- (##structure-ref _time46636_ '3 std/srfi/19#time::t '#f)
                  (std/srfi/19#tm:leap-second-delta
                   (##structure-ref _time46636_ '3 std/srfi/19#time::t '#f)))
               (/ (##structure-ref _time46636_ '2 std/srfi/19#time::t '#f)
                  std/srfi/19#tm:nano))
            std/srfi/19#tm:sid)
         std/srfi/19#tm:tai-epoch-in-jd)))
  (define std/srfi/19#time-tai->modified-julian-day
    (lambda (_time46634_)
      (- (std/srfi/19#time-tai->julian-day _time46634_) '4800001/2)))
  (define std/srfi/19#time-monotonic->julian-day
    (lambda (_time46632_)
      (if (not (eq? (##structure-ref _time46632_ '1 std/srfi/19#time::t '#f)
                    std/srfi/19#time-monotonic))
          (std/srfi/19#tm:time-error
           'time-monotonic->julian-day
           'incompatible-time-types
           _time46632_)
          '#!void)
      (+ (/ (+ (- (##structure-ref _time46632_ '3 std/srfi/19#time::t '#f)
                  (std/srfi/19#tm:leap-second-delta
                   (##structure-ref _time46632_ '3 std/srfi/19#time::t '#f)))
               (/ (##structure-ref _time46632_ '2 std/srfi/19#time::t '#f)
                  std/srfi/19#tm:nano))
            std/srfi/19#tm:sid)
         std/srfi/19#tm:tai-epoch-in-jd)))
  (define std/srfi/19#time-monotonic->modified-julian-day
    (lambda (_time46630_)
      (- (std/srfi/19#time-monotonic->julian-day _time46630_) '4800001/2)))
  (define std/srfi/19#julian-day->time-utc
    (lambda (_jdn46626_)
      (let ((_nanosecs46628_
             (* std/srfi/19#tm:nano
                std/srfi/19#tm:sid
                (- _jdn46626_ std/srfi/19#tm:tai-epoch-in-jd))))
        (let ((__tmp273077 (remainder _nanosecs46628_ std/srfi/19#tm:nano))
              (__tmp273076 (floor (/ _nanosecs46628_ std/srfi/19#tm:nano))))
          (declare (not safe))
          (##structure
           std/srfi/19#time::t
           std/srfi/19#time-utc
           __tmp273077
           __tmp273076)))))
  (define std/srfi/19#julian-day->time-tai
    (lambda (_jdn46624_)
      (std/srfi/19#time-utc->time-tai!
       (std/srfi/19#julian-day->time-utc _jdn46624_))))
  (define std/srfi/19#julian-day->time-monotonic
    (lambda (_jdn46622_)
      (std/srfi/19#time-utc->time-monotonic!
       (std/srfi/19#julian-day->time-utc _jdn46622_))))
  (define std/srfi/19#julian-day->date
    (lambda (_jdn46614_ . _tz-offset46615_)
      (let ((_offset46620_
             (let ((_maybe-arg46617_ _tz-offset46615_))
               (if (null? _maybe-arg46617_)
                   (std/srfi/19#tm:local-tz-offset)
                   (if (null? (cdr _maybe-arg46617_))
                       (car _maybe-arg46617_)
                       (error '"too many optional arguments"
                              _maybe-arg46617_))))))
        (std/srfi/19#time-utc->date
         (std/srfi/19#julian-day->time-utc _jdn46614_)
         _offset46620_))))
  (define std/srfi/19#modified-julian-day->date
    (lambda (_jdn46606_ . _tz-offset46607_)
      (let ((_offset46612_
             (let ((_maybe-arg46609_ _tz-offset46607_))
               (if (null? _maybe-arg46609_)
                   (std/srfi/19#tm:local-tz-offset)
                   (if (null? (cdr _maybe-arg46609_))
                       (car _maybe-arg46609_)
                       (error '"too many optional arguments"
                              _maybe-arg46609_))))))
        (std/srfi/19#julian-day->date
         (+ _jdn46606_ '4800001/2)
         _offset46612_))))
  (define std/srfi/19#modified-julian-day->time-utc
    (lambda (_jdn46604_)
      (std/srfi/19#julian-day->time-utc (+ _jdn46604_ '4800001/2))))
  (define std/srfi/19#modified-julian-day->time-tai
    (lambda (_jdn46602_)
      (std/srfi/19#julian-day->time-tai (+ _jdn46602_ '4800001/2))))
  (define std/srfi/19#modified-julian-day->time-monotonic
    (lambda (_jdn46600_)
      (std/srfi/19#julian-day->time-monotonic (+ _jdn46600_ '4800001/2))))
  (define std/srfi/19#current-julian-day
    (lambda ()
      (std/srfi/19#time-utc->julian-day
       (std/srfi/19#current-time std/srfi/19#time-utc))))
  (define std/srfi/19#current-modified-julian-day
    (lambda ()
      (std/srfi/19#time-utc->modified-julian-day
       (std/srfi/19#current-time std/srfi/19#time-utc))))
  (define std/srfi/19#tm:padding
    (lambda (_n46576_ _pad-with46577_ _length46578_)
      (let* ((_str46580_ (number->string _n46576_))
             (_str-len46582_ (string-length _str46580_)))
        (if (or (> _str-len46582_ _length46578_) (not _pad-with46577_))
            _str46580_
            (let* ((_new-str46588_ (make-string _length46578_ _pad-with46577_))
                   (_new-str-offset46590_
                    (- (string-length _new-str46588_) _str-len46582_)))
              (let _$loop46593_ ((_i46596_ '0))
                (if (>= _i46596_ (string-length _str46580_))
                    '#!void
                    (begin
                      (string-set!
                       _new-str46588_
                       (+ _new-str-offset46590_ _i46596_)
                       (string-ref _str46580_ _i46596_))
                      (_$loop46593_ (+ _i46596_ '1)))))
              _new-str46588_)))))
  (define std/srfi/19#tm:last-n-digits
    (lambda (_i46573_ _n46574_)
      (abs (remainder _i46573_ (expt '10 _n46574_)))))
  (define std/srfi/19#tm:locale-abbr-weekday
    (lambda (_n46571_)
      (vector-ref std/srfi/19#tm:locale-abbr-weekday-vector _n46571_)))
  (define std/srfi/19#tm:locale-long-weekday
    (lambda (_n46569_)
      (vector-ref std/srfi/19#tm:locale-long-weekday-vector _n46569_)))
  (define std/srfi/19#tm:locale-abbr-month
    (lambda (_n46567_)
      (vector-ref std/srfi/19#tm:locale-abbr-month-vector _n46567_)))
  (define std/srfi/19#tm:locale-long-month
    (lambda (_n46565_)
      (vector-ref std/srfi/19#tm:locale-long-month-vector _n46565_)))
  (define std/srfi/19#tm:vector-find
    (lambda (_needle46555_ _haystack46556_ _comparator46557_)
      (let ((_len46559_ (vector-length _haystack46556_)))
        (letrec ((_tm:vector-find-int46561_
                  (lambda (_index46563_)
                    (if (>= _index46563_ _len46559_)
                        '#f
                        (if (_comparator46557_
                             _needle46555_
                             (vector-ref _haystack46556_ _index46563_))
                            _index46563_
                            (_tm:vector-find-int46561_
                             (+ _index46563_ '1)))))))
          (_tm:vector-find-int46561_ '0)))))
  (define std/srfi/19#tm:locale-abbr-weekday->index
    (lambda (_string46553_)
      (std/srfi/19#tm:vector-find
       _string46553_
       std/srfi/19#tm:locale-abbr-weekday-vector
       string=?)))
  (define std/srfi/19#tm:locale-long-weekday->index
    (lambda (_string46551_)
      (std/srfi/19#tm:vector-find
       _string46551_
       std/srfi/19#tm:locale-long-weekday-vector
       string=?)))
  (define std/srfi/19#tm:locale-abbr-month->index
    (lambda (_string46549_)
      (std/srfi/19#tm:vector-find
       _string46549_
       std/srfi/19#tm:locale-abbr-month-vector
       string=?)))
  (define std/srfi/19#tm:locale-long-month->index
    (lambda (_string46547_)
      (std/srfi/19#tm:vector-find
       _string46547_
       std/srfi/19#tm:locale-long-month-vector
       string=?)))
  (define std/srfi/19#tm:locale-print-time-zone
    (lambda (_date46544_ _port46545_) '#!void))
  (define std/srfi/19#tm:locale-am/pm
    (lambda (_hr46542_)
      (if (> _hr46542_ '11)
          std/srfi/19#tm:locale-pm
          std/srfi/19#tm:locale-am)))
  (define std/srfi/19#tm:tz-printer
    (lambda (_offset46536_ _port46537_)
      (if (= _offset46536_ '0)
          (display '"Z" _port46537_)
          (if (negative? _offset46536_)
              (display '"-" _port46537_)
              (display '"+" _port46537_)))
      (if (not (= _offset46536_ '0))
          (let ((_hours46539_ (abs (quotient _offset46536_ (* '60 '60))))
                (_minutes46540_
                 (abs (quotient (remainder _offset46536_ (* '60 '60)) '60))))
            (display (std/srfi/19#tm:padding _hours46539_ '#\0 '2) _port46537_)
            (display (std/srfi/19#tm:padding _minutes46540_ '#\0 '2)
                     _port46537_))
          '#!void)))
  (define std/srfi/19#tm:directives
    (list (cons '#\~
                (lambda (_date46363_ _pad-with46364_ _port46365_)
                  (display '#\~ _port46365_)))
          (cons '#\a
                (lambda (_date46367_ _pad-with46368_ _port46369_)
                  (display (std/srfi/19#tm:locale-abbr-weekday
                            (std/srfi/19#date-week-day _date46367_))
                           _port46369_)))
          (cons '#\A
                (lambda (_date46371_ _pad-with46372_ _port46373_)
                  (display (std/srfi/19#tm:locale-long-weekday
                            (std/srfi/19#date-week-day _date46371_))
                           _port46373_)))
          (cons '#\b
                (lambda (_date46375_ _pad-with46376_ _port46377_)
                  (display (std/srfi/19#tm:locale-abbr-month
                            (##structure-ref
                             _date46375_
                             '6
                             std/srfi/19#date::t
                             '#f))
                           _port46377_)))
          (cons '#\B
                (lambda (_date46379_ _pad-with46380_ _port46381_)
                  (display (std/srfi/19#tm:locale-long-month
                            (##structure-ref
                             _date46379_
                             '6
                             std/srfi/19#date::t
                             '#f))
                           _port46381_)))
          (cons '#\c
                (lambda (_date46383_ _pad-with46384_ _port46385_)
                  (display (std/srfi/19#date->string
                            _date46383_
                            std/srfi/19#tm:locale-date-time-format)
                           _port46385_)))
          (cons '#\d
                (lambda (_date46387_ _pad-with46388_ _port46389_)
                  (display (std/srfi/19#tm:padding
                            (##structure-ref
                             _date46387_
                             '5
                             std/srfi/19#date::t
                             '#f)
                            '#\0
                            '2)
                           _port46389_)))
          (cons '#\D
                (lambda (_date46391_ _pad-with46392_ _port46393_)
                  (display (std/srfi/19#date->string _date46391_ '"~m/~d/~y")
                           _port46393_)))
          (cons '#\e
                (lambda (_date46395_ _pad-with46396_ _port46397_)
                  (display (std/srfi/19#tm:padding
                            (##structure-ref
                             _date46395_
                             '5
                             std/srfi/19#date::t
                             '#f)
                            '#\space
                            '2)
                           _port46397_)))
          (cons '#\f
                (lambda (_date46399_ _pad-with46400_ _port46401_)
                  (if (> (##structure-ref
                          _date46399_
                          '1
                          std/srfi/19#date::t
                          '#f)
                         std/srfi/19#tm:nano)
                      (display (std/srfi/19#tm:padding
                                (+ (##structure-ref
                                    _date46399_
                                    '2
                                    std/srfi/19#date::t
                                    '#f)
                                   '1)
                                _pad-with46400_
                                '2)
                               _port46401_)
                      (display (std/srfi/19#tm:padding
                                (##structure-ref
                                 _date46399_
                                 '2
                                 std/srfi/19#date::t
                                 '#f)
                                _pad-with46400_
                                '2)
                               _port46401_))
                  (let* ((_ns46403_
                          (std/srfi/19#tm:fractional-part
                           (/ (##structure-ref
                               _date46399_
                               '1
                               std/srfi/19#date::t
                               '#f)
                              std/srfi/19#tm:nano
                              '1.)))
                         (_le46405_ (string-length _ns46403_)))
                    (if (> _le46405_ '2)
                        (begin
                          (display std/srfi/19#tm:locale-number-separator
                                   _port46401_)
                          (display (substring _ns46403_ '2 _le46405_)
                                   _port46401_))
                        '#!void))))
          (cons '#\h
                (lambda (_date46408_ _pad-with46409_ _port46410_)
                  (display (std/srfi/19#date->string _date46408_ '"~b")
                           _port46410_)))
          (cons '#\H
                (lambda (_date46412_ _pad-with46413_ _port46414_)
                  (display (std/srfi/19#tm:padding
                            (##structure-ref
                             _date46412_
                             '4
                             std/srfi/19#date::t
                             '#f)
                            _pad-with46413_
                            '2)
                           _port46414_)))
          (cons '#\I
                (lambda (_date46416_ _pad-with46417_ _port46418_)
                  (let ((_hr46420_
                         (##structure-ref
                          _date46416_
                          '4
                          std/srfi/19#date::t
                          '#f)))
                    (if (> _hr46420_ '12)
                        (display (std/srfi/19#tm:padding
                                  (- _hr46420_ '12)
                                  _pad-with46417_
                                  '2)
                                 _port46418_)
                        (display (std/srfi/19#tm:padding
                                  _hr46420_
                                  _pad-with46417_
                                  '2)
                                 _port46418_)))))
          (cons '#\j
                (lambda (_date46422_ _pad-with46423_ _port46424_)
                  (display (std/srfi/19#tm:padding
                            (std/srfi/19#date-year-day _date46422_)
                            _pad-with46423_
                            '3)
                           _port46424_)))
          (cons '#\k
                (lambda (_date46426_ _pad-with46427_ _port46428_)
                  (display (std/srfi/19#tm:padding
                            (##structure-ref
                             _date46426_
                             '4
                             std/srfi/19#date::t
                             '#f)
                            '#\0
                            '2)
                           _port46428_)))
          (cons '#\l
                (lambda (_date46430_ _pad-with46431_ _port46432_)
                  (let ((_hr46434_
                         (if (> (##structure-ref
                                 _date46430_
                                 '4
                                 std/srfi/19#date::t
                                 '#f)
                                '12)
                             (- (##structure-ref
                                 _date46430_
                                 '4
                                 std/srfi/19#date::t
                                 '#f)
                                '12)
                             (##structure-ref
                              _date46430_
                              '4
                              std/srfi/19#date::t
                              '#f))))
                    (display (std/srfi/19#tm:padding _hr46434_ '#\space '2)
                             _port46432_))))
          (cons '#\m
                (lambda (_date46436_ _pad-with46437_ _port46438_)
                  (display (std/srfi/19#tm:padding
                            (##structure-ref
                             _date46436_
                             '6
                             std/srfi/19#date::t
                             '#f)
                            _pad-with46437_
                            '2)
                           _port46438_)))
          (cons '#\M
                (lambda (_date46440_ _pad-with46441_ _port46442_)
                  (display (std/srfi/19#tm:padding
                            (##structure-ref
                             _date46440_
                             '3
                             std/srfi/19#date::t
                             '#f)
                            _pad-with46441_
                            '2)
                           _port46442_)))
          (cons '#\n
                (lambda (_date46444_ _pad-with46445_ _port46446_)
                  (newline _port46446_)))
          (cons '#\N
                (lambda (_date46448_ _pad-with46449_ _port46450_)
                  (display (std/srfi/19#tm:padding
                            (##structure-ref
                             _date46448_
                             '1
                             std/srfi/19#date::t
                             '#f)
                            _pad-with46449_
                            '9)
                           _port46450_)))
          (cons '#\p
                (lambda (_date46452_ _pad-with46453_ _port46454_)
                  (display (std/srfi/19#tm:locale-am/pm
                            (##structure-ref
                             _date46452_
                             '4
                             std/srfi/19#date::t
                             '#f))
                           _port46454_)))
          (cons '#\r
                (lambda (_date46456_ _pad-with46457_ _port46458_)
                  (display (std/srfi/19#date->string
                            _date46456_
                            '"~I:~M:~S ~p")
                           _port46458_)))
          (cons '#\s
                (lambda (_date46460_ _pad-with46461_ _port46462_)
                  (display (##structure-ref
                            (std/srfi/19#date->time-utc _date46460_)
                            '3
                            std/srfi/19#time::t
                            '#f)
                           _port46462_)))
          (cons '#\S
                (lambda (_date46464_ _pad-with46465_ _port46466_)
                  (if (> (##structure-ref
                          _date46464_
                          '1
                          std/srfi/19#date::t
                          '#f)
                         std/srfi/19#tm:nano)
                      (display (std/srfi/19#tm:padding
                                (+ (##structure-ref
                                    _date46464_
                                    '2
                                    std/srfi/19#date::t
                                    '#f)
                                   '1)
                                _pad-with46465_
                                '2)
                               _port46466_)
                      (display (std/srfi/19#tm:padding
                                (##structure-ref
                                 _date46464_
                                 '2
                                 std/srfi/19#date::t
                                 '#f)
                                _pad-with46465_
                                '2)
                               _port46466_))))
          (cons '#\t
                (lambda (_date46468_ _pad-with46469_ _port46470_)
                  (display (integer->char '9) _port46470_)))
          (cons '#\T
                (lambda (_date46472_ _pad-with46473_ _port46474_)
                  (display (std/srfi/19#date->string _date46472_ '"~H:~M:~S")
                           _port46474_)))
          (cons '#\U
                (lambda (_date46476_ _pad-with46477_ _port46478_)
                  (if (> (std/srfi/19#tm:days-before-first-week _date46476_ '0)
                         '0)
                      (display (std/srfi/19#tm:padding
                                (+ (std/srfi/19#date-week-number
                                    _date46476_
                                    '0)
                                   '1)
                                '#\0
                                '2)
                               _port46478_)
                      (display (std/srfi/19#tm:padding
                                (std/srfi/19#date-week-number _date46476_ '0)
                                '#\0
                                '2)
                               _port46478_))))
          (cons '#\V
                (lambda (_date46480_ _pad-with46481_ _port46482_)
                  (display (std/srfi/19#tm:padding
                            (std/srfi/19#date-week-number _date46480_ '1)
                            '#\0
                            '2)
                           _port46482_)))
          (cons '#\w
                (lambda (_date46484_ _pad-with46485_ _port46486_)
                  (display (std/srfi/19#date-week-day _date46484_)
                           _port46486_)))
          (cons '#\x
                (lambda (_date46488_ _pad-with46489_ _port46490_)
                  (display (std/srfi/19#date->string
                            _date46488_
                            std/srfi/19#tm:locale-short-date-format)
                           _port46490_)))
          (cons '#\X
                (lambda (_date46492_ _pad-with46493_ _port46494_)
                  (display (std/srfi/19#date->string
                            _date46492_
                            std/srfi/19#tm:locale-time-format)
                           _port46494_)))
          (cons '#\W
                (lambda (_date46496_ _pad-with46497_ _port46498_)
                  (if (> (std/srfi/19#tm:days-before-first-week _date46496_ '1)
                         '0)
                      (display (std/srfi/19#tm:padding
                                (+ (std/srfi/19#date-week-number
                                    _date46496_
                                    '1)
                                   '1)
                                '#\0
                                '2)
                               _port46498_)
                      (display (std/srfi/19#tm:padding
                                (std/srfi/19#date-week-number _date46496_ '1)
                                '#\0
                                '2)
                               _port46498_))))
          (cons '#\y
                (lambda (_date46500_ _pad-with46501_ _port46502_)
                  (display (std/srfi/19#tm:padding
                            (std/srfi/19#tm:last-n-digits
                             (##structure-ref
                              _date46500_
                              '7
                              std/srfi/19#date::t
                              '#f)
                             '2)
                            _pad-with46501_
                            '2)
                           _port46502_)))
          (cons '#\Y
                (lambda (_date46504_ _pad-with46505_ _port46506_)
                  (display (##structure-ref
                            _date46504_
                            '7
                            std/srfi/19#date::t
                            '#f)
                           _port46506_)))
          (cons '#\z
                (lambda (_date46508_ _pad-with46509_ _port46510_)
                  (std/srfi/19#tm:tz-printer
                   (##structure-ref _date46508_ '8 std/srfi/19#date::t '#f)
                   _port46510_)))
          (cons '#\Z
                (lambda (_date46512_ _pad-with46513_ _port46514_)
                  (std/srfi/19#tm:locale-print-time-zone
                   _date46512_
                   _port46514_)))
          (cons '#\1
                (lambda (_date46516_ _pad-with46517_ _port46518_)
                  (display (std/srfi/19#date->string _date46516_ '"~Y-~m-~d")
                           _port46518_)))
          (cons '#\2
                (lambda (_date46520_ _pad-with46521_ _port46522_)
                  (display (std/srfi/19#date->string _date46520_ '"~k:~M:~S~z")
                           _port46522_)))
          (cons '#\3
                (lambda (_date46524_ _pad-with46525_ _port46526_)
                  (display (std/srfi/19#date->string _date46524_ '"~k:~M:~S")
                           _port46526_)))
          (cons '#\4
                (lambda (_date46528_ _pad-with46529_ _port46530_)
                  (display (std/srfi/19#date->string
                            _date46528_
                            '"~Y-~m-~dT~k:~M:~S~z")
                           _port46530_)))
          (cons '#\5
                (lambda (_date46532_ _pad-with46533_ _port46534_)
                  (display (std/srfi/19#date->string
                            _date46532_
                            '"~Y-~m-~dT~k:~M:~S")
                           _port46534_)))))
  (define std/srfi/19#tm:get-formatter
    (lambda (_char46359_)
      (let ((_associated46361_ (assoc _char46359_ std/srfi/19#tm:directives)))
        (if _associated46361_ (cdr _associated46361_) '#f))))
  (define std/srfi/19#tm:date-printer
    (lambda (_date46343_
             _index46344_
             _format-string46345_
             _str-len46346_
             _port46347_)
      (if (>= _index46344_ _str-len46346_)
          '#!void
          (let ((_current-char46349_
                 (string-ref _format-string46345_ _index46344_)))
            (if (not (char=? _current-char46349_ '#\~))
                (begin
                  (display _current-char46349_ _port46347_)
                  (std/srfi/19#tm:date-printer
                   _date46343_
                   (+ _index46344_ '1)
                   _format-string46345_
                   _str-len46346_
                   _port46347_))
                (if (= (+ _index46344_ '1) _str-len46346_)
                    (std/srfi/19#tm:time-error
                     'tm:date-printer
                     'bad-date-format-string
                     _format-string46345_)
                    (let ((_pad-char?46351_
                           (string-ref
                            _format-string46345_
                            (+ _index46344_ '1))))
                      (if (char=? _pad-char?46351_ '#\-)
                          (if (= (+ _index46344_ '2) _str-len46346_)
                              (std/srfi/19#tm:time-error
                               'tm:date-printer
                               'bad-date-format-string
                               _format-string46345_)
                              (let ((_formatter46353_
                                     (std/srfi/19#tm:get-formatter
                                      (string-ref
                                       _format-string46345_
                                       (+ _index46344_ '2)))))
                                (if (not _formatter46353_)
                                    (std/srfi/19#tm:time-error
                                     'tm:date-printer
                                     'bad-date-format-string
                                     _format-string46345_)
                                    (begin
                                      (_formatter46353_
                                       _date46343_
                                       '#f
                                       _port46347_)
                                      (std/srfi/19#tm:date-printer
                                       _date46343_
                                       (+ _index46344_ '3)
                                       _format-string46345_
                                       _str-len46346_
                                       _port46347_)))))
                          (if (char=? _pad-char?46351_ '#\_)
                              (if (= (+ _index46344_ '2) _str-len46346_)
                                  (std/srfi/19#tm:time-error
                                   'tm:date-printer
                                   'bad-date-format-string
                                   _format-string46345_)
                                  (let ((_formatter46355_
                                         (std/srfi/19#tm:get-formatter
                                          (string-ref
                                           _format-string46345_
                                           (+ _index46344_ '2)))))
                                    (if (not _formatter46355_)
                                        (std/srfi/19#tm:time-error
                                         'tm:date-printer
                                         'bad-date-format-string
                                         _format-string46345_)
                                        (begin
                                          (_formatter46355_
                                           _date46343_
                                           '#\space
                                           _port46347_)
                                          (std/srfi/19#tm:date-printer
                                           _date46343_
                                           (+ _index46344_ '3)
                                           _format-string46345_
                                           _str-len46346_
                                           _port46347_)))))
                              (let ((_formatter46357_
                                     (std/srfi/19#tm:get-formatter
                                      (string-ref
                                       _format-string46345_
                                       (+ _index46344_ '1)))))
                                (if (not _formatter46357_)
                                    (std/srfi/19#tm:time-error
                                     'tm:date-printer
                                     'bad-date-format-string
                                     _format-string46345_)
                                    (begin
                                      (_formatter46357_
                                       _date46343_
                                       '#\0
                                       _port46347_)
                                      (std/srfi/19#tm:date-printer
                                       _date46343_
                                       (+ _index46344_ '2)
                                       _format-string46345_
                                       _str-len46346_
                                       _port46347_)))))))))))))
  (define std/srfi/19#date->string
    (lambda (_date46334_ . _format-string46335_)
      (let ((_str-port46340_ (open-output-string))
            (_fmt-str46341_
             (let ((_maybe-arg46337_ _format-string46335_))
               (if (null? _maybe-arg46337_)
                   '"~c"
                   (if (null? (cdr _maybe-arg46337_))
                       (car _maybe-arg46337_)
                       (error '"too many optional arguments"
                              _maybe-arg46337_))))))
        (std/srfi/19#tm:date-printer
         _date46334_
         '0
         _fmt-str46341_
         (string-length _fmt-str46341_)
         _str-port46340_)
        (get-output-string _str-port46340_))))
  (define std/srfi/19#tm:char->int
    (lambda (_ch46332_)
      (if (char=? _ch46332_ '#\0)
          '0
          (if (char=? _ch46332_ '#\1)
              '1
              (if (char=? _ch46332_ '#\2)
                  '2
                  (if (char=? _ch46332_ '#\3)
                      '3
                      (if (char=? _ch46332_ '#\4)
                          '4
                          (if (char=? _ch46332_ '#\5)
                              '5
                              (if (char=? _ch46332_ '#\6)
                                  '6
                                  (if (char=? _ch46332_ '#\7)
                                      '7
                                      (if (char=? _ch46332_ '#\8)
                                          '8
                                          (if (char=? _ch46332_ '#\9)
                                              '9
                                              (std/srfi/19#tm:time-error
                                               'string->date
                                               'bad-date-template-string
                                               (list '"Non-integer character"
                                                     _ch46332_))))))))))))))
  (define std/srfi/19#tm:integer-reader
    (lambda (_upto46315_ _port46316_)
      (letrec ((_accum-int46318_
                (lambda (_port46320_ _accum46321_ _nchars46322_)
                  (let ((_ch46324_ (peek-char _port46320_)))
                    (if (or (eof-object? _ch46324_)
                            (not (char-numeric? _ch46324_))
                            (and _upto46315_ (>= _nchars46322_ _upto46315_)))
                        _accum46321_
                        (_accum-int46318_
                         _port46320_
                         (+ (* _accum46321_ '10)
                            (std/srfi/19#tm:char->int (read-char _port46320_)))
                         (+ _nchars46322_ '1)))))))
        (_accum-int46318_ _port46316_ '0 '0))))
  (define std/srfi/19#tm:make-integer-reader
    (lambda (_upto46311_)
      (lambda (_port46313_)
        (std/srfi/19#tm:integer-reader _upto46311_ _port46313_))))
  (define std/srfi/19#tm:fractional-integer-reader
    (lambda (_upto46294_ _port46295_)
      (letrec ((_accum-int46297_
                (lambda (_port46299_ _accum46300_ _nchars46301_)
                  (let ((_ch46303_ (peek-char _port46299_)))
                    (if (or (eof-object? _ch46303_)
                            (not (char-numeric? _ch46303_))
                            (and _upto46294_ (>= _nchars46301_ _upto46294_)))
                        (* _accum46300_
                           (expt '10 (- _upto46294_ _nchars46301_)))
                        (_accum-int46297_
                         _port46299_
                         (+ (* _accum46300_ '10)
                            (std/srfi/19#tm:char->int (read-char _port46299_)))
                         (+ _nchars46301_ '1)))))))
        (_accum-int46297_ _port46295_ '0 '0))))
  (define std/srfi/19#tm:make-fractional-integer-reader
    (lambda (_upto46290_)
      (lambda (_port46292_)
        (std/srfi/19#tm:fractional-integer-reader _upto46290_ _port46292_))))
  (define std/srfi/19#tm:integer-reader-exact
    (lambda (_n46277_ _port46278_)
      (let ((_padding-ok46280_ '#t))
        (letrec ((_accum-int46282_
                  (lambda (_port46284_ _accum46285_ _nchars46286_)
                    (let ((_ch46288_ (peek-char _port46284_)))
                      (if (>= _nchars46286_ _n46277_)
                          _accum46285_
                          (if (eof-object? _ch46288_)
                              (std/srfi/19#tm:time-error
                               'string->date
                               'bad-date-template-string
                               '"Premature ending to integer read.")
                              (if (char-numeric? _ch46288_)
                                  (begin
                                    (set! _padding-ok46280_ '#f)
                                    (_accum-int46282_
                                     _port46284_
                                     (+ (* _accum46285_ '10)
                                        (std/srfi/19#tm:char->int
                                         (read-char _port46284_)))
                                     (+ _nchars46286_ '1)))
                                  (if _padding-ok46280_
                                      (begin
                                        (read-char _port46284_)
                                        (_accum-int46282_
                                         _port46284_
                                         _accum46285_
                                         (+ _nchars46286_ '1)))
                                      (std/srfi/19#tm:time-error
                                       'string->date
                                       'bad-date-template-string
                                       '"Non-numeric characters in integer read.")))))))))
          (_accum-int46282_ _port46278_ '0 '0)))))
  (define std/srfi/19#tm:make-integer-exact-reader
    (lambda (_n46273_)
      (lambda (_port46275_)
        (std/srfi/19#tm:integer-reader-exact _n46273_ _port46275_))))
  (define std/srfi/19#tm:zone-reader
    (lambda (_port46255_)
      (let ((_offset46257_ '0) (_positive?46258_ '#f))
        (let ((_ch46260_ (read-char _port46255_)))
          (if (eof-object? _ch46260_)
              (std/srfi/19#tm:time-error
               'string->date
               'bad-date-template-string
               (list '"Invalid time zone +/-" _ch46260_))
              '#!void)
          (if (or (char=? _ch46260_ '#\Z) (char=? _ch46260_ '#\z))
              '0
              (begin
                (if (char=? _ch46260_ '#\+)
                    (set! _positive?46258_ '#t)
                    (if (char=? _ch46260_ '#\-)
                        (set! _positive?46258_ '#f)
                        (std/srfi/19#tm:time-error
                         'string->date
                         'bad-date-template-string
                         (list '"Invalid time zone +/-" _ch46260_))))
                (let ((_ch46265_ (read-char _port46255_)))
                  (if (eof-object? _ch46265_)
                      (std/srfi/19#tm:time-error
                       'string->date
                       'bad-date-template-string
                       (list '"Invalid time zone number" _ch46265_))
                      '#!void)
                  (set! _offset46257_
                        (* (std/srfi/19#tm:char->int _ch46265_) '10 '60 '60)))
                (let ((_ch46267_ (read-char _port46255_)))
                  (if (eof-object? _ch46267_)
                      (std/srfi/19#tm:time-error
                       'string->date
                       'bad-date-template-string
                       (list '"Invalid time zone number" _ch46267_))
                      '#!void)
                  (set! _offset46257_
                        (+ _offset46257_
                           (* (std/srfi/19#tm:char->int _ch46267_) '60 '60))))
                (let ((_ch46269_ (read-char _port46255_)))
                  (if (eof-object? _ch46269_)
                      (std/srfi/19#tm:time-error
                       'string->date
                       'bad-date-template-string
                       (list '"Invalid time zone number" _ch46269_))
                      '#!void)
                  (set! _offset46257_
                        (+ _offset46257_
                           (* (std/srfi/19#tm:char->int _ch46269_) '10 '60))))
                (let ((_ch46271_ (read-char _port46255_)))
                  (if (eof-object? _ch46271_)
                      (std/srfi/19#tm:time-error
                       'string->date
                       'bad-date-template-string
                       (list '"Invalid time zone number" _ch46271_))
                      '#!void)
                  (set! _offset46257_
                        (+ _offset46257_
                           (* (std/srfi/19#tm:char->int _ch46271_) '60))))
                (if _positive?46258_ _offset46257_ (- _offset46257_))))))))
  (define std/srfi/19#tm:locale-reader
    (lambda (_port46240_ _indexer46241_)
      (let ((_string-port46243_ (open-output-string)))
        (letrec ((_read-char-string46245_
                  (lambda ()
                    (let ((_ch46253_ (peek-char _port46240_)))
                      (if (char-alphabetic? _ch46253_)
                          (begin
                            (write-char
                             (read-char _port46240_)
                             _string-port46243_)
                            (_read-char-string46245_))
                          (get-output-string _string-port46243_))))))
          (let* ((_str46247_ (_read-char-string46245_))
                 (_index46249_ (_indexer46241_ _str46247_)))
            (if _index46249_
                _index46249_
                (std/srfi/19#tm:time-error
                 'string->date
                 'bad-date-template-string
                 (list '"Invalid string for " _indexer46241_))))))))
  (define std/srfi/19#tm:make-locale-reader
    (lambda (_indexer46236_)
      (lambda (_port46238_)
        (std/srfi/19#tm:locale-reader _port46238_ _indexer46236_))))
  (define std/srfi/19#tm:make-char-id-reader
    (lambda (_char46232_)
      (lambda (_port46234_)
        (if (char=? _char46232_ (read-char _port46234_))
            _char46232_
            (std/srfi/19#tm:time-error
             'string->date
             'bad-date-template-string
             '"Invalid character match.")))))
  (define std/srfi/19#tm:read-directives
    (let ((_ireader446166_ (std/srfi/19#tm:make-integer-reader '4))
          (_ireader246167_ (std/srfi/19#tm:make-integer-reader '2))
          (_fireader946168_ (std/srfi/19#tm:make-fractional-integer-reader '9))
          (_ireaderf46169_ (std/srfi/19#tm:make-integer-reader '#f))
          (_eireader246170_ (std/srfi/19#tm:make-integer-exact-reader '2))
          (_eireader446171_ (std/srfi/19#tm:make-integer-exact-reader '4))
          (_locale-reader-abbr-weekday46172_
           (std/srfi/19#tm:make-locale-reader
            std/srfi/19#tm:locale-abbr-weekday->index))
          (_locale-reader-long-weekday46173_
           (std/srfi/19#tm:make-locale-reader
            std/srfi/19#tm:locale-long-weekday->index))
          (_locale-reader-abbr-month46174_
           (std/srfi/19#tm:make-locale-reader
            std/srfi/19#tm:locale-abbr-month->index))
          (_locale-reader-long-month46175_
           (std/srfi/19#tm:make-locale-reader
            std/srfi/19#tm:locale-long-month->index))
          (_char-fail46176_ (lambda (_ch46161_) '#t))
          (_do-nothing46177_ (lambda (_val46163_ _object46164_) '#!void)))
      (list (list '#\~
                  _char-fail46176_
                  (std/srfi/19#tm:make-char-id-reader '#\~)
                  _do-nothing46177_)
            (list '#\a
                  char-alphabetic?
                  _locale-reader-abbr-weekday46172_
                  _do-nothing46177_)
            (list '#\A
                  char-alphabetic?
                  _locale-reader-long-weekday46173_
                  _do-nothing46177_)
            (list '#\b
                  char-alphabetic?
                  _locale-reader-abbr-month46174_
                  (lambda (_val46179_ _object46180_)
                    (##structure-set!
                     _object46180_
                     _val46179_
                     '6
                     std/srfi/19#date::t
                     '#f)))
            (list '#\B
                  char-alphabetic?
                  _locale-reader-long-month46175_
                  (lambda (_val46182_ _object46183_)
                    (##structure-set!
                     _object46183_
                     _val46182_
                     '6
                     std/srfi/19#date::t
                     '#f)))
            (list '#\d
                  char-numeric?
                  _ireader246167_
                  (lambda (_val46185_ _object46186_)
                    (##structure-set!
                     _object46186_
                     _val46185_
                     '5
                     std/srfi/19#date::t
                     '#f)))
            (list '#\e
                  _char-fail46176_
                  _eireader246170_
                  (lambda (_val46188_ _object46189_)
                    (##structure-set!
                     _object46189_
                     _val46188_
                     '5
                     std/srfi/19#date::t
                     '#f)))
            (list '#\h
                  char-alphabetic?
                  _locale-reader-abbr-month46174_
                  (lambda (_val46191_ _object46192_)
                    (##structure-set!
                     _object46192_
                     _val46191_
                     '6
                     std/srfi/19#date::t
                     '#f)))
            (list '#\H
                  char-numeric?
                  _ireader246167_
                  (lambda (_val46194_ _object46195_)
                    (##structure-set!
                     _object46195_
                     _val46194_
                     '4
                     std/srfi/19#date::t
                     '#f)))
            (list '#\k
                  _char-fail46176_
                  _eireader246170_
                  (lambda (_val46197_ _object46198_)
                    (##structure-set!
                     _object46198_
                     _val46197_
                     '4
                     std/srfi/19#date::t
                     '#f)))
            (list '#\m
                  char-numeric?
                  _ireader246167_
                  (lambda (_val46200_ _object46201_)
                    (##structure-set!
                     _object46201_
                     _val46200_
                     '6
                     std/srfi/19#date::t
                     '#f)))
            (list '#\M
                  char-numeric?
                  _ireader246167_
                  (lambda (_val46203_ _object46204_)
                    (##structure-set!
                     _object46204_
                     _val46203_
                     '3
                     std/srfi/19#date::t
                     '#f)))
            (list '#\N
                  char-numeric?
                  _fireader946168_
                  (lambda (_val46206_ _object46207_)
                    (##structure-set!
                     _object46207_
                     _val46206_
                     '1
                     std/srfi/19#date::t
                     '#f)))
            (list '#\S
                  char-numeric?
                  _ireader246167_
                  (lambda (_val46209_ _object46210_)
                    (##structure-set!
                     _object46210_
                     _val46209_
                     '2
                     std/srfi/19#date::t
                     '#f)))
            (list '#\y
                  _char-fail46176_
                  _eireader246170_
                  (lambda (_val46212_ _object46213_)
                    (##structure-set!
                     _object46213_
                     (std/srfi/19#tm:natural-year _val46212_)
                     '7
                     std/srfi/19#date::t
                     '#f)))
            (list '#\Y
                  char-numeric?
                  _ireader446166_
                  (lambda (_val46215_ _object46216_)
                    (##structure-set!
                     _object46216_
                     _val46215_
                     '7
                     std/srfi/19#date::t
                     '#f)))
            (list '#\z
                  (lambda (_c46218_)
                    (let ((_$e46220_ (char=? _c46218_ '#\Z)))
                      (if _$e46220_
                          _$e46220_
                          (let ((_$e46223_ (char=? _c46218_ '#\z)))
                            (if _$e46223_
                                _$e46223_
                                (let ((_$e46226_ (char=? _c46218_ '#\+)))
                                  (if _$e46226_
                                      _$e46226_
                                      (char=? _c46218_ '#\-))))))))
                  std/srfi/19#tm:zone-reader
                  (lambda (_val46229_ _object46230_)
                    (##structure-set!
                     _object46230_
                     _val46229_
                     '8
                     std/srfi/19#date::t
                     '#f))))))
  (define std/srfi/19#tm:string->date
    (lambda (_date46129_
             _index46130_
             _format-string46131_
             _str-len46132_
             _port46133_
             _template-string46134_)
      (letrec ((_skip-until46136_
                (lambda (_port46156_ _skipper46157_)
                  (let ((_ch46159_ (peek-char _port46156_)))
                    (if (eof-object? _ch46159_)
                        (std/srfi/19#tm:time-error
                         'string->date
                         'bad-date-format-string
                         _template-string46134_)
                        (if (not (_skipper46157_ _ch46159_))
                            (begin
                              (read-char _port46156_)
                              (_skip-until46136_ _port46156_ _skipper46157_))
                            '#!void))))))
        (if (>= _index46130_ _str-len46132_)
            '#!void
            (let ((_current-char46138_
                   (string-ref _format-string46131_ _index46130_)))
              (if (not (char=? _current-char46138_ '#\~))
                  (let ((_port-char46140_ (read-char _port46133_)))
                    (if (or (eof-object? _port-char46140_)
                            (not (char=? _current-char46138_
                                         _port-char46140_)))
                        (std/srfi/19#tm:time-error
                         'string->date
                         'bad-date-format-string
                         _template-string46134_)
                        '#!void)
                    (std/srfi/19#tm:string->date
                     _date46129_
                     (+ _index46130_ '1)
                     _format-string46131_
                     _str-len46132_
                     _port46133_
                     _template-string46134_))
                  (if (> (+ _index46130_ '1) _str-len46132_)
                      (std/srfi/19#tm:time-error
                       'string->date
                       'bad-date-format-string
                       _template-string46134_)
                      (let* ((_format-char46145_
                              (string-ref
                               _format-string46131_
                               (+ _index46130_ '1)))
                             (_format-info46147_
                              (assoc _format-char46145_
                                     std/srfi/19#tm:read-directives)))
                        (if (not _format-info46147_)
                            (std/srfi/19#tm:time-error
                             'string->date
                             'bad-date-format-string
                             _template-string46134_)
                            (let ((_skipper46150_ (cadr _format-info46147_))
                                  (_reader46151_ (caddr _format-info46147_))
                                  (_actor46152_ (cadddr _format-info46147_)))
                              (_skip-until46136_ _port46133_ _skipper46150_)
                              (let ((_val46154_ (_reader46151_ _port46133_)))
                                (if (eof-object? _val46154_)
                                    (std/srfi/19#tm:time-error
                                     'string->date
                                     'bad-date-format-string
                                     _template-string46134_)
                                    (_actor46152_ _val46154_ _date46129_)))
                              (std/srfi/19#tm:string->date
                               _date46129_
                               (+ _index46130_ '2)
                               _format-string46131_
                               _str-len46132_
                               _port46133_
                               _template-string46134_)))))))))))
  (define std/srfi/19#string->date
    (lambda (_input-string46120_ _template-string46121_)
      (letrec ((_tm:date-ok?46123_
                (lambda (_date46127_)
                  (if (##structure-ref _date46127_ '1 std/srfi/19#date::t '#f)
                      (if (##structure-ref
                           _date46127_
                           '2
                           std/srfi/19#date::t
                           '#f)
                          (if (##structure-ref
                               _date46127_
                               '3
                               std/srfi/19#date::t
                               '#f)
                              (if (##structure-ref
                                   _date46127_
                                   '4
                                   std/srfi/19#date::t
                                   '#f)
                                  (if (##structure-ref
                                       _date46127_
                                       '5
                                       std/srfi/19#date::t
                                       '#f)
                                      (if (##structure-ref
                                           _date46127_
                                           '6
                                           std/srfi/19#date::t
                                           '#f)
                                          (if (##structure-ref
                                               _date46127_
                                               '7
                                               std/srfi/19#date::t
                                               '#f)
                                              (##structure-ref
                                               _date46127_
                                               '8
                                               std/srfi/19#date::t
                                               '#f)
                                              '#f)
                                          '#f)
                                      '#f)
                                  '#f)
                              '#f)
                          '#f)
                      '#f))))
        (let ((_newdate46125_
               (let ()
                 (declare (not safe))
                 (##structure
                  std/srfi/19#date::t
                  '0
                  '0
                  '0
                  '0
                  '#f
                  '#f
                  '#f
                  '0))))
          (std/srfi/19#tm:string->date
           _newdate46125_
           '0
           _template-string46121_
           (string-length _template-string46121_)
           (open-input-string _input-string46120_)
           _template-string46121_)
          (if (_tm:date-ok?46123_ _newdate46125_)
              _newdate46125_
              (std/srfi/19#tm:time-error
               'string->date
               'bad-date-format-string
               (list '"Incomplete date read. "
                     _newdate46125_
                     _template-string46121_))))))))
