(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/127#any-null?
    (lambda (_list94775_)
      (if (null? _list94775_)
          '#f
          (if (null? (car _list94775_))
              '#t
              (std/srfi/127#any-null? (cdr _list94775_))))))
  (define std/srfi/127#gappend
    (lambda _args94768_
      (lambda ()
        (if (null? _args94768_)
            (eof-object)
            (let _loop94771_ ((_v94773_ ((car _args94768_))))
              (if (eof-object? _v94773_)
                  (begin
                    (set! _args94768_ (cdr _args94768_))
                    (if (null? _args94768_)
                        (eof-object)
                        (_loop94771_ ((car _args94768_)))))
                  _v94773_))))))
  (define std/srfi/127#generator->lseq
    (lambda (_gen94764_)
      (let ((_value94766_ (_gen94764_)))
        (if (eof-object? _value94766_) '() (cons _value94766_ _gen94764_)))))
  (define std/srfi/127#lseq-car (lambda (_lseq94762_) (car _lseq94762_)))
  (define std/srfi/127#lseq-first (lambda (_lseq94760_) (car _lseq94760_)))
  (define std/srfi/127#lseq-cdr
    (lambda (_lseq94754_)
      (if (procedure? (cdr _lseq94754_))
          (let ((_obj94756_ ((cdr _lseq94754_))))
            (if (eof-object? _obj94756_)
                (begin (set-cdr! _lseq94754_ '()) '())
                (let ((_result94758_ (cons _obj94756_ (cdr _lseq94754_))))
                  (set-cdr! _lseq94754_ _result94758_)
                  _result94758_)))
          (cdr _lseq94754_))))
  (define std/srfi/127#lseq-rest
    (lambda (_lseq94752_) (std/srfi/127#lseq-cdr _lseq94752_)))
  (define std/srfi/127#lseq?
    (lambda (_obj94750_)
      (if (null? _obj94750_)
          '#t
          (if (not (pair? _obj94750_))
              '#f
              (if (procedure? (cdr _obj94750_))
                  '#t
                  (std/srfi/127#lseq? (cdr _obj94750_)))))))
  (define std/srfi/127#lseq=?
    (lambda (_=94743_ _lseq194744_ _lseq294745_)
      (if (and (null? _lseq194744_) (null? _lseq294745_))
          '#t
          (if (or (null? _lseq194744_) (null? _lseq294745_))
              '#f
              (if (_=94743_ (car _lseq194744_) (car _lseq294745_))
                  (std/srfi/127#lseq=?
                   _=94743_
                   (std/srfi/127#lseq-cdr _lseq194744_)
                   (std/srfi/127#lseq-cdr _lseq294745_))
                  '#f)))))
  (define std/srfi/127#lseq-take
    (lambda (_lseq94737_ _i94738_)
      (std/srfi/127#generator->lseq
       (lambda ()
         (if (= _i94738_ '0)
             (eof-object)
             (let ((_result94741_ (car _lseq94737_)))
               (set! _lseq94737_ (std/srfi/127#lseq-cdr _lseq94737_))
               (set! _i94738_ (- _i94738_ '1))
               _result94741_))))))
  (define std/srfi/127#lseq-drop
    (lambda (_lseq94729_ _i94730_)
      (let _loop94732_ ((_i94734_ _i94730_) (_lseq94735_ _lseq94729_))
        (if (= _i94734_ '0)
            _lseq94735_
            (_loop94732_
             (- _i94734_ '1)
             (std/srfi/127#lseq-cdr _lseq94735_))))))
  (define std/srfi/127#lseq-ref
    (lambda (_lseq94726_ _i94727_)
      (car (std/srfi/127#lseq-drop _lseq94726_ _i94727_))))
  (define std/srfi/127#lseq-realize
    (lambda (_lseq94720_)
      (let _loop94722_ ((_next94724_ _lseq94720_))
        (if (null? _next94724_)
            _lseq94720_
            (_loop94722_ (std/srfi/127#lseq-cdr _next94724_))))))
  (define std/srfi/127#lseq-length
    (lambda (_lseq94718_) (length (std/srfi/127#lseq-realize _lseq94718_))))
  (define std/srfi/127#lseq->generator
    (lambda (_lseq94713_)
      (lambda ()
        (if (null? _lseq94713_)
            (eof-object)
            (let ((_result94716_ (car _lseq94713_)))
              (set! _lseq94713_ (std/srfi/127#lseq-cdr _lseq94713_))
              _result94716_)))))
  (define std/srfi/127#lseq-append
    (lambda _lseqs94711_
      (std/srfi/127#generator->lseq
       (apply std/srfi/127#gappend
              (map std/srfi/127#lseq->generator _lseqs94711_)))))
  (define std/srfi/127#safe-lseq-cdr
    (lambda (_obj94709_)
      (if (null? _obj94709_) _obj94709_ (std/srfi/127#lseq-cdr _obj94709_))))
  (define std/srfi/127#lseq-map
    (lambda (_proc94703_ . _lseqs94704_)
      (std/srfi/127#generator->lseq
       (lambda ()
         (if (std/srfi/127#any-null? _lseqs94704_)
             (eof-object)
             (let ((_result94707_
                    (apply _proc94703_
                           (map std/srfi/127#lseq-car _lseqs94704_))))
               (set! _lseqs94704_
                     (map std/srfi/127#safe-lseq-cdr _lseqs94704_))
               _result94707_))))))
  (define std/srfi/127#lseq-zip
    (lambda _lseqs94701_ (apply std/srfi/127#lseq-map list _lseqs94701_)))
  (define std/srfi/127#lseq-for-each
    (lambda (_proc94698_ . _lseqs94699_)
      (apply for-each
             _proc94698_
             (map std/srfi/127#lseq-realize _lseqs94699_))))
  (define std/srfi/127#lseq-filter
    (lambda (_pred94688_ _lseq94689_)
      (std/srfi/127#generator->lseq
       (lambda ()
         (let _loop94692_ ((_lseq194694_ _lseq94689_))
           (if (null? _lseq194694_)
               (eof-object)
               (let ((_result94696_ (car _lseq194694_)))
                 (if (_pred94688_ _result94696_)
                     (begin
                       (set! _lseq94689_ (std/srfi/127#lseq-cdr _lseq194694_))
                       _result94696_)
                     (_loop94692_ (std/srfi/127#lseq-cdr _lseq194694_))))))))))
  (define std/srfi/127#lseq-remove
    (lambda (_pred94683_ _lseq94684_)
      (std/srfi/127#lseq-filter
       (lambda (_x94686_) (not (_pred94683_ _x94686_)))
       _lseq94684_)))
  (define std/srfi/127#lseq-find
    (lambda (_pred94680_ _lseq94681_)
      (if (null? _lseq94681_)
          '#f
          (if (_pred94680_ (car _lseq94681_))
              (car _lseq94681_)
              (std/srfi/127#lseq-find
               _pred94680_
               (std/srfi/127#lseq-cdr _lseq94681_))))))
  (define std/srfi/127#lseq-find-tail
    (lambda (_pred94677_ _lseq94678_)
      (if (null? _lseq94678_)
          '#f
          (if (_pred94677_ (car _lseq94678_))
              _lseq94678_
              (std/srfi/127#lseq-find-tail
               _pred94677_
               (std/srfi/127#lseq-cdr _lseq94678_))))))
  (define std/srfi/127#lseq-take-while
    (lambda (_pred94671_ _lseq94672_)
      (std/srfi/127#generator->lseq
       (lambda ()
         (if (not (_pred94671_ (car _lseq94672_)))
             (eof-object)
             (let ((_result94675_ (car _lseq94672_)))
               (set! _lseq94672_ (std/srfi/127#lseq-cdr _lseq94672_))
               _result94675_))))))
  (define std/srfi/127#lseq-drop-while
    (lambda (_pred94664_ _lseq94665_)
      (let _loop94667_ ((_lseq94669_ _lseq94665_))
        (if (not (_pred94664_ (car _lseq94669_)))
            _lseq94669_
            (_loop94667_ (std/srfi/127#lseq-cdr _lseq94669_))))))
  (define std/srfi/127#lseq-any
    (lambda (_pred94655_ . _lseqs94656_)
      (let _loop94658_ ((_lseqs94660_ _lseqs94656_))
        (if (std/srfi/127#any-null? _lseqs94660_)
            '#f
            (let ((_result94662_
                   (apply _pred94655_
                          (map std/srfi/127#lseq-car _lseqs94660_))))
              (if _result94662_
                  _result94662_
                  (_loop94658_ (map std/srfi/127#lseq-cdr _lseqs94660_))))))))
  (define std/srfi/127#lseq-every
    (lambda (_pred94645_ . _lseqs94646_)
      (let _loop94648_ ((_lseqs94650_ _lseqs94646_) (_last-result94651_ '#t))
        (if (std/srfi/127#any-null? _lseqs94650_)
            _last-result94651_
            (let ((_result94653_
                   (apply _pred94645_
                          (map std/srfi/127#lseq-car _lseqs94650_))))
              (if _result94653_
                  (_loop94648_
                   (map std/srfi/127#lseq-cdr _lseqs94650_)
                   _result94653_)
                  '#f))))))
  (define std/srfi/127#lseq-index
    (lambda (_pred94637_ . _lseqs94638_)
      (let _loop94640_ ((_lseqs94642_ _lseqs94638_) (_n94643_ '0))
        (if (std/srfi/127#any-null? _lseqs94642_)
            '#f
            (if (apply _pred94637_ (map std/srfi/127#lseq-car _lseqs94642_))
                _n94643_
                (_loop94640_
                 (map std/srfi/127#safe-lseq-cdr _lseqs94642_)
                 (+ _n94643_ '1)))))))
  (define std/srfi/127#lseq-member__0
    (lambda (_x94630_ _lseq94631_)
      (std/srfi/127#lseq-member__1 _x94630_ _lseq94631_ equal?)))
  (define std/srfi/127#lseq-member__1
    (lambda (_x94633_ _lseq94634_ _=94635_)
      (if (null? _lseq94634_)
          '#f
          (if (_=94635_ _x94633_ (car _lseq94634_))
              _lseq94634_
              (std/srfi/127#lseq-member__1
               _x94633_
               (std/srfi/127#lseq-cdr _lseq94634_)
               _=94635_)))))
  (define std/srfi/127#lseq-member
    (lambda _g278822_
      (let ((_g278821_ (let () (declare (not safe)) (##length _g278822_))))
        (cond ((let () (declare (not safe)) (##fx= _g278821_ 2))
               (apply std/srfi/127#lseq-member__0 _g278822_))
              ((let () (declare (not safe)) (##fx= _g278821_ 3))
               (apply std/srfi/127#lseq-member__1 _g278822_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/127#lseq-member
                _g278822_))))))
  (define std/srfi/127#lseq-memv
    (lambda (_x94627_ _lseq94628_)
      (std/srfi/127#lseq-member__1 _x94627_ _lseq94628_ eqv?)))
  (define std/srfi/127#lseq-memq
    (lambda (_x94624_ _lseq94625_)
      (std/srfi/127#lseq-member__1 _x94624_ _lseq94625_ eq?))))
