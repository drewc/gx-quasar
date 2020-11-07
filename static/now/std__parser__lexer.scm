(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/parser/lexer#token-stream::t
    (make-struct-type
     'std/parser/lexer#token-stream::t
     '#f
     '5
     'token-stream
     '((final: . #t))
     '#f
     '(cs buf Ls Rs $$)))
  (define std/parser/lexer#token-stream?
    (make-struct-predicate std/parser/lexer#token-stream::t))
  (define std/parser/lexer#make-token-stream
    (lambda _$args151430_
      (apply make-struct-instance
             std/parser/lexer#token-stream::t
             _$args151430_)))
  (define std/parser/lexer#token-stream-cs
    (make-struct-field-accessor std/parser/lexer#token-stream::t '0))
  (define std/parser/lexer#token-stream-buf
    (make-struct-field-accessor std/parser/lexer#token-stream::t '1))
  (define std/parser/lexer#token-stream-Ls
    (make-struct-field-accessor std/parser/lexer#token-stream::t '2))
  (define std/parser/lexer#token-stream-Rs
    (make-struct-field-accessor std/parser/lexer#token-stream::t '3))
  (define std/parser/lexer#token-stream-$$
    (make-struct-field-accessor std/parser/lexer#token-stream::t '4))
  (define std/parser/lexer#token-stream-cs-set!
    (make-struct-field-mutator std/parser/lexer#token-stream::t '0))
  (define std/parser/lexer#token-stream-buf-set!
    (make-struct-field-mutator std/parser/lexer#token-stream::t '1))
  (define std/parser/lexer#token-stream-Ls-set!
    (make-struct-field-mutator std/parser/lexer#token-stream::t '2))
  (define std/parser/lexer#token-stream-Rs-set!
    (make-struct-field-mutator std/parser/lexer#token-stream::t '3))
  (define std/parser/lexer#token-stream-$$-set!
    (make-struct-field-mutator std/parser/lexer#token-stream::t '4))
  (define std/parser/lexer#$
    (let ()
      (declare (not safe))
      (##structure std/parser/base#token::t '$ '#!void '#f)))
  (define std/parser/lexer#$?
    (lambda (_obj151428_) (eq? std/parser/lexer#$ _obj151428_)))
  (define std/parser/lexer#$$
    (lambda (_loc151426_)
      (let ((__tmp279743 (eof-object)))
        (declare (not safe))
        (##structure std/parser/base#token::t '$$ __tmp279743 _loc151426_))))
  (define std/parser/lexer#$$?
    (lambda (_obj151390_)
      (let* ((_obj151391151400_ _obj151390_)
             (_else151394151408_ (lambda () '#f)))
        (let ((_K151397151420_ (lambda () '#t))
              (_K151396151413_ (lambda () '#t)))
          (let ((_try-match151393151416_
                 (lambda ()
                   (if (eof-object? _obj151391151400_)
                       (_K151396151413_)
                       (_else151394151408_)))))
            (if (let ()
                  (declare (not safe))
                  (##structure-direct-instance-of?
                   _obj151391151400_
                   'std/parser/base#token::t))
                (let ((_e151398151423_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _obj151391151400_ '1))))
                  (if (let () (declare (not safe)) (##eq? _e151398151423_ '$$))
                      (_K151397151420_)
                      (_try-match151393151416_)))
                (_try-match151393151416_)))))))
  (define std/parser/lexer#lex
    (lambda (_input151384_ _Ls151385_ _Rs151386_)
      (let ((_cs151388_ (std/parser/lexer#lexer-input-stream _input151384_)))
        (declare (not safe))
        (##structure
         std/parser/lexer#token-stream::t
         _cs151388_
         '()
         _Ls151385_
         _Rs151386_
         '#f))))
  (define std/parser/lexer#lex-chars
    (lambda (_input151379_)
      (std/parser/lexer#lex
       _input151379_
       (cons std/parser/rlang#@dot '())
       (cons (lambda (_str151381_ _loc151382_)
               (let ((__tmp279744 (string-ref _str151381_ '0)))
                 (declare (not safe))
                 (##structure
                  std/parser/base#token::t
                  'Char
                  __tmp279744
                  _loc151382_)))
             '()))))
  (define std/parser/lexer#token-stream-close
    (lambda (_ts151377_)
      (std/parser/stream#char-stream-close
       (##direct-structure-ref
        _ts151377_
        '1
        std/parser/lexer#token-stream::t
        '#f))))
  (define std/parser/lexer#token-stream-get
    (lambda (_ts151294_)
      (let* ((_ts151295151304_ _ts151294_)
             (_E151297151308_
              (lambda () (error '"No clause matching" _ts151295151304_)))
             (_K151298151354_
              (lambda (_Rs151311_ _Ls151312_ _buf151313_ _cs151314_)
                (let* ((_buf151315151323_ _buf151313_)
                       (_else151317151336_
                        (lambda ()
                          (let _lp151331_ ()
                            (let ((_next151334_
                                   (std/parser/lexer#lex1
                                    _cs151314_
                                    _Ls151312_
                                    _Rs151311_)))
                              (if (std/parser/lexer#$? _next151334_)
                                  (_lp151331_)
                                  _next151334_)))))
                       (_K151319151342_
                        (lambda (_rest151339_ _tok151340_)
                          (##direct-structure-set!
                           _ts151294_
                           _rest151339_
                           '2
                           std/parser/lexer#token-stream::t
                           '#f)
                          _tok151340_)))
                  (if (let () (declare (not safe)) (##pair? _buf151315151323_))
                      (let ((_hd151320151345_
                             (let ()
                               (declare (not safe))
                               (##car _buf151315151323_)))
                            (_tl151321151347_
                             (let ()
                               (declare (not safe))
                               (##cdr _buf151315151323_))))
                        (let* ((_tok151350_ _hd151320151345_)
                               (_rest151352_ _tl151321151347_))
                          (_K151319151342_ _rest151352_ _tok151350_)))
                      (_else151317151336_))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _ts151295151304_
               'std/parser/lexer#token-stream::t))
            (let* ((_e151299151357_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _ts151295151304_ '1)))
                   (_cs151360_ _e151299151357_)
                   (_e151300151362_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _ts151295151304_ '2)))
                   (_buf151365_ _e151300151362_)
                   (_e151301151367_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _ts151295151304_ '3)))
                   (_Ls151370_ _e151301151367_)
                   (_e151302151372_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _ts151295151304_ '4)))
                   (_Rs151375_ _e151302151372_))
              (_K151298151354_ _Rs151375_ _Ls151370_ _buf151365_ _cs151360_))
            (_E151297151308_)))))
  (define std/parser/lexer#token-stream-next
    (lambda (_ts151285_)
      (let ((_next151287_ (std/parser/lexer#token-stream-get _ts151285_)))
        (if (eof-object? _next151287_)
            (let ((_$e151289_
                   (##direct-structure-ref
                    _ts151285_
                    '5
                    std/parser/lexer#token-stream::t
                    '#f)))
              (if _$e151289_
                  (values _$e151289_)
                  (let ((_eof151292_
                         (std/parser/lexer#$$
                          (##direct-structure-ref
                           (##direct-structure-ref
                            _ts151285_
                            '1
                            std/parser/lexer#token-stream::t
                            '#f)
                           '3
                           std/parser/stream#char-stream::t
                           '#f))))
                    (##direct-structure-set!
                     _ts151285_
                     _eof151292_
                     '5
                     std/parser/lexer#token-stream::t
                     '#f)
                    _eof151292_)))
            _next151287_))))
  (define std/parser/lexer#token-stream-unget
    (lambda (_ts151256_ _tok151257_)
      (if (eof-object? _tok151257_)
          '#!void
          (let* ((_ts151258151265_ _ts151256_)
                 (_E151260151269_
                  (lambda () (error '"No clause matching" _ts151258151265_)))
                 (_K151261151274_
                  (lambda (_buf151272_)
                    (##direct-structure-set!
                     _ts151256_
                     (cons _tok151257_ _buf151272_)
                     '2
                     std/parser/lexer#token-stream::t
                     '#f))))
            (if (let ()
                  (declare (not safe))
                  (##structure-direct-instance-of?
                   _ts151258151265_
                   'std/parser/lexer#token-stream::t))
                (let* ((_e151262151277_
                        (let ()
                          (declare (not safe))
                          (##vector-ref _ts151258151265_ '1)))
                       (_e151263151280_
                        (let ()
                          (declare (not safe))
                          (##vector-ref _ts151258151265_ '2)))
                       (_buf151283_ _e151263151280_))
                  (_K151261151274_ _buf151283_))
                (_E151260151269_))))))
  (define std/parser/lexer#token-stream-peek
    (lambda (_ts151193_)
      (let* ((_ts151194151201_ _ts151193_)
             (_E151196151205_
              (lambda () (error '"No clause matching" _ts151194151201_)))
             (_K151197151245_
              (lambda (_buf151208_)
                (let* ((_buf151209151217_ _buf151208_)
                       (_else151211151227_
                        (lambda ()
                          (let ((_next151225_
                                 (std/parser/lexer#token-stream-get
                                  _ts151193_)))
                            (if (eof-object? _next151225_)
                                '#!void
                                (##direct-structure-set!
                                 _ts151193_
                                 (cons _next151225_ '())
                                 '2
                                 std/parser/lexer#token-stream::t
                                 '#f))
                            _next151225_)))
                       (_K151213151233_
                        (lambda (_rest151230_ _tok151231_) _tok151231_)))
                  (if (let () (declare (not safe)) (##pair? _buf151209151217_))
                      (let ((_hd151214151236_
                             (let ()
                               (declare (not safe))
                               (##car _buf151209151217_)))
                            (_tl151215151238_
                             (let ()
                               (declare (not safe))
                               (##cdr _buf151209151217_))))
                        (let* ((_tok151241_ _hd151214151236_)
                               (_rest151243_ _tl151215151238_))
                          (_K151213151233_ _rest151243_ _tok151241_)))
                      (_else151211151227_))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _ts151194151201_
               'std/parser/lexer#token-stream::t))
            (let* ((_e151198151248_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _ts151194151201_ '1)))
                   (_e151199151251_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _ts151194151201_ '2)))
                   (_buf151254_ _e151199151251_))
              (_K151197151245_ _buf151254_))
            (_E151196151205_)))))
  (define std/parser/lexer#token-stream-loc
    (lambda (_ts151129_)
      (let* ((_ts151130151137_ _ts151129_)
             (_E151132151141_
              (lambda () (error '"No clause matching" _ts151130151137_)))
             (_K151133151180_
              (lambda (_buf151144_ _cs151145_)
                (let* ((_buf151146151154_ _buf151144_)
                       (_else151148151162_
                        (lambda ()
                          (##direct-structure-ref
                           _cs151145_
                           '3
                           std/parser/stream#char-stream::t
                           '#f)))
                       (_K151150151168_
                        (lambda (_rest151165_ _tok151166_)
                          (##direct-structure-ref
                           _tok151166_
                           '3
                           std/parser/base#token::t
                           '#f))))
                  (if (let () (declare (not safe)) (##pair? _buf151146151154_))
                      (let ((_hd151151151171_
                             (let ()
                               (declare (not safe))
                               (##car _buf151146151154_)))
                            (_tl151152151173_
                             (let ()
                               (declare (not safe))
                               (##cdr _buf151146151154_))))
                        (let* ((_tok151176_ _hd151151151171_)
                               (_rest151178_ _tl151152151173_))
                          (_K151150151168_ _rest151178_ _tok151176_)))
                      (_else151148151162_))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _ts151130151137_
               'std/parser/lexer#token-stream::t))
            (let* ((_e151134151183_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _ts151130151137_ '1)))
                   (_cs151186_ _e151134151183_)
                   (_e151135151188_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _ts151130151137_ '2)))
                   (_buf151191_ _e151135151188_))
              (_K151133151180_ _buf151191_ _cs151186_))
            (_E151132151141_)))))
  (define std/parser/lexer#lexer-input-stream
    (lambda (_inp151127_)
      (if (input-port? _inp151127_)
          (let ((__obj279741
                 (make-object std/parser/stream#char-stream::t '4)))
            (std/parser/stream#char-stream:::init! __obj279741 _inp151127_)
            __obj279741)
          (if (string? _inp151127_)
              (let ((__obj279742
                     (make-object std/parser/stream#char-stream::t '4)))
                (std/parser/stream#char-stream:::init!
                 __obj279742
                 (open-input-string _inp151127_))
                __obj279742)
              (if (let ()
                    (declare (not safe))
                    (##structure-direct-instance-of?
                     _inp151127_
                     'std/parser/stream#char-stream::t))
                  _inp151127_
                  (error '"Bad input source; expected input-port, string or char-stream"
                         _inp151127_))))))
  (define std/parser/lexer#lex1
    (lambda (_cs150899_ _Ls150900_ _Rs150901_)
      (letrec ((_chars->string150903_
                (lambda (_chars151125_)
                  (list->string (reverse _chars151125_))))
               (_token-e150904_
                (lambda (_t151118_ _e151119_ _start151120_ _end151121_)
                  (let ((_loc151123_
                         (std/parser/base#location-delta
                          _start151120_
                          _end151121_)))
                    (declare (not safe))
                    (##structure
                     std/parser/base#token::t
                     _t151118_
                     _e151119_
                     _loc151123_))))
               (_raise-e150905_
                (lambda (_chars151112_ _start151113_ _end151114_)
                  (let ((_tok151116_
                         (_token-e150904_
                          'ERROR
                          (_chars->string150903_ _chars151112_)
                          _start151113_
                          _end151114_)))
                    (std/parser/base#raise-parse-error
                     'lex
                     '"No lexeme matching input"
                     _tok151116_))))
               (_loop150906_
                (lambda (_Ls150920_ _chars150921_ _start150922_ _E150923_)
                  (let ((_next150925_
                         (std/parser/stream#char-stream-getc _cs150899_)))
                    (if (eof-object? _next150925_)
                        (if (null? _chars150921_)
                            (eof-object)
                            (let _lp150927_ ((_rest-Ls150929_ _Ls150920_)
                                             (_rest-Rs150930_ _Rs150901_))
                              (let* ((_rest-Ls150931150939_ _rest-Ls150929_)
                                     (_else150933150947_
                                      (lambda () (_E150923_ _chars150921_)))
                                     (_K150935150983_
                                      (lambda (_rest-Ls150950_ _L150951_)
                                        (let* ((_rest-Rs150952150959_
                                                _rest-Rs150930_)
                                               (_E150954150963_
                                                (lambda ()
                                                  (error '"No clause matching"
                                                         _rest-Rs150952150959_)))
                                               (_K150955150971_
                                                (lambda (_rest-Rs150966_
                                                         _R150967_)
                                                  (if (std/parser/rlang#delta
                                                       _L150951_)
                                                      (let ((_end150969_
                                                             (##direct-structure-ref
                                                              _cs150899_
                                                              '3
                                                              std/parser/stream#char-stream::t
                                                              '#f)))
                                                        (_R150967_
                                                         (_chars->string150903_
                                                          _chars150921_)
                                                         (std/parser/base#location-delta
                                                          _start150922_
                                                          _end150969_)))
                                                      (_lp150927_
                                                       _rest-Ls150950_
                                                       _rest-Rs150966_)))))
                                          (if (let ()
                                                (declare (not safe))
                                                (##pair? _rest-Rs150952150959_))
                                              (let ((_hd150956150974_
                                                     (let ()
                                                       (declare (not safe))
                                                       (##car _rest-Rs150952150959_)))
                                                    (_tl150957150976_
                                                     (let ()
                                                       (declare (not safe))
                                                       (##cdr _rest-Rs150952150959_))))
                                                (let* ((_R150979_
                                                        _hd150956150974_)
                                                       (_rest-Rs150981_
                                                        _tl150957150976_))
                                                  (_K150955150971_
                                                   _rest-Rs150981_
                                                   _R150979_)))
                                              (_E150954150963_))))))
                                (if (let ()
                                      (declare (not safe))
                                      (##pair? _rest-Ls150931150939_))
                                    (let ((_hd150936150986_
                                           (let ()
                                             (declare (not safe))
                                             (##car _rest-Ls150931150939_)))
                                          (_tl150937150988_
                                           (let ()
                                             (declare (not safe))
                                             (##cdr _rest-Ls150931150939_))))
                                      (let* ((_L150991_ _hd150936150986_)
                                             (_rest-Ls150993_
                                              _tl150937150988_))
                                        (_K150935150983_
                                         _rest-Ls150993_
                                         _L150991_)))
                                    (_else150933150947_)))))
                        (let* ((_chars150995_
                                (cons _next150925_ _chars150921_))
                               (_Ls*151001_
                                (map (lambda (_g150996150998_)
                                       (std/parser/rlang#deriv
                                        _g150996150998_
                                        _next150925_))
                                     _Ls150920_))
                               (_deltas151003_
                                (map std/parser/rlang#delta _Ls*151001_)))
                          (if (ormap1 values _deltas151003_)
                              (let* ((_end151006_
                                      (##direct-structure-ref
                                       _cs150899_
                                       '3
                                       std/parser/stream#char-stream::t
                                       '#f))
                                     (_E151106_
                                      (lambda (_xchars151008_)
                                        (let ((_count151010_
                                               (let ((__tmp279746
                                                      (length _xchars151008_))
                                                     (__tmp279745
                                                      (length _chars150995_)))
                                                 (declare (not safe))
                                                 (##fx- __tmp279746
                                                        __tmp279745))))
                                          (let _lp151012_ ((_rest151014_
                                                            _xchars151008_)
                                                           (_k151015_ '0))
                                            (if (let ()
                                                  (declare (not safe))
                                                  (##fx< _k151015_
                                                         _count151010_))
                                                (let* ((_rest151016151023_
                                                        _rest151014_)
                                                       (_E151018151027_
                                                        (lambda ()
                                                          (error '"No clause matching"
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                         _rest151016151023_)))
               (_K151019151033_
                (lambda (_rest151030_ _char151031_)
                  (std/parser/stream#char-stream-ungetc
                   _cs150899_
                   _char151031_)
                  (_lp151012_
                   _rest151030_
                   (let () (declare (not safe)) (##fx+ _k151015_ '1))))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                  (if (let ()
                                                        (declare (not safe))
                                                        (##pair? _rest151016151023_))
                                                      (let ((_hd151020151036_
                                                             (let ()
                                                               (declare
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                         (not safe))
                       (##car _rest151016151023_)))
                    (_tl151021151038_
                     (let () (declare (not safe)) (##cdr _rest151016151023_))))
                (let* ((_char151041_ _hd151020151036_)
                       (_rest151043_ _tl151021151038_))
                  (_K151019151033_ _rest151043_ _char151041_)))
              (_E151018151027_)))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                '#!void)))
                                        (let _lp151045_ ((_rest-deltas151047_
                                                          _deltas151003_)
                                                         (_rest-Rs151048_
                                                          _Rs150901_))
                                          (let* ((_rest-deltas151049151056_
                                                  _rest-deltas151047_)
                                                 (_E151051151060_
                                                  (lambda ()
                                                    (error '"No clause matching"
                                                           _rest-deltas151049151056_)))
                                                 (_K151052151094_
                                                  (lambda (_rest-deltas151063_
                                                           _hd151064_)
                                                    (let* ((_rest-Rs151065151072_
                                                            _rest-Rs151048_)
                                                           (_E151067151076_
                                                            (lambda ()
                                                              (error '"No clause matching"
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                             _rest-Rs151065151072_)))
                   (_K151068151082_
                    (lambda (_rest-Rs151079_ _R151080_)
                      (if _hd151064_
                          (_R151080_
                           (_chars->string150903_ _chars150995_)
                           (std/parser/base#location-delta
                            _start150922_
                            _end151006_))
                          (_lp151045_ _rest-deltas151063_ _rest-Rs151079_)))))
              (if (let () (declare (not safe)) (##pair? _rest-Rs151065151072_))
                  (let ((_hd151069151085_
                         (let ()
                           (declare (not safe))
                           (##car _rest-Rs151065151072_)))
                        (_tl151070151087_
                         (let ()
                           (declare (not safe))
                           (##cdr _rest-Rs151065151072_))))
                    (let* ((_R151090_ _hd151069151085_)
                           (_rest-Rs151092_ _tl151070151087_))
                      (_K151068151082_ _rest-Rs151092_ _R151090_)))
                  (_E151067151076_))))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                            (if (let ()
                                                  (declare (not safe))
                                                  (##pair? _rest-deltas151049151056_))
                                                (let ((_hd151053151097_
                                                       (let ()
                                                         (declare (not safe))
                                                         (##car _rest-deltas151049151056_)))
                                                      (_tl151054151099_
                                                       (let ()
                                                         (declare (not safe))
                                                         (##cdr _rest-deltas151049151056_))))
                                                  (let* ((_hd151102_
                                                          _hd151053151097_)
                                                         (_rest-deltas151104_
                                                          _tl151054151099_))
                                                    (_K151052151094_
                                                     _rest-deltas151104_
                                                     _hd151102_)))
                                                (_E151051151060_)))))))
                                (_loop150906_
                                 _Ls*151001_
                                 _chars150995_
                                 _start150922_
                                 _E151106_))
                              (if (ormap1 (lambda (_$obj151109_)
                                            (not (std/parser/rlang#@nul?
                                                  _$obj151109_)))
                                          _Ls*151001_)
                                  (_loop150906_
                                   _Ls*151001_
                                   _chars150995_
                                   _start150922_
                                   _E150923_)
                                  (_E150923_ _chars150995_)))))))))
        (let* ((_first150908_ (std/parser/stream#char-stream-getc _cs150899_))
               (_start150910_
                (##direct-structure-ref
                 _cs150899_
                 '3
                 std/parser/stream#char-stream::t
                 '#f))
               (_g279747_
                (std/parser/stream#char-stream-ungetc
                 _cs150899_
                 _first150908_))
               (_E150917_
                (lambda (_chars150913_)
                  (let ((_end150915_
                         (##direct-structure-ref
                          _cs150899_
                          '3
                          std/parser/stream#char-stream::t
                          '#f)))
                    (_raise-e150905_
                     _chars150913_
                     _start150910_
                     _end150915_)))))
          (_loop150906_ _Ls150900_ '() _start150910_ _E150917_))))))
