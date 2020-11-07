(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/151#bitwise-nand
    (lambda (_i103895_ _j103896_)
      (bitwise-not (bitwise-and _i103895_ _j103896_))))
  (define std/srfi/151#bitwise-nor
    (lambda (_i103892_ _j103893_)
      (bitwise-not (bitwise-ior _i103892_ _j103893_))))
  (define std/srfi/151#bitwise-andc1
    (lambda (_i103889_ _j103890_)
      (bitwise-and (bitwise-not _i103889_) _j103890_)))
  (define std/srfi/151#bitwise-andc2
    (lambda (_i103886_ _j103887_)
      (bitwise-and _i103886_ (bitwise-not _j103887_))))
  (define std/srfi/151#bitwise-orc1
    (lambda (_i103883_ _j103884_)
      (bitwise-ior (bitwise-not _i103883_) _j103884_)))
  (define std/srfi/151#bitwise-orc2
    (lambda (_i103880_ _j103881_)
      (bitwise-ior _i103880_ (bitwise-not _j103881_))))
  (define std/srfi/151#bitwise-eqv
    (lambda _args103873_
      (let _lp103875_ ((_args103877_ _args103873_) (_ans103878_ '-1))
        (if (pair? _args103877_)
            (_lp103875_
             (cdr _args103877_)
             (bitwise-not (bitwise-xor _ans103878_ (car _args103877_))))
            _ans103878_))))
  (define std/srfi/151#mask
    (lambda (_start103870_ _end103871_)
      (bitwise-not (arithmetic-shift '-1 (- _end103871_ _start103870_)))))
  (define std/srfi/151#any-bit-set?
    (lambda (_test-bits103867_ _n103868_)
      (not (zero? (bitwise-and _test-bits103867_ _n103868_)))))
  (define std/srfi/151#every-bit-set?
    (lambda (_test-bits103864_ _n103865_)
      (= _test-bits103864_ (bitwise-and _test-bits103864_ _n103865_))))
  (define std/srfi/151#bit-field
    (lambda (_n103860_ _start103861_ _end103862_)
      (bitwise-and
       (std/srfi/151#mask _start103861_ _end103862_)
       (arithmetic-shift _n103860_ (- _start103861_)))))
  (define std/srfi/151#bit-field-any?
    (lambda (_n103856_ _start103857_ _end103858_)
      (not (zero? (bitwise-and
                   (arithmetic-shift _n103856_ (- _start103857_))
                   (std/srfi/151#mask _start103857_ _end103858_))))))
  (define std/srfi/151#bit-field-every?
    (lambda (_n103850_ _start103851_ _end103852_)
      (let ((_m103854_ (std/srfi/151#mask _start103851_ _end103852_)))
        (eqv? _m103854_
              (bitwise-and
               (arithmetic-shift _n103850_ (- _start103851_))
               _m103854_)))))
  (define std/srfi/151#bit-field-clear
    (lambda (_n103846_ _start103847_ _end103848_)
      (std/srfi/151#bit-field-replace _n103846_ '0 _start103847_ _end103848_)))
  (define std/srfi/151#bit-field-set
    (lambda (_n103842_ _start103843_ _end103844_)
      (std/srfi/151#bit-field-replace
       _n103842_
       '-1
       _start103843_
       _end103844_)))
  (define std/srfi/151#bit-field-replace
    (lambda (_n103835_ _newfield103836_ _start103837_ _end103838_)
      (let ((_m103840_ (std/srfi/151#mask _start103837_ _end103838_)))
        (bitwise-ior
         (bitwise-and
          _n103835_
          (bitwise-not (arithmetic-shift _m103840_ _start103837_)))
         (arithmetic-shift
          (bitwise-and _newfield103836_ _m103840_)
          _start103837_)))))
  (define std/srfi/151#bit-field-replace-same
    (lambda (_to103830_ _from103831_ _start103832_ _end103833_)
      (std/srfi/151#bitwise-if
       (arithmetic-shift
        (std/srfi/151#mask _start103832_ _end103833_)
        _start103832_)
       _from103831_
       _to103830_)))
  (define std/srfi/151#first-set-bit
    (lambda (_i103828_)
      (- (bit-count (bitwise-xor _i103828_ (- _i103828_ '1))) '1)))
  (define std/srfi/151#bit-field-rotate
    (lambda (_n103817_ _count103818_ _start103819_ _end103820_)
      (letrec* ((_width103822_ (- _end103820_ _start103819_)))
        (set! _count103818_ (modulo _count103818_ _width103822_))
        (let ((_mask103824_
               (bitwise-not (arithmetic-shift '-1 _width103822_))))
          (letrec* ((_zn103826_
                     (bitwise-and
                      _mask103824_
                      (arithmetic-shift _n103817_ (- _start103819_)))))
            (bitwise-ior
             (arithmetic-shift
              (bitwise-ior
               (bitwise-and
                _mask103824_
                (arithmetic-shift _zn103826_ _count103818_))
               (arithmetic-shift _zn103826_ (- _count103818_ _width103822_)))
              _start103819_)
             (bitwise-and
              (bitwise-not (arithmetic-shift _mask103824_ _start103819_))
              _n103817_)))))))
  (define std/srfi/151#bit-reverse
    (lambda (_k103807_ _n103808_)
      (let _$loop103810_ ((_m103813_
                           (if (negative? _n103808_)
                               (bitwise-not _n103808_)
                               _n103808_))
                          (_k103814_ (+ '-1 _k103807_))
                          (_rvs103815_ '0))
        (if (negative? _k103814_)
            (if (negative? _n103808_) (bitwise-not _rvs103815_) _rvs103815_)
            (_$loop103810_
             (arithmetic-shift _m103813_ '-1)
             (+ '-1 _k103814_)
             (bitwise-ior
              (arithmetic-shift _rvs103815_ '1)
              (bitwise-and '1 _m103813_)))))))
  (define std/srfi/151#bit-field-reverse
    (lambda (_n103797_ _start103798_ _end103799_)
      (letrec* ((_width103801_ (- _end103799_ _start103798_)))
        (let ((_mask103803_
               (bitwise-not (arithmetic-shift '-1 _width103801_))))
          (letrec* ((_zn103805_
                     (bitwise-and
                      _mask103803_
                      (arithmetic-shift _n103797_ (- _start103798_)))))
            (bitwise-ior
             (arithmetic-shift
              (std/srfi/151#bit-reverse _width103801_ _zn103805_)
              _start103798_)
             (bitwise-and
              (bitwise-not (arithmetic-shift _mask103803_ _start103798_))
              _n103797_)))))))
  (define std/srfi/151#copy-bit
    (lambda (_index103793_ _to103794_ _bool103795_)
      (if _bool103795_
          (bitwise-ior _to103794_ (arithmetic-shift '1 _index103793_))
          (bitwise-and
           _to103794_
           (bitwise-not (arithmetic-shift '1 _index103793_))))))
  (define std/srfi/151#bits->list
    (lambda (_k103777_ . _len103778_)
      (if (null? _len103778_)
          (let _$loop103780_ ((_k103783_ _k103777_) (_lst103784_ '()))
            (if (<= _k103783_ '0)
                (reverse _lst103784_)
                (_$loop103780_
                 (arithmetic-shift _k103783_ '-1)
                 (cons (odd? _k103783_) _lst103784_))))
          (let _$loop103786_ ((_idx103789_ (+ '-1 (car _len103778_)))
                              (_k103790_ _k103777_)
                              (_lst103791_ '()))
            (if (negative? _idx103789_)
                (reverse _lst103791_)
                (_$loop103786_
                 (+ '-1 _idx103789_)
                 (arithmetic-shift _k103790_ '-1)
                 (cons (odd? _k103790_) _lst103791_)))))))
  (define std/srfi/151#list->bits
    (lambda (_bools103769_)
      (let _$loop103771_ ((_bs103774_ (reverse _bools103769_))
                          (_acc103775_ '0))
        (if (null? _bs103774_)
            _acc103775_
            (_$loop103771_
             (cdr _bs103774_)
             (+ _acc103775_ _acc103775_ (if (car _bs103774_) '1 '0)))))))
  (define std/srfi/151#bits
    (lambda _bools103767_ (std/srfi/151#list->bits _bools103767_)))
  (define std/srfi/151#bitwise-if
    (lambda (_mask103763_ _n0103764_ _n1103765_)
      (bitwise-ior
       (bitwise-and _mask103763_ _n0103764_)
       (bitwise-and (bitwise-not _mask103763_) _n1103765_))))
  (define std/srfi/151#bits->vector__0
    (lambda (_i103758_) (list->vector (std/srfi/151#bits->list _i103758_))))
  (define std/srfi/151#bits->vector__1
    (lambda (_i103760_ _len103761_)
      (list->vector (std/srfi/151#bits->list _i103760_ _len103761_))))
  (define std/srfi/151#bits->vector
    (lambda _g279248_
      (let ((_g279247_ (let () (declare (not safe)) (##length _g279248_))))
        (cond ((let () (declare (not safe)) (##fx= _g279247_ 1))
               (apply std/srfi/151#bits->vector__0 _g279248_))
              ((let () (declare (not safe)) (##fx= _g279247_ 2))
               (apply std/srfi/151#bits->vector__1 _g279248_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/151#bits->vector
                _g279248_))))))
  (define std/srfi/151#vector->bits
    (lambda (_vector103756_)
      (std/srfi/151#list->bits (vector->list _vector103756_))))
  (define std/srfi/151#bit-swap
    (lambda (_n1103749_ _n2103750_ _i103751_)
      (let ((_n1-bit103753_ (bit-set? _n1103749_ _i103751_))
            (_n2-bit103754_ (bit-set? _n2103750_ _i103751_)))
        (std/srfi/151#copy-bit
         _n2103750_
         (std/srfi/151#copy-bit _n1103749_ _i103751_ _n2-bit103754_)
         _n1-bit103753_))))
  (define std/srfi/151#bitwise-fold
    (lambda (_proc103738_ _seed103739_ _i103740_)
      (let ((_len103742_ (integer-length _i103740_)))
        (let _loop103744_ ((_n103746_ '0) (_r103747_ _seed103739_))
          (if (= _n103746_ _len103742_)
              _r103747_
              (_loop103744_
               (+ _n103746_ '1)
               (_proc103738_ (bit-set? _n103746_ _i103740_) _r103747_)))))))
  (define std/srfi/151#bitwise-for-each
    (lambda (_proc103729_ _i103730_)
      (let ((_len103732_ (integer-length _i103730_)))
        (let _loop103734_ ((_n103736_ '0))
          (if (< _n103736_ _len103732_)
              (begin
                (_proc103729_ (bit-set? _n103736_ _i103730_))
                (_loop103734_ (+ _n103736_ '1)))
              '#!void)))))
  (define std/srfi/151#bitwise-unfold
    (lambda (_stop?103718_ _mapper103719_ _successor103720_ _seed103721_)
      (let _loop103723_ ((_n103725_ '0)
                         (_result103726_ '0)
                         (_state103727_ _seed103721_))
        (if (_stop?103718_ _state103727_)
            _result103726_
            (_loop103723_
             (+ _n103725_ '1)
             (std/srfi/151#copy-bit
              _n103725_
              _result103726_
              (_mapper103719_ _state103727_))
             (_successor103720_ _state103727_))))))
  (define std/srfi/151#make-bitwise-generator
    (lambda (_i103713_)
      (lambda ()
        (let ((_bit103716_ (bit-set? '0 _i103713_)))
          (set! _i103713_ (arithmetic-shift _i103713_ '-1))
          _bit103716_)))))
