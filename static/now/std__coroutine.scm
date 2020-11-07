(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/coroutine#current-coroutine (make-parameter '#f))
  (define std/coroutine#cort::t
    (make-struct-type
     'std/coroutine#cort::t
     '#f
     '3
     'cort
     '((final: . #t))
     '#f
     '(k end? res)))
  (define std/coroutine#cort? (make-struct-predicate std/coroutine#cort::t))
  (define std/coroutine#make-cort
    (lambda _$args24311_
      (apply make-struct-instance std/coroutine#cort::t _$args24311_)))
  (define std/coroutine#cort-k
    (make-struct-field-accessor std/coroutine#cort::t '0))
  (define std/coroutine#cort-end?
    (make-struct-field-accessor std/coroutine#cort::t '1))
  (define std/coroutine#cort-res
    (make-struct-field-accessor std/coroutine#cort::t '2))
  (define std/coroutine#cort-k-set!
    (make-struct-field-mutator std/coroutine#cort::t '0))
  (define std/coroutine#cort-end?-set!
    (make-struct-field-mutator std/coroutine#cort::t '1))
  (define std/coroutine#cort-res-set!
    (make-struct-field-mutator std/coroutine#cort::t '2))
  (define std/coroutine#cothr::t
    (make-struct-type
     'std/coroutine#cothr::t
     '#f
     '4
     'cothr
     '((final: . #t))
     '#f
     '(mx cv state val)))
  (define std/coroutine#cothr? (make-struct-predicate std/coroutine#cothr::t))
  (define std/coroutine#make-cothr
    (lambda _$args24308_
      (apply make-struct-instance std/coroutine#cothr::t _$args24308_)))
  (define std/coroutine#cothr-mx
    (make-struct-field-accessor std/coroutine#cothr::t '0))
  (define std/coroutine#cothr-cv
    (make-struct-field-accessor std/coroutine#cothr::t '1))
  (define std/coroutine#cothr-state
    (make-struct-field-accessor std/coroutine#cothr::t '2))
  (define std/coroutine#cothr-val
    (make-struct-field-accessor std/coroutine#cothr::t '3))
  (define std/coroutine#cothr-mx-set!
    (make-struct-field-mutator std/coroutine#cothr::t '0))
  (define std/coroutine#cothr-cv-set!
    (make-struct-field-mutator std/coroutine#cothr::t '1))
  (define std/coroutine#cothr-state-set!
    (make-struct-field-mutator std/coroutine#cothr::t '2))
  (define std/coroutine#cothr-val-set!
    (make-struct-field-mutator std/coroutine#cothr::t '3))
  (define std/coroutine#coroutine
    (lambda (_proc24302_ . _args24303_)
      (call-with-current-continuation
       (lambda (_k24305_)
         (std/coroutine#coroutine-start!
          _k24305_
          (if (null? _args24303_)
              _proc24302_
              (lambda () (apply _proc24302_ _args24303_))))))))
  (define std/coroutine#cothread
    (lambda (_proc24293_ . _args24294_)
      (let* ((_cothr24296_
              (let ((__tmp272657 (make-mutex 'coroutine))
                    (__tmp272656 (make-condition-variable 'coroutine)))
                (declare (not safe))
                (##structure
                 std/coroutine#cothr::t
                 __tmp272657
                 __tmp272656
                 'run
                 '#f)))
             (_thread24299_
              (make-thread
               (lambda ()
                 (std/coroutine#cothread-start!
                  _cothr24296_
                  _proc24293_
                  _args24294_))
               'cothread)))
        (thread-specific-set! _thread24299_ _cothr24296_)
        (thread-start! _thread24299_))))
  (define std/coroutine#cothread?
    (lambda (_thread24291_)
      (if (thread? _thread24291_)
          (let ((__tmp272658 (thread-specific _thread24291_)))
            (declare (not safe))
            (##structure-direct-instance-of?
             __tmp272658
             'std/coroutine#cothr::t))
          '#f)))
  (define std/coroutine#continue
    (lambda (_c24288_ . _args24289_)
      (if (let ()
            (declare (not safe))
            (##structure-direct-instance-of? _c24288_ 'std/coroutine#cort::t))
          (std/coroutine#coroutine-continue! _c24288_ _args24289_)
          (if (std/coroutine#cothread? _c24288_)
              (std/coroutine#cothread-continue!
               (thread-specific _c24288_)
               _args24289_)
              (error '"Illegal argument; not continuable" _c24288_)))))
  (define std/coroutine#yield
    (lambda _args24279_
      (let ((_$e24281_ (std/coroutine#current-coroutine)))
        (if _$e24281_
            ((lambda (_g2428324285_)
               (std/coroutine#coroutine-yield! _g2428324285_ _args24279_))
             _$e24281_)
            (if (let ((__tmp272659 (thread-specific (current-thread))))
                  (declare (not safe))
                  (##structure-direct-instance-of?
                   __tmp272659
                   'std/coroutine#cothr::t))
                (std/coroutine#cothread-yield!
                 (thread-specific (current-thread))
                 _args24279_)
                (error '"Not in a coroutine continuation"))))))
  (define std/coroutine#coroutine-start!
    (lambda (_k24267_ _thunk24268_)
      (let ((_c24270_
             (let ()
               (declare (not safe))
               (##structure std/coroutine#cort::t '#f '#f '#f))))
        (call-with-parameters
         (lambda ()
           (call-with-current-continuation
            (lambda (_kk24273_)
              (##direct-structure-set!
               _c24270_
               _kk24273_
               '1
               std/coroutine#cort::t
               '#f)
              (_k24267_ _c24270_)))
           (call-with-values
            _thunk24268_
            (lambda _res24275_
              (let ((_k24277_
                     (##direct-structure-ref
                      _c24270_
                      '1
                      std/coroutine#cort::t
                      '#f)))
                (##direct-structure-set!
                 _c24270_
                 '#t
                 '2
                 std/coroutine#cort::t
                 '#f)
                (##direct-structure-set!
                 _c24270_
                 _res24275_
                 '3
                 std/coroutine#cort::t
                 '#f)
                (##direct-structure-set!
                 _c24270_
                 '#f
                 '1
                 std/coroutine#cort::t
                 '#f)
                (apply _k24277_ _res24275_)))))
         std/coroutine#current-coroutine
         _c24270_))))
  (define std/coroutine#coroutine-continue!
    (lambda (_c24226_ _args24227_)
      (let* ((_c2422824236_ _c24226_)
             (_E2423024240_
              (lambda () (error '"No clause matching" _c2422824236_)))
             (_K2423124249_
              (lambda (_res24243_ _end?24244_ _k24245_)
                (if _end?24244_
                    (apply values _res24243_)
                    (call-with-current-continuation
                     (lambda (_kk24247_)
                       (##direct-structure-set!
                        _c24226_
                        _kk24247_
                        '1
                        std/coroutine#cort::t
                        '#f)
                       (apply _k24245_ _args24227_)))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _c2422824236_
               'std/coroutine#cort::t))
            (let* ((_e2423224252_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2422824236_ '1)))
                   (_k24255_ _e2423224252_)
                   (_e2423324257_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2422824236_ '2)))
                   (_end?24260_ _e2423324257_)
                   (_e2423424262_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2422824236_ '3)))
                   (_res24265_ _e2423424262_))
              (_K2423124249_ _res24265_ _end?24260_ _k24255_))
            (_E2423024240_)))))
  (define std/coroutine#coroutine-yield!
    (lambda (_c24199_ _args24200_)
      (let* ((_c2420124207_ _c24199_)
             (_E2420324211_
              (lambda () (error '"No clause matching" _c2420124207_)))
             (_K2420424218_
              (lambda (_k24214_)
                (call-with-current-continuation
                 (lambda (_kk24216_)
                   (##direct-structure-set!
                    _c24199_
                    _kk24216_
                    '1
                    std/coroutine#cort::t
                    '#f)
                   (apply _k24214_ _args24200_))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _c2420124207_
               'std/coroutine#cort::t))
            (let* ((_e2420524221_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2420124207_ '1)))
                   (_k24224_ _e2420524221_))
              (_K2420424218_ _k24224_))
            (_E2420324211_)))))
  (define std/coroutine#cothread-start!
    (lambda (_c24185_ _proc24186_ _args24187_)
      (call-with-parameters
       (lambda ()
         (with-exception-catcher
          (lambda (_g2418924191_)
            (if '#t
                (let ((_e24194_ _g2418924191_))
                  (std/coroutine#cothread-signal! _c24185_ 'error _e24194_))
                (raise _g2418924191_)))
          (lambda ()
            (std/coroutine#cothread-wait! _c24185_)
            (let ((_val24197_ (apply _proc24186_ _args24187_)))
              (std/coroutine#cothread-signal! _c24185_ 'end _val24197_)))))
       std/coroutine#current-coroutine
       '#f)))
  (define std/coroutine#cothread-stop!__%
    (lambda (_thread24170_ _val24171_)
      (if (thread? _thread24170_)
          (let ((_spec24173_ (thread-specific _thread24170_)))
            (if (let ()
                  (declare (not safe))
                  (##structure-direct-instance-of?
                   _spec24173_
                   'std/coroutine#cothr::t))
                (std/coroutine#cothread-signal! _spec24173_ 'end _val24171_)
                (error '"Not a coroutine thread" _thread24170_ _spec24173_)))
          (error '"Expected coroutine thread" _thread24170_))))
  (define std/coroutine#cothread-stop!__0
    (lambda (_thread24178_)
      (let ((_val24180_ '#!void))
        (std/coroutine#cothread-stop!__% _thread24178_ _val24180_))))
  (define std/coroutine#cothread-stop!
    (lambda _g272661_
      (let ((_g272660_ (let () (declare (not safe)) (##length _g272661_))))
        (cond ((let () (declare (not safe)) (##fx= _g272660_ 1))
               (apply std/coroutine#cothread-stop!__0 _g272661_))
              ((let () (declare (not safe)) (##fx= _g272660_ 2))
               (apply std/coroutine#cothread-stop!__% _g272661_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/coroutine#cothread-stop!
                _g272661_))))))
  (define std/coroutine#cothread-continue!
    (lambda (_c24111_ _val24112_)
      (let* ((_c2411324122_ _c24111_)
             (_E2411524126_
              (lambda () (error '"No clause matching" _c2411324122_)))
             (_K2411624146_
              (lambda (_kont24129_ _state24130_ _cv24131_ _mx24132_)
                (mutex-lock! _mx24132_)
                (let ((_$e24134_ _state24130_))
                  (if (eq? 'run _$e24134_)
                      (begin
                        (##direct-structure-set!
                         _c24111_
                         _val24112_
                         '4
                         std/coroutine#cothr::t
                         '#f)
                        (##direct-structure-set!
                         _c24111_
                         'continue
                         '3
                         std/coroutine#cothr::t
                         '#f)
                        (condition-variable-signal! _cv24131_)
                        (mutex-unlock! _mx24132_ _cv24131_)
                        (let _lp24137_ ()
                          (mutex-lock! _mx24132_)
                          (let ((_state24140_
                                 (##direct-structure-ref
                                  _c24111_
                                  '3
                                  std/coroutine#cothr::t
                                  '#f))
                                (_kont24141_
                                 (##direct-structure-ref
                                  _c24111_
                                  '4
                                  std/coroutine#cothr::t
                                  '#f)))
                            (let ((_$e24143_ _state24140_))
                              (if (eq? 'continue _$e24143_)
                                  (begin
                                    (mutex-unlock! _mx24132_ _cv24131_)
                                    (_lp24137_))
                                  (if (eq? 'yield _$e24143_)
                                      (begin
                                        (##direct-structure-set!
                                         _c24111_
                                         'run
                                         '3
                                         std/coroutine#cothr::t
                                         '#f)
                                        (mutex-unlock! _mx24132_)
                                        _kont24141_)
                                      (if (eq? 'end _$e24143_)
                                          (begin
                                            (mutex-unlock! _mx24132_)
                                            _kont24141_)
                                          (if (eq? 'error _$e24143_)
                                              (begin
                                                (mutex-unlock! _mx24132_)
                                                (raise _kont24141_))
                                              (begin
                                                (mutex-unlock! _mx24132_)
                                                (error '"Illegal cothread state"
                                                       _state24140_))))))))))
                      (if (eq? 'end _$e24134_)
                          (begin (mutex-unlock! _mx24132_) _kont24129_)
                          (if (eq? 'error _$e24134_)
                              (begin
                                (mutex-unlock! _mx24132_)
                                (raise _kont24129_))
                              (error '"Illegal cothread state"
                                     _state24130_))))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _c2411324122_
               'std/coroutine#cothr::t))
            (let* ((_e2411724149_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2411324122_ '1)))
                   (_mx24152_ _e2411724149_)
                   (_e2411824154_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2411324122_ '2)))
                   (_cv24157_ _e2411824154_)
                   (_e2411924159_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2411324122_ '3)))
                   (_state24162_ _e2411924159_)
                   (_e2412024164_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2411324122_ '4)))
                   (_kont24167_ _e2412024164_))
              (_K2411624146_ _kont24167_ _state24162_ _cv24157_ _mx24152_))
            (_E2411524126_)))))
  (define std/coroutine#cothread-yield!
    (lambda (_c24106_ _args24107_)
      (let ((_kont24109_
             (std/coroutine#cothread-yield-values!
              _c24106_
              (apply values _args24107_))))
        (std/coroutine#cothread-wait! _c24106_)
        _kont24109_)))
  (define std/coroutine#cothread-yield-values!
    (lambda (_c24057_ _val24058_)
      (let* ((_c2405924068_ _c24057_)
             (_E2406124072_
              (lambda () (error '"No clause matching" _c2405924068_)))
             (_K2406224083_
              (lambda (_kont24075_ _state24076_ _cv24077_ _mx24078_)
                (mutex-lock! _mx24078_)
                (let ((_$e24080_ _state24076_))
                  (if (eq? 'continue _$e24080_)
                      (begin
                        (##direct-structure-set!
                         _c24057_
                         _val24058_
                         '4
                         std/coroutine#cothr::t
                         '#f)
                        (##direct-structure-set!
                         _c24057_
                         'yield
                         '3
                         std/coroutine#cothr::t
                         '#f)
                        (condition-variable-signal! _cv24077_)
                        (mutex-unlock! _mx24078_)
                        _kont24075_)
                      (begin
                        (mutex-unlock! _mx24078_)
                        (error '"Illegal cothread state" _state24076_)))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _c2405924068_
               'std/coroutine#cothr::t))
            (let* ((_e2406324086_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2405924068_ '1)))
                   (_mx24089_ _e2406324086_)
                   (_e2406424091_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2405924068_ '2)))
                   (_cv24094_ _e2406424091_)
                   (_e2406524096_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2405924068_ '3)))
                   (_state24099_ _e2406524096_)
                   (_e2406624101_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2405924068_ '4)))
                   (_kont24104_ _e2406624101_))
              (_K2406224083_ _kont24104_ _state24099_ _cv24094_ _mx24089_))
            (_E2406124072_)))))
  (define std/coroutine#cothread-signal!
    (lambda (_c24024_ _state24025_ _val24026_)
      (let* ((_c2402724034_ _c24024_)
             (_E2402924038_
              (lambda () (error '"No clause matching" _c2402724034_)))
             (_K2403024044_
              (lambda (_cv24041_ _mx24042_)
                (mutex-lock! _mx24042_)
                (if (memq (##direct-structure-ref
                           _c24024_
                           '3
                           std/coroutine#cothr::t
                           '#f)
                          '(end error))
                    '#!void
                    (begin
                      (##direct-structure-set!
                       _c24024_
                       _val24026_
                       '4
                       std/coroutine#cothr::t
                       '#f)
                      (##direct-structure-set!
                       _c24024_
                       _state24025_
                       '3
                       std/coroutine#cothr::t
                       '#f)
                      (condition-variable-signal! _cv24041_)))
                (mutex-unlock! _mx24042_))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _c2402724034_
               'std/coroutine#cothr::t))
            (let* ((_e2403124047_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2402724034_ '1)))
                   (_mx24050_ _e2403124047_)
                   (_e2403224052_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2402724034_ '2)))
                   (_cv24055_ _e2403224052_))
              (_K2403024044_ _cv24055_ _mx24050_))
            (_E2402924038_)))))
  (define std/coroutine#cothread-wait!
    (lambda (_c23982_)
      (let* ((_c2398323990_ _c23982_)
             (_E2398523994_
              (lambda () (error '"No clause matching" _c2398323990_)))
             (_K2398624011_
              (lambda (_cv23997_ _mx23998_)
                (let _lp24000_ ()
                  (mutex-lock! _mx23998_)
                  (let* ((_state24003_
                          (##direct-structure-ref
                           _c23982_
                           '3
                           std/coroutine#cothr::t
                           '#f))
                         (_$e24005_ _state24003_))
                    (if (or (eq? 'run _$e24005_) (eq? 'yield _$e24005_))
                        (begin (mutex-unlock! _mx23998_ _cv23997_) (_lp24000_))
                        (if (eq? 'continue _$e24005_)
                            (mutex-unlock! _mx23998_)
                            (begin
                              (mutex-unlock! _mx23998_)
                              (error '"Illegal cothread state"
                                     _state24003_)))))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _c2398323990_
               'std/coroutine#cothr::t))
            (let* ((_e2398724014_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2398323990_ '1)))
                   (_mx24017_ _e2398724014_)
                   (_e2398824019_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _c2398323990_ '2)))
                   (_cv24022_ _e2398824019_))
              (_K2398624011_ _cv24022_ _mx24017_))
            (_E2398523994_))))))
