(declare (block) (standard-bindings) (extended-bindings))
(begin
  (declare (not safe))
  (define std/text/json#read-json__%
    (lambda (_port167632_)
      (std/text/json#read-json-object__% _port167632_ '#f)))
  (define std/text/json#read-json__0
    (lambda ()
      (let ((_port167638_ (current-input-port)))
        (std/text/json#read-json__% _port167638_))))
  (define std/text/json#read-json
    (lambda _g279838_
      (let ((_g279837_ (##length _g279838_)))
        (cond ((##fx= _g279837_ 0)
               (apply std/text/json#read-json__0 _g279838_))
              ((##fx= _g279837_ 1)
               (apply std/text/json#read-json__% _g279838_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/json#read-json
                _g279838_))))))
  (define std/text/json#string->json-object
    (lambda (_str167629_)
      (std/text/json#read-json-object__% (open-input-string _str167629_) '#f)))
  (define std/text/json#write-json__%
    (lambda (_obj167616_ _port167617_)
      (std/text/json#write-json-object _obj167616_ _port167617_)))
  (define std/text/json#write-json__0
    (lambda (_obj167622_)
      (let ((_port167624_ (current-output-port)))
        (std/text/json#write-json-object _obj167622_ _port167624_))))
  (define std/text/json#write-json
    (lambda _g279840_
      (let ((_g279839_ (##length _g279840_)))
        (cond ((##fx= _g279839_ 1)
               (apply std/text/json#write-json__0 _g279840_))
              ((##fx= _g279839_ 2)
               (apply std/text/json#write-json-object _g279840_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/json#write-json
                _g279840_))))))
  (define std/text/json#json-object->string
    (lambda (_obj167611_)
      (let ((_port167613_ (open-output-string)))
        (std/text/json#write-json-object _obj167611_ _port167613_)
        (get-output-string _port167613_))))
  (define std/text/json#json-symbolic-keys (make-parameter '#t))
  (define std/text/json#json-list-wrapper (make-parameter identity))
  (define std/text/json#raise-invalid-token
    (lambda (_port167608_ _char167609_)
      (if (eof-object? _char167609_)
          (std/error#raise-io-error
           'read-json
           '"Incomplete JSON object; EOF reached"
           _port167608_)
          (std/error#raise-io-error
           'read-json
           '"Invalid JSON token"
           _port167608_
           _char167609_))))
  (define std/text/json#read-json-object__%
    (lambda (_port167576_ _raise-eof?167577_)
      (std/text/json#skip-whitespace _port167576_)
      (let ((_char167579_ (peek-char _port167576_)))
        (if (eof-object? _char167579_)
            (if _raise-eof?167577_
                (std/error#raise-io-error
                 'read-json
                 '"EOF reached"
                 _port167576_)
                '#!eof)
            (let ((_$e167581_ _char167579_))
              (let ((_default167583167587_
                     (lambda ()
                       (std/text/json#raise-invalid-token
                        _port167576_
                        _char167579_)))
                    (_table167584167589_
                     '#(#f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        2
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        6
                        #f
                        #f
                        6
                        6
                        6
                        6
                        6
                        6
                        6
                        6
                        6
                        6
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        1
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        4
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        5
                        #f
                        #f
                        #f
                        #f
                        #f
                        3
                        #f
                        #f
                        #f
                        #f
                        #f
                        #f
                        0)))
                (if (char? _$e167581_)
                    (let ((_ix167592_ (##char->integer _$e167581_)))
                      (if (##fx< _ix167592_ '124)
                          (let ((_x167595_
                                 (##vector-ref
                                  _table167584167589_
                                  _ix167592_)))
                            (if _x167595_
                                (if (##fx< _x167595_ '3)
                                    (if (##fx= _x167595_ '0)
                                        (std/text/json#read-json-hash
                                         _port167576_)
                                        (if (##fx= _x167595_ '1)
                                            (std/text/json#read-json-list
                                             _port167576_)
                                            (std/text/json#read-json-string
                                             _port167576_)))
                                    (if (##fx< _x167595_ '5)
                                        (if (##fx= _x167595_ '3)
                                            (std/text/json#read-json-true
                                             _port167576_)
                                            (std/text/json#read-json-false
                                             _port167576_))
                                        (if (##fx= _x167595_ '5)
                                            (std/text/json#read-json-null
                                             _port167576_)
                                            (std/text/json#read-json-number
                                             _port167576_))))
                                (_default167583167587_)))
                          (_default167583167587_)))
                    (_default167583167587_))))))))
  (define std/text/json#read-json-object__0
    (lambda (_port167601_)
      (let ((_raise-eof?167603_ '#t))
        (std/text/json#read-json-object__% _port167601_ _raise-eof?167603_))))
  (define std/text/json#read-json-object
    (lambda _g279842_
      (let ((_g279841_ (##length _g279842_)))
        (cond ((##fx= _g279841_ 1)
               (apply std/text/json#read-json-object__0 _g279842_))
              ((##fx= _g279841_ 2)
               (apply std/text/json#read-json-object__% _g279842_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/json#read-json-object
                _g279842_))))))
  (define std/text/json#skip-whitespace
    (lambda (_port167571_)
      (let ((_char167573_ (peek-char _port167571_)))
        (if (eof-object? _char167573_)
            '#!void
            (if (char-whitespace? _char167573_)
                (begin
                  (read-char _port167571_)
                  (std/text/json#skip-whitespace _port167571_))
                '#!void)))))
  (define std/text/json#skip-chars
    (lambda (_chars167529_ _port167530_)
      (let _lp167532_ ((_rest167534_ _chars167529_))
        (let* ((_rest167535167543_ _rest167534_)
               (_else167537167551_ (lambda () '#!void))
               (_K167539167559_
                (lambda (_rest167554_ _char167555_)
                  (let ((_next167557_ (read-char _port167530_)))
                    (if (eq? _next167557_ _char167555_)
                        (_lp167532_ _rest167554_)
                        (std/text/json#raise-invalid-token
                         _port167530_
                         _next167557_))))))
          (if (##pair? _rest167535167543_)
              (let ((_hd167540167562_ (##car _rest167535167543_))
                    (_tl167541167564_ (##cdr _rest167535167543_)))
                (let* ((_char167567_ _hd167540167562_)
                       (_rest167569_ _tl167541167564_))
                  (_K167539167559_ _rest167569_ _char167567_)))
              '#!void)))))
  (define std/text/json#read-json-hash
    (lambda (_port167513_)
      (read-char _port167513_)
      (let ((_obj167515_
             (if (std/text/json#json-symbolic-keys)
                 (make-table 'test: eq?)
                 (make-table))))
        (let _lp167517_ ()
          (let ((_key167520_ (std/text/json#read-json-hash-key _port167513_)))
            (if _key167520_
                (if (hash-key? _obj167515_ _key167520_)
                    (error '"Duplicate hash key in JSON input" _key167520_)
                    (let ((_val167522_
                           (std/text/json#read-json-object__0 _port167513_)))
                      (table-set! _obj167515_ _key167520_ _val167522_)
                      (std/text/json#skip-whitespace _port167513_)
                      (let* ((_char167524_ (peek-char _port167513_))
                             (_$e167526_ _char167524_))
                        (if (eq? '#\, _$e167526_)
                            (begin (read-char _port167513_) (_lp167517_))
                            (if (eq? '#\} _$e167526_)
                                (begin (read-char _port167513_) _obj167515_)
                                (std/text/json#raise-invalid-token
                                 _port167513_
                                 _char167524_))))))
                _obj167515_))))))
  (define std/text/json#read-json-hash-key
    (lambda (_port167499_)
      (std/text/json#skip-whitespace _port167499_)
      (let* ((_char167501_ (peek-char _port167499_)) (_$e167503_ _char167501_))
        (if (eq? '#\" _$e167503_)
            (let ((_key167506_ (std/text/json#read-json-string _port167499_)))
              (std/text/json#skip-whitespace _port167499_)
              (let* ((_char167508_ (peek-char _port167499_))
                     (_$e167510_ _char167508_))
                (if (eq? '#\: _$e167510_)
                    (begin
                      (read-char _port167499_)
                      (if (std/text/json#json-symbolic-keys)
                          (string->symbol _key167506_)
                          _key167506_))
                    (std/text/json#raise-invalid-token
                     _port167499_
                     _char167508_))))
            (if (eq? '#\} _$e167503_)
                (begin (read-char _port167499_) '#f)
                (std/text/json#raise-invalid-token
                 _port167499_
                 _char167501_))))))
  (define std/text/json#read-json-list
    (lambda (_port167487_)
      (read-char _port167487_)
      (let ((_root167489_ (cons '#f '())))
        (let _lp167491_ ((_tl167493_ _root167489_))
          (let ((_next167495_
                 (std/text/json#read-json-list-next _port167487_)))
            (if (eof-object? _next167495_)
                ((std/text/json#json-list-wrapper) (cdr _root167489_))
                (let ((_tl*167497_ (cons _next167495_ '())))
                  (set-cdr! _tl167493_ _tl*167497_)
                  (_lp167491_ _tl*167497_))))))))
  (define std/text/json#read-json-list-next
    (lambda (_port167473_)
      (std/text/json#skip-whitespace _port167473_)
      (let* ((_char167475_ (peek-char _port167473_)) (_$e167477_ _char167475_))
        (if (eq? '#\] _$e167477_)
            (begin (read-char _port167473_) '#!eof)
            (let ((_obj167480_
                   (std/text/json#read-json-object__0 _port167473_)))
              (std/text/json#skip-whitespace _port167473_)
              (let* ((_char167482_ (peek-char _port167473_))
                     (_$e167484_ _char167482_))
                (if (eq? '#\, _$e167484_)
                    (begin (read-char _port167473_) _obj167480_)
                    (if (eq? '#\] _$e167484_)
                        _obj167480_
                        (std/text/json#raise-invalid-token
                         _port167473_
                         _char167482_)))))))))
  (define std/text/json#read-json-string
    (lambda (_port167372_)
      (letrec ((_read-escape-char167374_
                (lambda (_port167452_)
                  (let* ((_char167454_ (read-char _port167452_))
                         (_$e167456_ _char167454_))
                    (let ((_default167458167462_
                           (lambda ()
                             (std/text/json#raise-invalid-token
                              _port167452_
                              _char167454_)))
                          (_table167459167464_
                           '#(#f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              0
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              0
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              0
                              #f
                              #f
                              #f
                              #f
                              #f
                              1
                              #f
                              #f
                              #f
                              3
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              #f
                              2
                              #f
                              #f
                              #f
                              4
                              #f
                              5
                              6)))
                      (if (char? _$e167456_)
                          (let ((_ix167467_ (##char->integer _$e167456_)))
                            (if (##fx< _ix167467_ '118)
                                (let ((_x167470_
                                       (##vector-ref
                                        _table167459167464_
                                        _ix167467_)))
                                  (if _x167470_
                                      (if (##fx< _x167470_ '3)
                                          (if (##fx= _x167470_ '0)
                                              _char167454_
                                              (if (##fx= _x167470_ '1)
                                                  '#\backspace
                                                  '#\newline))
                                          (if (##fx< _x167470_ '5)
                                              (if (##fx= _x167470_ '3)
                                                  '#\page
                                                  '#\return)
                                              (if (##fx= _x167470_ '5)
                                                  '#\tab
                                                  (_read-escape-unicode167375_
                                                   _port167452_))))
                                      (_default167458167462_)))
                                (_default167458167462_)))
                          (_default167458167462_))))))
               (_read-escape-unicode167375_
                (lambda (_port167401_)
                  (let _lp167403_ ((_n167405_ '0) (_chars167406_ '()))
                    (if (##fx< _n167405_ '4)
                        (_lp167403_
                         (##fx+ _n167405_ '1)
                         (cons (read-char _port167401_) _chars167406_))
                        (let _lp167408_ ((_rest167410_ _chars167406_)
                                         (_val167411_ '0)
                                         (_shift167412_ '0))
                          (let* ((_rest167413167421_ _rest167410_)
                                 (_else167415167432_
                                  (lambda ()
                                    (if (and (##fx< _val167411_ ##max-char)
                                             (or (##fx< _val167411_ '55296)
                                                 (##fx< '57343 _val167411_)))
                                        (##integer->char _val167411_)
                                        '#\�)))
                                 (_K167417167440_
                                  (lambda (_rest167435_ _char167436_)
                                    (let ((_n167438_
                                           (##fxarithmetic-shift
                                            (_hex-value167376_ _char167436_)
                                            _shift167412_)))
                                      (_lp167408_
                                       _rest167435_
                                       (bitwise-ior _n167438_ _val167411_)
                                       (##fx+ _shift167412_ '4))))))
                            (if (##pair? _rest167413167421_)
                                (let ((_hd167418167443_
                                       (##car _rest167413167421_))
                                      (_tl167419167445_
                                       (##cdr _rest167413167421_)))
                                  (let* ((_char167448_ _hd167418167443_)
                                         (_rest167450_ _tl167419167445_))
                                    (_K167417167440_
                                     _rest167450_
                                     _char167448_)))
                                (_else167415167432_))))))))
               (_hex-value167376_
                (lambda (_char167396_)
                  (let ((_$e167398_ (std/text/hex#unhex* _char167396_)))
                    (if _$e167398_
                        _$e167398_
                        (std/text/json#raise-invalid-token
                         _port167372_
                         _char167396_))))))
        (read-char _port167372_)
        (let ((_root167378_ (cons '#f '())))
          (let _lp167380_ ((_tl167382_ _root167378_))
            (let* ((_char167384_ (read-char _port167372_))
                   (_$e167386_ _char167384_))
              (if (eq? '#\" _$e167386_)
                  (list->string (cdr _root167378_))
                  (if (eq? '#\\ _$e167386_)
                      (let* ((_char167389_
                              (_read-escape-char167374_ _port167372_))
                             (_tl*167391_ (cons _char167389_ '())))
                        (set-cdr! _tl167382_ _tl*167391_)
                        (_lp167380_ _tl*167391_))
                      (if (eof-object? _char167384_)
                          (std/text/json#raise-invalid-token
                           _port167372_
                           _char167384_)
                          (let ((_tl*167394_ (cons _char167384_ '())))
                            (set-cdr! _tl167382_ _tl*167394_)
                            (_lp167380_ _tl*167394_)))))))))))
  (define std/text/json#read-json-number
    (lambda (_port167345_)
      (letrec ((_parse167347_
                (lambda (_chars167365_)
                  (let* ((_str167367_ (list->string _chars167365_))
                         (_$e167369_ (string->number _str167367_)))
                    (if _$e167369_
                        _$e167369_
                        (std/text/json#raise-invalid-token
                         _port167345_
                         _str167367_))))))
        (let ((_chars167349_ (cons (read-char _port167345_) '())))
          (let _lp167351_ ((_tl167353_ _chars167349_))
            (let ((_char167355_ (peek-char _port167345_)))
              (if (or (eof-object? _char167355_)
                      (memq _char167355_ '(#\] #\} #\,))
                      (char-whitespace? _char167355_))
                  (_parse167347_ _chars167349_)
                  (let ((_tl*167363_ (cons (read-char _port167345_) '())))
                    (set-cdr! _tl167353_ _tl*167363_)
                    (_lp167351_ _tl*167363_)))))))))
  (define std/text/json#read-json-true
    (lambda (_port167343_)
      (std/text/json#skip-chars '(#\t #\r #\u #\e) _port167343_)
      '#t))
  (define std/text/json#read-json-false
    (lambda (_port167341_)
      (std/text/json#skip-chars '(#\f #\a #\l #\s #\e) _port167341_)
      '#f))
  (define std/text/json#read-json-null
    (lambda (_port167339_)
      (std/text/json#skip-chars '(#\n #\u #\l #\l) _port167339_)
      '#!void))
  (define std/text/json#write-json-object
    (lambda (_obj167336_ _port167337_)
      (if (number? _obj167336_)
          (if (exact-integer? _obj167336_)
              (gerbil/gambit/ports#write-string__%
               (number->string _obj167336_)
               _port167337_)
              (if (inexact? _obj167336_)
                  (std/text/json#write-json-inexact _obj167336_ _port167337_)
                  (if (rational? _obj167336_)
                      (std/text/json#write-json-inexact
                       (exact->inexact _obj167336_)
                       _port167337_)
                      (error '"Bad JSON object" _obj167336_))))
          (if (string? _obj167336_)
              (std/text/json#write-json-string _obj167336_ _port167337_)
              (if (symbol? _obj167336_)
                  (std/text/json#write-json-string
                   (symbol->string _obj167336_)
                   _port167337_)
                  (if (keyword? _obj167336_)
                      (std/text/json#write-json-string
                       (keyword->string _obj167336_)
                       _port167337_)
                      (if (list? _obj167336_)
                          (std/text/json#write-json-list
                           _obj167336_
                           _port167337_)
                          (if (vector? _obj167336_)
                              (std/text/json#write-json-vector
                               _obj167336_
                               _port167337_)
                              (if (table? _obj167336_)
                                  (std/text/json#write-json-hash
                                   _obj167336_
                                   _port167337_)
                                  (if (eq? '#t _obj167336_)
                                      (gerbil/gambit/ports#write-string__%
                                       '"true"
                                       _port167337_)
                                      (if (eq? '#f _obj167336_)
                                          (gerbil/gambit/ports#write-string__%
                                           '"false"
                                           _port167337_)
                                          (if (eq? _obj167336_ '#!void)
                                              (gerbil/gambit/ports#write-string__%
                                               '"null"
                                               _port167337_)
                                              (std/text/json#write-json-object
                                               (let ((__method279836
                                                      (method-ref
                                                       _obj167336_
                                                       ':json)))
                                                 (if __method279836
                                                     (__method279836
                                                      _obj167336_)
                                                     (error '"Missing method"
                                                            _obj167336_
                                                            ':json)))
                                               _port167337_)))))))))))))
  (define std/text/json#write-json-inexact
    (lambda (_obj167328_ _port167329_)
      (let* ((_mag167331_ (abs _obj167328_))
             (_str167333_ (number->string _mag167331_)))
        (if (flnegative? _obj167328_) (write-char '#\- _port167329_) '#!void)
        (if (eq? (string-ref _str167333_ '0) '#\.)
            (write-char '#\0 _port167329_)
            '#!void)
        (gerbil/gambit/ports#write-string__% _str167333_ _port167329_)
        (if (eq? (string-ref
                  _str167333_
                  (##fx- (string-length _str167333_) '1))
                 '#\.)
            (write-char '#\0 _port167329_)
            '#!void))))
  (define std/text/json#write-json-list
    (lambda (_obj167263_ _port167264_)
      (write-char '#\[ _port167264_)
      (let _lp167266_ ((_rest167268_ _obj167263_))
        (let* ((_rest167269167282_ _rest167268_)
               (_E167273167286_
                (lambda () (error '"No clause matching" _rest167269167282_))))
          (let ((_K167278167318_
                 (lambda (_val167316_)
                   (std/text/json#write-json-object _val167316_ _port167264_)
                   (write-char '#\] _port167264_)))
                (_K167275167301_
                 (lambda (_rest167298_ _val167299_)
                   (std/text/json#write-json-object _val167299_ _port167264_)
                   (write-char '#\, _port167264_)
                   (_lp167266_ _rest167298_)))
                (_K167274167291_ (lambda () (write-char '#\] _port167264_))))
            (let ((_try-match167272167294_
                   (lambda ()
                     (if (##null? _rest167269167282_)
                         (_K167274167291_)
                         (_E167273167286_)))))
              (if (##pair? _rest167269167282_)
                  (let ((_tl167280167323_ (##cdr _rest167269167282_))
                        (_hd167279167321_ (##car _rest167269167282_)))
                    (if (##null? _tl167280167323_)
                        (let ((_val167326_ _hd167279167321_))
                          (_K167278167318_ _val167326_))
                        (let ((_val167309_ _hd167279167321_)
                              (_rest167311_ _tl167280167323_))
                          (_K167275167301_ _rest167311_ _val167309_))))
                  (_try-match167272167294_))))))))
  (define std/text/json#write-json-vector
    (lambda (_obj167252_ _port167253_)
      (let ((_len167255_ (vector-length _obj167252_)))
        (if (##fxpositive? _len167255_)
            (let ((_last167257_ (##fx- _len167255_ '1)))
              (write-char '#\[ _port167253_)
              (let _lp167259_ ((_n167261_ '0))
                (if (##fx= _n167261_ _last167257_)
                    (begin
                      (std/text/json#write-json-object
                       (##vector-ref _obj167252_ _n167261_)
                       _port167253_)
                      (write-char '#\] _port167253_))
                    (begin
                      (std/text/json#write-json-object
                       (##vector-ref _obj167252_ _n167261_)
                       _port167253_)
                      (write-char '#\, _port167253_)
                      (_lp167259_ (##fx+ _n167261_ '1))))))
            (gerbil/gambit/ports#write-string__% '"[]" _port167253_)))))
  (define std/text/json#write-json-hash
    (lambda (_obj167161_ _port167162_)
      (letrec ((_string-e167164_
                (lambda (_key167250_)
                  (if (string? _key167250_)
                      _key167250_
                      (if (symbol? _key167250_)
                          (symbol->string _key167250_)
                          (if (keyword? _key167250_)
                              (keyword->string _key167250_)
                              (error '"Illegal hash key; must be symbol, keyword or string"
                                     _obj167161_
                                     _key167250_)))))))
        (write-char '#\{ _port167162_)
        (let ((_lst167166_ (table->list _obj167161_)))
          (let _lp167168_ ((_rest167170_ _lst167166_))
            (let* ((_rest167171167188_ _rest167170_)
                   (_E167175167192_
                    (lambda ()
                      (error '"No clause matching" _rest167171167188_))))
              (let ((_K167182167233_
                     (lambda (_val167230_ _key167231_)
                       (write (_string-e167164_ _key167231_) _port167162_)
                       (write-char '#\: _port167162_)
                       (std/text/json#write-json-object
                        _val167230_
                        _port167162_)
                       (write-char '#\} _port167162_)))
                    (_K167177167208_
                     (lambda (_rest167204_ _val167205_ _key167206_)
                       (write (_string-e167164_ _key167206_) _port167162_)
                       (write-char '#\: _port167162_)
                       (std/text/json#write-json-object
                        _val167205_
                        _port167162_)
                       (write-char '#\, _port167162_)
                       (_lp167168_ _rest167204_)))
                    (_K167176167197_
                     (lambda () (write-char '#\} _port167162_))))
                (let ((_try-match167174167200_
                       (lambda ()
                         (if (##null? _rest167171167188_)
                             (_K167176167197_)
                             (_E167175167192_)))))
                  (if (##pair? _rest167171167188_)
                      (let ((_tl167184167238_ (##cdr _rest167171167188_))
                            (_hd167183167236_ (##car _rest167171167188_)))
                        (if (##pair? _hd167183167236_)
                            (let ((_tl167186167243_ (##cdr _hd167183167236_))
                                  (_hd167185167241_ (##car _hd167183167236_)))
                              (if (##null? _tl167184167238_)
                                  (let ((_key167246_ _hd167185167241_)
                                        (_val167248_ _tl167186167243_))
                                    (_K167182167233_ _val167248_ _key167246_))
                                  (let ((_key167221_ _hd167185167241_)
                                        (_val167223_ _tl167186167243_)
                                        (_rest167225_ _tl167184167238_))
                                    (_K167177167208_
                                     _rest167225_
                                     _val167223_
                                     _key167221_))))
                            (_E167175167192_)))
                      (_try-match167174167200_))))))))))
  (define std/text/json#write-json-string
    (lambda (_obj167120_ _port167121_)
      (letrec* ((_escape167123_
                 '((#\" . #\")
                   (#\\ . #\\)
                   (#\backspace . #\b)
                   (#\newline . #\n)
                   (#\page . #\f)
                   (#\return . #\r)
                   (#\tab . #\t)))
                (_printable-char?167124_
                 (lambda (_char167157_)
                   (let ((_n167159_ (char->integer _char167157_)))
                     (if (##fx< _n167159_ '32)
                         '#f
                         (if (##fx= _n167159_ '127) '#f '#t)))))
                (_write-uchar167125_
                 (lambda (_char167144_ _port167145_)
                   (let ((_int167147_ (char->integer _char167144_)))
                     (gerbil/gambit/ports#write-string__% '"\\u" _port167145_)
                     (let _lp167149_ ((_n167151_ '0)
                                      (_mask167152_ '61440)
                                      (_shift167153_ '-12))
                       (if (##fx< _n167151_ '4)
                           (let ((_char167155_
                                  (std/text/hex#hex
                                   (arithmetic-shift
                                    (bitwise-and _int167147_ _mask167152_)
                                    _shift167153_))))
                             (write-char _char167155_ _port167145_)
                             (_lp167149_
                              (##fx+ _n167151_ '1)
                              (arithmetic-shift _mask167152_ '-4)
                              (##fx+ _shift167153_ '4)))
                           '#!void)))))
                (_write-str167126_
                 (lambda (_obj167128_ _port167129_)
                   (let ((_len167131_ (string-length _obj167128_)))
                     (let _lp167133_ ((_n167135_ '0))
                       (if (##fx< _n167135_ _len167131_)
                           (let ((_char167137_
                                  (string-ref _obj167128_ _n167135_)))
                             (let ((_$e167139_
                                    (assq _char167137_ _escape167123_)))
                               (if _$e167139_
                                   ((lambda (_esc167142_)
                                      (write-char '#\\ _port167129_)
                                      (write-char
                                       (cdr _esc167142_)
                                       _port167129_))
                                    _$e167139_)
                                   (if (_printable-char?167124_ _char167137_)
                                       (write-char _char167137_ _port167129_)
                                       (_write-uchar167125_
                                        _char167137_
                                        _port167129_))))
                             (_lp167133_ (##fx+ _n167135_ '1)))
                           '#!void))))))
        (write-char '#\" _port167121_)
        (_write-str167126_ _obj167120_ _port167121_)
        (write-char '#\" _port167121_)))))
