(declare (block) (standard-bindings) (extended-bindings))
(begin
  (declare (not safe))
  (define std/generic/dispatch#type-of
    (lambda (_obj5338_)
      (declare (not interrupts-enabled))
      (let ((_t5341_ (##type _obj5338_)))
        (if (##fx= _t5341_ (macro-type-mem1))
            (let ((_st5343_ (##subtype _obj5338_)))
              (if (##fx= _st5343_ (macro-subtype-structure))
                  (##type-id (##structure-type _obj5338_))
                  (if (##fx= _st5343_ (macro-subtype-boxvalues))
                      (if (##fx= (##vector-length _obj5338_) '1) 'box 'values)
                      (##vector-ref
                       std/generic/dispatch#+subtype-id+
                       _st5343_))))
            (if (##fx= _t5341_ (macro-type-mem2))
                'pair
                (if (##fx= _t5341_ (macro-type-fixnum))
                    'fixnum
                    (if (##char? _obj5338_)
                        'char
                        (if (##eq? _obj5338_ '())
                            'null
                            (if (##eq? _obj5338_ '#f)
                                'boolean
                                (if (##eq? _obj5338_ '#t)
                                    'boolean
                                    (if (##eq? _obj5338_ '#!void)
                                        'void
                                        (if (##eq? _obj5338_ '#!eof)
                                            'eof
                                            'unknown))))))))))))
  (define std/generic/dispatch#linear-type-of
    (lambda (_obj5330_)
      (let ((_t5332_ (##type _obj5330_)))
        (if (##fx= _t5332_ (macro-type-mem1))
            (let ((_st5334_ (##subtype _obj5330_)))
              (if (##fx= _st5334_ (macro-subtype-structure))
                  (let ((_klass5336_ (##structure-type _obj5330_)))
                    (std/generic/dispatch#type-linearize-class _klass5336_))
                  (if (##fx= _st5334_ (macro-subtype-boxvalues))
                      (if (##fx= (##vector-length _obj5330_) '1)
                          '(box t)
                          '(values t))
                      (##vector-ref
                       std/generic/dispatch#+subtype-linear+
                       _st5334_))))
            (if (##fx= _t5332_ (macro-type-mem2))
                '(pair t)
                (if (##fx= _t5332_ (macro-type-fixnum))
                    '(fixnum integer real number t)
                    (if (##char? _obj5330_)
                        '(char t)
                        (if (##eq? _obj5330_ '())
                            '(null t)
                            (if (##eq? _obj5330_ '#f)
                                '(boolean t)
                                (if (##eq? _obj5330_ '#t)
                                    '(boolean t)
                                    (if (##eq? _obj5330_ '#!void)
                                        '(void t)
                                        (if (##eq? _obj5330_ '#!eof)
                                            '(eof t)
                                            '(unknown)))))))))))))
  (define std/generic/dispatch#type-linearize-class
    (lambda (_klass5328_)
      (if (type-descriptor? _klass5328_)
          (if (type-descriptor-mixin _klass5328_)
              (std/generic/dispatch#type-linearize-class-type _klass5328_)
              (std/generic/dispatch#type-linearize-struct-type _klass5328_))
          (std/generic/dispatch#type-linearize-record-type__0 _klass5328_))))
  (define std/generic/dispatch#type-linearize-class-type
    (lambda (_klass5288_)
      (let _lp5290_ ((_rest5292_ (type-descriptor-mixin _klass5288_))
                     (_r5293_ (cons (##type-id _klass5288_) '())))
        (let* ((_rest52945302_ _rest5292_)
               (_else52965310_ (lambda () (foldl1 cons '(object t) _r5293_)))
               (_K52985316_
                (lambda (_rest5313_ _klass5314_)
                  (_lp5290_
                   _rest5313_
                   (cons (##type-id _klass5314_) _r5293_)))))
          (if (##pair? _rest52945302_)
              (let ((_hd52995319_ (##car _rest52945302_))
                    (_tl53005321_ (##cdr _rest52945302_)))
                (let* ((_klass5324_ _hd52995319_) (_rest5326_ _tl53005321_))
                  (_K52985316_ _rest5326_ _klass5324_)))
              (_else52965310_))))))
  (define std/generic/dispatch#type-linearize-struct-type
    (lambda (_klass5286_)
      (std/generic/dispatch#type-linearize-record-type__%
       _klass5286_
       '(object t))))
  (define std/generic/dispatch#type-linearize-record-type__%
    (lambda (_klass5268_ _base5269_)
      (let _lp5271_ ((_klass5273_ _klass5268_) (_r5274_ '()))
        (if (##type? _klass5273_)
            (_lp5271_
             (##type-super _klass5273_)
             (cons (##type-id _klass5273_) _r5274_))
            (foldl1 cons _base5269_ _r5274_)))))
  (define std/generic/dispatch#type-linearize-record-type__0
    (lambda (_klass5279_)
      (let ((_base5281_ '(t)))
        (std/generic/dispatch#type-linearize-record-type__%
         _klass5279_
         _base5281_))))
  (define std/generic/dispatch#type-linearize-record-type
    (lambda _g272625_
      (let ((_g272624_ (##length _g272625_)))
        (cond ((##fx= _g272624_ 1)
               (apply std/generic/dispatch#type-linearize-record-type__0
                      _g272625_))
              ((##fx= _g272624_ 2)
               (apply std/generic/dispatch#type-linearize-record-type__%
                      _g272625_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/generic/dispatch#type-linearize-record-type
                _g272625_))))))
  (define std/generic/dispatch#+subtype-id+ (make-vector '32 'unknown))
  (define std/generic/dispatch#+subtype-linear+ (make-vector '32 '(unknown)))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-vector)
   'vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-vector)
   '(vector t))
  (vector-set! std/generic/dispatch#+subtype-id+ (macro-subtype-pair) 'pair)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-pair)
   '(pair t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-ratnum)
   'ratnum)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-ratnum)
   '(ratnum real number t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-cpxnum)
   'cpxnum)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-cpxnum)
   '(cpxnum number t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-symbol)
   'symbol)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-symbol)
   '(symbol t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-keyword)
   'keyword)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-keyword)
   '(keyword t))
  (vector-set! std/generic/dispatch#+subtype-id+ (macro-subtype-frame) 'frame)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-frame)
   '(frame t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-continuation)
   'continuation)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-continuation)
   '(continuation t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-promise)
   'promise)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-promise)
   '(promise t))
  (vector-set! std/generic/dispatch#+subtype-id+ (macro-subtype-weak) 'weak)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-weak)
   '(weak t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-procedure)
   'procedure)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-procedure)
   '(procedure t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-foreign)
   'foreign)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-foreign)
   '(foreign t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-string)
   'string)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-string)
   '(string t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-s8vector)
   's8vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-s8vector)
   '(s8vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-u8vector)
   'u8vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-u8vector)
   '(u8vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-s16vector)
   's16vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-s16vector)
   '(s16vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-u16vector)
   'u16vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-u16vector)
   '(u16vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-s32vector)
   's32vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-s32vector)
   '(s32vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-u32vector)
   'u32vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-u32vector)
   '(u32vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-f32vector)
   'f32vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-f32vector)
   '(f32vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-s64vector)
   's64vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-s64vector)
   '(s64vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-u64vector)
   'u64vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-u64vector)
   '(u64vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-f64vector)
   'f64vector)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-f64vector)
   '(f64vector t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-flonum)
   'flonum)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-flonum)
   '(flonum real number t))
  (vector-set!
   std/generic/dispatch#+subtype-id+
   (macro-subtype-bignum)
   'bignum)
  (vector-set!
   std/generic/dispatch#+subtype-linear+
   (macro-subtype-bignum)
   '(bignum integer real number t))
  (define std/generic/dispatch#generic::t
    (make-struct-type
     'std/generic/dispatch#generic::t
     '#f
     '4
     'generic
     '((final: . #t))
     ':init!
     '(id tabs default mx)))
  (define std/generic/dispatch#generic?
    (make-struct-predicate std/generic/dispatch#generic::t))
  (define std/generic/dispatch#make-generic
    (lambda _$args5264_
      (apply make-struct-instance
             std/generic/dispatch#generic::t
             _$args5264_)))
  (define std/generic/dispatch#generic-id
    (make-struct-field-accessor std/generic/dispatch#generic::t '0))
  (define std/generic/dispatch#generic-tabs
    (make-struct-field-accessor std/generic/dispatch#generic::t '1))
  (define std/generic/dispatch#generic-default
    (make-struct-field-accessor std/generic/dispatch#generic::t '2))
  (define std/generic/dispatch#generic-mx
    (make-struct-field-accessor std/generic/dispatch#generic::t '3))
  (define std/generic/dispatch#generic-id-set!
    (make-struct-field-mutator std/generic/dispatch#generic::t '0))
  (define std/generic/dispatch#generic-tabs-set!
    (make-struct-field-mutator std/generic/dispatch#generic::t '1))
  (define std/generic/dispatch#generic-default-set!
    (make-struct-field-mutator std/generic/dispatch#generic::t '2))
  (define std/generic/dispatch#generic-mx-set!
    (make-struct-field-mutator std/generic/dispatch#generic::t '3))
  (define std/generic/dispatch#&generic-id
    (make-struct-field-unchecked-accessor std/generic/dispatch#generic::t '0))
  (define std/generic/dispatch#&generic-tabs
    (make-struct-field-unchecked-accessor std/generic/dispatch#generic::t '1))
  (define std/generic/dispatch#&generic-default
    (make-struct-field-unchecked-accessor std/generic/dispatch#generic::t '2))
  (define std/generic/dispatch#&generic-mx
    (make-struct-field-unchecked-accessor std/generic/dispatch#generic::t '3))
  (define std/generic/dispatch#&generic-id-set!
    (make-struct-field-unchecked-mutator std/generic/dispatch#generic::t '0))
  (define std/generic/dispatch#&generic-tabs-set!
    (make-struct-field-unchecked-mutator std/generic/dispatch#generic::t '1))
  (define std/generic/dispatch#&generic-default-set!
    (make-struct-field-unchecked-mutator std/generic/dispatch#generic::t '2))
  (define std/generic/dispatch#&generic-mx-set!
    (make-struct-field-unchecked-mutator std/generic/dispatch#generic::t '3))
  (define std/generic/dispatch#generic:::init!__%
    (lambda (_self5245_ _id5246_ _default5247_)
      (if (or (not _default5247_) (procedure? _default5247_))
          '#!void
          (error '"Bad default method; expected procedure or #f"
                 _id5246_
                 _default5247_))
      (if (##fx< '4 (##vector-length _self5245_))
          (begin
            (##vector-set! _self5245_ '1 _id5246_)
            (##vector-set! _self5245_ '2 (vector))
            (##vector-set! _self5245_ '3 _default5247_)
            (##vector-set! _self5245_ '4 (make-mutex 'generic)))
          (error '"struct-instance-init!: too many arguments for struct"
                 _self5245_))))
  (define std/generic/dispatch#generic:::init!__0
    (lambda (_self5255_ _id5256_)
      (let ((_default5258_ '#f))
        (std/generic/dispatch#generic:::init!__%
         _self5255_
         _id5256_
         _default5258_))))
  (define std/generic/dispatch#generic:::init!
    (lambda _g272627_
      (let ((_g272626_ (##length _g272627_)))
        (cond ((##fx= _g272626_ 2)
               (apply std/generic/dispatch#generic:::init!__0 _g272627_))
              ((##fx= _g272626_ 3)
               (apply std/generic/dispatch#generic:::init!__% _g272627_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/generic/dispatch#generic:::init!
                _g272627_))))))
  (bind-method!
   std/generic/dispatch#generic::t
   ':init!
   std/generic/dispatch#generic:::init!
   '#f)
  (define std/generic/dispatch#generic-table::t
    (make-struct-type
     'std/generic/dispatch#generic-table::t
     '#f
     '3
     'generic-table
     '((final: . #t))
     ':init!
     '(methods cache mx)))
  (define std/generic/dispatch#generic-table?
    (make-struct-predicate std/generic/dispatch#generic-table::t))
  (define std/generic/dispatch#make-generic-table
    (lambda _$args5119_
      (apply make-struct-instance
             std/generic/dispatch#generic-table::t
             _$args5119_)))
  (define std/generic/dispatch#generic-table-methods
    (make-struct-field-accessor std/generic/dispatch#generic-table::t '0))
  (define std/generic/dispatch#generic-table-cache
    (make-struct-field-accessor std/generic/dispatch#generic-table::t '1))
  (define std/generic/dispatch#generic-table-mx
    (make-struct-field-accessor std/generic/dispatch#generic-table::t '2))
  (define std/generic/dispatch#generic-table-methods-set!
    (make-struct-field-mutator std/generic/dispatch#generic-table::t '0))
  (define std/generic/dispatch#generic-table-cache-set!
    (make-struct-field-mutator std/generic/dispatch#generic-table::t '1))
  (define std/generic/dispatch#generic-table-mx-set!
    (make-struct-field-mutator std/generic/dispatch#generic-table::t '2))
  (define std/generic/dispatch#&generic-table-methods
    (make-struct-field-unchecked-accessor
     std/generic/dispatch#generic-table::t
     '0))
  (define std/generic/dispatch#&generic-table-cache
    (make-struct-field-unchecked-accessor
     std/generic/dispatch#generic-table::t
     '1))
  (define std/generic/dispatch#&generic-table-mx
    (make-struct-field-unchecked-accessor
     std/generic/dispatch#generic-table::t
     '2))
  (define std/generic/dispatch#&generic-table-methods-set!
    (make-struct-field-unchecked-mutator
     std/generic/dispatch#generic-table::t
     '0))
  (define std/generic/dispatch#&generic-table-cache-set!
    (make-struct-field-unchecked-mutator
     std/generic/dispatch#generic-table::t
     '1))
  (define std/generic/dispatch#&generic-table-mx-set!
    (make-struct-field-unchecked-mutator
     std/generic/dispatch#generic-table::t
     '2))
  (define std/generic/dispatch#generic-table:::init!
    (lambda (_self5117_)
      (if (##fx< '3 (##vector-length _self5117_))
          (begin
            (##vector-set! _self5117_ '1 '())
            (##vector-set! _self5117_ '2 (make-vector '10 '#f))
            (##vector-set! _self5117_ '3 (make-mutex 'generic-table)))
          (error '"struct-instance-init!: too many arguments for struct"
                 _self5117_))))
  (bind-method!
   std/generic/dispatch#generic-table::t
   ':init!
   std/generic/dispatch#generic-table:::init!
   '#f)
  (define std/generic/dispatch#generic-bind!
    (lambda (_gen4976_ _signature4977_ _method4978_)
      (if (procedure? _method4978_)
          '#!void
          (error '"Bad method; expected procedure" _method4978_))
      (let ((_arity4980_ (length _signature4977_))
            (_mx4981_
             (##unchecked-structure-ref
              _gen4976_
              '4
              std/generic/dispatch#generic::t
              '#f)))
        (mutex-lock! _mx4981_)
        (let ((_tabs4983_
               (##unchecked-structure-ref
                _gen4976_
                '2
                std/generic/dispatch#generic::t
                '#f)))
          (if (##fx< _arity4980_ (##vector-length _tabs4983_))
              (let ((_$e4985_ (##vector-ref _tabs4983_ _arity4980_)))
                (if _$e4985_
                    ((lambda (_gtab4988_)
                       (std/generic/dispatch#generic-bind-method!
                        _gtab4988_
                        _signature4977_
                        _method4978_))
                     _$e4985_)
                    (let ((_gtab4990_
                           (let ((__obj272622
                                  (make-object
                                   std/generic/dispatch#generic-table::t
                                   '3)))
                             (std/generic/dispatch#generic-table:::init!
                              __obj272622)
                             __obj272622)))
                      (##vector-set! _tabs4983_ _arity4980_ _gtab4990_)
                      (std/generic/dispatch#generic-bind-method!
                       _gtab4990_
                       _signature4977_
                       _method4978_))))
              (let ((_new-tabs4992_ (make-vector (##fx+ _arity4980_ '1) '#f))
                    (_gtab4993_
                     (let ((__obj272623
                            (make-object
                             std/generic/dispatch#generic-table::t
                             '3)))
                       (std/generic/dispatch#generic-table:::init! __obj272623)
                       __obj272623)))
                (##subvector-move!
                 _tabs4983_
                 '0
                 (##vector-length _tabs4983_)
                 _new-tabs4992_
                 '0)
                (##vector-set! _new-tabs4992_ _arity4980_ _gtab4993_)
                (##unchecked-structure-set!
                 _gen4976_
                 _new-tabs4992_
                 '2
                 std/generic/dispatch#generic::t
                 '#f)
                (std/generic/dispatch#generic-bind-method!
                 _gtab4993_
                 _signature4977_
                 _method4978_))))
        (mutex-unlock! _mx4981_))))
  (define std/generic/dispatch#generic-bind-method!
    (lambda (_gtab4949_ _signature4950_ _method4951_)
      (letrec ((_invalidate?4953_
                (lambda (_cache4965_)
                  (let ((_cache-len4967_ (##vector-length _cache4965_)))
                    (let _lp4969_ ((_i4971_ '0))
                      (if (##fx< _i4971_ _cache-len4967_)
                          (let ((_$e4973_ (##vector-ref _cache4965_ _i4971_)))
                            (if _$e4973_
                                _$e4973_
                                (_lp4969_ (##fx+ _i4971_ '1))))
                          '#f))))))
        (let _again4955_ ()
          (let* ((_old-methods4958_
                  (##unchecked-structure-ref
                   _gtab4949_
                   '1
                   std/generic/dispatch#generic-table::t
                   '#f))
                 (_new-methods4960_
                  (std/generic/dispatch#generic-add-method
                   _old-methods4958_
                   _signature4950_
                   _method4951_)))
            (let ((_mx4963_
                   (##unchecked-structure-ref
                    _gtab4949_
                    '3
                    std/generic/dispatch#generic-table::t
                    '#f)))
              (mutex-lock! _mx4963_)
              (if (eq? _old-methods4958_
                       (##unchecked-structure-ref
                        _gtab4949_
                        '1
                        std/generic/dispatch#generic-table::t
                        '#f))
                  (begin
                    (##unchecked-structure-set!
                     _gtab4949_
                     _new-methods4960_
                     '1
                     std/generic/dispatch#generic-table::t
                     '#f)
                    (if (_invalidate?4953_
                         (##unchecked-structure-ref
                          _gtab4949_
                          '2
                          std/generic/dispatch#generic-table::t
                          '#f))
                        (##unchecked-structure-set!
                         _gtab4949_
                         (make-vector
                          (##vector-length
                           (##unchecked-structure-ref
                            _gtab4949_
                            '2
                            std/generic/dispatch#generic-table::t
                            '#f))
                          '#f)
                         '2
                         std/generic/dispatch#generic-table::t
                         '#f)
                        '#!void)
                    (mutex-unlock! _mx4963_))
                  (begin (mutex-unlock! _mx4963_) (_again4955_)))))))))
  (define std/generic/dispatch#generic-add-method
    (lambda (_methods4880_ _signature4881_ _method4882_)
      (let _recur4884_ ((_rest4886_ _methods4880_))
        (let* ((_rest48874895_ _rest4886_)
               (_else48894903_
                (lambda () (cons (cons _signature4881_ _method4882_) '())))
               (_K48914937_
                (lambda (_rest4906_ _hd4907_)
                  (let* ((_hd49084915_ _hd4907_)
                         (_E49104919_
                          (lambda ()
                            (error '"No clause matching" _hd49084915_)))
                         (_K49114925_
                          (lambda (_hd-method4922_ _hd-signature4923_)
                            (if (std/generic/dispatch#generic-dispatch-before?
                                 _signature4881_
                                 _hd-signature4923_)
                                (cons (cons _signature4881_ _method4882_)
                                      (cons _hd4907_ _rest4906_))
                                (if (equal? _signature4881_ _hd-signature4923_)
                                    (cons (cons _signature4881_ _method4882_)
                                          _rest4906_)
                                    (cons _hd4907_
                                          (_recur4884_ _rest4906_)))))))
                    (if (##pair? _hd49084915_)
                        (let ((_hd49124928_ (##car _hd49084915_))
                              (_tl49134930_ (##cdr _hd49084915_)))
                          (let* ((_hd-signature4933_ _hd49124928_)
                                 (_hd-method4935_ _tl49134930_))
                            (_K49114925_ _hd-method4935_ _hd-signature4933_)))
                        (_E49104919_))))))
          (if (##pair? _rest48874895_)
              (let ((_hd48924940_ (##car _rest48874895_))
                    (_tl48934942_ (##cdr _rest48874895_)))
                (let* ((_hd4945_ _hd48924940_) (_rest4947_ _tl48934942_))
                  (_K48914937_ _rest4947_ _hd4945_)))
              (_else48894903_))))))
  (define std/generic/dispatch#generic-dispatch-before?
    (lambda (_sig-a4808_ _sig-b4809_)
      (let _lp4811_ ((_rest-a4813_ _sig-a4808_) (_rest-b4814_ _sig-b4809_))
        (let* ((_rest-a48154823_ _rest-a4813_)
               (_else48174831_ (lambda () '#f))
               (_K48194868_
                (lambda (_rest-a4834_ _type-a4835_)
                  (let* ((_rest-b48364843_ _rest-b4814_)
                         (_E48384847_
                          (lambda ()
                            (error '"No clause matching" _rest-b48364843_)))
                         (_K48394856_
                          (lambda (_rest-b4850_ _type-b4851_)
                            (if (not (std/generic/dispatch#generic-dispatch-type<?
                                      _type-b4851_
                                      _type-a4835_))
                                (let ((_$e4853_
                                       (std/generic/dispatch#generic-dispatch-type<?
                                        _type-a4835_
                                        _type-b4851_)))
                                  (if _$e4853_
                                      _$e4853_
                                      (_lp4811_ _rest-a4834_ _rest-b4850_)))
                                '#f))))
                    (if (##pair? _rest-b48364843_)
                        (let ((_hd48404859_ (##car _rest-b48364843_))
                              (_tl48414861_ (##cdr _rest-b48364843_)))
                          (let* ((_type-b4864_ _hd48404859_)
                                 (_rest-b4866_ _tl48414861_))
                            (_K48394856_ _rest-b4866_ _type-b4864_)))
                        (_E48384847_))))))
          (if (##pair? _rest-a48154823_)
              (let ((_hd48204871_ (##car _rest-a48154823_))
                    (_tl48214873_ (##cdr _rest-a48154823_)))
                (let* ((_type-a4876_ _hd48204871_) (_rest-a4878_ _tl48214873_))
                  (_K48194868_ _rest-a4878_ _type-a4876_)))
              (_else48174831_))))))
  (define std/generic/dispatch#generic-dispatch-type<?
    (lambda (_type-a4805_ _type-b4806_)
      (memq (car _type-b4806_) _type-a4805_)))
  (define std/generic/dispatch#generic-dispatch
    (lambda (_gen4784_ . _args4785_)
      (let ((_arity4787_ (##length _args4785_))
            (_tabs4788_
             (##unchecked-structure-ref
              _gen4784_
              '2
              std/generic/dispatch#generic::t
              '#f)))
        (let ((_$e4790_
               (if (##fx< _arity4787_ (##vector-length _tabs4788_))
                   (##vector-ref _tabs4788_ _arity4787_)
                   '#f)))
          (if _$e4790_
              ((lambda (_gtab4793_)
                 (let ((_$e4795_
                        (std/generic/dispatch#generic-dispatch-method
                         _gtab4793_
                         _args4785_
                         (##unchecked-structure-ref
                          _gen4784_
                          '3
                          std/generic/dispatch#generic::t
                          '#f))))
                   (if _$e4795_
                       ((lambda (_method4798_) (apply _method4798_ _args4785_))
                        _$e4795_)
                       (error '"No method matching arguments"
                              (##direct-structure-ref
                               _gen4784_
                               '1
                               std/generic/dispatch#generic::t
                               '#f)
                              _args4785_))))
               _$e4790_)
              (let ((_$e4800_
                     (##unchecked-structure-ref
                      _gen4784_
                      '3
                      std/generic/dispatch#generic::t
                      '#f)))
                (if _$e4800_
                    ((lambda (_method4803_) (apply _method4803_ _args4785_))
                     _$e4800_)
                    (error '"No method matching arguments"
                           (##direct-structure-ref
                            _gen4784_
                            '1
                            std/generic/dispatch#generic::t
                            '#f)
                           _args4785_))))))))
  (define std/generic/dispatch#generic-dispatch-method
    (lambda (_gtab4777_ _args4778_ _default4779_)
      (let ((_$e4781_
             (std/generic/dispatch#generic-dispatch-cache-lookup
              (##unchecked-structure-ref
               _gtab4777_
               '2
               std/generic/dispatch#generic-table::t
               '#f)
              _args4778_)))
        (if _$e4781_
            _$e4781_
            (std/generic/dispatch#generic-dispatch-method-ref
             _gtab4777_
             _args4778_
             _default4779_)))))
  (define std/generic/dispatch#generic-dispatch-method-ref
    (lambda (_gtab4763_ _args4764_ _default4765_)
      (let* ((_methods4767_
              (##unchecked-structure-ref
               _gtab4763_
               '1
               std/generic/dispatch#generic-table::t
               '#f))
             (_method4772_
              (let ((_$e4769_
                     (std/generic/dispatch#generic-dispatch-find-method
                      _methods4767_
                      _args4764_)))
                (if _$e4769_ _$e4769_ _default4765_))))
        (if _method4772_
            (let ((_mx4775_
                   (##unchecked-structure-ref
                    _gtab4763_
                    '3
                    std/generic/dispatch#generic-table::t
                    '#f)))
              (mutex-lock! _mx4775_)
              (if (eq? _methods4767_
                       (##unchecked-structure-ref
                        _gtab4763_
                        '1
                        std/generic/dispatch#generic-table::t
                        '#f))
                  (if (std/generic/dispatch#generic-dispatch-cache-lookup
                       (##unchecked-structure-ref
                        _gtab4763_
                        '2
                        std/generic/dispatch#generic-table::t
                        '#f)
                       _args4764_)
                      '#!void
                      (std/generic/dispatch#generic-dispatch-cache!
                       _gtab4763_
                       _args4764_
                       _method4772_))
                  '#!void)
              (mutex-unlock! _mx4775_))
            '#!void)
        _method4772_)))
  (define std/generic/dispatch#generic-dispatch1
    (lambda (_gen4740_ _arg14742_)
      (let* ((_tabs4744_
              (##unchecked-structure-ref
               _gen4740_
               '2
               std/generic/dispatch#generic::t
               '#f))
             (_$e4747_
              (if (##fx< '1 (##vector-length _tabs4744_))
                  (##vector-ref _tabs4744_ '1)
                  '#f)))
        (if _$e4747_
            ((lambda (_gtab4750_)
               (let ((_$e4752_
                      (std/generic/dispatch#generic-dispatch-method1
                       _gtab4750_
                       (##unchecked-structure-ref
                        _gen4740_
                        '3
                        std/generic/dispatch#generic::t
                        '#f)
                       _arg14742_)))
                 (if _$e4752_
                     ((lambda (_method4755_) (_method4755_ _arg14742_))
                      _$e4752_)
                     (error '"No method matching arguments"
                            (##direct-structure-ref
                             _gen4740_
                             '1
                             std/generic/dispatch#generic::t
                             '#f)
                            (cons _arg14742_ '())))))
             _$e4747_)
            (let ((_$e4758_
                   (##unchecked-structure-ref
                    _gen4740_
                    '3
                    std/generic/dispatch#generic::t
                    '#f)))
              (if _$e4758_
                  ((lambda (_method4761_) (_method4761_ _arg14742_)) _$e4758_)
                  (error '"No method matching arguments"
                         (##direct-structure-ref
                          _gen4740_
                          '1
                          std/generic/dispatch#generic::t
                          '#f)
                         (cons _arg14742_ '()))))))))
  (define std/generic/dispatch#generic-dispatch-method1
    (lambda (_gtab4731_ _default4733_ _arg14735_)
      (let ((_$e4737_
             (std/generic/dispatch#generic-dispatch-cache-lookup1
              (##unchecked-structure-ref
               _gtab4731_
               '2
               std/generic/dispatch#generic-table::t
               '#f)
              _arg14735_)))
        (if _$e4737_
            _$e4737_
            (std/generic/dispatch#generic-dispatch-method-ref
             _gtab4731_
             (cons _arg14735_ '())
             _default4733_)))))
  (define std/generic/dispatch#generic-dispatch2
    (lambda (_gen4707_ _arg14709_ _arg24710_)
      (let* ((_tabs4712_
              (##unchecked-structure-ref
               _gen4707_
               '2
               std/generic/dispatch#generic::t
               '#f))
             (_$e4715_
              (if (##fx< '2 (##vector-length _tabs4712_))
                  (##vector-ref _tabs4712_ '2)
                  '#f)))
        (if _$e4715_
            ((lambda (_gtab4718_)
               (let ((_$e4720_
                      (std/generic/dispatch#generic-dispatch-method2
                       _gtab4718_
                       (##unchecked-structure-ref
                        _gen4707_
                        '3
                        std/generic/dispatch#generic::t
                        '#f)
                       _arg14709_
                       _arg24710_)))
                 (if _$e4720_
                     ((lambda (_method4723_)
                        (_method4723_ _arg14709_ _arg24710_))
                      _$e4720_)
                     (error '"No method matching arguments"
                            (##direct-structure-ref
                             _gen4707_
                             '1
                             std/generic/dispatch#generic::t
                             '#f)
                            (cons _arg14709_ (cons _arg24710_ '()))))))
             _$e4715_)
            (let ((_$e4726_
                   (##unchecked-structure-ref
                    _gen4707_
                    '3
                    std/generic/dispatch#generic::t
                    '#f)))
              (if _$e4726_
                  ((lambda (_method4729_) (_method4729_ _arg14709_ _arg24710_))
                   _$e4726_)
                  (error '"No method matching arguments"
                         (##direct-structure-ref
                          _gen4707_
                          '1
                          std/generic/dispatch#generic::t
                          '#f)
                         (cons _arg14709_ (cons _arg24710_ '())))))))))
  (define std/generic/dispatch#generic-dispatch-method2
    (lambda (_gtab4697_ _default4699_ _arg14701_ _arg24702_)
      (let ((_$e4704_
             (std/generic/dispatch#generic-dispatch-cache-lookup2
              (##unchecked-structure-ref
               _gtab4697_
               '2
               std/generic/dispatch#generic-table::t
               '#f)
              _arg14701_
              _arg24702_)))
        (if _$e4704_
            _$e4704_
            (std/generic/dispatch#generic-dispatch-method-ref
             _gtab4697_
             (cons _arg14701_ (cons _arg24702_ '()))
             _default4699_)))))
  (define std/generic/dispatch#generic-dispatch3
    (lambda (_gen4672_ _arg14674_ _arg24675_ _arg34676_)
      (let* ((_tabs4678_
              (##unchecked-structure-ref
               _gen4672_
               '2
               std/generic/dispatch#generic::t
               '#f))
             (_$e4681_
              (if (##fx< '3 (##vector-length _tabs4678_))
                  (##vector-ref _tabs4678_ '3)
                  '#f)))
        (if _$e4681_
            ((lambda (_gtab4684_)
               (let ((_$e4686_
                      (std/generic/dispatch#generic-dispatch-method3
                       _gtab4684_
                       (##unchecked-structure-ref
                        _gen4672_
                        '3
                        std/generic/dispatch#generic::t
                        '#f)
                       _arg14674_
                       _arg24675_
                       _arg34676_)))
                 (if _$e4686_
                     ((lambda (_method4689_)
                        (_method4689_ _arg14674_ _arg24675_ _arg34676_))
                      _$e4686_)
                     (error '"No method matching arguments"
                            (##direct-structure-ref
                             _gen4672_
                             '1
                             std/generic/dispatch#generic::t
                             '#f)
                            (cons _arg14674_
                                  (cons _arg24675_ (cons _arg34676_ '())))))))
             _$e4681_)
            (let ((_$e4692_
                   (##unchecked-structure-ref
                    _gen4672_
                    '3
                    std/generic/dispatch#generic::t
                    '#f)))
              (if _$e4692_
                  ((lambda (_method4695_)
                     (_method4695_ _arg14674_ _arg24675_ _arg34676_))
                   _$e4692_)
                  (error '"No method matching arguments"
                         (##direct-structure-ref
                          _gen4672_
                          '1
                          std/generic/dispatch#generic::t
                          '#f)
                         (cons _arg14674_
                               (cons _arg24675_ (cons _arg34676_ '()))))))))))
  (define std/generic/dispatch#generic-dispatch-method3
    (lambda (_gtab4661_ _default4663_ _arg14665_ _arg24666_ _arg34667_)
      (let ((_$e4669_
             (std/generic/dispatch#generic-dispatch-cache-lookup3
              (##unchecked-structure-ref
               _gtab4661_
               '2
               std/generic/dispatch#generic-table::t
               '#f)
              _arg14665_
              _arg24666_
              _arg34667_)))
        (if _$e4669_
            _$e4669_
            (std/generic/dispatch#generic-dispatch-method-ref
             _gtab4661_
             (cons _arg14665_ (cons _arg24666_ (cons _arg34667_ '())))
             _default4663_)))))
  (define std/generic/dispatch#generic-dispatch4
    (lambda (_gen4635_ _arg14637_ _arg24638_ _arg34639_ _arg44640_)
      (let* ((_tabs4642_
              (##unchecked-structure-ref
               _gen4635_
               '2
               std/generic/dispatch#generic::t
               '#f))
             (_$e4645_
              (if (##fx< '4 (##vector-length _tabs4642_))
                  (##vector-ref _tabs4642_ '4)
                  '#f)))
        (if _$e4645_
            ((lambda (_gtab4648_)
               (let ((_$e4650_
                      (std/generic/dispatch#generic-dispatch-method4
                       _gtab4648_
                       (##unchecked-structure-ref
                        _gen4635_
                        '3
                        std/generic/dispatch#generic::t
                        '#f)
                       _arg14637_
                       _arg24638_
                       _arg34639_
                       _arg44640_)))
                 (if _$e4650_
                     ((lambda (_method4653_)
                        (_method4653_
                         _arg14637_
                         _arg24638_
                         _arg34639_
                         _arg44640_))
                      _$e4650_)
                     (error '"No method matching arguments"
                            (##direct-structure-ref
                             _gen4635_
                             '1
                             std/generic/dispatch#generic::t
                             '#f)
                            (cons _arg14637_
                                  (cons _arg24638_
                                        (cons _arg34639_
                                              (cons _arg44640_ '()))))))))
             _$e4645_)
            (let ((_$e4656_
                   (##unchecked-structure-ref
                    _gen4635_
                    '3
                    std/generic/dispatch#generic::t
                    '#f)))
              (if _$e4656_
                  ((lambda (_method4659_)
                     (_method4659_
                      _arg14637_
                      _arg24638_
                      _arg34639_
                      _arg44640_))
                   _$e4656_)
                  (error '"No method matching arguments"
                         (##direct-structure-ref
                          _gen4635_
                          '1
                          std/generic/dispatch#generic::t
                          '#f)
                         (cons _arg14637_
                               (cons _arg24638_
                                     (cons _arg34639_
                                           (cons _arg44640_ '())))))))))))
  (define std/generic/dispatch#generic-dispatch-method4
    (lambda (_gtab4623_
             _default4625_
             _arg14627_
             _arg24628_
             _arg34629_
             _arg44630_)
      (let ((_$e4632_
             (std/generic/dispatch#generic-dispatch-cache-lookup4
              (##unchecked-structure-ref
               _gtab4623_
               '2
               std/generic/dispatch#generic-table::t
               '#f)
              _arg14627_
              _arg24628_
              _arg34629_
              _arg44630_)))
        (if _$e4632_
            _$e4632_
            (std/generic/dispatch#generic-dispatch-method-ref
             _gtab4623_
             (cons _arg14627_
                   (cons _arg24628_ (cons _arg34629_ (cons _arg44630_ '()))))
             _default4625_)))))
  (define std/generic/dispatch#generic-dispatch-find-method
    (lambda (_methods4553_ _args4554_)
      (let ((_arg-types4556_
             (map std/generic/dispatch#linear-type-of _args4554_)))
        (let _lp4558_ ((_rest4560_ _methods4553_))
          (let* ((_rest45614569_ _rest4560_)
                 (_else45634577_ (lambda () '#f))
                 (_K45654611_
                  (lambda (_rest4580_ _hd4581_)
                    (let* ((_hd45824589_ _hd4581_)
                           (_E45844593_
                            (lambda ()
                              (error '"No clause matching" _hd45824589_)))
                           (_K45854599_
                            (lambda (_method4596_ _signature4597_)
                              (if (std/generic/dispatch#generic-dispatch-match?
                                   _arg-types4556_
                                   _signature4597_)
                                  _method4596_
                                  (_lp4558_ _rest4580_)))))
                      (if (##pair? _hd45824589_)
                          (let ((_hd45864602_ (##car _hd45824589_))
                                (_tl45874604_ (##cdr _hd45824589_)))
                            (let* ((_signature4607_ _hd45864602_)
                                   (_method4609_ _tl45874604_))
                              (_K45854599_ _method4609_ _signature4607_)))
                          (_E45844593_))))))
            (if (##pair? _rest45614569_)
                (let ((_hd45664614_ (##car _rest45614569_))
                      (_tl45674616_ (##cdr _rest45614569_)))
                  (let* ((_hd4619_ _hd45664614_) (_rest4621_ _tl45674616_))
                    (_K45654611_ _rest4621_ _hd4619_)))
                (_else45634577_)))))))
  (define std/generic/dispatch#generic-dispatch-match?
    (lambda (_arg-types4484_ _signature4485_)
      (let _lp4487_ ((_rest-args4489_ _arg-types4484_)
                     (_rest-sign4490_ _signature4485_))
        (let* ((_rest-args44914499_ _rest-args4489_)
               (_else44934507_ (lambda () '#t))
               (_K44954541_
                (lambda (_rest-args4510_ _arg-tids4511_)
                  (let* ((_rest-sign45124519_ _rest-sign4490_)
                         (_E45144523_
                          (lambda ()
                            (error '"No clause matching" _rest-sign45124519_)))
                         (_K45154529_
                          (lambda (_rest-sign4526_ _sign-tids4527_)
                            (if (memq (car _sign-tids4527_) _arg-tids4511_)
                                (_lp4487_ _rest-args4510_ _rest-sign4526_)
                                '#f))))
                    (if (##pair? _rest-sign45124519_)
                        (let ((_hd45164532_ (##car _rest-sign45124519_))
                              (_tl45174534_ (##cdr _rest-sign45124519_)))
                          (let* ((_sign-tids4537_ _hd45164532_)
                                 (_rest-sign4539_ _tl45174534_))
                            (_K45154529_ _rest-sign4539_ _sign-tids4537_)))
                        (_E45144523_))))))
          (if (##pair? _rest-args44914499_)
              (let ((_hd44964544_ (##car _rest-args44914499_))
                    (_tl44974546_ (##cdr _rest-args44914499_)))
                (let* ((_arg-tids4549_ _hd44964544_)
                       (_rest-args4551_ _tl44974546_))
                  (_K44954541_ _rest-args4551_ _arg-tids4549_)))
              (_else44934507_))))))
  (define std/generic/dispatch#generic-dispatch-next
    (lambda (_gen4408_ _method4409_ . _args4410_)
      (letrec ((_drop4412_
                (lambda (_method4434_ _methods4435_)
                  (let _lp4437_ ((_rest4439_ _methods4435_))
                    (let* ((_rest44404450_ _rest4439_)
                           (_else44424458_ (lambda () '()))
                           (_K44444465_
                            (lambda (_rest4461_ _proc4462_ _signature4463_)
                              (if (eq? _method4434_ _proc4462_)
                                  _rest4461_
                                  (_lp4437_ _rest4461_)))))
                      (if (##pair? _rest44404450_)
                          (let ((_hd44454468_ (##car _rest44404450_))
                                (_tl44464470_ (##cdr _rest44404450_)))
                            (if (##pair? _hd44454468_)
                                (let ((_hd44474473_ (##car _hd44454468_))
                                      (_tl44484475_ (##cdr _hd44454468_)))
                                  (let* ((_signature4478_ _hd44474473_)
                                         (_proc4480_ _tl44484475_)
                                         (_rest4482_ _tl44464470_))
                                    (_K44444465_
                                     _rest4482_
                                     _proc4480_
                                     _signature4478_)))
                                (_else44424458_)))
                          (_else44424458_)))))))
        (let ((_arity4414_ (##length _args4410_))
              (_tabs4415_
               (##unchecked-structure-ref
                _gen4408_
                '2
                std/generic/dispatch#generic::t
                '#f)))
          (let ((_$e4417_
                 (if (##fx< _arity4414_ (##vector-length _tabs4415_))
                     (##vector-ref _tabs4415_ _arity4414_)
                     '#f)))
            (if _$e4417_
                ((lambda (_gtab4420_)
                   (let* ((_methods4422_
                           (_drop4412_
                            _method4409_
                            (##unchecked-structure-ref
                             _gtab4420_
                             '1
                             std/generic/dispatch#generic-table::t
                             '#f)))
                          (_$e4424_
                           (std/generic/dispatch#generic-dispatch-find-method
                            _methods4422_
                            _args4410_)))
                     (if _$e4424_
                         ((lambda (_method4427_)
                            (apply _method4427_ _args4410_))
                          _$e4424_)
                         (let ((_$e4429_
                                (##unchecked-structure-ref
                                 _gen4408_
                                 '3
                                 std/generic/dispatch#generic::t
                                 '#f)))
                           (if _$e4429_
                               ((lambda (_method4432_)
                                  (apply _method4432_ _args4410_))
                                _$e4429_)
                               (error '"No next method matching arguments"
                                      (##direct-structure-ref
                                       _gen4408_
                                       '1
                                       std/generic/dispatch#generic::t
                                       '#f)
                                      _args4410_))))))
                 _$e4417_)
                (error '"Cannot dispatch next method; no dispatch table"
                       (##direct-structure-ref
                        _gen4408_
                        '1
                        std/generic/dispatch#generic::t
                        '#f)
                       _args4410_)))))))
  (define std/generic/dispatch#generic-dispatch-cache-lookup
    (lambda (_cache4321_ _args4322_)
      (declare (not interrupts-enabled))
      (letrec ((_lookup4324_
                (lambda (_hash4328_ _shift4329_ _rest4330_)
                  (let* ((_rest43314339_ _rest4330_)
                         (_else43334352_
                          (lambda ()
                            (let* ((_len4347_ (##vector-length _cache4321_))
                                   (_ix4349_
                                    (##fxmodulo _hash4328_ _len4347_)))
                              (##vector-ref _cache4321_ _ix4349_))))
                         (_K43354396_
                          (lambda (_rest4355_ _arg4356_)
                            (let* ((_tid4358_
                                    (std/generic/dispatch#type-of _arg4356_))
                                   (_hash4360_
                                    (##fxxor _hash4328_
                                             (##fxarithmetic-shift
                                              (##symbol-hash _tid4358_)
                                              _shift4329_))))
                              (let* ((_g43624370_
                                      (_lookup4324_
                                       _hash4360_
                                       (##fx+ _shift4329_ '1)
                                       _rest4355_))
                                     (_else43644378_ (lambda () '#f))
                                     (_K43664384_
                                      (lambda (_xrest4381_ _xtid4382_)
                                        (if (##eq? _tid4358_ _xtid4382_)
                                            _xrest4381_
                                            '#f))))
                                (if (##pair? _g43624370_)
                                    (let ((_hd43674387_ (##car _g43624370_))
                                          (_tl43684389_ (##cdr _g43624370_)))
                                      (let* ((_xtid4392_ _hd43674387_)
                                             (_xrest4394_ _tl43684389_))
                                        (_K43664384_ _xrest4394_ _xtid4392_)))
                                    (_else43644378_)))))))
                    (if (##pair? _rest43314339_)
                        (let ((_hd43364399_ (##car _rest43314339_))
                              (_tl43374401_ (##cdr _rest43314339_)))
                          (let* ((_arg4404_ _hd43364399_)
                                 (_rest4406_ _tl43374401_))
                            (_K43354396_ _rest4406_ _arg4404_)))
                        (_else43334352_))))))
        (let ((_proc4326_ (_lookup4324_ '0 '0 _args4322_)))
          (if (##procedure? _proc4326_) _proc4326_ '#f)))))
  (define std/generic/dispatch#cache-hash1
    (lambda (_cache4269_ _mix4270_ _shift4271_ _arg4272_)
      (declare (not interrupts-enabled))
      (let* ((_tid4275_ (std/generic/dispatch#type-of _arg4272_))
             (_hash4277_
              (##fxxor _mix4270_
                       (##fxarithmetic-shift
                        (##symbol-hash _tid4275_)
                        _shift4271_)))
             (_len4279_ (##vector-length _cache4269_))
             (_ix4281_ (##fxmodulo _hash4277_ _len4279_))
             (_obj4283_ (##vector-ref _cache4269_ _ix4281_)))
        (let* ((_obj42854293_ _obj4283_)
               (_else42874301_ (lambda () '#f))
               (_K42894309_
                (lambda (_rest4304_ _xtid4306_)
                  (if (eq? _tid4275_ _xtid4306_) _rest4304_ '#f))))
          (if (##pair? _obj42854293_)
              (let ((_hd42904312_ (##car _obj42854293_))
                    (_tl42914314_ (##cdr _obj42854293_)))
                (let* ((_xtid4317_ _hd42904312_) (_rest4319_ _tl42914314_))
                  (_K42894309_ _rest4319_ _xtid4317_)))
              (_else42874301_))))))
  (define std/generic/dispatch#cache-hash2
    (lambda (_cache4214_ _mix4216_ _shift4218_ _arg14220_ _arg24221_)
      (declare (not interrupts-enabled))
      (let* ((_tid4224_ (std/generic/dispatch#type-of _arg14220_))
             (_hash4227_
              (##fxxor _mix4216_
                       (##fxarithmetic-shift
                        (##symbol-hash _tid4224_)
                        _shift4218_)))
             (_obj4230_
              (std/generic/dispatch#cache-hash1
               _cache4214_
               _hash4227_
               (fx+ _shift4218_ '1)
               _arg24221_)))
        (let* ((_obj42334241_ _obj4230_)
               (_else42354249_ (lambda () '#f))
               (_K42374257_
                (lambda (_rest4252_ _xtid4254_)
                  (if (eq? _tid4224_ _xtid4254_) _rest4252_ '#f))))
          (if (##pair? _obj42334241_)
              (let ((_hd42384260_ (##car _obj42334241_))
                    (_tl42394262_ (##cdr _obj42334241_)))
                (let* ((_xtid4265_ _hd42384260_) (_rest4267_ _tl42394262_))
                  (_K42374257_ _rest4267_ _xtid4265_)))
              (_else42354249_))))))
  (define std/generic/dispatch#cache-hash3
    (lambda (_cache4158_
             _mix4160_
             _shift4162_
             _arg14164_
             _arg24165_
             _arg34166_)
      (declare (not interrupts-enabled))
      (let* ((_tid4169_ (std/generic/dispatch#type-of _arg14164_))
             (_hash4172_
              (##fxxor _mix4160_
                       (##fxarithmetic-shift
                        (##symbol-hash _tid4169_)
                        _shift4162_)))
             (_obj4175_
              (std/generic/dispatch#cache-hash2
               _cache4158_
               _hash4172_
               (fx+ _shift4162_ '1)
               _arg24165_
               _arg34166_)))
        (let* ((_obj41784186_ _obj4175_)
               (_else41804194_ (lambda () '#f))
               (_K41824202_
                (lambda (_rest4197_ _xtid4199_)
                  (if (eq? _tid4169_ _xtid4199_) _rest4197_ '#f))))
          (if (##pair? _obj41784186_)
              (let ((_hd41834205_ (##car _obj41784186_))
                    (_tl41844207_ (##cdr _obj41784186_)))
                (let* ((_xtid4210_ _hd41834205_) (_rest4212_ _tl41844207_))
                  (_K41824202_ _rest4212_ _xtid4210_)))
              (_else41804194_))))))
  (define std/generic/dispatch#cache-hash4
    (lambda (_cache4101_
             _mix4103_
             _shift4105_
             _arg14107_
             _arg24108_
             _arg34109_
             _arg44110_)
      (declare (not interrupts-enabled))
      (let* ((_tid4113_ (std/generic/dispatch#type-of _arg14107_))
             (_hash4116_
              (##fxxor _mix4103_
                       (##fxarithmetic-shift
                        (##symbol-hash _tid4113_)
                        _shift4105_)))
             (_obj4119_
              (std/generic/dispatch#cache-hash3
               _cache4101_
               _hash4116_
               (fx+ _shift4105_ '1)
               _arg24108_
               _arg34109_
               _arg44110_)))
        (let* ((_obj41224130_ _obj4119_)
               (_else41244138_ (lambda () '#f))
               (_K41264146_
                (lambda (_rest4141_ _xtid4143_)
                  (if (eq? _tid4113_ _xtid4143_) _rest4141_ '#f))))
          (if (##pair? _obj41224130_)
              (let ((_hd41274149_ (##car _obj41224130_))
                    (_tl41284151_ (##cdr _obj41224130_)))
                (let* ((_xtid4154_ _hd41274149_) (_rest4156_ _tl41284151_))
                  (_K41264146_ _rest4156_ _xtid4154_)))
              (_else41244138_))))))
  (define std/generic/dispatch#generic-dispatch-cache-lookup1
    (lambda (_cache4093_ _arg14095_)
      (declare (not interrupts-enabled))
      (let ((_method4098_
             (std/generic/dispatch#cache-hash1 _cache4093_ '0 '0 _arg14095_)))
        (if (##procedure? _method4098_) _method4098_ '#f))))
  (define std/generic/dispatch#generic-dispatch-cache-lookup2
    (lambda (_cache4084_ _arg14086_ _arg24087_)
      (declare (not interrupts-enabled))
      (let ((_method4090_
             (std/generic/dispatch#cache-hash2
              _cache4084_
              '0
              '0
              _arg14086_
              _arg24087_)))
        (if (##procedure? _method4090_) _method4090_ '#f))))
  (define std/generic/dispatch#generic-dispatch-cache-lookup3
    (lambda (_cache4074_ _arg14076_ _arg24077_ _arg34078_)
      (declare (not interrupts-enabled))
      (let ((_method4081_
             (std/generic/dispatch#cache-hash3
              _cache4074_
              '0
              '0
              _arg14076_
              _arg24077_
              _arg34078_)))
        (if (##procedure? _method4081_) _method4081_ '#f))))
  (define std/generic/dispatch#generic-dispatch-cache-lookup4
    (lambda (_cache4063_ _arg14065_ _arg24066_ _arg34067_ _arg44068_)
      (declare (not interrupts-enabled))
      (let ((_method4071_
             (std/generic/dispatch#cache-hash4
              _cache4063_
              '0
              '0
              _arg14065_
              _arg24066_
              _arg34067_
              _arg44068_)))
        (if (##procedure? _method4071_) _method4071_ '#f))))
  (define std/generic/dispatch#generic-dispatch-cache!
    (lambda (_gtab4036_ _args4037_ _method4038_)
      (let* ((_arg-types4040_ (map std/generic/dispatch#type-of _args4037_))
             (_entry4042_ (foldl1 cons _method4038_ _arg-types4040_))
             (_hash4048_
              (foldl2 (lambda (_tid4044_ _shift4045_ _r4046_)
                        (##fxxor _r4046_
                                 (##fxarithmetic-shift
                                  (##symbol-hash _tid4044_)
                                  _shift4045_)))
                      '0
                      _arg-types4040_
                      (iota (length _args4037_)))))
        (let _lp4051_ ((_cache4053_
                        (##unchecked-structure-ref
                         _gtab4036_
                         '2
                         std/generic/dispatch#generic-table::t
                         '#f)))
          (let* ((_len4055_ (##vector-length _cache4053_))
                 (_ix4057_ (##fxmodulo _hash4048_ _len4055_)))
            (if (##vector-ref _cache4053_ _ix4057_)
                (let ((_$e4060_
                       (std/generic/dispatch#generic-dispatch-cache-rehash
                        _cache4053_)))
                  (if _$e4060_ (_lp4051_ _$e4060_) '#!void))
                (begin
                  (##vector-set! _cache4053_ _ix4057_ _entry4042_)
                  (##unchecked-structure-set!
                   _gtab4036_
                   _cache4053_
                   '2
                   std/generic/dispatch#generic-table::t
                   '#f))))))))
  (define std/generic/dispatch#generic-dispatch-cache-rehash
    (lambda (_cache3964_)
      (letrec* ((_cache-len3966_ (##vector-length _cache3964_))
                (_hash-entry3967_
                 (lambda (_entry3991_)
                   (let _lp3993_ ((_rest3995_ _entry3991_)
                                  (_count3996_ '0)
                                  (_r3997_ '()))
                     (let* ((_rest39984006_ _rest3995_)
                            (_else40004018_
                             (lambda ()
                               (foldl2 (lambda (_tid4014_ _shift4015_ _r4016_)
                                         (##fxxor _r4016_
                                                  (##fxarithmetic-shift
                                                   (##symbol-hash _tid4014_)
                                                   _shift4015_)))
                                       '0
                                       _r3997_
                                       (iota _count3996_))))
                            (_K40024024_
                             (lambda (_rest4021_ _tid4022_)
                               (_lp3993_
                                _rest4021_
                                (##fx+ _count3996_ '1)
                                (cons _tid4022_ _r3997_)))))
                       (if (##pair? _rest39984006_)
                           (let ((_hd40034027_ (##car _rest39984006_))
                                 (_tl40044029_ (##cdr _rest39984006_)))
                             (let* ((_tid4032_ _hd40034027_)
                                    (_rest4034_ _tl40044029_))
                               (_K40024024_ _rest4034_ _tid4032_)))
                           (_else40004018_))))))
                (_rehash!3968_
                 (lambda (_new-cache3976_)
                   (letrec* ((_new-cache-len3978_
                              (##vector-length _new-cache3976_)))
                     (let _lp3980_ ((_i3982_ '0))
                       (if (##fx< _i3982_ _cache-len3966_)
                           (let ((_entry3984_
                                  (##vector-ref _cache3964_ _i3982_)))
                             (if _entry3984_
                                 (let* ((_hash3986_
                                         (_hash-entry3967_ _entry3984_))
                                        (_ix3988_
                                         (##fxmodulo
                                          _hash3986_
                                          _new-cache-len3978_)))
                                   (if (##vector-ref _new-cache3976_ _ix3988_)
                                       '#f
                                       (begin
                                         (##vector-set!
                                          _new-cache3976_
                                          _ix3988_
                                          _entry3984_)
                                         (_lp3980_ (##fx+ _i3982_ '1)))))
                                 (_lp3980_ (##fx+ _i3982_ '1))))
                           '#t))))))
        (let _retry3970_ ((_new-cache-len3972_
                           (##fxquotient (##fx* '3 _cache-len3966_) '2)))
          (if (##fx< _new-cache-len3972_ std/generic/dispatch#+max-cache-size+)
              (let ((_new-cache3974_ (make-vector _new-cache-len3972_ '#f)))
                (if (_rehash!3968_ _new-cache3974_)
                    _new-cache3974_
                    (_retry3970_
                     (##fxquotient (##fx* '3 _new-cache-len3972_) '2))))
              (begin
                (display '"*** Warning: cannot rehash generic cache; maximum cache size exceeded\n"
                         ##stderr-port)
                '#f))))))
  (define std/generic/dispatch#+max-cache-size+ (expt '2 '16)))
