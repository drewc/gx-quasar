(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/95#identity (lambda (_x88985_) _x88985_))
  (define std/srfi/95#sorted?
    (lambda (_seq88969_ _less?88970_ . _opt-key88971_)
      (letrec* ((_key88973_
                 (if (null? _opt-key88971_)
                     std/srfi/95#identity
                     (car _opt-key88971_))))
        (if (null? _seq88969_)
            '#t
            (if (null? (cdr _seq88969_))
                '#t
                (let _loop88975_ ((_last88977_ (_key88973_ (car _seq88969_)))
                                  (_next88978_ (cdr _seq88969_)))
                  (let ((_$e88980_ (null? _next88978_)))
                    (if _$e88980_
                        _$e88980_
                        (let ((_nxt88983_ (_key88973_ (car _next88978_))))
                          (if (not (_less?88970_ _nxt88983_ _last88977_))
                              (_loop88975_ _nxt88983_ (cdr _next88978_))
                              '#f))))))))))
  (define std/srfi/95#merge
    (lambda (_a88953_ _b88954_ _less?88955_ . _opt-key88956_)
      (letrec* ((_key88958_
                 (if (null? _opt-key88956_)
                     std/srfi/95#identity
                     (car _opt-key88956_))))
        (if (null? _a88953_)
            _b88954_
            (if (null? _b88954_)
                _a88953_
                (let _loop88960_ ((_x88962_ (car _a88953_))
                                  (_kx88963_ (_key88958_ (car _a88953_)))
                                  (_a88964_ (cdr _a88953_))
                                  (_y88965_ (car _b88954_))
                                  (_ky88966_ (_key88958_ (car _b88954_)))
                                  (_b88967_ (cdr _b88954_)))
                  (if (_less?88955_ _ky88966_ _kx88963_)
                      (if (null? _b88967_)
                          (cons _y88965_ (cons _x88962_ _a88964_))
                          (cons _y88965_
                                (_loop88960_
                                 _x88962_
                                 _kx88963_
                                 _a88964_
                                 (car _b88967_)
                                 (_key88958_ (car _b88967_))
                                 (cdr _b88967_))))
                      (if (null? _a88964_)
                          (cons _x88962_ (cons _y88965_ _b88967_))
                          (cons _x88962_
                                (_loop88960_
                                 (car _a88964_)
                                 (_key88958_ (car _a88964_))
                                 (cdr _a88964_)
                                 _y88965_
                                 _ky88966_
                                 _b88967_))))))))))
  (define std/srfi/95#sort:merge!
    (lambda (_a88937_ _b88938_ _less?88939_ _key88940_)
      (letrec ((_loop88942_
                (lambda (_r88947_ _a88948_ _kcara88949_ _b88950_ _kcarb88951_)
                  (if (_less?88939_ _kcarb88951_ _kcara88949_)
                      (begin
                        (set-cdr! _r88947_ _b88950_)
                        (if (null? (cdr _b88950_))
                            (set-cdr! _b88950_ _a88948_)
                            (_loop88942_
                             _b88950_
                             _a88948_
                             _kcara88949_
                             (cdr _b88950_)
                             (_key88940_ (cadr _b88950_)))))
                      (begin
                        (set-cdr! _r88947_ _a88948_)
                        (if (null? (cdr _a88948_))
                            (set-cdr! _a88948_ _b88950_)
                            (_loop88942_
                             _a88948_
                             (cdr _a88948_)
                             (_key88940_ (cadr _a88948_))
                             _b88950_
                             _kcarb88951_)))))))
        (if (null? _a88937_)
            _b88938_
            (if (null? _b88938_)
                _a88937_
                (let ((_kcara88944_ (_key88940_ (car _a88937_)))
                      (_kcarb88945_ (_key88940_ (car _b88938_))))
                  (if (_less?88939_ _kcarb88945_ _kcara88944_)
                      (begin
                        (if (null? (cdr _b88938_))
                            (set-cdr! _b88938_ _a88937_)
                            (_loop88942_
                             _b88938_
                             _a88937_
                             _kcara88944_
                             (cdr _b88938_)
                             (_key88940_ (cadr _b88938_))))
                        _b88938_)
                      (begin
                        (if (null? (cdr _a88937_))
                            (set-cdr! _a88937_ _b88938_)
                            (_loop88942_
                             _a88937_
                             (cdr _a88937_)
                             (_key88940_ (cadr _a88937_))
                             _b88938_
                             _kcarb88945_))
                        _a88937_))))))))
  (define std/srfi/95#merge!
    (lambda (_a88932_ _b88933_ _less?88934_ . _opt-key88935_)
      (std/srfi/95#sort:merge!
       _a88932_
       _b88933_
       _less?88934_
       (if (null? _opt-key88935_) std/srfi/95#identity (car _opt-key88935_)))))
  (define std/srfi/95#sort:sort-list!
    (lambda (_seq88896_ _less?88897_ _key88898_)
      (letrec* ((_keyer88900_ (if _key88898_ car std/srfi/95#identity))
                (_step88901_
                 (lambda (_n88915_)
                   (if (> _n88915_ '2)
                       (let* ((_j88917_ (quotient _n88915_ '2))
                              (_a88919_ (_step88901_ _j88917_))
                              (_k88921_ (- _n88915_ _j88917_))
                              (_b88923_ (_step88901_ _k88921_)))
                         (std/srfi/95#sort:merge!
                          _a88919_
                          _b88923_
                          _less?88897_
                          _keyer88900_))
                       (if (= _n88915_ '2)
                           (let ((_x88926_ (car _seq88896_))
                                 (_y88927_ (cadr _seq88896_))
                                 (_p88928_ _seq88896_))
                             (set! _seq88896_ (cddr _seq88896_))
                             (if (_less?88897_
                                  (_keyer88900_ _y88927_)
                                  (_keyer88900_ _x88926_))
                                 (begin
                                   (set-car! _p88928_ _y88927_)
                                   (set-car! (cdr _p88928_) _x88926_))
                                 '#!void)
                             (set-cdr! (cdr _p88928_) '())
                             _p88928_)
                           (if (= _n88915_ '1)
                               (let ((_p88930_ _seq88896_))
                                 (set! _seq88896_ (cdr _seq88896_))
                                 (set-cdr! _p88930_ '())
                                 _p88930_)
                               '())))))
                (_key-wrap!88902_
                 (lambda (_lst88910_)
                   (let ((_$e88912_ (null? _lst88910_)))
                     (if _$e88912_
                         _$e88912_
                         (begin
                           (set-car!
                            _lst88910_
                            (cons (_key88898_ (car _lst88910_))
                                  (car _lst88910_)))
                           (_key-wrap!88902_ (cdr _lst88910_)))))))
                (_key-unwrap!88903_
                 (lambda (_lst88905_)
                   (let ((_$e88907_ (null? _lst88905_)))
                     (if _$e88907_
                         _$e88907_
                         (begin
                           (set-car! _lst88905_ (cdar _lst88905_))
                           (_key-unwrap!88903_ (cdr _lst88905_))))))))
        (if _key88898_
            (begin
              (_key-wrap!88902_ _seq88896_)
              (set! _seq88896_ (_step88901_ (length _seq88896_)))
              (_key-unwrap!88903_ _seq88896_)
              _seq88896_)
            (_step88901_ (length _seq88896_))))))
  (define std/srfi/95#sort!
    (lambda (_seq88880_ _less?88881_ . _opt-key88882_)
      (letrec* ((_key88884_
                 (if (null? _opt-key88882_) '#f (car _opt-key88882_))))
        (let ((_ret88886_
               (std/srfi/95#sort:sort-list!
                _seq88880_
                _less?88881_
                _key88884_)))
          (if (not (eq? _ret88886_ _seq88880_))
              (let _$loop88888_ ((_crt88891_ _ret88886_))
                (if (eq? (cdr _crt88891_) _seq88880_)
                    (begin
                      (set-cdr! _crt88891_ _ret88886_)
                      (let ((_scar88893_ (car _seq88880_))
                            (_scdr88894_ (cdr _seq88880_)))
                        (set-car! _seq88880_ (car _ret88886_))
                        (set-cdr! _seq88880_ (cdr _ret88886_))
                        (set-car! _ret88886_ _scar88893_)
                        (set-cdr! _ret88886_ _scdr88894_)))
                    (_$loop88888_ (cdr _crt88891_))))
              '#!void)
          _seq88880_))))
  (define std/srfi/95#sort
    (lambda (_seq88874_ _less?88875_ . _opt-key88876_)
      (letrec* ((_key88878_
                 (if (null? _opt-key88876_) '#f (car _opt-key88876_))))
        (std/srfi/95#sort:sort-list!
         (append _seq88874_ '())
         _less?88875_
         _key88878_)))))
