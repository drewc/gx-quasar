(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/parser/stream#char-stream::t
    (make-struct-type
     'std/parser/stream#char-stream::t
     '#f
     '4
     'char-stream
     '((final: . #t))
     ':init!
     '(port buf loc lines)))
  (define std/parser/stream#char-stream?
    (make-struct-predicate std/parser/stream#char-stream::t))
  (define std/parser/stream#make-char-stream
    (lambda _$args150895_
      (apply make-struct-instance
             std/parser/stream#char-stream::t
             _$args150895_)))
  (define std/parser/stream#char-stream-port
    (make-struct-field-accessor std/parser/stream#char-stream::t '0))
  (define std/parser/stream#char-stream-buf
    (make-struct-field-accessor std/parser/stream#char-stream::t '1))
  (define std/parser/stream#char-stream-loc
    (make-struct-field-accessor std/parser/stream#char-stream::t '2))
  (define std/parser/stream#char-stream-lines
    (make-struct-field-accessor std/parser/stream#char-stream::t '3))
  (define std/parser/stream#char-stream-port-set!
    (make-struct-field-mutator std/parser/stream#char-stream::t '0))
  (define std/parser/stream#char-stream-buf-set!
    (make-struct-field-mutator std/parser/stream#char-stream::t '1))
  (define std/parser/stream#char-stream-loc-set!
    (make-struct-field-mutator std/parser/stream#char-stream::t '2))
  (define std/parser/stream#char-stream-lines-set!
    (make-struct-field-mutator std/parser/stream#char-stream::t '3))
  (define std/parser/stream#char-stream:::init!
    (lambda (_self150892_ _port150893_)
      (if (macro-character-input-port? _port150893_)
          '#!void
          (error '"Bad input source; not a character-input-port" _port150893_))
      (if (let ((__tmp279709
                 (let () (declare (not safe)) (##vector-length _self150892_))))
            (declare (not safe))
            (##fx< '4 __tmp279709))
          (begin
            (let ()
              (declare (not safe))
              (##vector-set! _self150892_ '1 _port150893_))
            (let () (declare (not safe)) (##vector-set! _self150892_ '2 '()))
            (let ((__tmp279710
                   (let ()
                     (declare (not safe))
                     (##structure
                      std/parser/base#location::t
                      _port150893_
                      '0
                      '0
                      '0
                      '0))))
              (declare (not safe))
              (##vector-set! _self150892_ '3 __tmp279710))
            (let () (declare (not safe)) (##vector-set! _self150892_ '4 '())))
          (error '"struct-instance-init!: too many arguments for struct"
                 _self150892_))))
  (bind-method!
   std/parser/stream#char-stream::t
   ':init!
   std/parser/stream#char-stream:::init!
   '#f)
  (define std/parser/stream#char-stream-close
    (lambda (_cs150767_)
      (close-input-port
       (##direct-structure-ref
        _cs150767_
        '1
        std/parser/stream#char-stream::t
        '#f))))
  (define std/parser/stream#char-stream-getc
    (lambda (_cs150684_)
      (let* ((_cs150685150694_ _cs150684_)
             (_E150687150698_
              (lambda () (error '"No clause matching" _cs150685150694_)))
             (_K150688150744_
              (lambda (_lines150701_ _loc150702_ _buf150703_ _port150704_)
                (let* ((_buf150705150713_ _buf150703_)
                       (_else150707150726_
                        (lambda ()
                          (let* ((_loc150721_
                                  (std/parser/stream#port-location
                                   _port150704_))
                                 (_char150723_ (read-char _port150704_)))
                            (if (eof-object? _char150723_)
                                '#!void
                                (begin
                                  (##direct-structure-set!
                                   _cs150684_
                                   _loc150721_
                                   '3
                                   std/parser/stream#char-stream::t
                                   '#f)
                                  (if (eq? '#\newline _char150723_)
                                      (##direct-structure-set!
                                       _cs150684_
                                       (cons (##direct-structure-ref
                                              _loc150721_
                                              '5
                                              std/parser/base#location::t
                                              '#f)
                                             _lines150701_)
                                       '4
                                       std/parser/stream#char-stream::t
                                       '#f)
                                      '#!void)))
                            _char150723_)))
                       (_K150709150732_
                        (lambda (_rest150729_ _char150730_)
                          (##direct-structure-set!
                           _cs150684_
                           _rest150729_
                           '2
                           std/parser/stream#char-stream::t
                           '#f)
                          (##direct-structure-set!
                           _cs150684_
                           (std/parser/stream#location-getc
                            _loc150702_
                            _char150730_
                            _lines150701_)
                           '3
                           std/parser/stream#char-stream::t
                           '#f)
                          _char150730_)))
                  (if (let () (declare (not safe)) (##pair? _buf150705150713_))
                      (let ((_hd150710150735_
                             (let ()
                               (declare (not safe))
                               (##car _buf150705150713_)))
                            (_tl150711150737_
                             (let ()
                               (declare (not safe))
                               (##cdr _buf150705150713_))))
                        (let* ((_char150740_ _hd150710150735_)
                               (_rest150742_ _tl150711150737_))
                          (_K150709150732_ _rest150742_ _char150740_)))
                      (_else150707150726_))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _cs150685150694_
               'std/parser/stream#char-stream::t))
            (let* ((_e150689150747_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _cs150685150694_ '1)))
                   (_port150750_ _e150689150747_)
                   (_e150690150752_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _cs150685150694_ '2)))
                   (_buf150755_ _e150690150752_)
                   (_e150691150757_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _cs150685150694_ '3)))
                   (_loc150760_ _e150691150757_)
                   (_e150692150762_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _cs150685150694_ '4)))
                   (_lines150765_ _e150692150762_))
              (_K150688150744_
               _lines150765_
               _loc150760_
               _buf150755_
               _port150750_))
            (_E150687150698_)))))
  (define std/parser/stream#char-stream-ungetc
    (lambda (_cs150638_ _char150639_)
      (if (eof-object? _char150639_)
          '#!void
          (let* ((_cs150640150649_ _cs150638_)
                 (_E150642150653_
                  (lambda () (error '"No clause matching" _cs150640150649_)))
                 (_K150643150661_
                  (lambda (_lines150656_ _loc150657_ _buf150658_ _port150659_)
                    (##direct-structure-set!
                     _cs150638_
                     (cons _char150639_ _buf150658_)
                     '2
                     std/parser/stream#char-stream::t
                     '#f)
                    (##direct-structure-set!
                     _cs150638_
                     (std/parser/stream#location-ungetc
                      _loc150657_
                      _char150639_
                      _lines150656_)
                     '3
                     std/parser/stream#char-stream::t
                     '#f))))
            (if (let ()
                  (declare (not safe))
                  (##structure-direct-instance-of?
                   _cs150640150649_
                   'std/parser/stream#char-stream::t))
                (let* ((_e150644150664_
                        (let ()
                          (declare (not safe))
                          (##vector-ref _cs150640150649_ '1)))
                       (_port150667_ _e150644150664_)
                       (_e150645150669_
                        (let ()
                          (declare (not safe))
                          (##vector-ref _cs150640150649_ '2)))
                       (_buf150672_ _e150645150669_)
                       (_e150646150674_
                        (let ()
                          (declare (not safe))
                          (##vector-ref _cs150640150649_ '3)))
                       (_loc150677_ _e150646150674_)
                       (_e150647150679_
                        (let ()
                          (declare (not safe))
                          (##vector-ref _cs150640150649_ '4)))
                       (_lines150682_ _e150647150679_))
                  (_K150643150661_
                   _lines150682_
                   _loc150677_
                   _buf150672_
                   _port150667_))
                (_E150642150653_))))))
  (define std/parser/stream#char-stream-peek
    (lambda (_cs150574_)
      (let* ((_cs150575150582_ _cs150574_)
             (_E150577150586_
              (lambda () (error '"No clause matching" _cs150575150582_)))
             (_K150578150625_
              (lambda (_buf150589_ _port150590_)
                (let* ((_buf150591150599_ _buf150589_)
                       (_else150593150607_
                        (lambda () (peek-char _port150590_)))
                       (_K150595150613_
                        (lambda (_rest150610_ _char150611_) _char150611_)))
                  (if (let () (declare (not safe)) (##pair? _buf150591150599_))
                      (let ((_hd150596150616_
                             (let ()
                               (declare (not safe))
                               (##car _buf150591150599_)))
                            (_tl150597150618_
                             (let ()
                               (declare (not safe))
                               (##cdr _buf150591150599_))))
                        (let* ((_char150621_ _hd150596150616_)
                               (_rest150623_ _tl150597150618_))
                          (_K150595150613_ _rest150623_ _char150621_)))
                      (_else150593150607_))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _cs150575150582_
               'std/parser/stream#char-stream::t))
            (let* ((_e150579150628_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _cs150575150582_ '1)))
                   (_port150631_ _e150579150628_)
                   (_e150580150633_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _cs150575150582_ '2)))
                   (_buf150636_ _e150580150633_))
              (_K150578150625_ _buf150636_ _port150631_))
            (_E150577150586_)))))
  (define std/parser/stream#location-getc
    (lambda (_loc150523_ _char150524_ _lines150525_)
      (let* ((_loc150526150536_ _loc150523_)
             (_E150528150540_
              (lambda () (error '"No clause matching" _loc150526150536_)))
             (_K150529150548_
              (lambda (_xoff150543_ _col150544_ _line150545_ _port150546_)
                (if (let () (declare (not safe)) (##fx< _xoff150543_ '0))
                    (let ()
                      (declare (not safe))
                      (##structure
                       std/parser/base#location::t
                       _port150546_
                       '0
                       '0
                       '1
                       '0))
                    (if (memq _xoff150543_ _lines150525_)
                        (let ((__tmp279712
                               (let ()
                                 (declare (not safe))
                                 (##fx+ _line150545_ '1)))
                              (__tmp279711
                               (let ()
                                 (declare (not safe))
                                 (##fx+ _xoff150543_ '1))))
                          (declare (not safe))
                          (##structure
                           std/parser/base#location::t
                           _port150546_
                           __tmp279712
                           '0
                           '1
                           __tmp279711))
                        (let ((__tmp279714
                               (let ()
                                 (declare (not safe))
                                 (##fx+ _col150544_ '1)))
                              (__tmp279713
                               (let ()
                                 (declare (not safe))
                                 (##fx+ _xoff150543_ '1))))
                          (declare (not safe))
                          (##structure
                           std/parser/base#location::t
                           _port150546_
                           _line150545_
                           __tmp279714
                           '1
                           __tmp279713)))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _loc150526150536_
               'std/parser/base#location::t))
            (let* ((_e150530150551_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150526150536_ '1)))
                   (_port150554_ _e150530150551_)
                   (_e150531150556_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150526150536_ '2)))
                   (_line150559_ _e150531150556_)
                   (_e150532150561_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150526150536_ '3)))
                   (_col150564_ _e150532150561_)
                   (_e150533150566_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150526150536_ '4)))
                   (_e150534150569_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150526150536_ '5)))
                   (_xoff150572_ _e150534150569_))
              (_K150529150548_
               _xoff150572_
               _col150564_
               _line150559_
               _port150554_))
            (_E150528150540_)))))
  (define std/parser/stream#location-ungetc
    (lambda (_loc150458_ _char150459_ _lines150460_)
      (let* ((_loc150461150471_ _loc150458_)
             (_E150463150475_
              (lambda () (error '"No clause matching" _loc150461150471_)))
             (_K150464150497_
              (lambda (_xoff150478_ _col150479_ _line150480_ _port150481_)
                (if (let () (declare (not safe)) (##fx> _col150479_ '0))
                    (let ((__tmp279716
                           (let ()
                             (declare (not safe))
                             (##fx- _col150479_ '1)))
                          (__tmp279715
                           (let ()
                             (declare (not safe))
                             (##fx- _xoff150478_ '1))))
                      (declare (not safe))
                      (##structure
                       std/parser/base#location::t
                       _port150481_
                       _line150480_
                       __tmp279716
                       '1
                       __tmp279715))
                    (let* ((_xoff150483_
                            (let ()
                              (declare (not safe))
                              (##fx- _xoff150478_ '1)))
                           (_base150492_
                            (let ((_$e150489_
                                   (find (lambda (_g150484150486_)
                                           (< _g150484150486_ _xoff150483_))
                                         _lines150460_)))
                              (if _$e150489_ _$e150489_ '-1)))
                           (_col150494_
                            (let ()
                              (declare (not safe))
                              (##fx- _xoff150483_ _base150492_ '1))))
                      (let ((__tmp279717
                             (let ()
                               (declare (not safe))
                               (##fx- _line150480_ '1))))
                        (declare (not safe))
                        (##structure
                         std/parser/base#location::t
                         _port150481_
                         __tmp279717
                         _col150494_
                         '1
                         _xoff150483_)))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _loc150461150471_
               'std/parser/base#location::t))
            (let* ((_e150465150500_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150461150471_ '1)))
                   (_port150503_ _e150465150500_)
                   (_e150466150505_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150461150471_ '2)))
                   (_line150508_ _e150466150505_)
                   (_e150467150510_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150461150471_ '3)))
                   (_col150513_ _e150467150510_)
                   (_e150468150515_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150461150471_ '4)))
                   (_e150469150518_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _loc150461150471_ '5)))
                   (_xoff150521_ _e150469150518_))
              (_K150464150497_
               _xoff150521_
               _col150513_
               _line150508_
               _port150503_))
            (_E150463150475_)))))
  (define std/parser/stream#port-location
    (lambda (_port150449_)
      (let* ((_line150451_ (macro-character-port-rlines _port150449_))
             (_xoff150453_
              (let ((__tmp279719 (macro-character-port-rchars _port150449_))
                    (__tmp279718 (macro-character-port-rlo _port150449_)))
                (declare (not safe))
                (##fx+ __tmp279719 __tmp279718)))
             (_col150455_
              (let ((__tmp279720 (macro-character-port-rcurline _port150449_)))
                (declare (not safe))
                (##fx- _xoff150453_ __tmp279720))))
        (let ()
          (declare (not safe))
          (##structure
           std/parser/base#location::t
           _port150449_
           _line150451_
           _col150455_
           '1
           _xoff150453_))))))
