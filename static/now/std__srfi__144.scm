(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/144#srfi:flmax__0 (lambda () '-inf.0))
  (define std/srfi/144#srfi:flmax
    (lambda _g279242_
      (let ((_g279241_ (let () (declare (not safe)) (##length _g279242_))))
        (cond ((let () (declare (not safe)) (##fx= _g279241_ 0))
               (apply std/srfi/144#srfi:flmax__0 _g279242_))
              (#t (apply flmax _g279242_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/144#srfi:flmax
                _g279242_))))))
  (define std/srfi/144#srfi:flmin__0 (lambda () '+inf.0))
  (define std/srfi/144#srfi:flmin
    (lambda _g279244_
      (let ((_g279243_ (let () (declare (not safe)) (##length _g279244_))))
        (cond ((let () (declare (not safe)) (##fx= _g279243_ 0))
               (apply std/srfi/144#srfi:flmin__0 _g279244_))
              (#t (apply flmin _g279244_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/144#srfi:flmin
                _g279244_))))))
  (define std/srfi/144#c-functions-are-available '#f)
  (define std/srfi/144#fl-fast-fl+* '#f)
  (define std/srfi/144#fma
    (lambda (_x103583_ _y103584_ _z103585_) (error '"fma not defined")))
  (define std/srfi/144#jn
    (lambda (_n103580_ _x103581_) (error '"jn not defined")))
  (define std/srfi/144#yn
    (lambda (_n103577_ _x103578_) (error '"yn not defined")))
  (define std/srfi/144#fl-e '2.718281828459045)
  (define std/srfi/144#fl-1/e '.36787944117144233)
  (define std/srfi/144#fl-e-2 '7.38905609893065)
  (define std/srfi/144#fl-e-pi/4 '2.1932800507380152)
  (define std/srfi/144#fl-log2-e '1.4426950408889634)
  (define std/srfi/144#fl-log10-e '.4342944819032518)
  (define std/srfi/144#fl-log-2 '.6931471805599453)
  (define std/srfi/144#fl-1/log-2 '1.4426950408889634)
  (define std/srfi/144#fl-log-3 '1.0986122886681098)
  (define std/srfi/144#fl-log-pi '1.1447298858494002)
  (define std/srfi/144#fl-log-10 '2.302585092994046)
  (define std/srfi/144#fl-1/log-10 '.4342944819032518)
  (define std/srfi/144#fl-pi '3.141592653589793)
  (define std/srfi/144#fl-1/pi '.3183098861837907)
  (define std/srfi/144#fl-2pi '6.283185307179586)
  (define std/srfi/144#fl-pi/2 '1.5707963267948966)
  (define std/srfi/144#fl-2/pi '.6366197723675814)
  (define std/srfi/144#fl-pi/4 '.7853981633974483)
  (define std/srfi/144#fl-2/sqrt-pi '1.1283791670955126)
  (define std/srfi/144#fl-sqrt-pi '1.772453850905516)
  (define std/srfi/144#fl-pi-squared '9.869604401089358)
  (define std/srfi/144#fl-degree '.017453292519943295)
  (define std/srfi/144#fl-gamma-1/2 '1.772453850905516)
  (define std/srfi/144#fl-gamma-1/3 '2.6789385347077475)
  (define std/srfi/144#fl-gamma-2/3 '1.3541179394264005)
  (define std/srfi/144#fl-sqrt-2 '1.4142135623730951)
  (define std/srfi/144#fl-sqrt-3 '1.7320508075688772)
  (define std/srfi/144#fl-sqrt-5 '2.23606797749979)
  (define std/srfi/144#fl-sqrt-10 '3.1622776601683795)
  (define std/srfi/144#fl-cbrt-2 '1.2599210498948732)
  (define std/srfi/144#fl-cbrt-3 '1.4422495703074083)
  (define std/srfi/144#fl-4thrt-2 '1.189207115002721)
  (define std/srfi/144#fl-1/sqrt-2 '.7071067811865476)
  (define std/srfi/144#fl-phi '1.618033988749895)
  (define std/srfi/144#fl-log-phi '.48121182505960347)
  (define std/srfi/144#fl-1/log-phi '2.0780869212350277)
  (define std/srfi/144#fl-euler '.5772156649015329)
  (define std/srfi/144#fl-e-euler '1.781072417990198)
  (define std/srfi/144#fl-sin-1 '.8414709848078965)
  (define std/srfi/144#fl-cos-1 '.5403023058681398)
  (define std/srfi/144#FIXME 'FIXME)
  (define std/srfi/144#precision-bits
    (let _loop103572_ ((_bits103574_ '0) (_x103575_ '1.))
      (if (= _x103575_ (+ _x103575_ '1.))
          _bits103574_
          (_loop103572_ (+ _bits103574_ '1) (* '2. _x103575_)))))
  (define std/srfi/144#check-flonum!
    (lambda (_name103569_ _x103570_)
      (if (not (flonum? _x103570_))
          (error (string-append
                  '"non-flonum argument passed to "
                  (symbol->string _name103569_))
                 _x103570_)
          '#!void)))
  (define std/srfi/144#flop1
    (lambda (_name103562_ _op103563_)
      (lambda (_x103565_)
        (std/srfi/144#check-flonum! _name103562_ _x103565_)
        (let ((_result103567_ (_op103563_ _x103565_)))
          (if (not (flonum? _result103567_))
              (error (string-append
                      '"non-flonum result from "
                      (symbol->string _name103562_))
                     _result103567_)
              '#!void)
          _result103567_))))
  (define std/srfi/144#flop2
    (lambda (_name103554_ _op103555_)
      (lambda (_x103557_ _y103558_)
        (std/srfi/144#check-flonum! _name103554_ _x103557_)
        (std/srfi/144#check-flonum! _name103554_ _y103558_)
        (let ((_result103560_ (_op103555_ _x103557_ _y103558_)))
          (if (not (flonum? _result103560_))
              (error (string-append
                      '"non-flonum result from "
                      (symbol->string _name103554_))
                     _result103560_)
              '#!void)
          _result103560_))))
  (define std/srfi/144#flop3
    (lambda (_name103545_ _op103546_)
      (lambda (_x103548_ _y103549_ _z103550_)
        (std/srfi/144#check-flonum! _name103545_ _x103548_)
        (std/srfi/144#check-flonum! _name103545_ _y103549_)
        (std/srfi/144#check-flonum! _name103545_ _z103550_)
        (let ((_result103552_ (_op103546_ _x103548_ _y103549_ _z103550_)))
          (if (not (flonum? _result103552_))
              (error (string-append
                      '"non-flonum result from "
                      (symbol->string _name103545_))
                     _result103552_)
              '#!void)
          _result103552_))))
  (define std/srfi/144#polynomial-at
    (lambda (_x103542_ _coefs103543_)
      (if (null? _coefs103543_)
          '0.
          (fl+ (car _coefs103543_)
               (fl* _x103542_
                    (std/srfi/144#polynomial-at
                     _x103542_
                     (cdr _coefs103543_)))))))
  (define std/srfi/144#definite-integral
    (lambda (_lower103517_ _upper103518_ _f103519_ . _rest103520_)
      (let* ((_range103522_ (fl- _upper103518_ _lower103517_))
             (_kmax103527_
              (if (or (null? _rest103520_)
                      (not (and (exact-integer? (car _rest103520_))
                                (even? (car _rest103520_))
                                (positive? (car _rest103520_)))))
                  '1024
                  (car _rest103520_)))
             (_n2103529_ (inexact _kmax103527_))
             (_h103531_ (fl/ _range103522_ _n2103529_)))
        (letrec ((_loop103534_
                  (lambda (_k103536_ _n103537_ _sum103538_)
                    (if (= _k103536_ '0)
                        (_loop103534_ '1 '1. (_f103519_ _lower103517_))
                        (if (= _k103536_ _kmax103527_)
                            (fl+ _sum103538_ (_f103519_ _upper103518_))
                            (let ((_fn103540_
                                   (_f103519_
                                    (+ _lower103517_
                                       (fl/ (fl* _n103537_ _range103522_)
                                            _n2103529_)))))
                              (_loop103534_
                               (+ _k103536_ '1)
                               (fl+ _n103537_ '1.)
                               (fl+ _sum103538_
                                    (fl* (if (even? _k103536_) '2. '4.)
                                         _fn103540_)))))))))
          (fl/ (fl* _h103531_ (_loop103534_ '0 '0. '0.)) '3.)))))
  (define std/srfi/144#interpolate
    (lambda (_x103509_ _x0103510_ _x1103511_ _f0103512_ _f1103513_)
      (let ((_delta103515_ (fl- _x1103511_ _x0103510_)))
        (fl+ (fl* (fl/ (fl- _x1103511_ _x103509_) _delta103515_) _f0103512_)
             (fl* (fl/ (fl- _x103509_ _x0103510_) _delta103515_)
                  _f1103513_)))))
  (define std/srfi/144#iota
    (lambda (_n103501_)
      (let _$loop103503_ ((_n103506_ (- _n103501_ '1)) (_x103507_ '()))
        (if (< _n103506_ '0)
            _x103507_
            (_$loop103503_ (- _n103506_ '1) (cons _n103506_ _x103507_))))))
  (define std/srfi/144#fact
    (lambda (_x103499_)
      (if (zero? _x103499_)
          '1
          (* _x103499_ (std/srfi/144#fact (- _x103499_ '1))))))
  (define std/srfi/144#factorial
    (lambda (_x103497_)
      (if (flzero? _x103497_)
          '1.
          (fl* _x103497_ (std/srfi/144#factorial (fl- _x103497_ '1.))))))
  (define std/srfi/144#fl-greatest
    (let _loop103493_ ((_x103495_
                        (- (expt '2. std/srfi/144#precision-bits) '1.)))
      (if (finite? (* '2. _x103495_))
          (_loop103493_ (* '2. _x103495_))
          _x103495_)))
  (define std/srfi/144#fl-least
    (let _loop103489_ ((_x103491_ '1.))
      (if (> (/ _x103491_ '2.) '0.)
          (_loop103489_ (/ _x103491_ '2.))
          _x103491_)))
  (define std/srfi/144#fl-epsilon
    (let _loop103485_ ((_eps103487_ '1.))
      (if (= '1. (+ '1. _eps103487_))
          (* '2. _eps103487_)
          (_loop103485_ (/ _eps103487_ '2.)))))
  (define std/srfi/144#fl-integer-exponent-zero
    (exact (- (log std/srfi/144#fl-least '2.) '1.)))
  (define std/srfi/144#fl-integer-exponent-nan
    (- std/srfi/144#fl-integer-exponent-zero '1))
  (define std/srfi/144#flonum
    (lambda (_x103483_) (if (real? _x103483_) (inexact _x103483_) '+nan.0)))
  (define std/srfi/144#fladjacent
    (std/srfi/144#flop2
     'fladjacent
     (lambda (_x103465_ _y103466_)
       (letrec ((_loop103468_
                 (lambda (_y103478_)
                   (let ((_y3103480_
                          (fl+ (fl* '.999755859375 _x103465_)
                               (fl* '2.44140625e-4 _y103478_))))
                     (if (fl< _x103465_ _y3103480_ _y103478_)
                         (_loop103468_ _y3103480_)
                         (if (fl< _y103478_ _y3103480_ _x103465_)
                             (_loop103468_ _y3103480_)
                             (_loop2103469_ _y103478_))))))
                (_loop2103469_
                 (lambda (_y103471_)
                   (let* ((_y2103473_ (fl/ (fl+ _x103465_ _y103471_) '2.))
                          (_y2103475_
                           (if (flinfinite? _y2103473_)
                               (fl+ (fl* '.5 _x103465_) (fl* '.5 _y103471_))
                               _y2103473_)))
                     (if (fl= _x103465_ _y2103475_)
                         _y103471_
                         (if (fl= _y103471_ _y2103475_)
                             _y103471_
                             (_loop2103469_ _y2103475_)))))))
         (if (flinfinite? _x103465_)
             (if (fl< _x103465_ _y103466_)
                 (fl- std/srfi/144#fl-greatest)
                 (if (fl> _x103465_ _y103466_)
                     std/srfi/144#fl-greatest
                     _x103465_))
             (if (fl= _x103465_ _y103466_)
                 _x103465_
                 (if (flzero? _x103465_)
                     (if (flpositive? _y103466_)
                         std/srfi/144#fl-least
                         (fl- std/srfi/144#fl-least))
                     (if (fl< _x103465_ _y103466_)
                         (_loop103468_
                          (flmin _y103466_
                                 std/srfi/144#fl-greatest
                                 (flmax (* '2. _x103465_) (* '.5 _x103465_))))
                         (if (fl> _x103465_ _y103466_)
                             (_loop103468_
                              (flmax _y103466_
                                     (fl- std/srfi/144#fl-greatest)
                                     (flmin (* '2. _x103465_)
                                            (* '.5 _x103465_))))
                             _x103465_)))))))))
  (define std/srfi/144#flcopysign
    (std/srfi/144#flop2
     'flcopysign
     (lambda (_x103462_ _y103463_)
       (if (= (std/srfi/144#flsign-bit _x103462_)
              (std/srfi/144#flsign-bit _y103463_))
           _x103462_
           (fl- _x103462_)))))
  (define std/srfi/144#make-flonum
    (lambda (_x103454_ _n103455_)
      (let ((_y103457_ (expt '2. _n103455_)))
        (if (or (not (flonum? _x103454_)) (not (exact-integer? _n103455_)))
            (error '"bad arguments to make-flonum" _x103454_ _n103455_)
            (if (finite? _y103457_)
                (* _x103454_ _y103457_)
                (inexact (* (exact _x103454_) (expt '2 _n103455_))))))))
  (define std/srfi/144#flinteger-fraction
    (lambda (_x103447_)
      (std/srfi/144#check-flonum! 'flinteger-fraction _x103447_)
      (let* ((_result1103449_ (fltruncate _x103447_))
             (_result2103451_ (fl- _x103447_ _result1103449_)))
        (values _result1103449_ _result2103451_))))
  (define std/srfi/144#flexponent
    (lambda (_x103445_) (floor (std/srfi/144#fllog2 (flabs _x103445_)))))
  (define std/srfi/144#flinteger-exponent
    (lambda (_x103443_) (exact (std/srfi/144#flexponent _x103443_))))
  (define std/srfi/144#flnormalized-fraction-exponent
    (lambda (_x103412_)
      (letrec ((_return103414_
                (lambda (_result1103440_ _result2103441_)
                  (if (fl< _result1103440_ '.5)
                      (values (fl* '2. _result1103440_) (- _result2103441_ '1))
                      (if (fl>= _result1103440_ '1.)
                          (values (fl* '.5 _result1103440_)
                                  (+ _result2103441_ '1))
                          (values _result1103440_ _result2103441_))))))
        (std/srfi/144#check-flonum! 'flnormalized-fraction-exponent _x103412_)
        (if (flnan? _x103412_)
            (values _x103412_ '0)
            (if (fl< _x103412_ '0.)
                (call-with-values
                 (lambda ()
                   (std/srfi/144#flnormalized-fraction-exponent
                    (fl- _x103412_)))
                 (lambda (_y103417_ _n103418_)
                   (values (fl- _y103417_) _n103418_)))
                (if (fl= _x103412_ '0.)
                    (values '0. '0)
                    (if (flinfinite? _x103412_)
                        (values '.5
                                (+ '3
                                   (exact (round (std/srfi/144#fllog2
                                                  std/srfi/144#fl-greatest)))))
                        (if (std/srfi/144#flnormalized? _x103412_)
                            (let* ((_result2103420_
                                    (exact (flround (std/srfi/144#fllog2
                                                     _x103412_))))
                                   (_result2103422_
                                    (if (integer? _result2103420_)
                                        _result2103420_
                                        (round _result2103420_)))
                                   (_two^result2103424_
                                    (inexact (expt '2. _result2103422_))))
                              (if (flinfinite? _two^result2103424_)
                                  (call-with-values
                                   (lambda ()
                                     (std/srfi/144#flnormalized-fraction-exponent
                                      (fl/ _x103412_ '4.)))
                                   (lambda (_y103428_ _n103429_)
                                     (values _y103428_ (+ _n103429_ '2))))
                                  (_return103414_
                                   (fl/ _x103412_ _two^result2103424_)
                                   _result2103422_)))
                            (let* ((_k103431_
                                    (+ '2 std/srfi/144#precision-bits))
                                   (_two^k103433_ (expt '2 _k103431_)))
                              (call-with-values
                               (lambda ()
                                 (std/srfi/144#flnormalized-fraction-exponent
                                  (fl* _x103412_ (inexact _two^k103433_))))
                               (lambda (_y103437_ _n103438_)
                                 (_return103414_
                                  _y103437_
                                  (- _n103438_ _k103431_)))))))))))))
  (define std/srfi/144#flsign-bit
    (lambda (_x103410_)
      (std/srfi/144#check-flonum! 'flsign-bit _x103410_)
      (if (fl< _x103410_ '0.) '1 (if (eqv? _x103410_ '-0.) '1 '0))))
  (define std/srfi/144#flunordered?
    (lambda (_x103404_ _y103405_)
      (let ((_$e103407_ (flnan? _x103404_)))
        (if _$e103407_ _$e103407_ (flnan? _y103405_)))))
  (define std/srfi/144#flnormalized?
    (lambda (_x103400_)
      (std/srfi/144#check-flonum! 'flnormalized? _x103400_)
      (let ((_x103402_ (flabs _x103400_)))
        (if (flfinite? _x103402_)
            (fl< (fl/ std/srfi/144#fl-greatest) _x103402_)
            '#f))))
  (define std/srfi/144#fldenormalized?
    (lambda (_x103396_)
      (std/srfi/144#check-flonum! 'fldenormalized? _x103396_)
      (let ((_x103398_ (flabs _x103396_)))
        (if (flfinite? _x103398_)
            (if (fl< '0. _x103398_)
                (fl<= _x103398_ (fl/ std/srfi/144#fl-greatest))
                '#f)
            '#f))))
  (define std/srfi/144#fl+*
    (std/srfi/144#flop3
     'fl+*
     (lambda (_x103388_ _y103389_ _z103390_)
       (if std/srfi/144#c-functions-are-available
           (std/srfi/144#fma _x103388_ _y103389_ _z103390_)
           (if (and (flfinite? _x103388_) (flfinite? _y103389_))
               (if (flfinite? _z103390_)
                   (let ((_x103392_ (exact _x103388_))
                         (_y103393_ (exact _y103389_))
                         (_z103394_ (exact _z103390_)))
                     (std/srfi/144#flonum
                      (+ (* _x103392_ _y103393_) _z103394_)))
                   _z103390_)
               (fl+ (fl* _x103388_ _y103389_) _z103390_))))))
  (define std/srfi/144#flabsdiff
    (lambda (_x103385_ _y103386_) (flabs (fl- _x103385_ _y103386_))))
  (define std/srfi/144#flposdiff
    (lambda (_x103380_ _y103381_)
      (let ((_diff103383_ (fl- _x103380_ _y103381_)))
        (if (flnegative? _diff103383_) '0. _diff103383_))))
  (define std/srfi/144#flsgn
    (lambda (_x103378_) (std/srfi/144#flcopysign '1. _x103378_)))
  (define std/srfi/144#flnumerator
    (std/srfi/144#flop1
     'flnumerator
     (lambda (_x103376_)
       (if (flnan? _x103376_)
           _x103376_
           (std/srfi/144#flnumerator _x103376_)))))
  (define std/srfi/144#fldenominator
    (std/srfi/144#flop1
     'fldenominator
     (lambda (_x103374_)
       (if (flnan? _x103374_)
           _x103374_
           (std/srfi/144#fldenominator _x103374_)))))
  (define std/srfi/144#flexp2
    (std/srfi/144#flop1 'flexp2 (lambda (_x103372_) (flexpt '2. _x103372_))))
  (define std/srfi/144#flexp-1
    (std/srfi/144#flop1
     'flexp-1
     (let ((_coefs103368_
            (cons '0.
                  (map fl/
                       (map std/srfi/144#factorial
                            '(1.
                              2.
                              3.
                              4.
                              5.
                              6.
                              7.
                              8.
                              9.
                              10.
                              11.
                              12.
                              13.
                              14.
                              15.))))))
       (lambda (_x103370_)
         (if (fl< (flabs _x103370_) '.5)
             (std/srfi/144#polynomial-at _x103370_ _coefs103368_)
             (fl- (flexp _x103370_) '1.))))))
  (define std/srfi/144#flsquare
    (std/srfi/144#flop1
     'flsquare
     (lambda (_x103366_) (fl* _x103366_ _x103366_))))
  (define std/srfi/144#flcbrt
    (std/srfi/144#flop1
     'flcbrt
     (lambda (_x103364_)
       (if (flnegative? _x103364_)
           (fl- (std/srfi/144#flcbrt (fl- _x103364_)))
           (flexpt _x103364_ (fl/ '3.))))))
  (define std/srfi/144#flhypot
    (std/srfi/144#flop2
     'flhypot
     (lambda (_x103353_ _y103354_)
       (if (flzero? _x103353_)
           (flabs _y103354_)
           (if (flzero? _y103354_)
               (flabs _x103353_)
               (if (or (flinfinite? _x103353_) (flinfinite? _y103354_))
                   '+inf.0
                   (if (flnan? _x103353_)
                       _x103353_
                       (if (flnan? _y103354_)
                           _y103354_
                           (if (fl> _y103354_ _x103353_)
                               (std/srfi/144#flhypot _y103354_ _x103353_)
                               (let* ((_y/x103359_ (fl/ _y103354_ _x103353_))
                                      (_root103361_
                                       (flsqrt (fl+ '1.
                                                    (fl* _y/x103359_
                                                         _y/x103359_)))))
                                 (fl* (flabs _x103353_) _root103361_)))))))))))
  (define std/srfi/144#fllog1+
    (std/srfi/144#flop1
     'fllog1+
     (lambda (_x103349_)
       (let ((_u103351_ (fl+ '1. _x103349_)))
         (if (fl= _u103351_ '1.)
             _x103349_
             (if (fl= _u103351_ _x103349_)
                 (fllog _u103351_)
                 (fl* (fllog _u103351_)
                      (fl/ _x103349_ (fl- _u103351_ '1.)))))))))
  (define std/srfi/144#fllog2
    (std/srfi/144#flop1 'fllog2 (lambda (_x103347_) (log _x103347_ '2.))))
  (define std/srfi/144#fllog10
    (std/srfi/144#flop1 'fllog10 (lambda (_x103345_) (log _x103345_ '10.))))
  (define std/srfi/144#make-fllog-base
    (lambda (_base103341_)
      (std/srfi/144#check-flonum! 'make-fllog-base _base103341_)
      (if (fl> _base103341_ '1.)
          (std/srfi/144#flop1
           'procedure-created-by-make-fllog-base
           (lambda (_x103343_) (log _x103343_ _base103341_)))
          (error '"argument to make-fllog-base must be greater than 1.0"
                 _base103341_))))
  (define std/srfi/144#flsinh
    (std/srfi/144#flop1
     'flsinh
     (lambda (_x103339_)
       (if (not (flfinite? _x103339_))
           _x103339_
           (if (fl< (flabs _x103339_) '.75)
               (fl/ (fl- (std/srfi/144#flexp-1 _x103339_)
                         (std/srfi/144#flexp-1 (fl- _x103339_)))
                    '2.)
               (fl/ (fl- (flexp _x103339_) (flexp (fl- _x103339_))) '2.))))))
  (define std/srfi/144#flcosh
    (std/srfi/144#flop1
     'flcosh
     (lambda (_x103337_)
       (if (not (flfinite? _x103337_))
           (flabs _x103337_)
           (if (fl< (flabs _x103337_) '.75)
               (fl+ '1.
                    (fl/ (fl+ (std/srfi/144#flexp-1 _x103337_)
                              (std/srfi/144#flexp-1 (fl- _x103337_)))
                         '2.))
               (fl/ (fl+ (flexp _x103337_) (flexp (fl- _x103337_))) '2.))))))
  (define std/srfi/144#fltanh
    (std/srfi/144#flop1
     'fltanh
     (lambda (_x103332_)
       (if (flinfinite? _x103332_)
           (std/srfi/144#flcopysign '1. _x103332_)
           (if (flnan? _x103332_)
               _x103332_
               (let ((_a103334_ (std/srfi/144#flsinh _x103332_))
                     (_b103335_ (std/srfi/144#flcosh _x103332_)))
                 (if (fl= _a103334_ _b103335_)
                     '1.
                     (if (fl= _a103334_ (fl- _b103335_))
                         '-1.
                         (fl/ (std/srfi/144#flsinh _x103332_)
                              (std/srfi/144#flcosh _x103332_))))))))))
  (define std/srfi/144#flasinh
    (std/srfi/144#flop1
     'flasinh
     (lambda (_x103316_)
       (letrec ((_eqn4.6.31103318_
                 (lambda (_x^2103327_ _c103328_ _k103329_ _k0103330_)
                   (if (> _k103329_ '45)
                       _c103328_
                       (fl+ _c103328_
                            (fl* _x^2103327_
                                 (_eqn4.6.31103318_
                                  _x^2103327_
                                  (fl- (fl/ (fl* _c103328_
                                                 _k0103330_
                                                 _k0103330_)
                                            (fl* (fl+ _k0103330_ '1.)
                                                 (fl+ _k0103330_ '2.))))
                                  (+ _k103329_ '2)
                                  (fl+ _k0103330_ '2.))))))))
         (if (flzero? _x103316_)
             _x103316_
             (if (not (flfinite? _x103316_))
                 _x103316_
                 (if (fl< _x103316_ '0.)
                     (fl- (std/srfi/144#flasinh (fl- _x103316_)))
                     (if (fl< _x103316_ '.5)
                         (fl* _x103316_
                              (_eqn4.6.31103318_
                               (fl* _x103316_ _x103316_)
                               '1.
                               '1
                               '1.))
                         (let* ((_x^2+1103320_
                                 (fl+ (fl* _x103316_ _x103316_) '1.))
                                (_root103322_
                                 (if (flfinite? _x^2+1103320_)
                                     (flsqrt _x^2+1103320_)
                                     _x103316_))
                                (_a103324_ (fl+ _x103316_ _root103322_)))
                           (if (flfinite? _a103324_)
                               (fllog _a103324_)
                               (fl+ std/srfi/144#fl-log-2
                                    (fllog _x103316_))))))))))))
  (define std/srfi/144#flacosh
    (std/srfi/144#flop1
     'flacosh
     (lambda (_x103307_)
       (if (fl<= _x103307_ '.5)
           '+nan.0
           (let* ((_x^2-1103309_ (fl- (fl* _x103307_ _x103307_) '1.))
                  (_root103311_
                   (if (flfinite? _x^2-1103309_)
                       (flsqrt _x^2-1103309_)
                       _x103307_))
                  (_a103313_ (fl+ _x103307_ _root103311_)))
             (if (flfinite? _a103313_)
                 (fllog _a103313_)
                 (fl+ std/srfi/144#fl-log-2 (fllog _x103307_))))))))
  (define std/srfi/144#flatanh
    (std/srfi/144#flop1
     'flatanh
     (lambda (_x103299_)
       (letrec ((_eqn4.6.33103301_
                 (lambda (_x^2103303_ _k103304_ _k0103305_)
                   (if (> _k103304_ '50)
                       (fl/ _k0103305_)
                       (fl+ (fl/ _k0103305_)
                            (fl* _x^2103303_
                                 (_eqn4.6.33103301_
                                  _x^2103303_
                                  (+ _k103304_ '2)
                                  (+ _k0103305_ '2.))))))))
         (if (flzero? _x103299_)
             _x103299_
             (if (not (flfinite? _x103299_))
                 _x103299_
                 (if (fl< _x103299_ '0.)
                     (fl- (std/srfi/144#flatanh (fl- _x103299_)))
                     (if (fl< _x103299_ '.5)
                         (fl* _x103299_
                              (_eqn4.6.33103301_
                               (fl* _x103299_ _x103299_)
                               '1
                               '1.))
                         (fl* '.5
                              (fllog (fl/ (fl+ '1. _x103299_)
                                          (fl- '1. _x103299_))))))))))))
  (define std/srfi/144#flquotient
    (std/srfi/144#flop2
     'flquotient
     (lambda (_x103296_ _y103297_) (fltruncate (fl/ _x103296_ _y103297_)))))
  (define std/srfi/144#flremainder
    (std/srfi/144#flop2
     'flremainder
     (lambda (_x103293_ _y103294_)
       (fl- _x103293_
            (fl* _y103294_ (std/srfi/144#flquotient _x103293_ _y103294_))))))
  (define std/srfi/144#flremquo
    (lambda (_x103285_ _y103286_)
      (std/srfi/144#check-flonum! 'flremquo _x103285_)
      (std/srfi/144#check-flonum! 'flremquo _y103286_)
      (let* ((_quo103288_ (flround (fl/ _x103285_ _y103286_)))
             (_rem103290_ (fl- _x103285_ (fl* _y103286_ _quo103288_))))
        (values _rem103290_ (exact _quo103288_)))))
  (define std/srfi/144#flgamma
    (lambda (_x103283_)
      (std/srfi/144#check-flonum! 'flgamma _x103283_)
      (if (fl>= _x103283_ std/srfi/144#flgamma:upper-cutoff)
          '+inf.0
          (if (fl<= _x103283_ std/srfi/144#flgamma:lower-cutoff)
              (if (= _x103283_ '-inf.0)
                  '+nan.0
                  (if (flinteger? _x103283_)
                      '+nan.0
                      (if (flodd? (fltruncate _x103283_)) '0. '-0.)))
              (std/srfi/144#Gamma _x103283_)))))
  (define std/srfi/144#Gamma
    (lambda (_x103277_)
      (if (fl> _x103277_ '2.)
          (let ((_x103279_ (fl- _x103277_ '2.)))
            (fl* _x103279_ (fl+ _x103279_ '1.) (std/srfi/144#Gamma _x103279_)))
          (if (fl= _x103277_ '2.)
              '1.
              (if (fl> _x103277_ '1.)
                  (let ((_x103281_ (fl- _x103277_ '1.)))
                    (fl* _x103281_ (std/srfi/144#Gamma _x103281_)))
                  (if (fl= _x103277_ '1.)
                      '1.
                      (if (fl= _x103277_ '0.)
                          '+inf.0
                          (if (fl< _x103277_ '0.)
                              (if (flinteger? _x103277_)
                                  '+nan.0
                                  (fl/ (std/srfi/144#Gamma (fl+ _x103277_ '2.))
                                       _x103277_
                                       (fl+ _x103277_ '1.)))
                              (fl/ (std/srfi/144#polynomial-at
                                    _x103277_
                                    std/srfi/144#gamma-coefs))))))))))
  (define std/srfi/144#gamma-coefs
    '(0.
      1.
      .5772156649015329
      -.6558780715202538
      -.0420026350340952
      .1665386113822915
      -.0421977345555443
      -.009621971527877
      .007218943246663
      -.0011651675918591
      -2.152416741149e-4
      1.280502823882e-4
      -2.01348547807e-5
      -1.2504934821e-6
      1.133027232e-6
      -2.056338417e-7
      6.116095e-9
      5.0020075e-9
      -1.1812746e-9
      1.043427e-10
      7.7823e-12
      -3.6968e-12
      5.1e-13
      -2.06e-14
      -5.4e-15
      1.4e-15
      1e-16))
  (define std/srfi/144#flgamma:upper-cutoff
    (let _$loop103272_ ((_x103275_ '2.))
      (if (flinfinite? (std/srfi/144#Gamma _x103275_))
          _x103275_
          (_$loop103272_ (+ _x103275_ '1.)))))
  (define std/srfi/144#flgamma:lower-cutoff
    (let _$loop103267_ ((_x103270_ '-2.))
      (if (flzero? (std/srfi/144#Gamma
                    (std/srfi/144#fladjacent _x103270_ '0.)))
          _x103270_
          (_$loop103267_ (- _x103270_ '1.)))))
  (define std/srfi/144#flloggamma
    (lambda (_x103261_)
      (std/srfi/144#check-flonum! 'flloggamma _x103261_)
      (if (flinfinite? _x103261_)
          (if (flpositive? _x103261_)
              (values _x103261_ '1.)
              (values '+inf.0 '+nan.0))
          (if (fl>= _x103261_ std/srfi/144#flloggamma:upper-threshold)
              (values (std/srfi/144#eqn6.1.48 _x103261_) '1.)
              (if (fl> _x103261_ '0.)
                  (let ((_g103263_ (std/srfi/144#flgamma _x103261_)))
                    (values (log _g103263_) '1.))
                  (let ((_g103265_ (std/srfi/144#flgamma _x103261_)))
                    (values (log (flabs _g103265_))
                            (std/srfi/144#flcopysign '1. _g103265_))))))))
  (define std/srfi/144#eqn6.1.48
    (lambda (_x103256_)
      (let ((_+103258_ fl+) (_/103259_ fl/))
        (_+103258_
         (fl* (fl- _x103256_ '.5) (fllog _x103256_))
         (fl- _x103256_)
         (fl* '.5 (fllog std/srfi/144#fl-2pi))
         (_/103259_
          '.08333333333333333
          (_+103258_
           _x103256_
           (_/103259_
            '.03333333333333333
            (_+103258_
             _x103256_
             (_/103259_
              '.2523809523809524
              (_+103258_
               _x103256_
               (_/103259_
                '.5256064690026954
                (_+103258_
                 _x103256_
                 (_/103259_
                  '1.0115230681268417
                  (_+103258_
                   _x103256_
                   (_/103259_
                    '1.5174736491532874
                    (_+103258_
                     _x103256_
                     (_/103259_
                      '2.2694889742049598
                      (_+103258_ _x103256_))))))))))))))))))
  (define std/srfi/144#flloggamma:upper-threshold '20.)
  (define std/srfi/144#flfirst-bessel
    (lambda (_n103242_ _x103243_)
      (letrec ((_nan-protected103245_
                (lambda (_y103254_) (if (flfinite? _y103254_) _y103254_ '0.))))
        (std/srfi/144#check-flonum! 'flfirst-bessel _x103243_)
        (if std/srfi/144#c-functions-are-available
            (std/srfi/144#jn _n103242_ _x103243_)
            (if (< _n103242_ '0)
                (let ((_result103247_
                       (std/srfi/144#flfirst-bessel (- _n103242_) _x103243_)))
                  (if (even? _n103242_) _result103247_ (- _result103247_)))
                (if (< _x103243_ '0)
                    (let ((_result103249_
                           (std/srfi/144#flfirst-bessel
                            _n103242_
                            (- _x103243_))))
                      (if (even? _n103242_) _result103249_ (- _result103249_)))
                    (if (= _x103243_ '+inf.0)
                        '0.
                        (let ((_$e103251_ _n103242_))
                          (if (eq? '0 _$e103251_)
                              (if (fl< _x103243_ '4.5)
                                  (std/srfi/144#eqn9.1.10 _n103242_ _x103243_)
                                  (if (fl< _x103243_ '93.)
                                      (std/srfi/144#eqn9.1.18
                                       _n103242_
                                       _x103243_)
                                      (std/srfi/144#eqn9.2.5
                                       _n103242_
                                       _x103243_)))
                              (if (eq? '1 _$e103251_)
                                  (if (fl< _x103243_ '11.)
                                      (std/srfi/144#eqn9.1.10-fast
                                       _n103242_
                                       _x103243_)
                                      (if (fl< _x103243_ '300.)
                                          (std/srfi/144#eqn9.1.75
                                           _n103242_
                                           _x103243_)
                                          (if (fl< _x103243_ '1e12)
                                              (std/srfi/144#eqn9.2.5
                                               _n103242_
                                               _x103243_)
                                              (std/srfi/144#eqn9.2.1
                                               _n103242_
                                               _x103243_))))
                                  (if (eq? '2 _$e103251_)
                                      (if (fl< _x103243_ '10.)
                                          (std/srfi/144#eqn9.1.10-fast
                                           _n103242_
                                           _x103243_)
                                          (if (fl< _x103243_ '1e19)
                                              (std/srfi/144#eqn9.1.27-first-bessel
                                               _n103242_
                                               _x103243_)
                                              '0.))
                                      (if (eq? '3 _$e103251_)
                                          (if (fl< _x103243_ '10.)
                                              (std/srfi/144#eqn9.1.10-fast
                                               _n103242_
                                               _x103243_)
                                              (if (fl< _x103243_ '1000000.)
                                                  (std/srfi/144#eqn9.1.27-first-bessel
                                                   _n103242_
                                                   _x103243_)
                                                  (_nan-protected103245_
                                                   (std/srfi/144#eqn9.2.5
                                                    _n103242_
                                                    _x103243_))))
                                          (if (fl< _x103243_ '12.)
                                              (_nan-protected103245_
                                               (std/srfi/144#eqn9.1.10-fast
                                                _n103242_
                                                _x103243_))
                                              (if (fl< _x103243_ '150.)
                                                  (_nan-protected103245_
                                                   (if (fl> (inexact _n103242_)
                                                            _x103243_)
                                                       (std/srfi/144#method9.12ex1
                                                        _n103242_
                                                        _x103243_)
                                                       (std/srfi/144#eqn9.1.75
                                                        _n103242_
                                                        _x103243_)))
                                                  (if (fl< _x103243_ '1e18)
                                                      (_nan-protected103245_
                                                       (std/srfi/144#eqn9.1.27-first-bessel
                                                        _n103242_
                                                        _x103243_))
                                                      '0.)))))))))))))))
  (define std/srfi/144#flsecond-bessel
    (lambda (_n103229_ _x103230_)
      (std/srfi/144#check-flonum! 'flsecond-bessel _x103230_)
      (if std/srfi/144#c-functions-are-available
          (std/srfi/144#yn _n103229_ _x103230_)
          (if (< _n103229_ '0)
              (let ((_result103232_
                     (std/srfi/144#flsecond-bessel (- _n103229_) _x103230_)))
                (if (even? _n103229_) _result103232_ (- _result103232_)))
              (if (fl< _x103230_ '0.)
                  '+nan.0
                  (if (fl= _x103230_ '0.)
                      '-inf.0
                      (if (fl= _x103230_ '+inf.0)
                          '0.
                          (let ((_$e103234_ _n103229_))
                            (if (eq? '0 _$e103234_)
                                (if (fl< _x103230_ '14.5)
                                    (std/srfi/144#eqn9.1.13 '0 _x103230_)
                                    (std/srfi/144#eqn9.2.6 '0 _x103230_))
                                (if (eq? '1 _$e103234_)
                                    (if (fl< _x103230_ '1e12)
                                        (std/srfi/144#eqn9.1.16
                                         _n103229_
                                         _x103230_)
                                        (std/srfi/144#eqn9.2.6
                                         _n103229_
                                         _x103230_))
                                    (if (or (eq? '2 _$e103234_)
                                            (eq? '3 _$e103234_))
                                        (std/srfi/144#eqn9.1.27-second-bessel
                                         _n103229_
                                         _x103230_)
                                        (let ((_ynx103240_
                                               (std/srfi/144#eqn9.1.27-second-bessel
                                                _n103229_
                                                _x103230_)))
                                          (if (flnan? _ynx103240_)
                                              '-inf.0
                                              _ynx103240_)))))))))))))
  (define std/srfi/144#eqn9.1.10
    (lambda (_n103226_ _x103227_)
      (fl* (inexact (expt (* '.5 _x103227_) _n103226_))
           (std/srfi/144#polynomial-at
            (std/srfi/144#flsquare _x103227_)
            (if (= _n103226_ '0)
                std/srfi/144#eqn9.1.10-coefficients-0
                (if (= _n103226_ '1)
                    std/srfi/144#eqn9.1.10-coefficients-1
                    (std/srfi/144#eqn9.1.10-coefficients _n103226_)))))))
  (define std/srfi/144#eqn9.1.10-coefficients
    (lambda (_n103215_)
      (letrec ((_loop103217_
                (lambda (_k103221_ _prev103222_)
                  (if (flzero? (inexact _prev103222_))
                      '()
                      (let ((_c103224_
                             (/ (* '-1/4 _prev103222_)
                                _k103221_
                                (+ _n103215_ _k103221_))))
                        (cons _c103224_
                              (_loop103217_ (+ _k103221_ '1) _c103224_)))))))
        (let ((_c103219_ (/ (std/srfi/144#fact _n103215_))))
          (map inexact (cons _c103219_ (_loop103217_ '1 _c103219_)))))))
  (define std/srfi/144#eqn9.1.10-coefficients-0
    (std/srfi/144#eqn9.1.10-coefficients '0))
  (define std/srfi/144#eqn9.1.10-coefficients-1
    (std/srfi/144#eqn9.1.10-coefficients '1))
  (define std/srfi/144#eqn9.1.10-fast
    (lambda (_n103200_ _x103201_)
      (let* ((_y103203_ (fl* '.5 _x103201_))
             (_y2103205_ (fl- (fl* _y103203_ _y103203_)))
             (_bound103207_ (+ '25. (inexact _n103200_))))
        (letrec ((_loop103210_
                  (lambda (_k103212_ _n+k103213_)
                    (if (fl> _n+k103213_ _bound103207_)
                        '1.
                        (fl+ '1.
                             (fl* (fl/ _y2103205_ (fl* _k103212_ _n+k103213_))
                                  (_loop103210_
                                   (fl+ '1. _k103212_)
                                   (fl+ '1. _n+k103213_))))))))
          (fl/ (fl* (inexact (expt _y103203_ _n103200_))
                    (_loop103210_ '1. (fl+ '1. (inexact _n103200_))))
               (std/srfi/144#factorial (inexact _n103200_)))))))
  (define std/srfi/144#eqn9.1.13
    (lambda (_n103197_ _x103198_)
      (if (not (= _n103197_ '0)) (error '"eqn9.1.13 requires n=0") '#!void)
      (fl* '2.
           std/srfi/144#fl-1/pi
           (fl+ (fl* (fl+ (fllog (fl/ _x103198_ '2.)) std/srfi/144#fl-euler)
                     (std/srfi/144#flfirst-bessel '0 _x103198_))
                (std/srfi/144#polynomial-at
                 (fl* '.25 _x103198_ _x103198_)
                 std/srfi/144#eqn9.1.13-coefficients)))))
  (define std/srfi/144#eqn9.1.13-coefficients
    (map (lambda (_k103191_)
           (if (= _k103191_ '0)
               '0.
               (if (= _k103191_ '1)
                   '1.
                   (let ((_c103195_
                          (/ (apply +
                                    (map /
                                         (cdr (std/srfi/144#iota
                                               (+ _k103191_ '1)))))
                             (let ((_k!103193_ (std/srfi/144#fact _k103191_)))
                               (* _k!103193_ _k!103193_)))))
                     (inexact (if (even? _k103191_)
                                  (- _c103195_)
                                  _c103195_))))))
         (std/srfi/144#iota '25)))
  (define std/srfi/144#eqn9.1.16
    (lambda (_n+1103186_ _x103187_)
      (if (= '0 _n+1103186_)
          (std/srfi/144#flsecond-bessel '0 _x103187_)
          (let ((_n103189_ (- _n+1103186_ '1)))
            (fl/ (fl- (fl* (std/srfi/144#flfirst-bessel _n+1103186_ _x103187_)
                           (std/srfi/144#flsecond-bessel _n103189_ _x103187_))
                      (fl/ '2. (fl* std/srfi/144#fl-pi _x103187_)))
                 (std/srfi/144#flfirst-bessel _n103189_ _x103187_))))))
  (define std/srfi/144#eqn9.1.18
    (lambda (_n103181_ _x103182_)
      (if (> _n103181_ '0)
          (std/srfi/144#flfirst-bessel _n103181_ _x103182_)
          (fl* std/srfi/144#fl-1/pi
               (std/srfi/144#definite-integral
                '0.
                std/srfi/144#fl-pi
                (lambda (_theta103184_)
                  (flcos (fl* _x103182_ (flsin _theta103184_))))
                '128)))))
  (define std/srfi/144#eqn9.1.27-first-bessel
    (lambda (_n103178_ _x103179_)
      (std/srfi/144#eqn9.1.27
       std/srfi/144#flfirst-bessel
       _n103178_
       _x103179_)))
  (define std/srfi/144#eqn9.1.27-second-bessel
    (lambda (_n103175_ _x103176_)
      (std/srfi/144#eqn9.1.27
       std/srfi/144#flsecond-bessel
       _n103175_
       _x103176_)))
  (define std/srfi/144#eqn9.1.27
    (lambda (_f103165_ _n0103166_ _x103167_)
      (letrec ((_loop103169_
                (lambda (_n103171_ _jn103172_ _jn-1103173_)
                  (if (= _n103171_ _n0103166_)
                      _jn103172_
                      (_loop103169_
                       (+ _n103171_ '1)
                       (fl- (fl* (fl/ (inexact (+ _n103171_ _n103171_))
                                      _x103167_)
                                 _jn103172_)
                            _jn-1103173_)
                       _jn103172_)))))
        (if (<= _n0103166_ '1)
            (_f103165_ _n0103166_ _x103167_)
            (_loop103169_
             '1
             (_f103165_ '1 _x103167_)
             (_f103165_ '0 _x103167_))))))
  (define std/srfi/144#method9.12ex1
    (lambda (_n0103145_ _x103146_)
      (letrec ((_loop103148_
                (lambda (_n103157_
                         _jn103158_
                         _jn+1103159_
                         _jn0103160_
                         _sumEvens103161_)
                  (if (= _n103157_ '0)
                      (fl/ _jn0103160_
                           (+ _jn103158_ _sumEvens103161_ _sumEvens103161_))
                      (let ((_jn-1103163_
                             (fl- (fl/ (fl* '2. (inexact _n103157_) _jn103158_)
                                       _x103146_)
                                  _jn+1103159_)))
                        (_loop103148_
                         (- _n103157_ '1)
                         _jn-1103163_
                         _jn103158_
                         (if (= _n103157_ _n0103145_) _jn103158_ _jn0103160_)
                         (if (even? _n103157_)
                             (fl+ _jn103158_ _sumEvens103161_)
                             _sumEvens103161_)))))))
        (let* ((_n103150_ (min '200 (+ _n0103145_ '20)))
               (_jn+1103152_ (fl/ _x103146_ (fl* '2. (inexact _n103150_))))
               (_jn103154_ '1.))
          (_loop103148_ (- _n103150_ '1) _jn103154_ _jn+1103152_ '0. '0.)))))
  (define std/srfi/144#eqn9.1.75
    (lambda (_n103135_ _x103136_)
      (letrec* ((_k103138_ (max '10 (* '2 (exact (flceiling _x103136_)))))
                (_loop103139_
                 (lambda (_x2103141_ _m103142_ _i103143_)
                   (if (> _i103143_ _k103138_)
                       (fl/ '1. (fl* _m103142_ _x2103141_))
                       (fl/ '1.
                            (fl- (fl* _m103142_ _x2103141_)
                                 (_loop103139_
                                  _x2103141_
                                  (+ _m103142_ '1.)
                                  (+ _i103143_ '1))))))))
        (if (and (> _n103135_ '0)
                 (flpositive? _x103136_)
                 (fl< _x103136_ '1000.))
            (fl* (std/srfi/144#eqn9.1.75 (- _n103135_ '1) _x103136_)
                 (_loop103139_ (fl/ '2. _x103136_) (inexact _n103135_) '0))
            (std/srfi/144#flfirst-bessel _n103135_ _x103136_)))))
  (define std/srfi/144#eqn9.2.1
    (lambda (_n103132_ _x103133_)
      (fl* (flsqrt (/ '2. (fl* std/srfi/144#fl-pi _x103133_)))
           (flcos (fl- _x103133_
                       (fl* std/srfi/144#fl-pi
                            (fl+ (fl* '.5 (inexact _n103132_)) '.25)))))))
  (define std/srfi/144#eqn9.2.5
    (lambda (_n103127_ _x103128_)
      (let ((_theta103130_
             (fl- _x103128_
                  (fl* (fl+ (/ _n103127_ '2.) '.25) std/srfi/144#fl-pi))))
        (fl* (flsqrt (fl/ '2. (fl* std/srfi/144#fl-pi _x103128_)))
             (fl- (fl* (std/srfi/144#eqn9.2.9 _n103127_ _x103128_)
                       (flcos _theta103130_))
                  (fl* (std/srfi/144#eqn9.2.10 _n103127_ _x103128_)
                       (flsin _theta103130_)))))))
  (define std/srfi/144#eqn9.2.6
    (lambda (_n103122_ _x103123_)
      (let ((_theta103125_
             (fl- _x103123_
                  (fl* (fl+ (/ _n103122_ '2.) '.25) std/srfi/144#fl-pi))))
        (fl* (flsqrt (fl/ '2. (fl* std/srfi/144#fl-pi _x103123_)))
             (fl+ (fl* (std/srfi/144#eqn9.2.9 _n103122_ _x103123_)
                       (flsin _theta103125_))
                  (fl* (std/srfi/144#eqn9.2.10 _n103122_ _x103123_)
                       (flcos _theta103125_)))))))
  (define std/srfi/144#eqn9.2.9
    (lambda (_n103110_ _x103111_)
      (letrec* ((_mu103113_
                 (fl* '4. (std/srfi/144#flsquare (inexact _n103110_))))
                (_coefficients103114_
                 (lambda (_k2103116_ _p103117_ _fact2k103118_)
                   (let ((_c103120_ (fl/ _p103117_ _fact2k103118_)))
                     (if (fl> _k2103116_ '20.)
                         (list _c103120_)
                         (cons _c103120_
                               (_coefficients103114_
                                (fl+ _k2103116_ '2.)
                                (fl* _p103117_
                                     (fl- _mu103113_
                                          (std/srfi/144#flsquare
                                           (fl+ _k2103116_ '1.)))
                                     (fl- _mu103113_
                                          (std/srfi/144#flsquare
                                           (fl+ _k2103116_ '3.))))
                                (fl* _fact2k103118_
                                     (fl+ _k2103116_ '1.)
                                     (fl+ _k2103116_ '2.)))))))))
        (std/srfi/144#polynomial-at
         (fl- (fl/ (std/srfi/144#flsquare (fl* '8. _x103111_))))
         (_coefficients103114_ '0. '1. '1.)))))
  (define std/srfi/144#eqn9.2.10
    (lambda (_n103098_ _x103099_)
      (letrec* ((_mu103101_
                 (fl* '4. (std/srfi/144#flsquare (inexact _n103098_))))
                (_coefficients103102_
                 (lambda (_k2+1103104_ _p103105_ _fact2k+1103106_)
                   (let ((_c103108_ (fl/ _p103105_ _fact2k+1103106_)))
                     (if (fl> _k2+1103104_ '20.)
                         (list _c103108_)
                         (cons _c103108_
                               (_coefficients103102_
                                (fl+ _k2+1103104_ '2.)
                                (fl* _p103105_
                                     (fl- _mu103101_
                                          (std/srfi/144#flsquare
                                           (fl+ _k2+1103104_ '2.)))
                                     (fl- _mu103101_
                                          (std/srfi/144#flsquare
                                           (fl+ _k2+1103104_ '4.))))
                                (fl* _fact2k+1103106_
                                     (fl+ _k2+1103104_ '1.)
                                     (fl+ _k2+1103104_ '2.)))))))))
        (fl* (fl/ (fl* '8. _x103099_))
             (std/srfi/144#polynomial-at
              (fl- (fl/ (std/srfi/144#flsquare (fl* '8. _x103099_))))
              (_coefficients103102_ '1. (fl- _mu103101_ '1.) '1.))))))
  (define std/srfi/144#flerf
    (lambda (_x103096_)
      (std/srfi/144#check-flonum! 'flerf _x103096_)
      (if (flnegative? _x103096_)
          (fl- (std/srfi/144#flerf (fl- _x103096_)))
          (if (fl< _x103096_ '2.)
              (std/srfi/144#eqn7.1.6 _x103096_)
              (if (fl< _x103096_ '+inf.0)
                  (- '1. (std/srfi/144#eqn7.1.14 _x103096_))
                  (if (fl= _x103096_ '+inf.0) '1. _x103096_))))))
  (define std/srfi/144#flerfc
    (lambda (_x103094_)
      (std/srfi/144#check-flonum! 'flerfc _x103094_)
      (if (flnegative? _x103094_)
          (fl- '2. (std/srfi/144#flerfc (fl- _x103094_)))
          (if (fl< _x103094_ '2.)
              (std/srfi/144#eqn7.1.2 _x103094_)
              (if (fl< _x103094_ '+inf.0)
                  (std/srfi/144#eqn7.1.14 _x103094_)
                  (if (fl= _x103094_ '+inf.0) '0. _x103094_))))))
  (define std/srfi/144#eqn7.1.2
    (lambda (_x103092_) (fl- '1. (std/srfi/144#flerf _x103092_))))
  (define std/srfi/144#eqn7.1.6
    (lambda (_x103088_)
      (let ((_x^2103090_ (std/srfi/144#flsquare _x103088_)))
        (fl* std/srfi/144#fl-2/sqrt-pi
             (flexp (fl- _x^2103090_))
             _x103088_
             (std/srfi/144#polynomial-at
              _x^2103090_
              std/srfi/144#eqn7.1.6-coefficients)))))
  (define std/srfi/144#eqn7.1.6-coefficients
    (let ()
      (letrec ((_loop103081_
                (lambda (_n103083_ _p103084_)
                  (if (> _n103083_ '32)
                      '()
                      (let ((_p103086_
                             (fl* _p103084_
                                  (inexact (+ (* '2 _n103083_) '1)))))
                        (cons (fl/ (inexact (expt '2. _n103083_)) _p103086_)
                              (_loop103081_ (+ _n103083_ '1) _p103086_)))))))
        (_loop103081_ '0 '1.))))
  (define std/srfi/144#eqn7.1.14
    (lambda (_x103070_)
      (letrec ((_continued-fraction103072_
                (lambda (_x103078_)
                  (fl/ '1. (fl+ _x103078_ (_loop103073_ '1 '.5)))))
               (_loop103073_
                (lambda (_k103075_ _frac103076_)
                  (if (> _k103075_ '70)
                      '1.
                      (fl/ _frac103076_
                           (fl+ _x103070_
                                (_loop103073_
                                 (+ _k103075_ '1)
                                 (fl+ _frac103076_ '.5))))))))
        (fl/ (_continued-fraction103072_ _x103070_)
             (fl* (flsqrt std/srfi/144#fl-pi)
                  (flexp (std/srfi/144#flsquare _x103070_))))))))
