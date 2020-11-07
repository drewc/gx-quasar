(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/158#any
    (lambda (_pred112561_ _ls112562_)
      (if (null? (cdr _ls112562_))
          (_pred112561_ (car _ls112562_))
          ((lambda (_x112564_)
             (if _x112564_
                 _x112564_
                 (std/srfi/158#any _pred112561_ (cdr _ls112562_))))
           (_pred112561_ (car _ls112562_))))))
  (define std/srfi/158#list->bytevector
    (lambda (_list112552_)
      (let ((_vec112554_ (make-u8vector (length _list112552_) '0)))
        (let _loop112556_ ((_i112558_ '0) (_list112559_ _list112552_))
          (if (null? _list112559_)
              _vec112554_
              (begin
                (u8vector-set! _vec112554_ _i112558_ (car _list112559_))
                (_loop112556_ (+ _i112558_ '1) (cdr _list112559_))))))))
  (define std/srfi/158#circular-generator
    (lambda _args112545_
      (let ((_base-args112547_ _args112545_))
        (lambda ()
          (if (null? _args112545_)
              (set! _args112545_ _base-args112547_)
              '#!void)
          (let ((_next112550_ (car _args112545_)))
            (set! _args112545_ (cdr _args112545_))
            _next112550_)))))
  (define std/srfi/158#gflatten
    (lambda (_gen112538_)
      (let ((_state112540_ '()))
        (lambda ()
          (if (null? _state112540_) (set! _state112540_ (_gen112538_)) '#!void)
          (if (eof-object? _state112540_)
              _state112540_
              (let ((_obj112543_ (car _state112540_)))
                (set! _state112540_ (cdr _state112540_))
                _obj112543_))))))
  (define std/srfi/158#ggroup__1
    (lambda (_gen112534_ _k112535_ _padding112536_)
      (std/srfi/158#padded-ggroup
       (std/srfi/158#simple-ggroup _gen112534_ _k112535_)
       _k112535_
       _padding112536_)))
  (define std/srfi/158#ggroup
    (lambda _g279528_
      (let ((_g279527_ (let () (declare (not safe)) (##length _g279528_))))
        (cond ((let () (declare (not safe)) (##fx= _g279527_ 2))
               (apply std/srfi/158#simple-ggroup _g279528_))
              ((let () (declare (not safe)) (##fx= _g279527_ 3))
               (apply std/srfi/158#ggroup__1 _g279528_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/158#ggroup
                _g279528_))))))
  (define std/srfi/158#simple-ggroup
    (lambda (_gen112521_ _k112522_)
      (lambda ()
        (let _loop112525_ ((_item112527_ (_gen112521_))
                           (_result112528_ '())
                           (_count112529_ (- _k112522_ '1)))
          (if (eof-object? _item112527_)
              (if (null? _result112528_) _item112527_ (reverse _result112528_))
              (if (= _count112529_ '0)
                  (reverse (cons _item112527_ _result112528_))
                  (_loop112525_
                   (_gen112521_)
                   (cons _item112527_ _result112528_)
                   (- _count112529_ '1))))))))
  (define std/srfi/158#padded-ggroup
    (lambda (_gen112512_ _k112513_ _padding112514_)
      (lambda ()
        (let ((_item112517_ (_gen112512_)))
          (if (eof-object? _item112517_)
              _item112517_
              (let ((_len112519_ (length _item112517_)))
                (if (= _len112519_ _k112513_)
                    _item112517_
                    (append _item112517_
                            (make-list
                             (- _k112513_ _len112519_)
                             _padding112514_)))))))))
  (define std/srfi/158#gmerge__0
    (lambda (_<112483_) (error '"wrong number of arguments for gmerge")))
  (define std/srfi/158#gmerge__1 (lambda (_<112485_ _gen112486_) _gen112486_))
  (define std/srfi/158#gmerge__2
    (lambda (_<112488_ _genleft112489_ _genright112490_)
      (let ((_left112492_ (_genleft112489_))
            (_right112493_ (_genright112490_)))
        (lambda ()
          (if (and (eof-object? _left112492_) (eof-object? _right112493_))
              _left112492_
              (if (eof-object? _left112492_)
                  (let ((_obj112496_ _right112493_))
                    (set! _right112493_ (_genright112490_))
                    _obj112496_)
                  (if (eof-object? _right112493_)
                      (let ((_obj112498_ _left112492_))
                        (set! _left112492_ (_genleft112489_))
                        _obj112498_)
                      (if (_<112488_ _right112493_ _left112492_)
                          (let ((_obj112500_ _right112493_))
                            (set! _right112493_ (_genright112490_))
                            _obj112500_)
                          (let ((_obj112502_ _left112492_))
                            (set! _left112492_ (_genleft112489_))
                            _obj112502_)))))))))
  (define std/srfi/158#gmerge__3
    (lambda (_<112504_ . _gens112505_)
      (apply std/srfi/158#gmerge
             _<112504_
             (let _loop112507_ ((_gens112509_ _gens112505_) (_gs112510_ '()))
               (if (null? _gens112509_)
                   (reverse _gs112510_)
                   (if (null? (cdr _gens112509_))
                       (reverse (cons (car _gens112509_) _gs112510_))
                       (_loop112507_
                        (cddr _gens112509_)
                        (cons (std/srfi/158#gmerge__2
                               _<112504_
                               (car _gens112509_)
                               (cadr _gens112509_))
                              _gs112510_))))))))
  (define std/srfi/158#gmerge
    (lambda _g279530_
      (let ((_g279529_ (let () (declare (not safe)) (##length _g279530_))))
        (cond ((let () (declare (not safe)) (##fx= _g279529_ 1))
               (apply std/srfi/158#gmerge__0 _g279530_))
              ((let () (declare (not safe)) (##fx= _g279529_ 2))
               (apply std/srfi/158#gmerge__1 _g279530_))
              ((let () (declare (not safe)) (##fx= _g279529_ 3))
               (apply std/srfi/158#gmerge__2 _g279530_))
              ((let () (declare (not safe)) (##fx>= _g279529_ 1))
               (apply std/srfi/158#gmerge__3 _g279530_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/158#gmerge
                _g279530_))))))
  (define std/srfi/158#gmap__0
    (lambda (_proc112467_) (error '"wrong number of arguments for gmap")))
  (define std/srfi/158#gmap__1
    (lambda (_proc112469_ _gen112470_)
      (lambda ()
        (let ((_item112473_ (_gen112470_)))
          (if (eof-object? _item112473_)
              _item112473_
              (_proc112469_ _item112473_))))))
  (define std/srfi/158#gmap__2
    (lambda (_proc112475_ . _gens112476_)
      (lambda ()
        (let ((_items112481_
               (map (lambda (_x112479_) (_x112479_)) _gens112476_)))
          (if (std/srfi/158#any eof-object? _items112481_)
              (eof-object)
              (apply _proc112475_ _items112481_))))))
  (define std/srfi/158#gmap
    (lambda _g279532_
      (let ((_g279531_ (let () (declare (not safe)) (##length _g279532_))))
        (cond ((let () (declare (not safe)) (##fx= _g279531_ 1))
               (apply std/srfi/158#gmap__0 _g279532_))
              ((let () (declare (not safe)) (##fx= _g279531_ 2))
               (apply std/srfi/158#gmap__1 _g279532_))
              ((let () (declare (not safe)) (##fx>= _g279531_ 1))
               (apply std/srfi/158#gmap__2 _g279532_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/158#gmap
                _g279532_))))))
  (define std/srfi/158#gstate-filter
    (lambda (_proc112453_ _seed112454_ _gen112455_)
      (let ((_state112457_ _seed112454_))
        (lambda ()
          (let _loop112460_ ((_item112462_ (_gen112455_)))
            (if (eof-object? _item112462_)
                _item112462_
                (let ((_g279533_ (_proc112453_ _item112462_ _state112457_)))
                  (begin
                    (let ((_g279534_
                           (let ()
                             (declare (not safe))
                             (if (##values? _g279533_)
                                 (##vector-length _g279533_)
                                 1))))
                      (if (not (let ()
                                 (declare (not safe))
                                 (##fx= _g279534_ 2)))
                          (error "Context expects 2 values" _g279534_)))
                    (let ((_yes112464_
                           (let ()
                             (declare (not safe))
                             (##vector-ref _g279533_ 0)))
                          (_newstate112465_
                           (let ()
                             (declare (not safe))
                             (##vector-ref _g279533_ 1))))
                      (begin
                        (set! _state112457_ _newstate112465_)
                        (if _yes112464_
                            _item112462_
                            (_loop112460_ (_gen112455_)))))))))))))
  (define std/srfi/158#generator-map->list
    (lambda (_f112442_ . _gs112443_)
      (let _loop112445_ ((_result112447_ '()))
        (let ((_vs112451_ (map (lambda (_g112449_) (_g112449_)) _gs112443_)))
          (if (std/srfi/158#any eof-object? _vs112451_)
              (reverse _result112447_)
              (_loop112445_
               (cons (apply _f112442_ _vs112451_) _result112447_)))))))
  (define std/srfi/158#make-accumulator
    (lambda (_kons112434_ _knil112435_ _finalize112436_)
      (let ((_state112438_ _knil112435_))
        (lambda (_obj112440_)
          (if (eof-object? _obj112440_)
              (_finalize112436_ _state112438_)
              (set! _state112438_
                    (_kons112434_ _obj112440_ _state112438_)))))))
  (define std/srfi/158#count-accumulator
    (lambda ()
      (std/srfi/158#make-accumulator
       (lambda (_obj112429_ _state112430_) (+ '1 _state112430_))
       '0
       (lambda (_x112432_) _x112432_))))
  (define std/srfi/158#list-accumulator
    (lambda () (std/srfi/158#make-accumulator cons '() reverse)))
  (define std/srfi/158#reverse-list-accumulator
    (lambda ()
      (std/srfi/158#make-accumulator cons '() (lambda (_x112425_) _x112425_))))
  (define std/srfi/158#vector-accumulator
    (lambda ()
      (std/srfi/158#make-accumulator
       cons
       '()
       (lambda (_x112422_) (list->vector (reverse _x112422_))))))
  (define std/srfi/158#reverse-vector-accumulator
    (lambda () (std/srfi/158#make-accumulator cons '() list->vector)))
  (define std/srfi/158#vector-accumulator!
    (lambda (_vec112415_ _at112416_)
      (lambda (_obj112418_)
        (if (eof-object? _obj112418_)
            _vec112415_
            (begin
              (vector-set! _vec112415_ _at112416_ _obj112418_)
              (set! _at112416_ (+ _at112416_ '1)))))))
  (define std/srfi/158#bytevector-accumulator
    (lambda ()
      (std/srfi/158#make-accumulator
       cons
       '()
       (lambda (_x112413_)
         (std/srfi/158#list->bytevector (reverse _x112413_))))))
  (define std/srfi/158#bytevector-accumulator!
    (lambda (_bytevec112407_ _at112408_)
      (lambda (_obj112410_)
        (if (eof-object? _obj112410_)
            _bytevec112407_
            (begin
              (u8vector-set! _bytevec112407_ _at112408_ _obj112410_)
              (set! _at112408_ (+ _at112408_ '1)))))))
  (define std/srfi/158#string-accumulator
    (lambda ()
      (std/srfi/158#make-accumulator
       cons
       '()
       (lambda (_lst112405_) (list->string (reverse _lst112405_))))))
  (define std/srfi/158#sum-accumulator
    (lambda ()
      (std/srfi/158#make-accumulator + '0 (lambda (_x112402_) _x112402_))))
  (define std/srfi/158#product-accumulator
    (lambda ()
      (std/srfi/158#make-accumulator * '1 (lambda (_x112399_) _x112399_)))))
