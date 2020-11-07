(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/parser/rlang#rlang::t
    (make-struct-type 'std/parser/rlang#rlang::t '#f '0 'rlang '() '#f '()))
  (define std/parser/rlang#rlang?
    (make-struct-predicate std/parser/rlang#rlang::t))
  (define std/parser/rlang#make-rlang
    (lambda _$args149888_
      (apply make-struct-instance std/parser/rlang#rlang::t _$args149888_)))
  (define std/parser/rlang#nul::t
    (make-struct-type
     'std/parser/rlang#nul::t
     std/parser/rlang#rlang::t
     '0
     'nul
     '((final: . #t))
     '#f
     '()))
  (define std/parser/rlang#nul?
    (make-struct-predicate std/parser/rlang#nul::t))
  (define std/parser/rlang#make-nul
    (lambda _$args149885_
      (apply make-struct-instance std/parser/rlang#nul::t _$args149885_)))
  (define std/parser/rlang#eps::t
    (make-struct-type
     'std/parser/rlang#eps::t
     std/parser/rlang#rlang::t
     '0
     'eps
     '((final: . #t))
     '#f
     '()))
  (define std/parser/rlang#eps?
    (make-struct-predicate std/parser/rlang#eps::t))
  (define std/parser/rlang#make-eps
    (lambda _$args149882_
      (apply make-struct-instance std/parser/rlang#eps::t _$args149882_)))
  (define std/parser/rlang#char::t
    (make-struct-type
     'std/parser/rlang#char::t
     std/parser/rlang#rlang::t
     '1
     'char
     '((final: . #t))
     '#f
     '(c)))
  (define std/parser/rlang#char?
    (make-struct-predicate std/parser/rlang#char::t))
  (define std/parser/rlang#make-char
    (lambda _$args149879_
      (apply make-struct-instance std/parser/rlang#char::t _$args149879_)))
  (define std/parser/rlang#char-c
    (make-struct-field-accessor std/parser/rlang#char::t '0))
  (define std/parser/rlang#char-c-set!
    (make-struct-field-mutator std/parser/rlang#char::t '0))
  (define std/parser/rlang#charset::t
    (make-struct-type
     'std/parser/rlang#charset::t
     std/parser/rlang#rlang::t
     '1
     'charset
     '((final: . #t))
     '#f
     '(chars)))
  (define std/parser/rlang#charset?
    (make-struct-predicate std/parser/rlang#charset::t))
  (define std/parser/rlang#make-charset
    (lambda _$args149876_
      (apply make-struct-instance std/parser/rlang#charset::t _$args149876_)))
  (define std/parser/rlang#charset-chars
    (make-struct-field-accessor std/parser/rlang#charset::t '0))
  (define std/parser/rlang#charset-chars-set!
    (make-struct-field-mutator std/parser/rlang#charset::t '0))
  (define std/parser/rlang#negset::t
    (make-struct-type
     'std/parser/rlang#negset::t
     std/parser/rlang#rlang::t
     '1
     'negset
     '((final: . #t))
     '#f
     '(chars)))
  (define std/parser/rlang#negset?
    (make-struct-predicate std/parser/rlang#negset::t))
  (define std/parser/rlang#make-negset
    (lambda _$args149873_
      (apply make-struct-instance std/parser/rlang#negset::t _$args149873_)))
  (define std/parser/rlang#negset-chars
    (make-struct-field-accessor std/parser/rlang#negset::t '0))
  (define std/parser/rlang#negset-chars-set!
    (make-struct-field-mutator std/parser/rlang#negset::t '0))
  (define std/parser/rlang#alt::t
    (make-struct-type
     'std/parser/rlang#alt::t
     std/parser/rlang#rlang::t
     '2
     'alt
     '((final: . #t))
     '#f
     '(L1 L2)))
  (define std/parser/rlang#alt?
    (make-struct-predicate std/parser/rlang#alt::t))
  (define std/parser/rlang#make-alt
    (lambda _$args149870_
      (apply make-struct-instance std/parser/rlang#alt::t _$args149870_)))
  (define std/parser/rlang#alt-L1
    (make-struct-field-accessor std/parser/rlang#alt::t '0))
  (define std/parser/rlang#alt-L2
    (make-struct-field-accessor std/parser/rlang#alt::t '1))
  (define std/parser/rlang#alt-L1-set!
    (make-struct-field-mutator std/parser/rlang#alt::t '0))
  (define std/parser/rlang#alt-L2-set!
    (make-struct-field-mutator std/parser/rlang#alt::t '1))
  (define std/parser/rlang#cat::t
    (make-struct-type
     'std/parser/rlang#cat::t
     std/parser/rlang#rlang::t
     '2
     'cat
     '((final: . #t))
     '#f
     '(L1 L2)))
  (define std/parser/rlang#cat?
    (make-struct-predicate std/parser/rlang#cat::t))
  (define std/parser/rlang#make-cat
    (lambda _$args149867_
      (apply make-struct-instance std/parser/rlang#cat::t _$args149867_)))
  (define std/parser/rlang#cat-L1
    (make-struct-field-accessor std/parser/rlang#cat::t '0))
  (define std/parser/rlang#cat-L2
    (make-struct-field-accessor std/parser/rlang#cat::t '1))
  (define std/parser/rlang#cat-L1-set!
    (make-struct-field-mutator std/parser/rlang#cat::t '0))
  (define std/parser/rlang#cat-L2-set!
    (make-struct-field-mutator std/parser/rlang#cat::t '1))
  (define std/parser/rlang#rep::t
    (make-struct-type
     'std/parser/rlang#rep::t
     std/parser/rlang#rlang::t
     '1
     'rep
     '((final: . #t))
     '#f
     '(L)))
  (define std/parser/rlang#rep?
    (make-struct-predicate std/parser/rlang#rep::t))
  (define std/parser/rlang#make-rep
    (lambda _$args149864_
      (apply make-struct-instance std/parser/rlang#rep::t _$args149864_)))
  (define std/parser/rlang#rep-L
    (make-struct-field-accessor std/parser/rlang#rep::t '0))
  (define std/parser/rlang#rep-L-set!
    (make-struct-field-mutator std/parser/rlang#rep::t '0))
  (define std/parser/rlang#@nul
    (let () (declare (not safe)) (##structure std/parser/rlang#nul::t)))
  (define std/parser/rlang#@eps
    (let () (declare (not safe)) (##structure std/parser/rlang#eps::t)))
  (define std/parser/rlang#@nul?
    (lambda (_L149862_) (eq? std/parser/rlang#@nul _L149862_)))
  (define std/parser/rlang#@eps?
    (lambda (_L149860_) (eq? std/parser/rlang#@eps _L149860_)))
  (define std/parser/rlang#@char
    (lambda (_c149858_)
      (let ()
        (declare (not safe))
        (##structure std/parser/rlang#char::t _c149858_))))
  (define std/parser/rlang#@charset
    (lambda (_chars149852_)
      (if (null? _chars149852_)
          std/parser/rlang#@nul
          (let ((__tmp279614
                 (list->table
                  (map (lambda (_g149853149855_) (cons _g149853149855_ '#t))
                       _chars149852_)
                  'test:
                  eq?)))
            (declare (not safe))
            (##structure std/parser/rlang#charset::t __tmp279614)))))
  (define std/parser/rlang#@negset
    (lambda (_chars149846_)
      (let ((__tmp279615
             (list->table
              (map (lambda (_g149847149849_) (cons _g149847149849_ '#t))
                   _chars149846_)
              'test:
              eq?)))
        (declare (not safe))
        (##structure std/parser/rlang#negset::t __tmp279615))))
  (define std/parser/rlang#@dot (std/parser/rlang#@negset '()))
  (define std/parser/rlang#@alt__0 (lambda (_L149837_) _L149837_))
  (define std/parser/rlang#@alt__1
    (lambda (_L1149839_ _L2149840_)
      (if (std/parser/rlang#@nul? _L1149839_)
          _L2149840_
          (if (std/parser/rlang#@nul? _L2149840_)
              _L1149839_
              (let ()
                (declare (not safe))
                (##structure
                 std/parser/rlang#alt::t
                 _L1149839_
                 _L2149840_))))))
  (define std/parser/rlang#@alt__2
    (lambda (_L1149842_ _L2149843_ . _rest149844_)
      (std/parser/rlang#@alt__1
       _L1149842_
       (apply std/parser/rlang#@alt _L2149843_ _rest149844_))))
  (define std/parser/rlang#@alt
    (lambda _g279617_
      (let ((_g279616_ (let () (declare (not safe)) (##length _g279617_))))
        (cond ((let () (declare (not safe)) (##fx= _g279616_ 1))
               (apply std/parser/rlang#@alt__0 _g279617_))
              ((let () (declare (not safe)) (##fx= _g279616_ 2))
               (apply std/parser/rlang#@alt__1 _g279617_))
              ((let () (declare (not safe)) (##fx>= _g279616_ 2))
               (apply std/parser/rlang#@alt__2 _g279617_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/parser/rlang#@alt
                _g279617_))))))
  (define std/parser/rlang#@cat__0 (lambda (_L149825_) _L149825_))
  (define std/parser/rlang#@cat__1
    (lambda (_L1149827_ _L2149828_)
      (if (or (std/parser/rlang#@nul? _L1149827_)
              (std/parser/rlang#@nul? _L2149828_))
          std/parser/rlang#@nul
          (let ()
            (declare (not safe))
            (##structure std/parser/rlang#cat::t _L1149827_ _L2149828_)))))
  (define std/parser/rlang#@cat__2
    (lambda (_L1149833_ _L2149834_ . _rest149835_)
      (std/parser/rlang#@cat__1
       _L1149833_
       (apply std/parser/rlang#@cat _L2149834_ _rest149835_))))
  (define std/parser/rlang#@cat
    (lambda _g279619_
      (let ((_g279618_ (let () (declare (not safe)) (##length _g279619_))))
        (cond ((let () (declare (not safe)) (##fx= _g279618_ 1))
               (apply std/parser/rlang#@cat__0 _g279619_))
              ((let () (declare (not safe)) (##fx= _g279618_ 2))
               (apply std/parser/rlang#@cat__1 _g279619_))
              ((let () (declare (not safe)) (##fx>= _g279618_ 2))
               (apply std/parser/rlang#@cat__2 _g279619_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/parser/rlang#@cat
                _g279619_))))))
  (define std/parser/rlang#@rep*
    (lambda (_L149823_)
      (if (std/parser/rlang#@nul? _L149823_)
          std/parser/rlang#@eps
          (let ()
            (declare (not safe))
            (##structure std/parser/rlang#rep::t _L149823_)))))
  (define std/parser/rlang#@rep+
    (lambda (_L149821_)
      (std/parser/rlang#@cat__1 _L149821_ (std/parser/rlang#@rep* _L149821_))))
  (define std/parser/rlang#@maybe
    (lambda (_L149819_)
      (std/parser/rlang#@alt__1 _L149819_ std/parser/rlang#@eps)))
  (define std/parser/rlang#deriv
    (lambda (_L149675_ _c149676_)
      (let* ((_L149677149704_ _L149675_)
             (_E149686149708_
              (lambda () (error '"No clause matching" _L149677149704_))))
        (let ((_K149702149816_ (lambda () std/parser/rlang#@nul))
              (_K149701149809_ (lambda () std/parser/rlang#@nul))
              (_K149699149796_
               (lambda (_a149794_)
                 (if (eq? _c149676_ _a149794_)
                     std/parser/rlang#@eps
                     std/parser/rlang#@nul)))
              (_K149697149782_
               (lambda (_chars149780_)
                 (if (table-ref _chars149780_ _c149676_ '#f)
                     std/parser/rlang#@eps
                     std/parser/rlang#@nul)))
              (_K149695149768_
               (lambda (_chars149766_)
                 (if (table-ref _chars149766_ _c149676_ '#f)
                     std/parser/rlang#@nul
                     std/parser/rlang#@eps)))
              (_K149692149749_
               (lambda (_L2149746_ _L1149747_)
                 (std/parser/rlang#@alt__1
                  (std/parser/rlang#deriv _L1149747_ _c149676_)
                  (std/parser/rlang#deriv _L2149746_ _c149676_))))
              (_K149689149729_
               (lambda (_L2149726_ _L1149727_)
                 (if (std/parser/rlang#delta _L1149727_)
                     (std/parser/rlang#@alt__1
                      (std/parser/rlang#deriv _L2149726_ _c149676_)
                      (std/parser/rlang#@cat__1
                       (std/parser/rlang#deriv _L1149727_ _c149676_)
                       _L2149726_))
                     (std/parser/rlang#@cat__1
                      (std/parser/rlang#deriv _L1149727_ _c149676_)
                      _L2149726_))))
              (_K149687149714_
               (lambda (_Lc149712_)
                 (std/parser/rlang#@cat__1
                  (std/parser/rlang#deriv _Lc149712_ _c149676_)
                  _L149675_))))
          (let* ((_try-match149685149722_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149677149704_
                           'std/parser/rlang#rep::t))
                        (let* ((_e149688149717_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149677149704_ '1)))
                               (_Lc149720_ _e149688149717_))
                          (_K149687149714_ _Lc149720_))
                        (_E149686149708_))))
                 (_try-match149684149742_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149677149704_
                           'std/parser/rlang#cat::t))
                        (let* ((_e149690149732_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149677149704_ '1)))
                               (_e149691149737_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149677149704_ '2))))
                          (let ((_L1149735_ _e149690149732_)
                                (_L2149740_ _e149691149737_))
                            (_K149689149729_ _L2149740_ _L1149735_)))
                        (_try-match149685149722_))))
                 (_try-match149683149762_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149677149704_
                           'std/parser/rlang#alt::t))
                        (let* ((_e149693149752_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149677149704_ '1)))
                               (_e149694149757_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149677149704_ '2))))
                          (let ((_L1149755_ _e149693149752_)
                                (_L2149760_ _e149694149757_))
                            (_K149692149749_ _L2149760_ _L1149755_)))
                        (_try-match149684149742_))))
                 (_try-match149682149776_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149677149704_
                           'std/parser/rlang#negset::t))
                        (let* ((_e149696149771_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149677149704_ '1)))
                               (_chars149774_ _e149696149771_))
                          (_K149695149768_ _chars149774_))
                        (_try-match149683149762_))))
                 (_try-match149681149790_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149677149704_
                           'std/parser/rlang#charset::t))
                        (let* ((_e149698149785_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149677149704_ '1)))
                               (_chars149788_ _e149698149785_))
                          (_K149697149782_ _chars149788_))
                        (_try-match149682149776_))))
                 (_try-match149680149804_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149677149704_
                           'std/parser/rlang#char::t))
                        (let* ((_e149700149799_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149677149704_ '1)))
                               (_a149802_ _e149700149799_))
                          (_K149699149796_ _a149802_))
                        (_try-match149681149790_))))
                 (_try-match149679149812_
                  (lambda ()
                    (if (std/parser/rlang#@eps? _L149677149704_)
                        (_K149701149809_)
                        (_try-match149680149804_)))))
            (if (std/parser/rlang#@nul? _L149677149704_)
                (_K149702149816_)
                (_try-match149679149812_)))))))
  (define std/parser/rlang#delta
    (lambda (_L149550_)
      (let* ((_L149551149575_ _L149550_)
             (_E149560149579_
              (lambda () (error '"No clause matching" _L149551149575_))))
        (let ((_K149573149672_ (lambda () '#f))
              (_K149572149665_ (lambda () '#t))
              (_K149571149657_ (lambda () '#f))
              (_K149570149649_ (lambda () '#f))
              (_K149569149641_ (lambda () '#f))
              (_K149566149623_
               (lambda (_L2149617_ _L1149618_)
                 (let ((_$e149620_ (std/parser/rlang#delta _L1149618_)))
                   (if _$e149620_
                       _$e149620_
                       (std/parser/rlang#delta _L2149617_)))))
              (_K149563149600_
               (lambda (_L2149597_ _L1149598_)
                 (if (std/parser/rlang#delta _L1149598_)
                     (std/parser/rlang#delta _L2149597_)
                     '#f)))
              (_K149561149585_ (lambda (_L149583_) '#t)))
          (let* ((_try-match149559149593_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149551149575_
                           'std/parser/rlang#rep::t))
                        (let* ((_e149562149588_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149551149575_ '1)))
                               (_L149591_ _e149562149588_))
                          (_K149561149585_ _L149591_))
                        (_E149560149579_))))
                 (_try-match149558149613_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149551149575_
                           'std/parser/rlang#cat::t))
                        (let* ((_e149564149603_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149551149575_ '1)))
                               (_e149565149608_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149551149575_ '2))))
                          (let ((_L1149606_ _e149564149603_)
                                (_L2149611_ _e149565149608_))
                            (_K149563149600_ _L2149611_ _L1149606_)))
                        (_try-match149559149593_))))
                 (_try-match149557149636_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149551149575_
                           'std/parser/rlang#alt::t))
                        (let* ((_e149567149626_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149551149575_ '1)))
                               (_e149568149631_
                                (let ()
                                  (declare (not safe))
                                  (##vector-ref _L149551149575_ '2))))
                          (let ((_L1149629_ _e149567149626_)
                                (_L2149634_ _e149568149631_))
                            (_K149566149623_ _L2149634_ _L1149629_)))
                        (_try-match149558149613_))))
                 (_try-match149556149644_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149551149575_
                           'std/parser/rlang#negset::t))
                        (_K149569149641_)
                        (_try-match149557149636_))))
                 (_try-match149555149652_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149551149575_
                           'std/parser/rlang#charset::t))
                        (_K149570149649_)
                        (_try-match149556149644_))))
                 (_try-match149554149660_
                  (lambda ()
                    (if (let ()
                          (declare (not safe))
                          (##structure-direct-instance-of?
                           _L149551149575_
                           'std/parser/rlang#char::t))
                        (_K149571149657_)
                        (_try-match149555149652_))))
                 (_try-match149553149668_
                  (lambda ()
                    (if (std/parser/rlang#@eps? _L149551149575_)
                        (_K149572149665_)
                        (_try-match149554149660_)))))
            (if (std/parser/rlang#@nul? _L149551149575_)
                (_K149573149672_)
                (_try-match149553149668_)))))))
  (define std/parser/rlang#recognizes?
    (lambda (_L149514_ _chars149515_)
      (let* ((_chars149516149524_ _chars149515_)
             (_else149518149532_
              (lambda () (std/parser/rlang#delta _L149514_)))
             (_K149520149538_
              (lambda (_rest149535_ _char149536_)
                (std/parser/rlang#recognizes?
                 (std/parser/rlang#deriv _L149514_ _char149536_)
                 _rest149535_))))
        (if (let () (declare (not safe)) (##pair? _chars149516149524_))
            (let ((_hd149521149541_
                   (let () (declare (not safe)) (##car _chars149516149524_)))
                  (_tl149522149543_
                   (let () (declare (not safe)) (##cdr _chars149516149524_))))
              (let* ((_char149546_ _hd149521149541_)
                     (_rest149548_ _tl149522149543_))
                (_K149520149538_ _rest149548_ _char149546_)))
            (_else149518149532_))))))
