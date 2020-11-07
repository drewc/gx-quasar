(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/parser/base#parse-error::t
    (make-struct-type
     'std/parser/base#parse-error::t
     error::t
     '0
     'parse-error
     '()
     '#f
     '()))
  (define std/parser/base#parse-error?
    (make-struct-predicate std/parser/base#parse-error::t))
  (define std/parser/base#make-parse-error
    (lambda _$args150445_
      (apply make-struct-instance
             std/parser/base#parse-error::t
             _$args150445_)))
  (define std/parser/base#token::t
    (make-struct-type
     'std/parser/base#token::t
     '#f
     '3
     'token
     '((final: . #t))
     '#f
     '(t e loc)))
  (define std/parser/base#token?
    (make-struct-predicate std/parser/base#token::t))
  (define std/parser/base#make-token
    (lambda _$args150442_
      (apply make-struct-instance std/parser/base#token::t _$args150442_)))
  (define std/parser/base#token-t
    (make-struct-field-accessor std/parser/base#token::t '0))
  (define std/parser/base#token-e
    (make-struct-field-accessor std/parser/base#token::t '1))
  (define std/parser/base#token-loc
    (make-struct-field-accessor std/parser/base#token::t '2))
  (define std/parser/base#token-t-set!
    (make-struct-field-mutator std/parser/base#token::t '0))
  (define std/parser/base#token-e-set!
    (make-struct-field-mutator std/parser/base#token::t '1))
  (define std/parser/base#token-loc-set!
    (make-struct-field-mutator std/parser/base#token::t '2))
  (define std/parser/base#location::t
    (make-struct-type
     'std/parser/base#location::t
     '#f
     '5
     'location
     '((final: . #t))
     '#f
     '(port line col off xoff)))
  (define std/parser/base#location?
    (make-struct-predicate std/parser/base#location::t))
  (define std/parser/base#make-location
    (lambda _$args150439_
      (apply make-struct-instance std/parser/base#location::t _$args150439_)))
  (define std/parser/base#location-port
    (make-struct-field-accessor std/parser/base#location::t '0))
  (define std/parser/base#location-line
    (make-struct-field-accessor std/parser/base#location::t '1))
  (define std/parser/base#location-col
    (make-struct-field-accessor std/parser/base#location::t '2))
  (define std/parser/base#location-off
    (make-struct-field-accessor std/parser/base#location::t '3))
  (define std/parser/base#location-xoff
    (make-struct-field-accessor std/parser/base#location::t '4))
  (define std/parser/base#location-port-set!
    (make-struct-field-mutator std/parser/base#location::t '0))
  (define std/parser/base#location-line-set!
    (make-struct-field-mutator std/parser/base#location::t '1))
  (define std/parser/base#location-col-set!
    (make-struct-field-mutator std/parser/base#location::t '2))
  (define std/parser/base#location-off-set!
    (make-struct-field-mutator std/parser/base#location::t '3))
  (define std/parser/base#location-xoff-set!
    (make-struct-field-mutator std/parser/base#location::t '4))
  (define std/parser/base#wrap-identity
    (lambda (_e150436_ _loc150437_) _e150436_))
  (define std/parser/base#wrap-ast
    (lambda (_e150430_ _loc150431_)
      (if (or (let ()
                (declare (not safe))
                (##structure-instance-of? _e150430_ 'gerbil#AST::t))
              (not _loc150431_))
          _e150430_
          (let ((__tmp279673
                 (std/parser/base#location->source-location _loc150431_)))
            (declare (not safe))
            (##structure AST::t _e150430_ __tmp279673)))))
  (define std/parser/base#unwrap-ast
    (lambda (_e150428_)
      (if (let ()
            (declare (not safe))
            (##structure-instance-of? _e150428_ 'gerbil#AST::t))
          (##structure-ref _e150428_ '1 AST::t '#f)
          _e150428_)))
  (define std/parser/base#token->syntax
    (lambda (_tok150385_)
      (let* ((_tok150386150395_ _tok150385_)
             (_else150388150403_ (lambda () _tok150385_))
             (_K150390150410_
              (lambda (_loc150406_ _e150407_ _t150408_)
                (std/parser/base#wrap-ast
                 (cons _t150408_ (cons _e150407_ '()))
                 _loc150406_))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _tok150386150395_
               'std/parser/base#token::t))
            (let* ((_e150391150413_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _tok150386150395_ '1)))
                   (_t150416_ _e150391150413_)
                   (_e150392150418_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _tok150386150395_ '2)))
                   (_e150421_ _e150392150418_)
                   (_e150393150423_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _tok150386150395_ '3)))
                   (_loc150426_ _e150393150423_))
              (_K150390150410_ _loc150426_ _e150421_ _t150416_))
            (_else150388150403_)))))
  (define std/parser/base#raise-parse-error
    (lambda (_where150380_ _msg150381_ _tok150382_ . _rest150383_)
      (raise (make-struct-instance
              std/parser/base#parse-error::t
              _msg150381_
              (cons _tok150382_ _rest150383_)
              _where150380_))))
  (define std/parser/base#parse-error::display-exception
    (lambda (_self150234_ _port150235_)
      (let* ((_self150236150244_ _self150234_)
             (_E150238150248_
              (lambda () (error '"No clause matching" _self150236150244_)))
             (_K150239150362_
              (lambda (_where150251_ _irritants150252_ _msg150253_)
                (let* ((_irritants150254150265_ _irritants150252_)
                       (_else150256150275_
                        (lambda ()
                          (if _where150251_
                              (displayln
                               '"Parse error at "
                               _where150251_
                               '": "
                               _msg150253_)
                              (displayln '"Parse error: " _msg150253_))
                          (if (null? _irritants150252_)
                              '#!void
                              (begin
                                (display '"--- irritants: ")
                                (for-each
                                 (lambda (_obj150273_)
                                   (write _obj150273_)
                                   (display '" "))
                                 _irritants150252_)))))
                       (_K150258150337_
                        (lambda (_rest150278_ _loc150279_ _e150280_ _t150281_)
                          (call-with-parameters
                           (lambda ()
                             (displayln '"Parse Error")
                             (display '"*** ERROR IN ")
                             (if _loc150279_
                                 (std/parser/base#display-location__%
                                  _loc150279_
                                  _port150235_)
                                 (display '"?"))
                             (newline)
                             (display '"--- Parse error")
                             (if _where150251_
                                 (begin
                                   (display '" at ")
                                   (display _where150251_))
                                 '#!void)
                             (displayln '": " _msg150253_)
                             (display '"... token: (")
                             (display _t150281_)
                             (display '" ")
                             (write _e150280_)
                             (displayln '")")
                             (if (null? _rest150278_)
                                 '#!void
                                 (for-each
                                  (lambda (_e150283150285_)
                                    (let* ((_g150287150297_ _e150283150285_)
                                           (_E150290150301_
                                            (lambda ()
                                              (error '"No clause matching"
                                                     _g150287150297_))))
                                      (let ((_K150292150319_
                                             (lambda (_loc150315_
                                                      _e150316_
                                                      _t150317_)
                                               (display '"... detail: ")
                                               (display '"(")
                                               (display _t150317_)
                                               (display '" ")
                                               (write _e150316_)
                                               (display '")")
                                               (if _loc150315_
                                                   (begin
                                                     (display '" at ")
                                                     (std/parser/base#display-location__0
                                                      _loc150315_))
                                                   '#!void)
                                               (newline)))
                                            (_K150291150307_
                                             (lambda (_obj150305_)
                                               (write _obj150305_)
                                               (newline))))
                                        (if (let ()
                                              (declare (not safe))
                                              (##structure-direct-instance-of?
                                               _g150287150297_
                                               'std/parser/base#token::t))
                                            (let* ((_e150293150322_
                                                    (let ()
                                                      (declare (not safe))
                                                      (##vector-ref
                                                       _g150287150297_
                                                       '1)))
                                                   (_e150294150327_
                                                    (let ()
                                                      (declare (not safe))
                                                      (##vector-ref
                                                       _g150287150297_
                                                       '2)))
                                                   (_e150295150332_
                                                    (let ()
                                                      (declare (not safe))
                                                      (##vector-ref
                                                       _g150287150297_
                                                       '3))))
                                              (let ((_t150325_ _e150293150322_)
                                                    (_e150330_ _e150294150327_)
                                                    (_loc150335_
                                                     _e150295150332_))
                                                (_K150292150319_
                                                 _loc150335_
                                                 _e150330_
                                                 _t150325_)))
                                            (let ((_obj150310_
                                                   _g150287150297_))
                                              (_K150291150307_
                                               _obj150310_))))))
                                  _rest150278_)))
                           current-output-port
                           _port150235_))))
                  (if (let ()
                        (declare (not safe))
                        (##pair? _irritants150254150265_))
                      (let ((_hd150259150340_
                             (let ()
                               (declare (not safe))
                               (##car _irritants150254150265_)))
                            (_tl150260150342_
                             (let ()
                               (declare (not safe))
                               (##cdr _irritants150254150265_))))
                        (if (let ()
                              (declare (not safe))
                              (##structure-direct-instance-of?
                               _hd150259150340_
                               'std/parser/base#token::t))
                            (let* ((_e150261150345_
                                    (let ()
                                      (declare (not safe))
                                      (##vector-ref _hd150259150340_ '1)))
                                   (_t150348_ _e150261150345_)
                                   (_e150262150350_
                                    (let ()
                                      (declare (not safe))
                                      (##vector-ref _hd150259150340_ '2)))
                                   (_e150353_ _e150262150350_)
                                   (_e150263150355_
                                    (let ()
                                      (declare (not safe))
                                      (##vector-ref _hd150259150340_ '3)))
                                   (_loc150358_ _e150263150355_)
                                   (_rest150360_ _tl150260150342_))
                              (_K150258150337_
                               _rest150360_
                               _loc150358_
                               _e150353_
                               _t150348_))
                            (_else150256150275_)))
                      (_else150256150275_))))))
        (if (let ()
              (declare (not safe))
              (##structure-instance-of?
               _self150236150244_
               'std/parser/base#parse-error::t))
            (if (let ((__tmp279674
                       (let ()
                         (declare (not safe))
                         (##vector-length _self150236150244_))))
                  (declare (not safe))
                  (##fx< '3 __tmp279674))
                (let* ((_e150240150365_
                        (let ()
                          (declare (not safe))
                          (##vector-ref _self150236150244_ '1)))
                       (_msg150368_ _e150240150365_)
                       (_e150241150370_
                        (let ()
                          (declare (not safe))
                          (##vector-ref _self150236150244_ '2)))
                       (_irritants150373_ _e150241150370_)
                       (_e150242150375_
                        (let ()
                          (declare (not safe))
                          (##vector-ref _self150236150244_ '3)))
                       (_where150378_ _e150242150375_))
                  (_K150239150362_
                   _where150378_
                   _irritants150373_
                   _msg150368_))
                (_E150238150248_))
            (_E150238150248_)))))
  (bind-method!
   std/parser/base#parse-error::t
   'display-exception
   std/parser/base#parse-error::display-exception
   '#f)
  (define std/parser/base#location->source-location
    (lambda (_loc150061_)
      (let* ((_loc150062150071_ _loc150061_)
             (_E150064150075_
              (lambda () (error '"No clause matching" _loc150062150071_)))
             (_K150065150088_
              (lambda (_off150078_ _col150079_ _line150080_ _port150081_)
                (let* ((_container150083_
                        (let ((__tmp279675
                               (let ()
                                 (declare (not safe))
                                 (##port-name _port150081_))))
                          (declare (not safe))
                          (##port-name->container __tmp279675)))
                       (_filepos150085_
                        (let ()
                          (declare (not safe))
                          (##make-filepos
                           _line150080_
                           _col150079_
                           _off150078_))))
                  (let ()
                    (declare (not safe))
                    (##make-locat _container150083_ _filepos150085_))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _loc150062150071_
               'std/parser/base#location::t))
            (let* ((_e150066150091_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150062150071_ '1)))
                   (_port150094_ _e150066150091_)
                   (_e150067150096_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150062150071_ '2)))
                   (_line150099_ _e150067150096_)
                   (_e150068150101_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150062150071_ '3)))
                   (_col150104_ _e150068150101_)
                   (_e150069150106_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150062150071_ '4)))
                   (_off150109_ _e150069150106_))
              (_K150065150088_
               _off150109_
               _col150104_
               _line150099_
               _port150094_))
            (_E150064150075_)))))
  (define std/parser/base#display-location__%
    (lambda (_loc150048_ _port150049_)
      (let ((__tmp279676
             (std/parser/base#location->source-location _loc150048_)))
        (declare (not safe))
        (##display-locat __tmp279676 '#t _port150049_))))
  (define std/parser/base#display-location__0
    (lambda (_loc150054_)
      (let ((_port150056_ (current-output-port)))
        (std/parser/base#display-location__% _loc150054_ _port150056_))))
  (define std/parser/base#display-location
    (lambda _g279678_
      (let ((_g279677_ (let () (declare (not safe)) (##length _g279678_))))
        (cond ((let () (declare (not safe)) (##fx= _g279677_ 1))
               (apply std/parser/base#display-location__0 _g279678_))
              ((let () (declare (not safe)) (##fx= _g279677_ 2))
               (apply std/parser/base#display-location__% _g279678_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/parser/base#display-location
                _g279678_))))))
  (define std/parser/base#location-delta
    (lambda (_start149968_ _end149969_)
      (let ((_start149970149986_ _start149968_)
            (_end149971149988_ _end149969_))
        (let* ((_E149973149992_
                (lambda ()
                  (error '"No clause matching"
                         _start149970149986_
                         _end149971149988_)))
               (_K149974150002_
                (lambda (_xoff149995_
                         _col149996_
                         _line149997_
                         _port149998_
                         _exoff149999_
                         _eoff150000_)
                  (let ((__tmp279679
                         (let ((__tmp279680
                                (let ()
                                  (declare (not safe))
                                  (##fx- _exoff149999_ _xoff149995_))))
                           (declare (not safe))
                           (##fx+ __tmp279680 _eoff150000_))))
                    (declare (not safe))
                    (##structure
                     std/parser/base#location::t
                     _port149998_
                     _line149997_
                     _col149996_
                     __tmp279679
                     _xoff149995_)))))
          (if (let ()
                (declare (not safe))
                (##structure-direct-instance-of?
                 _start149970149986_
                 'std/parser/base#location::t))
              (let* ((_e149980150005_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149970149986_ '1)))
                     (_port150008_ _e149980150005_)
                     (_e149981150010_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149970149986_ '2)))
                     (_line150013_ _e149981150010_)
                     (_e149982150015_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149970149986_ '3)))
                     (_col150018_ _e149982150015_)
                     (_e149983150020_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149970149986_ '4)))
                     (_e149984150023_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149970149986_ '5)))
                     (_xoff150026_ _e149984150023_))
                (if (let ()
                      (declare (not safe))
                      (##structure-direct-instance-of?
                       _end149971149988_
                       'std/parser/base#location::t))
                    (let* ((_e149975150028_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149971149988_ '1)))
                           (_e149976150031_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149971149988_ '2)))
                           (_e149977150034_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149971149988_ '3)))
                           (_e149978150037_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149971149988_ '4)))
                           (_eoff150040_ _e149978150037_)
                           (_e149979150042_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149971149988_ '5)))
                           (_exoff150045_ _e149979150042_))
                      (_K149974150002_
                       _xoff150026_
                       _col150018_
                       _line150013_
                       _port150008_
                       _exoff150045_
                       _eoff150040_))
                    (_E149973149992_)))
              (_E149973149992_))))))
  (define std/parser/base#location-delta*
    (lambda (_start149892_ _end149893_)
      (let ((_start149894149910_ _start149892_)
            (_end149895149912_ _end149893_))
        (let* ((_E149897149916_
                (lambda ()
                  (error '"No clause matching"
                         _start149894149910_
                         _end149895149912_)))
               (_K149898149925_
                (lambda (_xoff149919_
                         _col149920_
                         _line149921_
                         _port149922_
                         _exoff149923_)
                  (let ((__tmp279681
                         (let ()
                           (declare (not safe))
                           (##fx- _exoff149923_ _xoff149919_))))
                    (declare (not safe))
                    (##structure
                     std/parser/base#location::t
                     _port149922_
                     _line149921_
                     _col149920_
                     __tmp279681
                     _xoff149919_)))))
          (if (let ()
                (declare (not safe))
                (##structure-direct-instance-of?
                 _start149894149910_
                 'std/parser/base#location::t))
              (let* ((_e149904149928_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149894149910_ '1)))
                     (_port149931_ _e149904149928_)
                     (_e149905149933_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149894149910_ '2)))
                     (_line149936_ _e149905149933_)
                     (_e149906149938_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149894149910_ '3)))
                     (_col149941_ _e149906149938_)
                     (_e149907149943_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149894149910_ '4)))
                     (_e149908149946_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _start149894149910_ '5)))
                     (_xoff149949_ _e149908149946_))
                (if (let ()
                      (declare (not safe))
                      (##structure-direct-instance-of?
                       _end149895149912_
                       'std/parser/base#location::t))
                    (let* ((_e149899149951_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149895149912_ '1)))
                           (_e149900149954_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149895149912_ '2)))
                           (_e149901149957_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149895149912_ '3)))
                           (_e149902149960_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149895149912_ '4)))
                           (_e149903149963_
                            (let ()
                              (declare (not safe))
                              (##vector-ref _end149895149912_ '5)))
                           (_exoff149966_ _e149903149963_))
                      (_K149898149925_
                       _xoff149949_
                       _col149941_
                       _line149936_
                       _port149931_
                       _exoff149966_))
                    (_E149897149916_)))
              (_E149897149916_)))))))
