(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/42#ec-:vector-filter
    (lambda (_vecs84900_)
      (if (null? _vecs84900_)
          '()
          (if (zero? (vector-length (car _vecs84900_)))
              (std/srfi/42#ec-:vector-filter (cdr _vecs84900_))
              (cons (car _vecs84900_)
                    (std/srfi/42#ec-:vector-filter (cdr _vecs84900_)))))))
  (define std/srfi/42#dispatch-union
    (lambda (_d184892_ _d284893_)
      (lambda (_args84895_)
        (let ((_g184897_ (_d184892_ _args84895_))
              (_g284898_ (_d284893_ _args84895_)))
          (if _g184897_
              (if _g284898_
                  (if (null? _args84895_)
                      (append (if (list? _g184897_) _g184897_ (list _g184897_))
                              (if (list? _g284898_)
                                  _g284898_
                                  (list _g284898_)))
                      (error '"dispatching conflict"
                             _args84895_
                             (_d184892_ '())
                             (_d284893_ '())))
                  _g184897_)
              (if _g284898_ _g284898_ '#f))))))
  (define std/srfi/42#make-initial-:-dispatch
    (lambda ()
      (lambda (_args84489_)
        (let ((_$e84491_ (length _args84489_)))
          (if (eq? '0 _$e84491_)
              'SRFI42
              (if (eq? '1 _$e84491_)
                  (let ((_a184494_ (car _args84489_)))
                    (if (list? _a184494_)
                        (let ((_t84496_ _a184494_) (_ne284498_ '#t))
                          (let ((_var84501_ '#f))
                            (lambda (_empty84504_)
                              (if (and (not (null? _t84496_)) _ne284498_)
                                  (begin
                                    (set! _var84501_ (car _t84496_))
                                    (let ((_value84507_ _var84501_))
                                      (set! _t84496_ (cdr _t84496_))
                                      _value84507_))
                                  _empty84504_))))
                        (if (string? _a184494_)
                            (let ((_str84510_ _a184494_) (_len84512_ '0))
                              (set! _len84512_ (string-length _str84510_))
                              (let ((_i84515_ '0) (_ne284517_ '#t))
                                (let ((_var84520_ '#f))
                                  (lambda (_empty84523_)
                                    (if (and (< _i84515_ _len84512_)
                                             _ne284517_)
                                        (begin
                                          (set! _var84520_
                                                (string-ref
                                                 _str84510_
                                                 _i84515_))
                                          (let ((_value84526_ _var84520_))
                                            (set! _i84515_ (+ _i84515_ '1))
                                            _value84526_))
                                        _empty84523_)))))
                            (if (vector? _a184494_)
                                (let ((_vec84529_ _a184494_) (_len84531_ '0))
                                  (set! _len84531_ (vector-length _vec84529_))
                                  (let ((_i84534_ '0) (_ne284536_ '#t))
                                    (let ((_var84539_ '#f))
                                      (lambda (_empty84542_)
                                        (if (and (< _i84534_ _len84531_)
                                                 _ne284536_)
                                            (begin
                                              (set! _var84539_
                                                    (vector-ref
                                                     _vec84529_
                                                     _i84534_))
                                              (let ((_value84545_ _var84539_))
                                                (set! _i84534_ (+ _i84534_ '1))
                                                _value84545_))
                                            _empty84542_)))))
                                (if (and (integer? _a184494_)
                                         (exact? _a184494_))
                                    (let ((_b84548_ _a184494_))
                                      (if (not (and (integer? _b84548_)
                                                    (exact? _b84548_)))
                                          (error '"arguments of :range are not exact integer "
                                                 '"(use :real-range?)"
                                                 '0
                                                 _b84548_
                                                 '1)
                                          '#!void)
                                      (let ((_var84551_ '0) (_ne284553_ '#t))
                                        (lambda (_empty84556_)
                                          (if (and (< _var84551_ _b84548_)
                                                   _ne284553_)
                                              (let ((_value84559_ _var84551_))
                                                (set! _var84551_
                                                      (+ _var84551_ '1))
                                                _value84559_)
                                              _empty84556_))))
                                    (if (real? _a184494_)
                                        (let ((_a84562_ '0)
                                              (_b84564_ _a184494_)
                                              (_s84566_ '1)
                                              (_istop84568_ '0))
                                          (if (not (and (real? _a84562_)
                                                        (real? _b84564_)
                                                        (real? _s84566_)))
                                              (error '"arguments of :real-range are not real"
                                                     _a84562_
                                                     _b84564_
                                                     _s84566_)
                                              '#!void)
                                          (if (and (exact? _a84562_)
                                                   (or (not (exact? _b84564_))
                                                       (not (exact? _s84566_))))
                                              (set! _a84562_
                                                    (exact->inexact _a84562_))
                                              '#!void)
                                          (set! _istop84568_
                                                (/ (- _b84564_ _a84562_)
                                                   _s84566_))
                                          (let ((_i84574_ '0) (_ne284576_ '#t))
                                            (let ((_var84579_ '#f))
                                              (lambda (_empty84582_)
                                                (if (and (< _i84574_
                                                            _istop84568_)
                                                         _ne284576_)
                                                    (begin
                                                      (set! _var84579_
                                                            (+ _a84562_
                                                               (* _s84566_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                          _i84574_)))
              (let ((_value84585_ _var84579_))
                (set! _i84574_ (+ _i84574_ '1))
                _value84585_))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                    _empty84582_)))))
                                        (if (input-port? _a184494_)
                                            (let ((_port84588_ _a184494_)
                                                  (_read-proc84590_ read))
                                              (let ((_var84593_
                                                     (_read-proc84590_
                                                      _port84588_))
                                                    (_ne284595_ '#t))
                                                (lambda (_empty84598_)
                                                  (if (and (not (eof-object?
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                         _var84593_))
                   _ne284595_)
              (let ((_value84601_ _var84593_))
                (set! _var84593_ (_read-proc84590_ _port84588_))
                _value84601_)
              _empty84598_))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                            '#f)))))))
                  (if (eq? '2 _$e84491_)
                      (let ((_a184604_ (car _args84489_))
                            (_a284605_ (cadr _args84489_)))
                        (if (and (list? _a184604_) (list? _a284605_))
                            (let ((_t84607_ (append _a184604_ _a284605_))
                                  (_ne284609_ '#t))
                              (let ((_var84612_ '#f))
                                (lambda (_empty84615_)
                                  (if (and (not (null? _t84607_)) _ne284609_)
                                      (begin
                                        (set! _var84612_ (car _t84607_))
                                        (let ((_value84618_ _var84612_))
                                          (set! _t84607_ (cdr _t84607_))
                                          _value84618_))
                                      _empty84615_))))
                            (if (and (string? _a184604_) (string? _a184604_))
                                (let ((_str84621_
                                       (string-append _a184604_ _a284605_))
                                      (_len84623_ '0))
                                  (set! _len84623_ (string-length _str84621_))
                                  (let ((_i84626_ '0) (_ne284628_ '#t))
                                    (let ((_var84631_ '#f))
                                      (lambda (_empty84634_)
                                        (if (and (< _i84626_ _len84623_)
                                                 _ne284628_)
                                            (begin
                                              (set! _var84631_
                                                    (string-ref
                                                     _str84621_
                                                     _i84626_))
                                              (let ((_value84637_ _var84631_))
                                                (set! _i84626_ (+ _i84626_ '1))
                                                _value84637_))
                                            _empty84634_)))))
                                (if (and (vector? _a184604_)
                                         (vector? _a284605_))
                                    (let ((_vec84640_ '#f)
                                          (_len84642_ '0)
                                          (_vecs84644_
                                           (std/srfi/42#ec-:vector-filter
                                            (list _a184604_ _a284605_))))
                                      (let ((_k84647_ '0) (_ne284649_ '#t))
                                        (let ((_var84652_ '#f))
                                          (lambda (_empty84655_)
                                            (if (and (if (< _k84647_
                                                            _len84642_)
                                                         '#t
                                                         (if (null? _vecs84644_)
                                                             '#f
                                                             (begin
                                                               (set! _vec84640_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                             (car _vecs84644_))
                       (set! _vecs84644_ (cdr _vecs84644_))
                       (set! _len84642_ (vector-length _vec84640_))
                       (set! _k84647_ '0)
                       '#t)))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                     _ne284649_)
                                                (begin
                                                  (set! _var84652_
                                                        (vector-ref
                                                         _vec84640_
                                                         _k84647_))
                                                  (let ((_value84658_
                                                         _var84652_))
                                                    (set! _k84647_
                                                          (+ _k84647_ '1))
                                                    _value84658_))
                                                _empty84655_)))))
                                    (if (and (integer? _a184604_)
                                             (exact? _a184604_)
                                             (integer? _a284605_)
                                             (exact? _a284605_))
                                        (let ((_a84661_ _a184604_)
                                              (_b84663_ _a284605_))
                                          (if (not (and (integer? _a84661_)
                                                        (exact? _a84661_)
                                                        (integer? _b84663_)
                                                        (exact? _b84663_)))
                                              (error '"arguments of :range are not exact integer "
                                                     '"(use :real-range?)"
                                                     _a84661_
                                                     _b84663_
                                                     '1)
                                              '#!void)
                                          (let ((_var84666_ _a84661_)
                                                (_ne284668_ '#t))
                                            (lambda (_empty84671_)
                                              (if (and (< _var84666_ _b84663_)
                                                       _ne284668_)
                                                  (let ((_value84674_
                                                         _var84666_))
                                                    (set! _var84666_
                                                          (+ _var84666_ '1))
                                                    _value84674_)
                                                  _empty84671_))))
                                        (if (and (real? _a184604_)
                                                 (real? _a284605_))
                                            (let ((_a84677_ _a184604_)
                                                  (_b84679_ _a284605_)
                                                  (_s84681_ '1)
                                                  (_istop84683_ '0))
                                              (if (not (and (real? _a84677_)
                                                            (real? _b84679_)
                                                            (real? _s84681_)))
                                                  (error '"arguments of :real-range are not real"
                                                         _a84677_
                                                         _b84679_
                                                         _s84681_)
                                                  '#!void)
                                              (if (and (exact? _a84677_)
                                                       (or (not (exact? _b84679_))
                                                           (not (exact? _s84681_))))
                                                  (set! _a84677_
                                                        (exact->inexact
                                                         _a84677_))
                                                  '#!void)
                                              (set! _istop84683_
                                                    (/ (- _b84679_ _a84677_)
                                                       _s84681_))
                                              (let ((_i84689_ '0)
                                                    (_ne284691_ '#t))
                                                (let ((_var84694_ '#f))
                                                  (lambda (_empty84697_)
                                                    (if (and (< _i84689_
                                                                _istop84683_)
                                                             _ne284691_)
                                                        (begin
                                                          (set! _var84694_
                                                                (+ _a84677_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                           (* _s84681_ _i84689_)))
                  (let ((_value84700_ _var84694_))
                    (set! _i84689_ (+ _i84689_ '1))
                    _value84700_))
                _empty84697_)))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                            (if (and (char? _a184604_)
                                                     (char? _a284605_))
                                                (let ((_imax84703_
                                                       (char->integer
                                                        _a284605_)))
                                                  (let ((_i84706_
                                                         (char->integer
                                                          _a184604_))
                                                        (_ne284708_ '#t))
                                                    (let ((_var84711_ '#f))
                                                      (lambda (_empty84714_)
                                                        (if (and (<= _i84706_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                             _imax84703_)
                         _ne284708_)
                    (begin
                      (set! _var84711_ (integer->char _i84706_))
                      (let ((_value84717_ _var84711_))
                        (set! _i84706_ (+ _i84706_ '1))
                        _value84717_))
                    _empty84714_)))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                (if (and (input-port?
                                                          _a184604_)
                                                         (procedure?
                                                          _a284605_))
                                                    (let ((_port84720_
                                                           _a184604_)
                                                          (_read-proc84722_
                                                           _a284605_))
                                                      (let ((_var84725_
                                                             (_read-proc84722_
                                                              _port84720_))
                                                            (_ne284727_ '#t))
                                                        (lambda (_empty84730_)
                                                          (if (and (not (eof-object?
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                                 _var84725_))
                           _ne284727_)
                      (let ((_value84733_ _var84725_))
                        (set! _var84725_ (_read-proc84722_ _port84720_))
                        _value84733_)
                      _empty84730_))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                    '#f))))))))
                      (if (eq? '3 _$e84491_)
                          (let ((_a184736_ (car _args84489_))
                                (_a284737_ (cadr _args84489_))
                                (_a384738_ (caddr _args84489_)))
                            (if (and (list? _a184736_)
                                     (list? _a284737_)
                                     (list? _a384738_))
                                (let ((_t84740_
                                       (append _a184736_ _a284737_ _a384738_))
                                      (_ne284742_ '#t))
                                  (let ((_var84745_ '#f))
                                    (lambda (_empty84748_)
                                      (if (and (not (null? _t84740_))
                                               _ne284742_)
                                          (begin
                                            (set! _var84745_ (car _t84740_))
                                            (let ((_value84751_ _var84745_))
                                              (set! _t84740_ (cdr _t84740_))
                                              _value84751_))
                                          _empty84748_))))
                                (if (and (string? _a184736_)
                                         (string? _a184736_)
                                         (string? _a384738_))
                                    (let ((_str84754_
                                           (string-append
                                            _a184736_
                                            _a284737_
                                            _a384738_))
                                          (_len84756_ '0))
                                      (set! _len84756_
                                            (string-length _str84754_))
                                      (let ((_i84759_ '0) (_ne284761_ '#t))
                                        (let ((_var84764_ '#f))
                                          (lambda (_empty84767_)
                                            (if (and (< _i84759_ _len84756_)
                                                     _ne284761_)
                                                (begin
                                                  (set! _var84764_
                                                        (string-ref
                                                         _str84754_
                                                         _i84759_))
                                                  (let ((_value84770_
                                                         _var84764_))
                                                    (set! _i84759_
                                                          (+ _i84759_ '1))
                                                    _value84770_))
                                                _empty84767_)))))
                                    (if (and (vector? _a184736_)
                                             (vector? _a284737_)
                                             (vector? _a384738_))
                                        (let ((_vec84773_ '#f)
                                              (_len84775_ '0)
                                              (_vecs84777_
                                               (std/srfi/42#ec-:vector-filter
                                                (list _a184736_
                                                      _a284737_
                                                      _a384738_))))
                                          (let ((_k84780_ '0) (_ne284782_ '#t))
                                            (let ((_var84785_ '#f))
                                              (lambda (_empty84788_)
                                                (if (and (if (< _k84780_
                                                                _len84775_)
                                                             '#t
                                                             (if (null? _vecs84777_)
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                         '#f
                         (begin
                           (set! _vec84773_ (car _vecs84777_))
                           (set! _vecs84777_ (cdr _vecs84777_))
                           (set! _len84775_ (vector-length _vec84773_))
                           (set! _k84780_ '0)
                           '#t)))
                 _ne284782_)
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                    (begin
                                                      (set! _var84785_
                                                            (vector-ref
                                                             _vec84773_
                                                             _k84780_))
                                                      (let ((_value84791_
                                                             _var84785_))
                                                        (set! _k84780_
                                                              (+ _k84780_ '1))
                                                        _value84791_))
                                                    _empty84788_)))))
                                        (if (and (integer? _a184736_)
                                                 (exact? _a184736_)
                                                 (integer? _a284737_)
                                                 (exact? _a284737_)
                                                 (integer? _a384738_)
                                                 (exact? _a384738_))
                                            (let ((_a84794_ _a184736_)
                                                  (_b84796_ _a284737_)
                                                  (_s84798_ _a384738_)
                                                  (_stop84800_ '0))
                                              (if (not (and (integer? _a84794_)
                                                            (exact? _a84794_)
                                                            (integer? _b84796_)
                                                            (exact? _b84796_)
                                                            (integer? _s84798_)
                                                            (exact? _s84798_)))
                                                  (error '"arguments of :range are not exact integer "
                                                         '"(use :real-range?)"
                                                         _a84794_
                                                         _b84796_
                                                         _s84798_)
                                                  '#!void)
                                              (if (zero? _s84798_)
                                                  (error '"step size must not be zero in :range")
                                                  '#!void)
                                              (set! _stop84800_
                                                    (+ _a84794_
                                                       (* (max '0
                                                               (ceiling (/ (- _b84796_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                                      _a84794_)
                                   _s84798_)))
                  _s84798_)))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                              (let ((_var84803_ _a84794_)
                                                    (_ne284805_ '#t))
                                                (lambda (_empty84808_)
                                                  (if (and (not (= _var84803_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                           _stop84800_))
                   _ne284805_)
              (let ((_value84811_ _var84803_))
                (set! _var84803_ (+ _var84803_ _s84798_))
                _value84811_)
              _empty84808_))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                            (if (and (real? _a184736_)
                                                     (real? _a284737_)
                                                     (real? _a384738_))
                                                (let ((_a84814_ _a184736_)
                                                      (_b84816_ _a284737_)
                                                      (_s84818_ _a384738_)
                                                      (_istop84820_ '0))
                                                  (if (not (and (real? _a84814_)
                                                                (real? _b84816_)
                                                                (real? _s84818_)))
                                                      (error '"arguments of :real-range are not real"
                                                             _a84814_
                                                             _b84816_
                                                             _s84818_)
                                                      '#!void)
                                                  (if (and (exact? _a84814_)
                                                           (or (not (exact? _b84816_))
                                                               (not (exact? _s84818_))))
                                                      (set! _a84814_
                                                            (exact->inexact
                                                             _a84814_))
                                                      '#!void)
                                                  (set! _istop84820_
                                                        (/ (- _b84816_
                                                              _a84814_)
                                                           _s84818_))
                                                  (let ((_i84826_ '0)
                                                        (_ne284828_ '#t))
                                                    (let ((_var84831_ '#f))
                                                      (lambda (_empty84834_)
                                                        (if (and (< _i84826_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                            _istop84820_)
                         _ne284828_)
                    (begin
                      (set! _var84831_ (+ _a84814_ (* _s84818_ _i84826_)))
                      (let ((_value84837_ _var84831_))
                        (set! _i84826_ (+ _i84826_ '1))
                        _value84837_))
                    _empty84834_)))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                '#f))))))
                          (letrec ((_every?84840_
                                    (lambda (_pred84842_ _args84843_)
                                      (if (null? _args84843_)
                                          '#t
                                          (if (_pred84842_ (car _args84843_))
                                              (_every?84840_
                                               _pred84842_
                                               (cdr _args84843_))
                                              '#f)))))
                            (if (_every?84840_ list? _args84489_)
                                (let ((_t84845_ (apply append _args84489_))
                                      (_ne284847_ '#t))
                                  (let ((_var84850_ '#f))
                                    (lambda (_empty84853_)
                                      (if (and (not (null? _t84845_))
                                               _ne284847_)
                                          (begin
                                            (set! _var84850_ (car _t84845_))
                                            (let ((_value84856_ _var84850_))
                                              (set! _t84845_ (cdr _t84845_))
                                              _value84856_))
                                          _empty84853_))))
                                (if (_every?84840_ string? _args84489_)
                                    (let ((_str84859_
                                           (apply string-append _args84489_))
                                          (_len84861_ '0))
                                      (set! _len84861_
                                            (string-length _str84859_))
                                      (let ((_i84864_ '0) (_ne284866_ '#t))
                                        (let ((_var84869_ '#f))
                                          (lambda (_empty84872_)
                                            (if (and (< _i84864_ _len84861_)
                                                     _ne284866_)
                                                (begin
                                                  (set! _var84869_
                                                        (string-ref
                                                         _str84859_
                                                         _i84864_))
                                                  (let ((_value84875_
                                                         _var84869_))
                                                    (set! _i84864_
                                                          (+ _i84864_ '1))
                                                    _value84875_))
                                                _empty84872_)))))
                                    (if (_every?84840_ vector? _args84489_)
                                        (let ((_t84878_
                                               (apply append
                                                      (map vector->list
                                                           _args84489_)))
                                              (_ne284880_ '#t))
                                          (let ((_var84883_ '#f))
                                            (lambda (_empty84886_)
                                              (if (and (not (null? _t84878_))
                                                       _ne284880_)
                                                  (begin
                                                    (set! _var84883_
                                                          (car _t84878_))
                                                    (let ((_value84889_
                                                           _var84883_))
                                                      (set! _t84878_
                                                            (cdr _t84878_))
                                                      _value84889_))
                                                  _empty84886_))))
                                        '#f))))))))))))
  (define std/srfi/42#:-dispatch (std/srfi/42#make-initial-:-dispatch))
  (define std/srfi/42#:-dispatch-ref (lambda () std/srfi/42#:-dispatch))
  (define std/srfi/42#:-dispatch-set!
    (lambda (_dispatch84485_)
      (if (not (procedure? _dispatch84485_))
          (error '"not a procedure" _dispatch84485_)
          '#!void)
      (set! std/srfi/42#:-dispatch _dispatch84485_))))
