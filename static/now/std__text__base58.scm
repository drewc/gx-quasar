(declare (block) (standard-bindings) (extended-bindings))
(begin
  (declare (not safe))
  (define std/text/base58#alphabet::t
    (make-struct-type
     'std/text/base58#alphabet::t
     '#f
     '2
     'alphabet
     '((final: . #t))
     ':init!
     '(enc dec)))
  (define std/text/base58#alphabet?
    (make-struct-predicate std/text/base58#alphabet::t))
  (define std/text/base58#make-alphabet
    (lambda _$args165339_
      (apply make-struct-instance std/text/base58#alphabet::t _$args165339_)))
  (define std/text/base58#alphabet-enc
    (make-struct-field-accessor std/text/base58#alphabet::t '0))
  (define std/text/base58#alphabet-dec
    (make-struct-field-accessor std/text/base58#alphabet::t '1))
  (define std/text/base58#alphabet-enc-set!
    (make-struct-field-mutator std/text/base58#alphabet::t '0))
  (define std/text/base58#alphabet-dec-set!
    (make-struct-field-mutator std/text/base58#alphabet::t '1))
  (define std/text/base58#&alphabet-enc
    (make-struct-field-unchecked-accessor std/text/base58#alphabet::t '0))
  (define std/text/base58#&alphabet-dec
    (make-struct-field-unchecked-accessor std/text/base58#alphabet::t '1))
  (define std/text/base58#&alphabet-enc-set!
    (make-struct-field-unchecked-mutator std/text/base58#alphabet::t '0))
  (define std/text/base58#&alphabet-dec-set!
    (make-struct-field-unchecked-mutator std/text/base58#alphabet::t '1))
  (define std/text/base58#alphabet:::init!
    (lambda (_self165326_ _str165327_)
      (let* ((_alpha165329_ (string->list _str165327_))
             (_enc165331_ (list->vector _alpha165329_))
             (_dec165333_ (make-vector '128 '#f)))
        (for-each
         (lambda (_i165336_ _a165337_)
           (vector-set! _dec165333_ (char->integer _a165337_) _i165336_))
         (iota (string-length _str165327_))
         _alpha165329_)
        (if (##fx< '2 (##vector-length _self165326_))
            (begin
              (##vector-set! _self165326_ '1 _enc165331_)
              (##vector-set! _self165326_ '2 _dec165333_))
            (error '"struct-instance-init!: too many arguments for struct"
                   _self165326_)))))
  (bind-method!
   std/text/base58#alphabet::t
   ':init!
   std/text/base58#alphabet:::init!
   '#f)
  (define std/text/base58#alphabet-encode
    (lambda (_ab165200_ _i165201_)
      (vector-ref
       (##unchecked-structure-ref
        _ab165200_
        '1
        std/text/base58#alphabet::t
        '#f)
       _i165201_)))
  (define std/text/base58#alphabet-decode
    (lambda (_ab165195_ _char165196_)
      (let ((_i165198_ (char->integer _char165196_)))
        (if (fx< _i165198_ '128)
            (vector-ref
             (##unchecked-structure-ref
              _ab165195_
              '2
              std/text/base58#alphabet::t
              '#f)
             _i165198_)
            '#f))))
  (define std/text/base58#base58-btc-alphabet
    (let ((__obj279788 (make-object std/text/base58#alphabet::t '2)))
      (std/text/base58#alphabet:::init!
       __obj279788
       '"123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz")
      __obj279788))
  (define std/text/base58#base58-flickr-alphabet
    (let ((__obj279789 (make-object std/text/base58#alphabet::t '2)))
      (std/text/base58#alphabet:::init!
       __obj279789
       '"123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ")
      __obj279789))
  (define std/text/base58#base58-encode__%
    (lambda (_bytes165159_ _ab165160_)
      (let* ((_idx165162_
              (fx+ (fxquotient (fx* (u8vector-length _bytes165159_) '138) '100)
                   '1))
             (_str165164_ (make-string _idx165162_)))
        (let _lp165167_ ((_bn165169_
                          (std/text/base58#bytes->integer _bytes165159_))
                         (_idx165170_ _idx165162_))
          (if (zero? _bn165169_)
              (let ((_zero165172_
                     (std/text/base58#alphabet-encode _ab165160_ '0)))
                (let _pad165174_ ((_i165176_ '0) (_idx165177_ _idx165170_))
                  (if (and (fx< _i165176_ (u8vector-length _bytes165159_))
                           (fxzero? (u8vector-ref _bytes165159_ _i165176_)))
                      (let ((_idx165179_ (fx- _idx165177_ '1)))
                        (string-set! _str165164_ _idx165179_ _zero165172_)
                        (_pad165174_ (fx+ _i165176_ '1) _idx165179_))
                      (substring
                       _str165164_
                       _idx165177_
                       (string-length _str165164_)))))
              (let ((_bn165181_ (quotient _bn165169_ '58))
                    (_mo165182_ (modulo _bn165169_ '58))
                    (_idx165183_ (fx- _idx165170_ '1)))
                (string-set!
                 _str165164_
                 _idx165183_
                 (std/text/base58#alphabet-encode _ab165160_ _mo165182_))
                (_lp165167_ _bn165181_ _idx165183_)))))))
  (define std/text/base58#base58-encode__0
    (lambda (_bytes165188_)
      (let ((_ab165190_ std/text/base58#base58-btc-alphabet))
        (std/text/base58#base58-encode__% _bytes165188_ _ab165190_))))
  (define std/text/base58#base58-encode
    (lambda _g279791_
      (let ((_g279790_ (##length _g279791_)))
        (cond ((##fx= _g279790_ 1)
               (apply std/text/base58#base58-encode__0 _g279791_))
              ((##fx= _g279790_ 2)
               (apply std/text/base58#base58-encode__% _g279791_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/base58#base58-encode
                _g279791_))))))
  (define std/text/base58#base58-decode__%
    (lambda (_str165121_ _ab165122_)
      (letrec* ((_leading-zeros165124_
                 (let ((_zero165142_
                        (std/text/base58#alphabet-encode _ab165122_ '0)))
                   (let _lp165144_ ((_i165146_ '0))
                     (if (and (fx< _i165146_ (string-length _str165121_))
                              (eq? _zero165142_
                                   (string-ref _str165121_ _i165146_)))
                         (_lp165144_ (fx+ _i165146_ '1))
                         (make-u8vector _i165146_))))))
        (let _lp165126_ ((_i165128_ '0) (_bn165129_ '0))
          (if (fx< _i165128_ (string-length _str165121_))
              (let* ((_char165131_ (string-ref _str165121_ _i165128_))
                     (_int165133_ (char->integer _char165131_))
                     (_g279792_
                      (if (fx< _int165133_ '128)
                          '#!void
                          (std/error#raise-io-error
                           'base58-decode
                           '"Invalid character"
                           _str165121_
                           _char165131_))))
                (let ((_$e165137_
                       (std/text/base58#alphabet-decode
                        _ab165122_
                        _int165133_)))
                  (if _$e165137_
                      ((lambda (_c165140_)
                         (_lp165126_
                          (fx+ _i165128_ '1)
                          (+ (* _bn165129_ '58) _c165140_)))
                       _$e165137_)
                      (std/error#raise-io-error
                       'base58-decode
                       '"Invalid character"
                       _str165121_
                       _char165131_))))
              (u8vector-append
               _leading-zeros165124_
               (std/text/base58#integer->bytes _bn165129_)))))))
  (define std/text/base58#base58-decode__0
    (lambda (_str165151_)
      (let ((_ab165153_ std/text/base58#base58-btc-alphabet))
        (std/text/base58#base58-decode__% _str165151_ _ab165153_))))
  (define std/text/base58#base58-decode
    (lambda _g279794_
      (let ((_g279793_ (##length _g279794_)))
        (cond ((##fx= _g279793_ 1)
               (apply std/text/base58#base58-decode__0 _g279794_))
              ((##fx= _g279793_ 2)
               (apply std/text/base58#base58-decode__% _g279794_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/text/base58#base58-decode
                _g279794_))))))
  (define std/text/base58#bytes->integer
    (lambda (_bytes165111_)
      (let _lp165113_ ((_i165115_ '0) (_r165116_ '0))
        (if (fx< _i165115_ (u8vector-length _bytes165111_))
            (let ((_b165118_ (u8vector-ref _bytes165111_ _i165115_)))
              (_lp165113_
               (fx+ _i165115_ '1)
               (bitwise-ior (arithmetic-shift _r165116_ '8) _b165118_)))
            _r165116_))))
  (define std/text/base58#integer->bytes
    (lambda (_x165104_)
      (let _lp165106_ ((_x165108_ _x165104_) (_r165109_ '()))
        (if (positive? _x165108_)
            (_lp165106_
             (arithmetic-shift _x165108_ '-8)
             (cons (bitwise-and _x165108_ '255) _r165109_))
            (list->u8vector _r165109_))))))
