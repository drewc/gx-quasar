(declare (block) (standard-bindings) (extended-bindings))
(begin
  (declare (not safe))
  (define std/text/utf8#string->utf8__%
    (lambda (_str99568_ _start99569_ _end99570_)
      (if (string? _str99568_)
          (std/text/utf8#utf8-encode _str99568_ _start99569_ _end99570_)
          (error '"Bad argument; expected string" _str99568_))))
  (define std/text/utf8#string->utf8__0
    (lambda (_str99575_)
      (let* ((_start99577_ '0) (_end99579_ (string-length _str99575_)))
        (std/text/utf8#string->utf8__% _str99575_ _start99577_ _end99579_))))
  (define std/text/utf8#string->utf8__1
    (lambda (_str99581_ _start99582_)
      (let ((_end99584_ (string-length _str99581_)))
        (std/text/utf8#string->utf8__% _str99581_ _start99582_ _end99584_))))
  (define std/text/utf8#string->utf8
    (lambda _g279762_
      (let ((_g279761_ (##length _g279762_)))
        (cond ((##fx= _g279761_ 1)
               (apply std/text/utf8#string->utf8__0 _g279762_))
              ((##fx= _g279761_ 2)
               (apply std/text/utf8#string->utf8__1 _g279762_))
              ((##fx= _g279761_ 3)
               (apply std/text/utf8#string->utf8__% _g279762_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/utf8#string->utf8
                _g279762_))))))
  (define std/text/utf8#string-utf8-length__%
    (lambda (_str99545_ _start99546_ _end99547_)
      (if (string? _str99545_)
          (std/text/utf8#utf8-encode-length _str99545_ _start99546_ _end99547_)
          (error '"Bad argument; expected string" _str99545_))))
  (define std/text/utf8#string-utf8-length__0
    (lambda (_str99552_)
      (let* ((_start99554_ '0) (_end99556_ (string-length _str99552_)))
        (std/text/utf8#string-utf8-length__%
         _str99552_
         _start99554_
         _end99556_))))
  (define std/text/utf8#string-utf8-length__1
    (lambda (_str99558_ _start99559_)
      (let ((_end99561_ (string-length _str99558_)))
        (std/text/utf8#string-utf8-length__%
         _str99558_
         _start99559_
         _end99561_))))
  (define std/text/utf8#string-utf8-length
    (lambda _g279764_
      (let ((_g279763_ (##length _g279764_)))
        (cond ((##fx= _g279763_ 1)
               (apply std/text/utf8#string-utf8-length__0 _g279764_))
              ((##fx= _g279763_ 2)
               (apply std/text/utf8#string-utf8-length__1 _g279764_))
              ((##fx= _g279763_ 3)
               (apply std/text/utf8#string-utf8-length__% _g279764_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/utf8#string-utf8-length
                _g279764_))))))
  (define std/text/utf8#utf8->string__%
    (lambda (_u8v99522_ _start99523_ _end99524_)
      (if (u8vector? _u8v99522_)
          (std/text/utf8#utf8-decode _u8v99522_ _start99523_ _end99524_)
          (error '"Bad argument; expected u8vector" _u8v99522_))))
  (define std/text/utf8#utf8->string__0
    (lambda (_u8v99529_)
      (let* ((_start99531_ '0) (_end99533_ (u8vector-length _u8v99529_)))
        (std/text/utf8#utf8->string__% _u8v99529_ _start99531_ _end99533_))))
  (define std/text/utf8#utf8->string__1
    (lambda (_u8v99535_ _start99536_)
      (let ((_end99538_ (u8vector-length _u8v99535_)))
        (std/text/utf8#utf8->string__% _u8v99535_ _start99536_ _end99538_))))
  (define std/text/utf8#utf8->string
    (lambda _g279766_
      (let ((_g279765_ (##length _g279766_)))
        (cond ((##fx= _g279765_ 1)
               (apply std/text/utf8#utf8->string__0 _g279766_))
              ((##fx= _g279765_ 2)
               (apply std/text/utf8#utf8->string__1 _g279766_))
              ((##fx= _g279765_ 3)
               (apply std/text/utf8#utf8->string__% _g279766_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/utf8#utf8->string
                _g279766_))))))
  (define std/text/utf8#utf8-encode
    (lambda (_str99508_ _start99509_ _end99510_)
      (let* ((_slen99512_ (fx- _end99510_ _start99509_))
             (_u8vlen99514_ (##fx* _slen99512_ '4))
             (_u8v99516_ (make-u8vector _u8vlen99514_))
             (_count99518_
              (std/text/utf8#utf8-encode!
               _str99508_
               _u8v99516_
               _start99509_
               _end99510_)))
        (##u8vector-shrink! _u8v99516_ _count99518_)
        _u8v99516_)))
  (define std/text/utf8#utf8-encode-length
    (lambda (_str99494_ _start99495_ _end99496_)
      (let _lp99498_ ((_i99500_ _start99495_) (_r99501_ '0))
        (if (##fx< _i99500_ _end99496_)
            (let* ((_char99503_ (##string-ref _str99494_ _i99500_))
                   (_clen99505_ (std/text/utf8#utf8-char-length _char99503_)))
              (_lp99498_ (##fx+ _i99500_ '1) (##fx+ _r99501_ _clen99505_)))
            _r99501_))))
  (define std/text/utf8#utf8-char-length
    (lambda (_char99490_)
      (let ((_c99492_ (##char->integer _char99490_)))
        (if (##fx<= _c99492_ '127)
            '1
            (if (##fx<= _c99492_ '2047)
                '2
                (if (##fx<= _c99492_ '65535) '3 '4))))))
  (define std/text/utf8#utf8-encode!
    (lambda (_str99475_ _u8v99476_ _start99477_ _end99478_)
      (let _lp99480_ ((_i99482_ _start99477_) (_j99483_ '0))
        (if (##fx< _i99482_ _end99478_)
            (let* ((_char99485_ (##string-ref _str99475_ _i99482_))
                   (_c99487_ (##char->integer _char99485_)))
              (if (##fx<= _c99487_ '127)
                  (begin
                    (##u8vector-set! _u8v99476_ _j99483_ _c99487_)
                    (_lp99480_ (##fx+ _i99482_ '1) (##fx+ _j99483_ '1)))
                  (if (##fx<= _c99487_ '2047)
                      (begin
                        (##u8vector-set!
                         _u8v99476_
                         _j99483_
                         (##fxior '192
                                  (##fxarithmetic-shift-right _c99487_ '6)))
                        (##u8vector-set!
                         _u8v99476_
                         (##fx+ _j99483_ '1)
                         (##fxior '128 (##fxand _c99487_ '63)))
                        (_lp99480_ (##fx+ _i99482_ '1) (##fx+ _j99483_ '2)))
                      (if (##fx<= _c99487_ '65535)
                          (begin
                            (##u8vector-set!
                             _u8v99476_
                             _j99483_
                             (##fxior '224
                                      (##fxarithmetic-shift-right
                                       _c99487_
                                       '12)))
                            (##u8vector-set!
                             _u8v99476_
                             (##fx+ _j99483_ '1)
                             (##fxior '128
                                      (##fxand (##fxarithmetic-shift-right
                                                _c99487_
                                                '6)
                                               '63)))
                            (##u8vector-set!
                             _u8v99476_
                             (##fx+ _j99483_ '2)
                             (##fxior '128 (##fxand _c99487_ '63)))
                            (_lp99480_
                             (##fx+ _i99482_ '1)
                             (##fx+ _j99483_ '3)))
                          (begin
                            (##u8vector-set!
                             _u8v99476_
                             _j99483_
                             (##fxior '240
                                      (##fxarithmetic-shift-right
                                       _c99487_
                                       '18)))
                            (##u8vector-set!
                             _u8v99476_
                             (##fx+ _j99483_ '1)
                             (##fxior '128
                                      (##fxand (##fxarithmetic-shift-right
                                                _c99487_
                                                '12)
                                               '63)))
                            (##u8vector-set!
                             _u8v99476_
                             (##fx+ _j99483_ '2)
                             (##fxior '128
                                      (##fxand (##fxarithmetic-shift-right
                                                _c99487_
                                                '6)
                                               '63)))
                            (##u8vector-set!
                             _u8v99476_
                             (##fx+ _j99483_ '3)
                             (##fxior '128 (##fxand _c99487_ '63)))
                            (_lp99480_
                             (##fx+ _i99482_ '1)
                             (##fx+ _j99483_ '4)))))))
            _j99483_))))
  (define std/text/utf8#utf8-decode
    (lambda (_u8v99464_ _start99465_ _end99466_)
      (let* ((_u8vlen99468_ (fx- _end99466_ _start99465_))
             (_str99470_ (make-string _u8vlen99468_))
             (_slen99472_
              (std/text/utf8#utf8-decode!
               _u8v99464_
               _str99470_
               _start99465_
               _end99466_)))
        (##string-shrink! _str99470_ _slen99472_)
        _str99470_)))
  (define std/text/utf8#utf8-decode!
    (lambda (_u8v99420_ _str99421_ _start99422_ _end99423_)
      (let _lp99425_ ((_i99427_ _start99422_) (_j99428_ '0))
        (if (##fx< _i99427_ _end99423_)
            (let ((_byte99430_ (##u8vector-ref _u8v99420_ _i99427_)))
              (if (##fx<= _byte99430_ '127)
                  (let ((_char99432_ (##integer->char _byte99430_)))
                    (##string-set! _str99421_ _j99428_ _char99432_)
                    (_lp99425_ (##fx+ _i99427_ '1) (##fx+ _j99428_ '1)))
                  (if (##fx<= _byte99430_ '223)
                      (let* ((_i+299434_ (##fx+ _i99427_ '2))
                             (_g279767_
                              (if (##fx<= _i+299434_ _end99423_)
                                  '#!void
                                  (std/error#raise-io-error
                                   'utf8-decode!
                                   '"incomplete character"
                                   _byte99430_)))
                             (_byte299437_
                              (##u8vector-ref _u8v99420_ (##fx+ _i99427_ '1)))
                             (_char99439_
                              (##integer->char
                               (##fxior (##fxarithmetic-shift-left
                                         (##fxand _byte99430_ '31)
                                         '6)
                                        (##fxand _byte299437_ '63)))))
                        (##string-set! _str99421_ _j99428_ _char99439_)
                        (_lp99425_ _i+299434_ (##fx+ _j99428_ '1)))
                      (if (##fx<= _byte99430_ '239)
                          (let* ((_i+399442_ (##fx+ _i99427_ '3))
                                 (_g279768_
                                  (if (##fx<= _i+399442_ _end99423_)
                                      '#!void
                                      (std/error#raise-io-error
                                       'utf8-decode!
                                       '"incomplete character"
                                       _byte99430_)))
                                 (_byte299445_
                                  (##u8vector-ref
                                   _u8v99420_
                                   (##fx+ _i99427_ '1)))
                                 (_byte399447_
                                  (##u8vector-ref
                                   _u8v99420_
                                   (##fx+ _i99427_ '2)))
                                 (_char99449_
                                  (##integer->char
                                   (##fxior (##fxarithmetic-shift-left
                                             (##fxand _byte99430_ '15)
                                             '12)
                                            (##fxarithmetic-shift-left
                                             (##fxand _byte299445_ '63)
                                             '6)
                                            (##fxand _byte399447_ '63)))))
                            (##string-set! _str99421_ _j99428_ _char99449_)
                            (_lp99425_ _i+399442_ (##fx+ _j99428_ '1)))
                          (if (##fx<= _byte99430_ '244)
                              (let* ((_i+499452_ (##fx+ _i99427_ '4))
                                     (_g279769_
                                      (if (##fx<= _i+499452_ _end99423_)
                                          '#!void
                                          (std/error#raise-io-error
                                           'utf8-decode!
                                           '"incomplete character"
                                           _byte99430_)))
                                     (_byte299455_
                                      (##u8vector-ref
                                       _u8v99420_
                                       (##fx+ _i99427_ '1)))
                                     (_byte399457_
                                      (##u8vector-ref
                                       _u8v99420_
                                       (##fx+ _i99427_ '2)))
                                     (_byte499459_
                                      (##u8vector-ref
                                       _u8v99420_
                                       (##fx+ _i99427_ '3)))
                                     (_char99461_
                                      (##integer->char
                                       (##fxior (##fxarithmetic-shift-left
                                                 (##fxand _byte99430_ '7)
                                                 '18)
                                                (##fxarithmetic-shift-left
                                                 (##fxand _byte299455_ '63)
                                                 '12)
                                                (##fxarithmetic-shift-left
                                                 (##fxand _byte399457_ '63)
                                                 '6)
                                                (##fxand _byte499459_ '63)))))
                                (##string-set! _str99421_ _j99428_ _char99461_)
                                (_lp99425_ _i+499452_ (##fx+ _j99428_ '1)))
                              (begin
                                (##string-set! _str99421_ _j99428_ '#\�)
                                (_lp99425_
                                 (##fx+ _i99427_ '1)
                                 (##fx+ _j99428_ '1))))))))
            _j99428_)))))
