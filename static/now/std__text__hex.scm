(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/text/hex#hexes '"0123456789abcdef")
  (define std/text/hex#hex-encode__%
    (lambda (_bytes162452_ _start162453_ _end162454_)
      (let* ((_end162459_
              (let ((_$e162456_ _end162454_))
                (if _$e162456_ _$e162456_ (u8vector-length _bytes162452_))))
             (_len162461_ (fx- _end162459_ _start162453_))
             (_str162463_
              (make-string
               (let () (declare (not safe)) (##fx* '2 _len162461_)))))
        (let _lp162466_ ((_n162468_ '0))
          (if (let () (declare (not safe)) (##fx< _n162468_ _len162461_))
              (let* ((_ix162470_
                      (let ()
                        (declare (not safe))
                        (##fx+ _n162468_ _start162453_)))
                     (_b162472_
                      (let ()
                        (declare (not safe))
                        (##u8vector-ref _bytes162452_ _ix162470_)))
                     (_off162474_
                      (let ()
                        (declare (not safe))
                        (##fxarithmetic-shift _n162468_ '1))))
                (let ((__tmp279770
                       (let ((__tmp279771
                              (let ()
                                (declare (not safe))
                                (##fxarithmetic-shift _b162472_ '-4))))
                         (declare (not safe))
                         (##string-ref std/text/hex#hexes __tmp279771))))
                  (declare (not safe))
                  (##string-set! _str162463_ _off162474_ __tmp279770))
                (let ((__tmp279774
                       (let () (declare (not safe)) (##fx+ _off162474_ '1)))
                      (__tmp279772
                       (let ((__tmp279773
                              (let ()
                                (declare (not safe))
                                (##fxand _b162472_ '15))))
                         (declare (not safe))
                         (##string-ref std/text/hex#hexes __tmp279773))))
                  (declare (not safe))
                  (##string-set! _str162463_ __tmp279774 __tmp279772))
                (_lp162466_
                 (let () (declare (not safe)) (##fx+ _n162468_ '1))))
              _str162463_)))))
  (define std/text/hex#hex-encode__0
    (lambda (_bytes162480_)
      (let* ((_start162482_ '0) (_end162484_ '#f))
        (std/text/hex#hex-encode__% _bytes162480_ _start162482_ _end162484_))))
  (define std/text/hex#hex-encode__1
    (lambda (_bytes162486_ _start162487_)
      (let ((_end162489_ '#f))
        (std/text/hex#hex-encode__% _bytes162486_ _start162487_ _end162489_))))
  (define std/text/hex#hex-encode
    (lambda _g279776_
      (let ((_g279775_ (let () (declare (not safe)) (##length _g279776_))))
        (cond ((let () (declare (not safe)) (##fx= _g279775_ 1))
               (apply std/text/hex#hex-encode__0 _g279776_))
              ((let () (declare (not safe)) (##fx= _g279775_ 2))
               (apply std/text/hex#hex-encode__1 _g279776_))
              ((let () (declare (not safe)) (##fx= _g279775_ 3))
               (apply std/text/hex#hex-encode__% _g279776_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/hex#hex-encode
                _g279776_))))))
  (define std/text/hex#hex
    (lambda (_u4162449_)
      (let ()
        (declare (not safe))
        (##string-ref std/text/hex#hexes _u4162449_))))
  (define std/text/hex#unhexes-len (char->integer '#\g))
  (define std/text/hex#unhexes (make-u8vector std/text/hex#unhexes-len '255))
  (let _loop162443_ ((_i162445_ '0))
    (if (<= _i162445_ '15)
        (begin
          (let ((_c162447_ (std/text/hex#hex _i162445_)))
            (let ((__tmp279777 (char->integer _c162447_)))
              (declare (not safe))
              (##u8vector-set! std/text/hex#unhexes __tmp279777 _i162445_))
            (let ((__tmp279778 (char->integer (char-upcase _c162447_))))
              (declare (not safe))
              (##u8vector-set! std/text/hex#unhexes __tmp279778 _i162445_)))
          (_loop162443_ (+ _i162445_ '1)))
        '#!void))
  (define std/text/hex#unhex*
    (lambda (_char162437_)
      (letrec* ((_i162439_ (char->integer _char162437_)))
        (if (let ()
              (declare (not safe))
              (##fx< '-1 _i162439_ std/text/hex#unhexes-len))
            (let ((_d162441_
                   (let ()
                     (declare (not safe))
                     (##u8vector-ref std/text/hex#unhexes _i162439_))))
              (if (let () (declare (not safe)) (##fx< _d162441_ '16))
                  _d162441_
                  '#f))
            '#f))))
  (define std/text/hex#unhex
    (lambda (_char162432_)
      (let ((_$e162434_ (std/text/hex#unhex* _char162432_)))
        (if _$e162434_ _$e162434_ (error '"invalid hex char" _char162432_)))))
  (define std/text/hex#hex-decode-nibble
    (lambda (_string162429_ _pos162430_)
      (std/text/hex#unhex
       (let ()
         (declare (not safe))
         (##string-ref _string162429_ _pos162430_)))))
  (define std/text/hex#hex-decode-byte
    (lambda (_string162426_ _pos162427_)
      (let ((__tmp279780
             (let ((__tmp279781
                    (std/text/hex#hex-decode-nibble
                     _string162426_
                     _pos162427_)))
               (declare (not safe))
               (##fxarithmetic-shift __tmp279781 '4)))
            (__tmp279779
             (std/text/hex#hex-decode-nibble
              _string162426_
              (let () (declare (not safe)) (##fx+ _pos162427_ '1)))))
        (declare (not safe))
        (##fx+ __tmp279780 __tmp279779))))
  (define std/text/hex#hex-decode__%
    (lambda (_str162390_ _start162391_ _end162392_)
      (letrec* ((_len162394_
                 (- (let ((_$e162405_ _end162392_))
                      (if _$e162405_ _$e162405_ (string-length _str162390_)))
                    _start162391_))
                (_blen162395_
                 (let ((__tmp279782
                        (let () (declare (not safe)) (##fx+ _len162394_ '1))))
                   (declare (not safe))
                   (##fxquotient __tmp279782 '2)))
                (_bytes162396_ (make-u8vector _blen162395_))
                (_hexes-start162397_
                 (let ((__tmp279783
                        (let ()
                          (declare (not safe))
                          (##fxand _len162394_ '1))))
                   (declare (not safe))
                   (##fx- _start162391_ __tmp279783))))
        (let _lp162399_ ((_n162401_ '0))
          (if (let () (declare (not safe)) (##fx< _n162401_ _blen162395_))
              (let ((_off162403_
                     (let ((__tmp279784
                            (let ()
                              (declare (not safe))
                              (##fxarithmetic-shift _n162401_ '1))))
                       (declare (not safe))
                       (##fx+ _hexes-start162397_ __tmp279784))))
                (let ((__tmp279785
                       (if (let ()
                             (declare (not safe))
                             (##fx< _off162403_ _start162391_))
                           (std/text/hex#hex-decode-nibble
                            _str162390_
                            (let ()
                              (declare (not safe))
                              (##fx+ _off162403_ '1)))
                           (std/text/hex#hex-decode-byte
                            _str162390_
                            _off162403_))))
                  (declare (not safe))
                  (##u8vector-set! _bytes162396_ _n162401_ __tmp279785))
                (_lp162399_
                 (let () (declare (not safe)) (##fx+ _n162401_ '1))))
              '#!void))
        _bytes162396_)))
  (define std/text/hex#hex-decode__0
    (lambda (_str162411_)
      (let* ((_start162413_ '0) (_end162415_ '#f))
        (std/text/hex#hex-decode__% _str162411_ _start162413_ _end162415_))))
  (define std/text/hex#hex-decode__1
    (lambda (_str162417_ _start162418_)
      (let ((_end162420_ '#f))
        (std/text/hex#hex-decode__% _str162417_ _start162418_ _end162420_))))
  (define std/text/hex#hex-decode
    (lambda _g279787_
      (let ((_g279786_ (let () (declare (not safe)) (##length _g279787_))))
        (cond ((let () (declare (not safe)) (##fx= _g279786_ 1))
               (apply std/text/hex#hex-decode__0 _g279787_))
              ((let () (declare (not safe)) (##fx= _g279786_ 2))
               (apply std/text/hex#hex-decode__1 _g279787_))
              ((let () (declare (not safe)) (##fx= _g279786_ 3))
               (apply std/text/hex#hex-decode__% _g279787_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/hex#hex-decode
                _g279787_)))))))
