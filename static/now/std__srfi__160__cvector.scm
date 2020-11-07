(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/160/cvector#c64vector::t
    (make-struct-type
     'std/srfi/160/cvector#c64vector::t
     '#f
     '1
     'c64vector
     '((equal: e) (final: . #t))
     ':init!
     '(e)))
  (define std/srfi/160/cvector#c64vector?
    (make-struct-predicate std/srfi/160/cvector#c64vector::t))
  (define std/srfi/160/cvector#make-c64vector
    (lambda _$args125880_
      (apply make-struct-instance
             std/srfi/160/cvector#c64vector::t
             _$args125880_)))
  (define std/srfi/160/cvector#c64vector-e
    (make-struct-field-accessor std/srfi/160/cvector#c64vector::t '0))
  (define std/srfi/160/cvector#c64vector-e-set!
    (make-struct-field-mutator std/srfi/160/cvector#c64vector::t '0))
  (define std/srfi/160/cvector#&c64vector-e
    (make-struct-field-unchecked-accessor
     std/srfi/160/cvector#c64vector::t
     '0))
  (define std/srfi/160/cvector#&c64vector-e-set!
    (make-struct-field-unchecked-mutator std/srfi/160/cvector#c64vector::t '0))
  (define std/srfi/160/cvector#c128vector::t
    (make-struct-type
     'std/srfi/160/cvector#c128vector::t
     '#f
     '1
     'c128vector
     '((equal: e) (final: . #t))
     'init!
     '(e)))
  (define std/srfi/160/cvector#c128vector?
    (make-struct-predicate std/srfi/160/cvector#c128vector::t))
  (define std/srfi/160/cvector#make-c128vector
    (lambda _$args125877_
      (apply make-struct-instance
             std/srfi/160/cvector#c128vector::t
             _$args125877_)))
  (define std/srfi/160/cvector#c128vector-e
    (make-struct-field-accessor std/srfi/160/cvector#c128vector::t '0))
  (define std/srfi/160/cvector#c128vector-e-set!
    (make-struct-field-mutator std/srfi/160/cvector#c128vector::t '0))
  (define std/srfi/160/cvector#&c128vector-e
    (make-struct-field-unchecked-accessor
     std/srfi/160/cvector#c128vector::t
     '0))
  (define std/srfi/160/cvector#&c128vector-e-set!
    (make-struct-field-unchecked-mutator
     std/srfi/160/cvector#c128vector::t
     '0))
  (define std/srfi/160/cvector#c64vector:::init!__%
    (lambda (_self125859_ _size125860_ _fill125861_)
      (let ((_e125863_ (make-f32vector (fx* '2 _size125860_))))
        (if (let ((__tmp279536
                   (let ()
                     (declare (not safe))
                     (##vector-length _self125859_))))
              (declare (not safe))
              (##fx< '1 __tmp279536))
            (let ()
              (declare (not safe))
              (##vector-set! _self125859_ '1 _e125863_))
            (error '"struct-instance-init!: too many arguments for struct"
                   _self125859_))
        (if _fill125861_
            (begin
              (if (complex? _fill125861_)
                  '#!void
                  (error '"Bad argument; expected complex number"
                         _fill125861_))
              (std/srfi/160/cvector#cvector-fill!
               _e125863_
               _fill125861_
               ##f32vector-set!
               _size125860_))
            '#!void))))
  (define std/srfi/160/cvector#c64vector:::init!__0
    (lambda (_self125868_ _size125869_)
      (let ((_fill125871_ '#f))
        (std/srfi/160/cvector#c64vector:::init!__%
         _self125868_
         _size125869_
         _fill125871_))))
  (define std/srfi/160/cvector#c64vector:::init!
    (lambda _g279538_
      (let ((_g279537_ (let () (declare (not safe)) (##length _g279538_))))
        (cond ((let () (declare (not safe)) (##fx= _g279537_ 2))
               (apply std/srfi/160/cvector#c64vector:::init!__0 _g279538_))
              ((let () (declare (not safe)) (##fx= _g279537_ 3))
               (apply std/srfi/160/cvector#c64vector:::init!__% _g279538_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/160/cvector#c64vector:::init!
                _g279538_))))))
  (bind-method!
   std/srfi/160/cvector#c64vector::t
   ':init!
   std/srfi/160/cvector#c64vector:::init!
   '#f)
  (define std/srfi/160/cvector#c128vector:::init!__%
    (lambda (_self125718_ _size125719_ _fill125720_)
      (let ((_e125722_ (make-f64vector (fx* '2 _size125719_))))
        (if (let ((__tmp279539
                   (let ()
                     (declare (not safe))
                     (##vector-length _self125718_))))
              (declare (not safe))
              (##fx< '1 __tmp279539))
            (let ()
              (declare (not safe))
              (##vector-set! _self125718_ '1 _e125722_))
            (error '"struct-instance-init!: too many arguments for struct"
                   _self125718_))
        (if _fill125720_
            (begin
              (if (complex? _fill125720_)
                  '#!void
                  (error '"Bad argument; expected complex number"
                         _fill125720_))
              (std/srfi/160/cvector#cvector-fill!
               _e125722_
               _fill125720_
               ##f64vector-set!
               _size125719_))
            '#!void))))
  (define std/srfi/160/cvector#c128vector:::init!__0
    (lambda (_self125727_ _size125728_)
      (let ((_fill125730_ '#f))
        (std/srfi/160/cvector#c128vector:::init!__%
         _self125727_
         _size125728_
         _fill125730_))))
  (define std/srfi/160/cvector#c128vector:::init!
    (lambda _g279541_
      (let ((_g279540_ (let () (declare (not safe)) (##length _g279541_))))
        (cond ((let () (declare (not safe)) (##fx= _g279540_ 2))
               (apply std/srfi/160/cvector#c128vector:::init!__0 _g279541_))
              ((let () (declare (not safe)) (##fx= _g279540_ 3))
               (apply std/srfi/160/cvector#c128vector:::init!__% _g279541_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/160/cvector#c128vector:::init!
                _g279541_))))))
  (bind-method!
   std/srfi/160/cvector#c128vector::t
   ':init!
   std/srfi/160/cvector#c128vector:::init!
   '#f)
  (define std/srfi/160/cvector#cvector-fill!
    (lambda (_v125579_ _fill125580_ _set-e125581_ _size125582_)
      (declare (not safe))
      (let ((_real125585_ (inexact (real-part _fill125580_)))
            (_imag125586_ (inexact (imag-part _fill125580_))))
        (let _$loop125588_ ((_i125591_ '0))
          (if (fx= _i125591_ _size125582_)
              '#!void
              (begin
                (let ((_j125593_ (fx* _i125591_ '2)))
                  (_set-e125581_ _v125579_ _j125593_ _real125585_)
                  (_set-e125581_ _v125579_ (fx+ _j125593_ '1) _imag125586_))
                (_$loop125588_ (fx+ _i125591_ '1))))))))
  (define std/srfi/160/cvector#make-c64vector*
    (lambda _args125577_ (std/srfi/160/cvector#list->c64vector _args125577_)))
  (define std/srfi/160/cvector#make-c128vector*
    (lambda _args125575_ (std/srfi/160/cvector#list->c128vector _args125575_)))
  (define std/srfi/160/cvector#list->c64vector
    (lambda (_lst125571_)
      (let ((_v125573_
             (let ((__obj279535
                    (make-object std/srfi/160/cvector#c64vector::t '1)))
               (std/srfi/160/cvector#c64vector:::init!__0
                __obj279535
                (length _lst125571_))
               __obj279535)))
        (std/srfi/160/cvector#cvector-init!
         (let ()
           (declare (not safe))
           (##unchecked-structure-ref
            _v125573_
            '1
            std/srfi/160/cvector#c64vector::t
            '#f))
         _lst125571_
         ##f32vector-set!)
        _v125573_)))
  (define std/srfi/160/cvector#list->c128vector
    (lambda (_lst125567_)
      (let ((_v125569_
             (make-struct-instance
              std/srfi/160/cvector#c128vector::t
              (length _lst125567_))))
        (std/srfi/160/cvector#cvector-init!
         (let ()
           (declare (not safe))
           (##unchecked-structure-ref
            _v125569_
            '1
            std/srfi/160/cvector#c128vector::t
            '#f))
         _lst125567_
         ##f64vector-set!)
        _v125569_)))
  (define std/srfi/160/cvector#cvector-init!
    (lambda (_v125521_ _lst125522_ _set-e125523_)
      (declare (not safe))
      (let _lp125526_ ((_rest125528_ _lst125522_) (_i125529_ '0))
        (let* ((_rest125530125538_ _rest125528_)
               (_else125532125546_ (lambda () '#!void))
               (_K125534125555_
                (lambda (_rest125549_ _x125550_)
                  (if (complex? _x125550_)
                      '#!void
                      (error '"Expected complex number" _x125550_))
                  (let ((_real125552_ (inexact (real-part _x125550_)))
                        (_imag125553_ (inexact (imag-part _x125550_))))
                    (_set-e125523_ _v125521_ _i125529_ _real125552_)
                    (_set-e125523_ _v125521_ (fx+ _i125529_ '1) _imag125553_)
                    (_lp125526_ _rest125549_ (fx+ _i125529_ '2))))))
          (if (##pair? _rest125530125538_)
              (let ((_hd125535125558_ (##car _rest125530125538_))
                    (_tl125536125560_ (##cdr _rest125530125538_)))
                (let* ((_x125563_ _hd125535125558_)
                       (_rest125565_ _tl125536125560_))
                  (_K125534125555_ _rest125565_ _x125563_)))
              '#!void)))))
  (define std/srfi/160/cvector#c64vector-ref
    (lambda (_v125489_ _i125490_)
      (let* ((_v125491125497_ _v125489_)
             (_E125493125501_
              (lambda () (error '"No clause matching" _v125491125497_)))
             (_K125494125513_
              (lambda (_e125504_)
                (let* ((_j125506_ (fx* _i125490_ '2))
                       (_real125508_ (f32vector-ref _e125504_ _j125506_))
                       (_imag125510_
                        (f32vector-ref _e125504_ (fx+ _j125506_ '1))))
                  (let ()
                    (declare (not safe))
                    (##cpxnum-make _real125508_ _imag125510_))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _v125491125497_
               'std/srfi/160/cvector#c64vector::t))
            (let* ((_e125495125516_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _v125491125497_ '1)))
                   (_e125519_ _e125495125516_))
              (_K125494125513_ _e125519_))
            (_E125493125501_)))))
  (define std/srfi/160/cvector#c64vector-set!
    (lambda (_v125456_ _i125457_ _x125458_)
      (let* ((_v125459125465_ _v125456_)
             (_E125461125469_
              (lambda () (error '"No clause matching" _v125459125465_)))
             (_K125462125481_
              (lambda (_e125472_)
                (let* ((_j125474_ (fx* _i125457_ '2))
                       (_real125476_ (inexact (real-part _x125458_)))
                       (_imag125478_ (inexact (imag-part _x125458_))))
                  (f32vector-set! _e125472_ _j125474_ _real125476_)
                  (f32vector-set!
                   _e125472_
                   (fx+ _j125474_ '1)
                   _imag125478_)))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _v125459125465_
               'std/srfi/160/cvector#c64vector::t))
            (let* ((_e125463125484_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _v125459125465_ '1)))
                   (_e125487_ _e125463125484_))
              (_K125462125481_ _e125487_))
            (_E125461125469_)))))
  (define std/srfi/160/cvector#c128vector-ref
    (lambda (_v125424_ _i125425_)
      (let* ((_v125426125432_ _v125424_)
             (_E125428125436_
              (lambda () (error '"No clause matching" _v125426125432_)))
             (_K125429125448_
              (lambda (_e125439_)
                (let* ((_j125441_ (fx* _i125425_ '2))
                       (_real125443_ (f64vector-ref _e125439_ _j125441_))
                       (_imag125445_
                        (f64vector-ref _e125439_ (fx+ _j125441_ '1))))
                  (let ()
                    (declare (not safe))
                    (##cpxnum-make _real125443_ _imag125445_))))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _v125426125432_
               'std/srfi/160/cvector#c128vector::t))
            (let* ((_e125430125451_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _v125426125432_ '1)))
                   (_e125454_ _e125430125451_))
              (_K125429125448_ _e125454_))
            (_E125428125436_)))))
  (define std/srfi/160/cvector#c128vector-set!
    (lambda (_v125391_ _i125392_ _x125393_)
      (let* ((_v125394125400_ _v125391_)
             (_E125396125404_
              (lambda () (error '"No clause matching" _v125394125400_)))
             (_K125397125416_
              (lambda (_e125407_)
                (let* ((_j125409_ (fx* _i125392_ '2))
                       (_real125411_ (inexact (real-part _x125393_)))
                       (_imag125413_ (inexact (imag-part _x125393_))))
                  (f64vector-set! _e125407_ _j125409_ _real125411_)
                  (f64vector-set!
                   _e125407_
                   (fx+ _j125409_ '1)
                   _imag125413_)))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _v125394125400_
               'std/srfi/160/cvector#c128vector::t))
            (let* ((_e125398125419_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _v125394125400_ '1)))
                   (_e125422_ _e125398125419_))
              (_K125397125416_ _e125422_))
            (_E125396125404_)))))
  (define std/srfi/160/cvector#c64vector-length
    (lambda (_v125367_)
      (let* ((_v125368125374_ _v125367_)
             (_E125370125378_
              (lambda () (error '"No clause matching" _v125368125374_)))
             (_K125371125383_
              (lambda (_e125381_)
                (let ((__tmp279542
                       (let ()
                         (declare (not safe))
                         (##f32vector-length _e125381_))))
                  (declare (not safe))
                  (##fxquotient __tmp279542 '2)))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _v125368125374_
               'std/srfi/160/cvector#c64vector::t))
            (let* ((_e125372125386_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _v125368125374_ '1)))
                   (_e125389_ _e125372125386_))
              (_K125371125383_ _e125389_))
            (_E125370125378_)))))
  (define std/srfi/160/cvector#c128vector-length
    (lambda (_v125343_)
      (let* ((_v125344125350_ _v125343_)
             (_E125346125354_
              (lambda () (error '"No clause matching" _v125344125350_)))
             (_K125347125359_
              (lambda (_e125357_)
                (let ((__tmp279543
                       (let ()
                         (declare (not safe))
                         (##f64vector-length _e125357_))))
                  (declare (not safe))
                  (##fxquotient __tmp279543 '2)))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _v125344125350_
               'std/srfi/160/cvector#c128vector::t))
            (let* ((_e125348125362_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _v125344125350_ '1)))
                   (_e125365_ _e125348125362_))
              (_K125347125359_ _e125365_))
            (_E125346125354_)))))
  (define std/srfi/160/cvector#c64vector->list
    (lambda (_v125319_)
      (let* ((_v125320125326_ _v125319_)
             (_E125322125330_
              (lambda () (error '"No clause matching" _v125320125326_)))
             (_K125323125335_
              (lambda (_e125333_)
                (std/srfi/160/cvector#cvector->list
                 _e125333_
                 ##f32vector-ref
                 ##f32vector-length))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _v125320125326_
               'std/srfi/160/cvector#c64vector::t))
            (let* ((_e125324125338_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _v125320125326_ '1)))
                   (_e125341_ _e125324125338_))
              (_K125323125335_ _e125341_))
            (_E125322125330_)))))
  (define std/srfi/160/cvector#c128vector->list
    (lambda (_v125295_)
      (let* ((_v125296125302_ _v125295_)
             (_E125298125306_
              (lambda () (error '"No clause matching" _v125296125302_)))
             (_K125299125311_
              (lambda (_e125309_)
                (std/srfi/160/cvector#cvector->list
                 _e125309_
                 ##f64vector-ref
                 ##f64vector-length))))
        (if (let ()
              (declare (not safe))
              (##structure-direct-instance-of?
               _v125296125302_
               'std/srfi/160/cvector#c128vector::t))
            (let* ((_e125300125314_
                    (let ()
                      (declare (not safe))
                      (##vector-ref _v125296125302_ '1)))
                   (_e125317_ _e125300125314_))
              (_K125299125311_ _e125317_))
            (_E125298125306_)))))
  (define std/srfi/160/cvector#cvector->list
    (lambda (_v125281_ _ref-e125282_ _length-e125283_)
      (declare (not safe))
      (letrec* ((_end125285_ (_length-e125283_ _v125281_)))
        (let _lp125287_ ((_i125289_ '0) (_r125290_ '()))
          (if (fx< _i125289_ _end125285_)
              (let ((_real125292_ (_ref-e125282_ _v125281_ _i125289_))
                    (_imag125293_
                     (_ref-e125282_ _v125281_ (fx+ _i125289_ '1))))
                (_lp125287_
                 (fx+ _i125289_ '2)
                 (cons (##cpxnum-make _real125292_ _imag125293_) _r125290_)))
              (reverse _r125290_))))))
  (define std/srfi/160/cvector#c64vector:::write
    (lambda (_self125276_ _port125277_)
      (let ((_lst125279_ (std/srfi/160/cvector#c64vector->list _self125276_)))
        (write '"#c64" _port125277_)
        (write _lst125279_ _port125277_))))
  (bind-method!
   std/srfi/160/cvector#c64vector::t
   ':write
   std/srfi/160/cvector#c64vector:::write
   '#f)
  (define std/srfi/160/cvector#c128vector:::write
    (lambda (_self125149_ _port125150_)
      (let ((_lst125152_ (std/srfi/160/cvector#c128vector->list _self125149_)))
        (write '"#c128" _port125150_)
        (write _lst125152_ _port125150_))))
  (bind-method!
   std/srfi/160/cvector#c128vector::t
   ':write
   std/srfi/160/cvector#c128vector:::write
   '#f))
