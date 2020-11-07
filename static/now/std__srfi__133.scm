(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/133#nonneg-int?
    (lambda (_x99074_)
      (if (integer? _x99074_) (not (negative? _x99074_)) '#f)))
  (define std/srfi/133#between?
    (lambda (_x99070_ _y99071_ _z99072_)
      (if (< _x99070_ _y99071_) (<= _y99071_ _z99072_) '#f)))
  (define std/srfi/133#unspecified-value (lambda () (if '#f '#f '#!void)))
  (define std/srfi/133#vectors-ref
    (lambda (_vectors99064_ _i99065_)
      (map (lambda (_v99067_) (vector-ref _v99067_ _i99065_)) _vectors99064_)))
  (define std/srfi/133#check-type
    (lambda (_pred?99060_ _value99061_ _callee99062_)
      (if (_pred?99060_ _value99061_)
          _value99061_
          (std/srfi/133#check-type
           _pred?99060_
           (error '"erroneous value"
                  (list _pred?99060_ _value99061_)
                  (cons 'while (cons 'calling (cons _callee99062_ '()))))
           _callee99062_))))
  (define std/srfi/133#check-index
    (lambda (_vec99054_ _index99055_ _callee99056_)
      (let ((_index99058_
             (std/srfi/133#check-type integer? _index99055_ _callee99056_)))
        (if (< _index99058_ '0)
            (std/srfi/133#check-index
             _vec99054_
             (error '"vector index too low"
                    _index99058_
                    (cons 'into (cons 'vector (cons _vec99054_ '())))
                    (cons 'while (cons 'calling (cons _callee99056_ '()))))
             _callee99056_)
            (if (>= _index99058_ (vector-length _vec99054_))
                (std/srfi/133#check-index
                 _vec99054_
                 (error '"vector index too high"
                        _index99058_
                        (cons 'into (cons 'vector (cons _vec99054_ '())))
                        (cons 'while (cons 'calling (cons _callee99056_ '()))))
                 _callee99056_)
                _index99058_)))))
  (define std/srfi/133#check-indices
    (lambda (_vec99038_
             _start99039_
             _start-name99040_
             _end99041_
             _end-name99042_
             _callee99043_)
      (let ((_lose99047_
             (lambda _things99045_
               (apply error
                      '"vector range out of bounds"
                      (append _things99045_
                              (cons 'vector (cons 'was (cons _vec99038_ '())))
                              (cons _start-name99040_
                                    (cons 'was (cons _start99039_ '())))
                              (cons _end-name99042_
                                    (cons 'was (cons _end99041_ '())))
                              (cons 'while
                                    (cons 'calling
                                          (cons _callee99043_ '())))))))
            (_start99048_
             (std/srfi/133#check-type integer? _start99039_ _callee99043_))
            (_end99049_
             (std/srfi/133#check-type integer? _end99041_ _callee99043_)))
        (if (> _start99048_ _end99049_)
            (let ((_g279179_
                   (_lose99047_
                    (cons _end-name99042_
                          (cons '< (cons _start-name99040_ '()))))))
              (begin
                (let ((_g279180_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g279179_)
                             (##vector-length _g279179_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g279180_ 2)))
                      (error "Context expects 2 values" _g279180_)))
                (let ((_new-start99051_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g279179_ 0)))
                      (_new-end99052_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g279179_ 1))))
                  (std/srfi/133#check-indices
                   _vec99038_
                   _new-start99051_
                   _start-name99040_
                   _new-end99052_
                   _end-name99042_
                   _callee99043_))))
            (if (< _start99048_ '0)
                (std/srfi/133#check-indices
                 _vec99038_
                 (_lose99047_ (cons _start-name99040_ (cons '< (cons '0 '()))))
                 _start-name99040_
                 _end99049_
                 _end-name99042_
                 _callee99043_)
                (if (>= _start99048_ (vector-length _vec99038_))
                    (std/srfi/133#check-indices
                     _vec99038_
                     (_lose99047_
                      (cons _start-name99040_ (cons '> (cons 'len '())))
                      (cons 'len
                            (cons 'was (cons (vector-length _vec99038_) '()))))
                     _start-name99040_
                     _end99049_
                     _end-name99042_
                     _callee99043_)
                    (if (> _end99049_ (vector-length _vec99038_))
                        (std/srfi/133#check-indices
                         _vec99038_
                         _start99048_
                         _start-name99040_
                         (_lose99047_
                          (cons _end-name99042_ (cons '> (cons 'len '())))
                          (cons 'len
                                (cons 'was
                                      (cons (vector-length _vec99038_) '()))))
                         _end-name99042_
                         _callee99043_)
                        (values _start99048_ _end99049_))))))))
  (define std/srfi/133#vector-parse-start+end
    (lambda (_vec99030_
             _args99031_
             _start-name99032_
             _end-name99033_
             _callee99034_)
      (let ((_len99036_ (vector-length _vec99030_)))
        (if (null? _args99031_)
            (values '0 _len99036_)
            (if (null? (cdr _args99031_))
                (std/srfi/133#check-indices
                 _vec99030_
                 (car _args99031_)
                 _start-name99032_
                 _len99036_
                 _end-name99033_
                 _callee99034_)
                (if (null? (cddr _args99031_))
                    (std/srfi/133#check-indices
                     _vec99030_
                     (car _args99031_)
                     _start-name99032_
                     (cadr _args99031_)
                     _end-name99033_
                     _callee99034_)
                    (error '"too many arguments"
                           (cons 'extra
                                 (cons 'args
                                       (cons 'were
                                             (cons (cddr _args99031_) '()))))
                           (cons 'while
                                 (cons 'calling
                                       (cons _callee99034_ '()))))))))))
  (define std/srfi/133#%smallest-length
    (letrec ((_loop99024_
              (lambda (_vector-list99026_ _length99027_ _callee99028_)
                (if (null? _vector-list99026_)
                    _length99027_
                    (_loop99024_
                     (cdr _vector-list99026_)
                     (min (vector-length
                           (std/srfi/133#check-type
                            vector?
                            (car _vector-list99026_)
                            _callee99028_))
                          _length99027_)
                     _callee99028_)))))
      _loop99024_))
  (define std/srfi/133#%vector-copy!
    (letrec ((_loop/l->r99003_
              (lambda (_target99006_
                       _source99007_
                       _send99008_
                       _i99009_
                       _j99010_)
                (if (< _i99009_ _send99008_)
                    (begin
                      (vector-set!
                       _target99006_
                       _j99010_
                       (vector-ref _source99007_ _i99009_))
                      (_loop/l->r99003_
                       _target99006_
                       _source99007_
                       _send99008_
                       (+ _i99009_ '1)
                       (+ _j99010_ '1)))
                    '#!void)))
             (_loop/r->l99004_
              (lambda (_target99012_
                       _source99013_
                       _sstart99014_
                       _i99015_
                       _j99016_)
                (if (>= _i99015_ _sstart99014_)
                    (begin
                      (vector-set!
                       _target99012_
                       _j99016_
                       (vector-ref _source99013_ _i99015_))
                      (_loop/r->l99004_
                       _target99012_
                       _source99013_
                       _sstart99014_
                       (- _i99015_ '1)
                       (- _j99016_ '1)))
                    '#!void))))
      (lambda (_target99018_
               _tstart99019_
               _source99020_
               _sstart99021_
               _send99022_)
        (if (> _sstart99021_ _tstart99019_)
            (_loop/l->r99003_
             _target99018_
             _source99020_
             _send99022_
             _sstart99021_
             _tstart99019_)
            (_loop/r->l99004_
             _target99018_
             _source99020_
             _sstart99021_
             (- _send99022_ '1)
             (+ '-1 _tstart99019_ _send99022_ (- _sstart99021_)))))))
  (define std/srfi/133#%vector-reverse-copy!
    (letrec ((_loop98989_
              (lambda (_target98991_
                       _source98992_
                       _sstart98993_
                       _i98994_
                       _j98995_)
                (if (>= _i98994_ _sstart98993_)
                    (begin
                      (vector-set!
                       _target98991_
                       _j98995_
                       (vector-ref _source98992_ _i98994_))
                      (_loop98989_
                       _target98991_
                       _source98992_
                       _sstart98993_
                       (- _i98994_ '1)
                       (+ _j98995_ '1)))
                    '#!void))))
      (lambda (_target98997_
               _tstart98998_
               _source98999_
               _sstart99000_
               _send99001_)
        (_loop98989_
         _target98997_
         _source98999_
         _sstart99000_
         (- _send99001_ '1)
         _tstart98998_))))
  (define std/srfi/133#%vector-reverse!
    (letrec ((_loop98977_
              (lambda (_vec98979_ _i98980_ _j98981_)
                (if (<= _i98980_ _j98981_)
                    (let ((_v98983_ (vector-ref _vec98979_ _i98980_)))
                      (vector-set!
                       _vec98979_
                       _i98980_
                       (vector-ref _vec98979_ _j98981_))
                      (vector-set! _vec98979_ _j98981_ _v98983_)
                      (_loop98977_ _vec98979_ (+ _i98980_ '1) (- _j98981_ '1)))
                    '#!void))))
      (lambda (_vec98985_ _start98986_ _end98987_)
        (_loop98977_ _vec98985_ _start98986_ (- _end98987_ '1)))))
  (define std/srfi/133#%vector-fold1
    (letrec ((_loop98964_
              (lambda (_kons98966_ _knil98967_ _len98968_ _vec98969_ _i98970_)
                (if (= _i98970_ _len98968_)
                    _knil98967_
                    (_loop98964_
                     _kons98966_
                     (_kons98966_ _knil98967_ (vector-ref _vec98969_ _i98970_))
                     _len98968_
                     _vec98969_
                     (+ _i98970_ '1))))))
      (lambda (_kons98972_ _knil98973_ _len98974_ _vec98975_)
        (_loop98964_ _kons98972_ _knil98973_ _len98974_ _vec98975_ '0))))
  (define std/srfi/133#%vector-fold2+
    (letrec ((_loop98951_
              (lambda (_kons98953_
                       _knil98954_
                       _len98955_
                       _vectors98956_
                       _i98957_)
                (if (= _i98957_ _len98955_)
                    _knil98954_
                    (_loop98951_
                     _kons98953_
                     (apply _kons98953_
                            _knil98954_
                            (std/srfi/133#vectors-ref _vectors98956_ _i98957_))
                     _len98955_
                     _vectors98956_
                     (+ _i98957_ '1))))))
      (lambda (_kons98959_ _knil98960_ _len98961_ _vectors98962_)
        (_loop98951_ _kons98959_ _knil98960_ _len98961_ _vectors98962_ '0))))
  (define std/srfi/133#%vector-map1!
    (letrec ((_loop98937_
              (lambda (_f98939_ _target98940_ _vec98941_ _i98942_)
                (if (zero? _i98942_)
                    _target98940_
                    (let ((_j98944_ (- _i98942_ '1)))
                      (vector-set!
                       _target98940_
                       _j98944_
                       (_f98939_ (vector-ref _vec98941_ _j98944_)))
                      (_loop98937_
                       _f98939_
                       _target98940_
                       _vec98941_
                       _j98944_))))))
      (lambda (_f98946_ _target98947_ _vec98948_ _len98949_)
        (_loop98937_ _f98946_ _target98947_ _vec98948_ _len98949_))))
  (define std/srfi/133#%vector-map2+!
    (letrec ((_loop98923_
              (lambda (_f98925_ _target98926_ _vectors98927_ _i98928_)
                (if (zero? _i98928_)
                    _target98926_
                    (let ((_j98930_ (- _i98928_ '1)))
                      (vector-set!
                       _target98926_
                       _j98930_
                       (apply _f98925_
                              (std/srfi/133#vectors-ref
                               _vectors98927_
                               _j98930_)))
                      (_loop98923_
                       _f98925_
                       _target98926_
                       _vectors98927_
                       _j98930_))))))
      (lambda (_f98932_ _target98933_ _vectors98934_ _len98935_)
        (_loop98923_ _f98932_ _target98933_ _vectors98934_ _len98935_))))
  (define std/srfi/133#vector-unfold
    (lambda (_f98917_ _length98918_ . _initial-seeds98919_)
      (letrec* ((_vec98921_ (make-vector _length98918_)))
        (apply std/srfi/133#vector-unfold!
               _f98917_
               _vec98921_
               '0
               _length98918_
               _initial-seeds98919_)
        _vec98921_)))
  (define std/srfi/133#vector-unfold!
    (letrec ((_tabulate!98879_
              (lambda (_f98883_ _vec98884_ _i98885_ _len98886_)
                (if (< _i98885_ _len98886_)
                    (begin
                      (vector-set! _vec98884_ _i98885_ (_f98883_ _i98885_))
                      (_tabulate!98879_
                       _f98883_
                       _vec98884_
                       (+ _i98885_ '1)
                       _len98886_))
                    '#!void)))
             (_unfold1!98880_
              (lambda (_f98888_ _vec98889_ _i98890_ _len98891_ _seed98892_)
                (if (< _i98890_ _len98891_)
                    (let ((_g279181_ (_f98888_ _i98890_ _seed98892_)))
                      (begin
                        (let ((_g279182_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g279181_)
                                     (##vector-length _g279181_)
                                     1))))
                          (if (not (let ()
                                     (declare (not safe))
                                     (##fx= _g279182_ 2)))
                              (error "Context expects 2 values" _g279182_)))
                        (let ((_elt98894_
                               (let ()
                                 (declare (not safe))
                                 (##vector-ref _g279181_ 0)))
                              (_new-seed98895_
                               (let ()
                                 (declare (not safe))
                                 (##vector-ref _g279181_ 1))))
                          (begin
                            (vector-set! _vec98889_ _i98890_ _elt98894_)
                            (_unfold1!98880_
                             _f98888_
                             _vec98889_
                             (+ _i98890_ '1)
                             _len98891_
                             _new-seed98895_)))))
                    '#!void)))
             (_unfold2+!98881_
              (lambda (_f98897_ _vec98898_ _i98899_ _len98900_ _seeds98901_)
                (if (< _i98899_ _len98900_)
                    (let ((_g279183_ (apply _f98897_ _i98899_ _seeds98901_)))
                      (begin
                        (let ((_g279184_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g279183_)
                                     (##vector-length _g279183_)
                                     1))))
                          (if (not (let ()
                                     (declare (not safe))
                                     (##fx>= _g279184_ 1)))
                              (error "Context expects at least 1 values"
                                     _g279184_)))
                        (let ((_elt98903_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g279183_)
                                     (##vector-ref _g279183_ 0)
                                     _g279183_)))
                              (_new-seeds98904_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g279183_)
                                     (##cdr (##vector->list _g279183_))
                                     '()))))
                          (begin
                            (vector-set! _vec98898_ _i98899_ _elt98903_)
                            (_unfold2+!98881_
                             _f98897_
                             _vec98898_
                             (+ _i98899_ '1)
                             _len98900_
                             _new-seeds98904_)))))
                    '#!void))))
      (lambda (_f98906_
               _vec98907_
               _start98908_
               _end98909_
               .
               _initial-seeds98910_)
        (let ((_f98912_
               (std/srfi/133#check-type
                procedure?
                _f98906_
                std/srfi/133#vector-unfold!))
              (_start98913_
               (std/srfi/133#check-type
                std/srfi/133#nonneg-int?
                _start98908_
                std/srfi/133#vector-unfold!))
              (_end98914_
               (std/srfi/133#check-type
                std/srfi/133#nonneg-int?
                _end98909_
                std/srfi/133#vector-unfold!)))
          (let ()
            (if (null? _initial-seeds98910_)
                (_tabulate!98879_ _f98912_ _vec98907_ _start98913_ _end98914_)
                (if (null? (cdr _initial-seeds98910_))
                    (_unfold1!98880_
                     _f98912_
                     _vec98907_
                     _start98913_
                     _end98914_
                     (car _initial-seeds98910_))
                    (_unfold2+!98881_
                     _f98912_
                     _vec98907_
                     _start98913_
                     _end98914_
                     _initial-seeds98910_))))))))
  (define std/srfi/133#vector-unfold-right
    (lambda (_f98873_ _len98874_ . _initial-seeds98875_)
      (letrec* ((_vec98877_ (make-vector _len98874_)))
        (apply std/srfi/133#vector-unfold-right!
               _f98873_
               _vec98877_
               '0
               _len98874_
               _initial-seeds98875_)
        _vec98877_)))
  (define std/srfi/133#vector-unfold-right!
    (lambda (_f98837_
             _vec98838_
             _start98839_
             _end98840_
             .
             _initial-seeds98841_)
      (letrec ((_tabulate!98843_
                (lambda (_f98847_ _vec98848_ _i98849_)
                  (if (>= _i98849_ _start98839_)
                      (begin
                        (vector-set! _vec98848_ _i98849_ (_f98847_ _i98849_))
                        (_tabulate!98843_ _f98847_ _vec98848_ (- _i98849_ '1)))
                      '#!void)))
               (_unfold1!98844_
                (lambda (_f98851_ _vec98852_ _i98853_ _seed98854_)
                  (if (>= _i98853_ _start98839_)
                      (let ((_g279185_ (_f98851_ _i98853_ _seed98854_)))
                        (begin
                          (let ((_g279186_
                                 (let ()
                                   (declare (not safe))
                                   (if (##values? _g279185_)
                                       (##vector-length _g279185_)
                                       1))))
                            (if (not (let ()
                                       (declare (not safe))
                                       (##fx= _g279186_ 2)))
                                (error "Context expects 2 values" _g279186_)))
                          (let ((_elt98856_
                                 (let ()
                                   (declare (not safe))
                                   (##vector-ref _g279185_ 0)))
                                (_new-seed98857_
                                 (let ()
                                   (declare (not safe))
                                   (##vector-ref _g279185_ 1))))
                            (begin
                              (vector-set! _vec98852_ _i98853_ _elt98856_)
                              (_unfold1!98844_
                               _f98851_
                               _vec98852_
                               (- _i98853_ '1)
                               _new-seed98857_)))))
                      '#!void)))
               (_unfold2+!98845_
                (lambda (_f98859_ _vec98860_ _i98861_ _seeds98862_)
                  (if (>= _i98861_ _start98839_)
                      (let ((_g279187_ (apply _f98859_ _i98861_ _seeds98862_)))
                        (begin
                          (let ((_g279188_
                                 (let ()
                                   (declare (not safe))
                                   (if (##values? _g279187_)
                                       (##vector-length _g279187_)
                                       1))))
                            (if (not (let ()
                                       (declare (not safe))
                                       (##fx>= _g279188_ 1)))
                                (error "Context expects at least 1 values"
                                       _g279188_)))
                          (let ((_elt98864_
                                 (let ()
                                   (declare (not safe))
                                   (if (##values? _g279187_)
                                       (##vector-ref _g279187_ 0)
                                       _g279187_)))
                                (_new-seeds98865_
                                 (let ()
                                   (declare (not safe))
                                   (if (##values? _g279187_)
                                       (##cdr (##vector->list _g279187_))
                                       '()))))
                            (begin
                              (vector-set! _vec98860_ _i98861_ _elt98864_)
                              (_unfold2+!98845_
                               _f98859_
                               _vec98860_
                               (- _i98861_ '1)
                               _new-seeds98865_)))))
                      '#!void))))
        (let ((_f98867_
               (std/srfi/133#check-type
                procedure?
                _f98837_
                std/srfi/133#vector-unfold-right!))
              (_start98868_
               (std/srfi/133#check-type
                std/srfi/133#nonneg-int?
                _start98839_
                std/srfi/133#vector-unfold-right!))
              (_end98869_
               (std/srfi/133#check-type
                std/srfi/133#nonneg-int?
                _end98840_
                std/srfi/133#vector-unfold-right!)))
          (let ((_i98871_ (- _end98869_ '1)))
            (if (null? _initial-seeds98841_)
                (_tabulate!98843_ _f98867_ _vec98838_ _i98871_)
                (if (null? (cdr _initial-seeds98841_))
                    (_unfold1!98844_
                     _f98867_
                     _vec98838_
                     _i98871_
                     (car _initial-seeds98841_))
                    (_unfold2+!98845_
                     _f98867_
                     _vec98838_
                     _i98871_
                     _initial-seeds98841_))))))))
  (define std/srfi/133#vector-copy
    (lambda (_vec98826_ . _args98827_)
      (let* ((_vec98829_
              (std/srfi/133#check-type
               vector?
               _vec98826_
               std/srfi/133#vector-copy))
             (_g279189_
              (std/srfi/133#vector-copy:parse-args _vec98829_ _args98827_)))
        (begin
          (let ((_g279190_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279189_) (##vector-length _g279189_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279190_ 3)))
                (error "Context expects 3 values" _g279190_)))
          (let ((_start98831_
                 (let () (declare (not safe)) (##vector-ref _g279189_ 0)))
                (_end98832_
                 (let () (declare (not safe)) (##vector-ref _g279189_ 1)))
                (_fill98833_
                 (let () (declare (not safe)) (##vector-ref _g279189_ 2))))
            (let ((_new-vector98835_
                   (make-vector (- _end98832_ _start98831_) _fill98833_)))
              (std/srfi/133#%vector-copy!
               _new-vector98835_
               '0
               _vec98829_
               _start98831_
               (if (> _end98832_ (vector-length _vec98829_))
                   (vector-length _vec98829_)
                   _end98832_))
              _new-vector98835_))))))
  (define std/srfi/133#vector-copy:parse-args
    (lambda (_vec98811_ _args98812_)
      (letrec ((_parse-args98814_
                (lambda (_start98818_ _end98819_ _n98820_ _fill98821_)
                  (let ((_start98823_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _start98818_
                          std/srfi/133#vector-copy))
                        (_end98824_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _end98819_
                          std/srfi/133#vector-copy)))
                    (if (and (<= '0 _start98823_ _end98824_)
                             (<= _start98823_ _n98820_))
                        (values _start98823_ _end98824_ _fill98821_)
                        (error '"illegal arguments"
                               (cons 'while
                                     (cons 'calling
                                           (cons std/srfi/133#vector-copy
                                                 '())))
                               (cons 'start
                                     (cons 'was (cons _start98823_ '())))
                               (cons 'end (cons 'was (cons _end98824_ '())))
                               (cons 'vector
                                     (cons 'was (cons _vec98811_ '())))))))))
        (let ((_n98816_ (vector-length _vec98811_)))
          (if (null? _args98812_)
              (_parse-args98814_
               '0
               _n98816_
               _n98816_
               (std/srfi/133#unspecified-value))
              (if (null? (cdr _args98812_))
                  (_parse-args98814_
                   (car _args98812_)
                   _n98816_
                   _n98816_
                   (std/srfi/133#unspecified-value))
                  (if (null? (cddr _args98812_))
                      (_parse-args98814_
                       (car _args98812_)
                       (cadr _args98812_)
                       _n98816_
                       (std/srfi/133#unspecified-value))
                      (if (null? (cdddr _args98812_))
                          (_parse-args98814_
                           (car _args98812_)
                           (cadr _args98812_)
                           _n98816_
                           (caddr _args98812_))
                          (error '"too many arguments"
                                 std/srfi/133#vector-copy
                                 (cdddr _args98812_))))))))))
  (define std/srfi/133#vector-reverse-copy
    (lambda (_vec98801_ . _maybe-start+end98802_)
      (let* ((_vec98804_
              (std/srfi/133#check-type
               vector?
               _vec98801_
               std/srfi/133#vector-reverse-copy))
             (_g279191_
              (std/srfi/133#vector-parse-start+end
               _vec98804_
               _maybe-start+end98802_
               'start
               'end
               std/srfi/133#vector-reverse-copy)))
        (begin
          (let ((_g279192_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279191_) (##vector-length _g279191_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279192_ 2)))
                (error "Context expects 2 values" _g279192_)))
          (let ((_start98806_
                 (let () (declare (not safe)) (##vector-ref _g279191_ 0)))
                (_end98807_
                 (let () (declare (not safe)) (##vector-ref _g279191_ 1))))
            (let ((_new98809_ (make-vector (- _end98807_ _start98806_))))
              (std/srfi/133#%vector-reverse-copy!
               _new98809_
               '0
               _vec98804_
               _start98806_
               _end98807_)
              _new98809_))))))
  (define std/srfi/133#vector-append
    (lambda _vectors98799_
      (std/srfi/133#vector-concatenate:aux
       _vectors98799_
       std/srfi/133#vector-append)))
  (define std/srfi/133#vector-concatenate
    (lambda (_vector-list98797_)
      (std/srfi/133#vector-concatenate:aux
       _vector-list98797_
       std/srfi/133#vector-concatenate)))
  (define std/srfi/133#vector-concatenate:aux
    (letrec ((_compute-length98767_
              (lambda (_vectors98770_ _len98771_ _callee98772_)
                (if (null? _vectors98770_)
                    _len98771_
                    (let ((_vec98774_
                           (std/srfi/133#check-type
                            vector?
                            (car _vectors98770_)
                            _callee98772_)))
                      (_compute-length98767_
                       (cdr _vectors98770_)
                       (+ (vector-length _vec98774_) _len98771_)
                       _callee98772_)))))
             (_concatenate!98768_
              (lambda (_vectors98776_ _target98777_ _to98778_)
                (if (null? _vectors98776_)
                    _target98777_
                    (let* ((_vec198780_ (car _vectors98776_))
                           (_len98782_ (vector-length _vec198780_)))
                      (std/srfi/133#%vector-copy!
                       _target98777_
                       _to98778_
                       _vec198780_
                       '0
                       _len98782_)
                      (_concatenate!98768_
                       (cdr _vectors98776_)
                       _target98777_
                       (+ _to98778_ _len98782_)))))))
      (lambda (_vectors98785_ _callee98786_)
        (if (null? _vectors98785_)
            (make-vector '0)
            (if (null? (cdr _vectors98785_))
                (let* ((_vec98788_
                        (std/srfi/133#check-type
                         vector?
                         (car _vectors98785_)
                         _callee98786_))
                       (_len98790_ (vector-length _vec98788_))
                       (_new98792_ (make-vector _len98790_)))
                  (std/srfi/133#%vector-copy!
                   _new98792_
                   '0
                   _vec98788_
                   '0
                   _len98790_)
                  _new98792_)
                (let ((_new-vector98795_
                       (make-vector
                        (_compute-length98767_
                         _vectors98785_
                         '0
                         _callee98786_))))
                  (_concatenate!98768_ _vectors98785_ _new-vector98795_ '0)
                  _new-vector98795_))))))
  (define std/srfi/133#vector-append-subvectors
    (lambda _args98718_
      (letrec ((_gather-args98720_
                (lambda (_args98758_)
                  (let _loop98760_ ((_args98762_ _args98758_)
                                    (_vecs98763_ '())
                                    (_starts98764_ '())
                                    (_ends98765_ '()))
                    (if (null? _args98762_)
                        (values (reverse _vecs98763_)
                                (reverse _starts98764_)
                                (reverse _ends98765_))
                        (_loop98760_
                         (cdddr _args98762_)
                         (cons (car _args98762_) _vecs98763_)
                         (cons (cadr _args98762_) _starts98764_)
                         (cons (caddr _args98762_) _ends98765_))))))
               (_total-length98721_
                (lambda (_starts98746_ _ends98747_)
                  (let _loop98749_ ((_count98751_ '0)
                                    (_starts98752_ _starts98746_)
                                    (_ends98753_ _ends98747_))
                    (if (null? _starts98752_)
                        _count98751_
                        (let ((_start98755_ (car _starts98752_))
                              (_end98756_ (car _ends98753_)))
                          (_loop98749_
                           (+ _count98751_ (- _end98756_ _start98755_))
                           (cdr _starts98752_)
                           (cdr _ends98753_)))))))
               (_copy-each!98722_
                (lambda (_result98730_ _vecs98731_ _starts98732_ _ends98733_)
                  (let _loop98735_ ((_at98737_ '0)
                                    (_vecs98738_ _vecs98731_)
                                    (_starts98739_ _starts98732_)
                                    (_ends98740_ _ends98733_))
                    (if (null? _vecs98738_)
                        _result98730_
                        (let ((_vec98742_ (car _vecs98738_))
                              (_start98743_ (car _starts98739_))
                              (_end98744_ (car _ends98740_)))
                          (std/srfi/133#%vector-copy!
                           _result98730_
                           _at98737_
                           _vec98742_
                           _start98743_
                           _end98744_)
                          (_loop98735_
                           (+ _at98737_ (- _end98744_ _start98743_))
                           (cdr _vecs98738_)
                           (cdr _starts98739_)
                           (cdr _ends98740_))))))))
        (let ((_g279193_ (_gather-args98720_ _args98718_)))
          (begin
            (let ((_g279194_
                   (let ()
                     (declare (not safe))
                     (if (##values? _g279193_)
                         (##vector-length _g279193_)
                         1))))
              (if (not (let () (declare (not safe)) (##fx= _g279194_ 3)))
                  (error "Context expects 3 values" _g279194_)))
            (let ((_vecs98724_
                   (let () (declare (not safe)) (##vector-ref _g279193_ 0)))
                  (_starts98725_
                   (let () (declare (not safe)) (##vector-ref _g279193_ 1)))
                  (_ends98726_
                   (let () (declare (not safe)) (##vector-ref _g279193_ 2))))
              (letrec* ((_result98728_
                         (make-vector
                          (_total-length98721_ _starts98725_ _ends98726_))))
                (_copy-each!98722_
                 _result98728_
                 _vecs98724_
                 _starts98725_
                 _ends98726_))))))))
  (define std/srfi/133#vector-empty?
    (lambda (_vec98714_)
      (let ((_vec98716_
             (std/srfi/133#check-type
              vector?
              _vec98714_
              std/srfi/133#vector-empty?)))
        (zero? (vector-length _vec98716_)))))
  (define std/srfi/133#vector=
    (lambda (_elt=?98699_ . _vectors98700_)
      (let ((_elt=?98702_
             (std/srfi/133#check-type
              procedure?
              _elt=?98699_
              std/srfi/133#vector=)))
        (if (null? _vectors98700_)
            '#t
            (if (null? (cdr _vectors98700_))
                (begin
                  (std/srfi/133#check-type
                   vector?
                   (car _vectors98700_)
                   std/srfi/133#vector=)
                  '#t)
                (let _loop98704_ ((_vecs98706_ _vectors98700_))
                  (let ((_vec198708_
                         (std/srfi/133#check-type
                          vector?
                          (car _vecs98706_)
                          std/srfi/133#vector=))
                        (_vec2+98709_ (cdr _vecs98706_)))
                    (let ((_$e98711_ (null? _vec2+98709_)))
                      (if _$e98711_
                          _$e98711_
                          (if (std/srfi/133#binary-vector=
                               _elt=?98702_
                               _vec198708_
                               (car _vec2+98709_))
                              (_loop98704_ _vec2+98709_)
                              '#f))))))))))
  (define std/srfi/133#binary-vector=
    (lambda (_elt=?98688_ _vector-a98689_ _vector-b98690_)
      (let ((_length-a98692_ (vector-length _vector-a98689_))
            (_length-b98693_ (vector-length _vector-b98690_)))
        (if (= _length-a98692_ _length-b98693_)
            (let _loop98695_ ((_i98697_ '0))
              (if (= _i98697_ _length-a98692_)
                  '#t
                  (if (_elt=?98688_
                       (vector-ref _vector-a98689_ _i98697_)
                       (vector-ref _vector-b98690_ _i98697_))
                      (_loop98695_ (+ _i98697_ '1))
                      '#f)))
            '#f))))
  (define std/srfi/133#vector-fold
    (lambda (_kons98680_ _knil98681_ _vec98682_ . _vectors98683_)
      (let ((_kons98685_
             (std/srfi/133#check-type
              procedure?
              _kons98680_
              std/srfi/133#vector-fold))
            (_vec98686_
             (std/srfi/133#check-type
              vector?
              _vec98682_
              std/srfi/133#vector-fold)))
        (if (null? _vectors98683_)
            (std/srfi/133#%vector-fold1
             _kons98685_
             _knil98681_
             (vector-length _vec98686_)
             _vec98686_)
            (std/srfi/133#%vector-fold2+
             _kons98685_
             _knil98681_
             (std/srfi/133#%smallest-length
              _vectors98683_
              (vector-length _vec98686_)
              std/srfi/133#vector-fold)
             (cons _vec98686_ _vectors98683_))))))
  (define std/srfi/133#vector-fold-right
    (letrec ((_loop198659_
              (lambda (_kons98662_ _knil98663_ _vec98664_ _i98665_)
                (if (negative? _i98665_)
                    _knil98663_
                    (_loop198659_
                     _kons98662_
                     (_kons98662_ _knil98663_ (vector-ref _vec98664_ _i98665_))
                     _vec98664_
                     (- _i98665_ '1)))))
             (_loop2+98660_
              (lambda (_kons98667_ _knil98668_ _vectors98669_ _i98670_)
                (if (negative? _i98670_)
                    _knil98668_
                    (_loop2+98660_
                     _kons98667_
                     (apply _kons98667_
                            _knil98668_
                            (std/srfi/133#vectors-ref _vectors98669_ _i98670_))
                     _vectors98669_
                     (- _i98670_ '1))))))
      (lambda (_kons98672_ _knil98673_ _vec98674_ . _vectors98675_)
        (let ((_kons98677_
               (std/srfi/133#check-type
                procedure?
                _kons98672_
                std/srfi/133#vector-fold-right))
              (_vec98678_
               (std/srfi/133#check-type
                vector?
                _vec98674_
                std/srfi/133#vector-fold-right)))
          (if (null? _vectors98675_)
              (_loop198659_
               _kons98677_
               _knil98673_
               _vec98678_
               (- (vector-length _vec98678_) '1))
              (_loop2+98660_
               _kons98677_
               _knil98673_
               (cons _vec98678_ _vectors98675_)
               (- (std/srfi/133#%smallest-length
                   _vectors98675_
                   (vector-length _vec98678_)
                   std/srfi/133#vector-fold-right)
                  '1)))))))
  (define std/srfi/133#vector-map
    (lambda (_f98648_ _vec98649_ . _vectors98650_)
      (let ((_f98652_
             (std/srfi/133#check-type
              procedure?
              _f98648_
              std/srfi/133#vector-map))
            (_vec98653_
             (std/srfi/133#check-type
              vector?
              _vec98649_
              std/srfi/133#vector-map)))
        (if (null? _vectors98650_)
            (let ((_len98655_ (vector-length _vec98653_)))
              (std/srfi/133#%vector-map1!
               _f98652_
               (make-vector _len98655_)
               _vec98653_
               _len98655_))
            (let ((_len98657_
                   (std/srfi/133#%smallest-length
                    _vectors98650_
                    (vector-length _vec98653_)
                    std/srfi/133#vector-map)))
              (std/srfi/133#%vector-map2+!
               _f98652_
               (make-vector _len98657_)
               (cons _vec98653_ _vectors98650_)
               _len98657_))))))
  (define std/srfi/133#vector-map!
    (lambda (_f98641_ _vec98642_ . _vectors98643_)
      (let ((_f98645_
             (std/srfi/133#check-type
              procedure?
              _f98641_
              std/srfi/133#vector-map!))
            (_vec98646_
             (std/srfi/133#check-type
              vector?
              _vec98642_
              std/srfi/133#vector-map!)))
        (if (null? _vectors98643_)
            (std/srfi/133#%vector-map1!
             _f98645_
             _vec98646_
             _vec98646_
             (vector-length _vec98646_))
            (std/srfi/133#%vector-map2+!
             _f98645_
             _vec98646_
             (cons _vec98646_ _vectors98643_)
             (std/srfi/133#%smallest-length
              _vectors98643_
              (vector-length _vec98646_)
              std/srfi/133#vector-map!)))
        (std/srfi/133#unspecified-value))))
  (define std/srfi/133#vector-for-each
    (letrec ((_for-each198621_
              (lambda (_f98624_ _vec98625_ _i98626_ _len98627_)
                (if (< _i98626_ _len98627_)
                    (begin
                      (_f98624_ (vector-ref _vec98625_ _i98626_))
                      (_for-each198621_
                       _f98624_
                       _vec98625_
                       (+ _i98626_ '1)
                       _len98627_))
                    '#!void)))
             (_for-each2+98622_
              (lambda (_f98629_ _vecs98630_ _i98631_ _len98632_)
                (if (< _i98631_ _len98632_)
                    (begin
                      (apply _f98629_
                             (std/srfi/133#vectors-ref _vecs98630_ _i98631_))
                      (_for-each2+98622_
                       _f98629_
                       _vecs98630_
                       (+ _i98631_ '1)
                       _len98632_))
                    '#!void))))
      (lambda (_f98634_ _vec98635_ . _vectors98636_)
        (let ((_f98638_
               (std/srfi/133#check-type
                procedure?
                _f98634_
                std/srfi/133#vector-for-each))
              (_vec98639_
               (std/srfi/133#check-type
                vector?
                _vec98635_
                std/srfi/133#vector-for-each)))
          (if (null? _vectors98636_)
              (_for-each198621_
               _f98638_
               _vec98639_
               '0
               (vector-length _vec98639_))
              (_for-each2+98622_
               _f98638_
               (cons _vec98639_ _vectors98636_)
               '0
               (std/srfi/133#%smallest-length
                _vectors98636_
                (vector-length _vec98639_)
                std/srfi/133#vector-for-each)))))))
  (define std/srfi/133#vector-count
    (lambda (_pred?98608_ _vec98609_ . _vectors98610_)
      (let ((_pred?98612_
             (std/srfi/133#check-type
              procedure?
              _pred?98608_
              std/srfi/133#vector-count))
            (_vec98613_
             (std/srfi/133#check-type
              vector?
              _vec98609_
              std/srfi/133#vector-count)))
        (if (null? _vectors98610_)
            (std/srfi/133#%vector-fold1
             (lambda (_count98615_ _elt98616_)
               (if (_pred?98612_ _elt98616_) (+ _count98615_ '1) _count98615_))
             '0
             (vector-length _vec98613_)
             _vec98613_)
            (std/srfi/133#%vector-fold2+
             (lambda (_count98618_ . _elts98619_)
               (if (apply _pred?98612_ _elts98619_)
                   (+ _count98618_ '1)
                   _count98618_))
             '0
             (std/srfi/133#%smallest-length
              _vectors98610_
              (vector-length _vec98613_)
              std/srfi/133#vector-count)
             (cons _vec98613_ _vectors98610_))))))
  (define std/srfi/133#vector-cumulate
    (lambda (_f98589_ _knil98590_ _vec98591_)
      (let* ((_len98593_ (vector-length _vec98591_))
             (_result98595_ (make-vector _len98593_)))
        (let _loop98598_ ((_i98600_ '0) (_left98601_ _knil98590_))
          (if (= _i98600_ _len98593_)
              _result98595_
              (let* ((_right98603_ (vector-ref _vec98591_ _i98600_))
                     (_r98605_ (_f98589_ _left98601_ _right98603_)))
                (vector-set! _result98595_ _i98600_ _r98605_)
                (_loop98598_ (+ _i98600_ '1) _r98605_)))))))
  (define std/srfi/133#vector-index
    (lambda (_pred?98585_ _vec98586_ . _vectors98587_)
      (std/srfi/133#vector-index/skip
       _pred?98585_
       _vec98586_
       _vectors98587_
       std/srfi/133#vector-index)))
  (define std/srfi/133#vector-skip
    (lambda (_pred?98579_ _vec98580_ . _vectors98581_)
      (std/srfi/133#vector-index/skip
       (lambda _elts98583_ (not (apply _pred?98579_ _elts98583_)))
       _vec98580_
       _vectors98581_
       std/srfi/133#vector-skip)))
  (define std/srfi/133#vector-index/skip
    (letrec ((_loop198558_
              (lambda (_pred?98561_ _vec98562_ _len98563_ _i98564_)
                (if (= _i98564_ _len98563_)
                    '#f
                    (if (_pred?98561_ (vector-ref _vec98562_ _i98564_))
                        _i98564_
                        (_loop198558_
                         _pred?98561_
                         _vec98562_
                         _len98563_
                         (+ _i98564_ '1))))))
             (_loop2+98559_
              (lambda (_pred?98566_ _vectors98567_ _len98568_ _i98569_)
                (if (= _i98569_ _len98568_)
                    '#f
                    (if (apply _pred?98566_
                               (std/srfi/133#vectors-ref
                                _vectors98567_
                                _i98569_))
                        _i98569_
                        (_loop2+98559_
                         _pred?98566_
                         _vectors98567_
                         _len98568_
                         (+ _i98569_ '1)))))))
      (lambda (_pred?98571_ _vec98572_ _vectors98573_ _callee98574_)
        (let ((_pred?98576_
               (std/srfi/133#check-type procedure? _pred?98571_ _callee98574_))
              (_vec98577_
               (std/srfi/133#check-type vector? _vec98572_ _callee98574_)))
          (if (null? _vectors98573_)
              (_loop198558_
               _pred?98576_
               _vec98577_
               (vector-length _vec98577_)
               '0)
              (_loop2+98559_
               _pred?98576_
               (cons _vec98577_ _vectors98573_)
               (std/srfi/133#%smallest-length
                _vectors98573_
                (vector-length _vec98577_)
                _callee98574_)
               '0))))))
  (define std/srfi/133#vector-index-right
    (lambda (_pred?98554_ _vec98555_ . _vectors98556_)
      (std/srfi/133#vector-index/skip-right
       _pred?98554_
       _vec98555_
       _vectors98556_
       std/srfi/133#vector-index-right)))
  (define std/srfi/133#vector-skip-right
    (lambda (_pred?98548_ _vec98549_ . _vectors98550_)
      (std/srfi/133#vector-index/skip-right
       (lambda _elts98552_ (not (apply _pred?98548_ _elts98552_)))
       _vec98549_
       _vectors98550_
       std/srfi/133#vector-index-right)))
  (define std/srfi/133#vector-index/skip-right
    (letrec ((_loop198529_
              (lambda (_pred?98532_ _vec98533_ _i98534_)
                (if (negative? _i98534_)
                    '#f
                    (if (_pred?98532_ (vector-ref _vec98533_ _i98534_))
                        _i98534_
                        (_loop198529_
                         _pred?98532_
                         _vec98533_
                         (- _i98534_ '1))))))
             (_loop2+98530_
              (lambda (_pred?98536_ _vectors98537_ _i98538_)
                (if (negative? _i98538_)
                    '#f
                    (if (apply _pred?98536_
                               (std/srfi/133#vectors-ref
                                _vectors98537_
                                _i98538_))
                        _i98538_
                        (_loop2+98530_
                         _pred?98536_
                         _vectors98537_
                         (- _i98538_ '1)))))))
      (lambda (_pred?98540_ _vec98541_ _vectors98542_ _callee98543_)
        (let ((_pred?98545_
               (std/srfi/133#check-type procedure? _pred?98540_ _callee98543_))
              (_vec98546_
               (std/srfi/133#check-type vector? _vec98541_ _callee98543_)))
          (if (null? _vectors98542_)
              (_loop198529_
               _pred?98545_
               _vec98546_
               (- (vector-length _vec98546_) '1))
              (_loop2+98530_
               _pred?98545_
               (cons _vec98546_ _vectors98542_)
               (- (std/srfi/133#%smallest-length
                   _vectors98542_
                   (vector-length _vec98546_)
                   _callee98543_)
                  '1)))))))
  (define std/srfi/133#vector-binary-search
    (lambda (_vec98504_ _value98505_ _cmp98506_ . _maybe-start+end98507_)
      (let* ((_cmp98509_
              (std/srfi/133#check-type
               procedure?
               _cmp98506_
               std/srfi/133#vector-binary-search))
             (_vec98511_
              (std/srfi/133#check-type
               vector?
               _vec98504_
               std/srfi/133#vector-binary-search))
             (_g279195_
              (std/srfi/133#vector-parse-start+end
               _vec98511_
               _maybe-start+end98507_
               'start
               'end
               std/srfi/133#vector-binary-search)))
        (begin
          (let ((_g279196_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279195_) (##vector-length _g279195_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279196_ 2)))
                (error "Context expects 2 values" _g279196_)))
          (let ((_start98513_
                 (let () (declare (not safe)) (##vector-ref _g279195_ 0)))
                (_end98514_
                 (let () (declare (not safe)) (##vector-ref _g279195_ 1))))
            (let _loop98516_ ((_start98518_ _start98513_)
                              (_end98519_ _end98514_)
                              (_j98520_ '#f))
              (let ((_i98522_ (quotient (+ _start98518_ _end98519_) '2)))
                (if (or (= _start98518_ _end98519_)
                        (and _j98520_ (= _i98522_ _j98520_)))
                    '#f
                    (let ((_comparison98527_
                           (std/srfi/133#check-type
                            integer?
                            (_cmp98509_
                             (vector-ref _vec98511_ _i98522_)
                             _value98505_)
                            (cons _cmp98509_
                                  (cons 'for
                                        (cons std/srfi/133#vector-binary-search
                                              '()))))))
                      (if (zero? _comparison98527_)
                          _i98522_
                          (if (positive? _comparison98527_)
                              (_loop98516_ _start98518_ _i98522_ _i98522_)
                              (_loop98516_
                               _i98522_
                               _end98519_
                               _i98522_))))))))))))
  (define std/srfi/133#vector-any
    (letrec ((_loop198472_
              (lambda (_pred?98475_
                       _vec98476_
                       _i98477_
                       _len98478_
                       _len-198479_)
                (if (not (= _i98477_ _len98478_))
                    (if (= _i98477_ _len-198479_)
                        (_pred?98475_ (vector-ref _vec98476_ _i98477_))
                        (let ((_$e98481_
                               (_pred?98475_
                                (vector-ref _vec98476_ _i98477_))))
                          (if _$e98481_
                              _$e98481_
                              (_loop198472_
                               _pred?98475_
                               _vec98476_
                               (+ _i98477_ '1)
                               _len98478_
                               _len-198479_))))
                    '#f)))
             (_loop2+98473_
              (lambda (_pred?98484_
                       _vectors98485_
                       _i98486_
                       _len98487_
                       _len-198488_)
                (if (not (= _i98486_ _len98487_))
                    (if (= _i98486_ _len-198488_)
                        (apply _pred?98484_
                               (std/srfi/133#vectors-ref
                                _vectors98485_
                                _i98486_))
                        (let ((_$e98490_
                               (apply _pred?98484_
                                      (std/srfi/133#vectors-ref
                                       _vectors98485_
                                       _i98486_))))
                          (if _$e98490_
                              _$e98490_
                              (_loop2+98473_
                               _pred?98484_
                               _vectors98485_
                               (+ _i98486_ '1)
                               _len98487_
                               _len-198488_))))
                    '#f))))
      (lambda (_pred?98493_ _vec98494_ . _vectors98495_)
        (let ((_pred?98497_
               (std/srfi/133#check-type
                procedure?
                _pred?98493_
                std/srfi/133#vector-any))
              (_vec98498_
               (std/srfi/133#check-type
                vector?
                _vec98494_
                std/srfi/133#vector-any)))
          (if (null? _vectors98495_)
              (let ((_len98500_ (vector-length _vec98498_)))
                (_loop198472_
                 _pred?98497_
                 _vec98498_
                 '0
                 _len98500_
                 (- _len98500_ '1)))
              (let ((_len98502_
                     (std/srfi/133#%smallest-length
                      _vectors98495_
                      (vector-length _vec98498_)
                      std/srfi/133#vector-any)))
                (_loop2+98473_
                 _pred?98497_
                 (cons _vec98498_ _vectors98495_)
                 '0
                 _len98502_
                 (- _len98502_ '1))))))))
  (define std/srfi/133#vector-every
    (letrec ((_loop198440_
              (lambda (_pred?98443_
                       _vec98444_
                       _i98445_
                       _len98446_
                       _len-198447_)
                (let ((_$e98449_ (= _i98445_ _len98446_)))
                  (if _$e98449_
                      _$e98449_
                      (if (= _i98445_ _len-198447_)
                          (_pred?98443_ (vector-ref _vec98444_ _i98445_))
                          (if (_pred?98443_ (vector-ref _vec98444_ _i98445_))
                              (_loop198440_
                               _pred?98443_
                               _vec98444_
                               (+ _i98445_ '1)
                               _len98446_
                               _len-198447_)
                              '#f))))))
             (_loop2+98441_
              (lambda (_pred?98452_
                       _vectors98453_
                       _i98454_
                       _len98455_
                       _len-198456_)
                (let ((_$e98458_ (= _i98454_ _len98455_)))
                  (if _$e98458_
                      _$e98458_
                      (if (= _i98454_ _len-198456_)
                          (apply _pred?98452_
                                 (std/srfi/133#vectors-ref
                                  _vectors98453_
                                  _i98454_))
                          (if (apply _pred?98452_
                                     (std/srfi/133#vectors-ref
                                      _vectors98453_
                                      _i98454_))
                              (_loop2+98441_
                               _pred?98452_
                               _vectors98453_
                               (+ _i98454_ '1)
                               _len98455_
                               _len-198456_)
                              '#f)))))))
      (lambda (_pred?98461_ _vec98462_ . _vectors98463_)
        (let ((_pred?98465_
               (std/srfi/133#check-type
                procedure?
                _pred?98461_
                std/srfi/133#vector-every))
              (_vec98466_
               (std/srfi/133#check-type
                vector?
                _vec98462_
                std/srfi/133#vector-every)))
          (if (null? _vectors98463_)
              (let ((_len98468_ (vector-length _vec98466_)))
                (_loop198440_
                 _pred?98465_
                 _vec98466_
                 '0
                 _len98468_
                 (- _len98468_ '1)))
              (let ((_len98470_
                     (std/srfi/133#%smallest-length
                      _vectors98463_
                      (vector-length _vec98466_)
                      std/srfi/133#vector-every)))
                (_loop2+98441_
                 _pred?98465_
                 (cons _vec98466_ _vectors98463_)
                 '0
                 _len98470_
                 (- _len98470_ '1))))))))
  (define std/srfi/133#vector-partition
    (lambda (_pred?98422_ _vec98423_)
      (let* ((_len98425_ (vector-length _vec98423_))
             (_cnt98427_ (std/srfi/133#vector-count _pred?98422_ _vec98423_))
             (_result98429_ (make-vector _len98425_)))
        (let _loop98432_ ((_i98434_ '0) (_yes98435_ '0) (_no98436_ _cnt98427_))
          (if (= _i98434_ _len98425_)
              (values _result98429_ _cnt98427_)
              (let ((_elem98438_ (vector-ref _vec98423_ _i98434_)))
                (if (_pred?98422_ _elem98438_)
                    (begin
                      (vector-set! _result98429_ _yes98435_ _elem98438_)
                      (_loop98432_
                       (+ _i98434_ '1)
                       (+ _yes98435_ '1)
                       _no98436_))
                    (begin
                      (vector-set! _result98429_ _no98436_ _elem98438_)
                      (_loop98432_
                       (+ _i98434_ '1)
                       _yes98435_
                       (+ _no98436_ '1))))))))))
  (define std/srfi/133#vector-swap!
    (lambda (_vec98411_ _i98412_ _j98413_)
      (let ((_vec98415_
             (std/srfi/133#check-type
              vector?
              _vec98411_
              std/srfi/133#vector-swap!)))
        (let ((_i98417_
               (std/srfi/133#check-index
                _vec98415_
                _i98412_
                std/srfi/133#vector-swap!))
              (_j98418_
               (std/srfi/133#check-index
                _vec98415_
                _j98413_
                std/srfi/133#vector-swap!)))
          (let ((_x98420_ (vector-ref _vec98415_ _i98417_)))
            (vector-set! _vec98415_ _i98417_ (vector-ref _vec98415_ _j98418_))
            (vector-set! _vec98415_ _j98418_ _x98420_))))))
  (define std/srfi/133#vector-fill!
    (lambda (_vec98397_ _value98398_ . _maybe-start+end98399_)
      (let* ((_vec98401_
              (std/srfi/133#check-type
               vector?
               _vec98397_
               std/srfi/133#vector-fill!))
             (_g279197_
              (std/srfi/133#vector-parse-start+end
               _vec98401_
               _maybe-start+end98399_
               'start
               'end
               std/srfi/133#vector-fill!)))
        (begin
          (let ((_g279198_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279197_) (##vector-length _g279197_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279198_ 2)))
                (error "Context expects 2 values" _g279198_)))
          (let ((_start98403_
                 (let () (declare (not safe)) (##vector-ref _g279197_ 0)))
                (_end98404_
                 (let () (declare (not safe)) (##vector-ref _g279197_ 1))))
            (let _$loop98406_ ((_i98409_ _start98403_))
              (if (= _i98409_ _end98404_)
                  '#!void
                  (begin
                    (vector-set! _vec98401_ _i98409_ _value98398_)
                    (_$loop98406_ (+ _i98409_ '1))))))))))
  (define std/srfi/133#vector-copy!
    (lambda (_target98380_
             _tstart98381_
             _source98382_
             .
             _maybe-sstart+send98383_)
      (letrec ((_doit!98385_
                (lambda (_sstart98389_ _send98390_ _source-length98391_)
                  (let ((_tstart98393_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _tstart98381_
                          std/srfi/133#vector-copy!))
                        (_sstart98394_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _sstart98389_
                          std/srfi/133#vector-copy!))
                        (_send98395_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _send98390_
                          std/srfi/133#vector-copy!)))
                    (if (and (<= '0
                                 _sstart98394_
                                 _send98395_
                                 _source-length98391_)
                             (<= (+ _tstart98393_
                                    (- _send98395_ _sstart98394_))
                                 (vector-length _target98380_)))
                        (std/srfi/133#%vector-copy!
                         _target98380_
                         _tstart98393_
                         _source98382_
                         _sstart98394_
                         _send98395_)
                        (error '"illegal arguments"
                               (cons 'while
                                     (cons 'calling
                                           (cons std/srfi/133#vector-copy!
                                                 '())))
                               (cons 'target
                                     (cons 'was (cons _target98380_ '())))
                               (cons 'target-length
                                     (cons 'was
                                           (cons (vector-length _target98380_)
                                                 '())))
                               (cons 'tstart
                                     (cons 'was (cons _tstart98393_ '())))
                               (cons 'source
                                     (cons 'was (cons _source98382_ '())))
                               (cons 'source-length
                                     (cons 'was
                                           (cons _source-length98391_ '())))
                               (cons 'sstart
                                     (cons 'was (cons _sstart98394_ '())))
                               (cons 'send
                                     (cons 'was (cons _send98395_ '())))))))))
        (let ((_n98387_ (vector-length _source98382_)))
          (if (null? _maybe-sstart+send98383_)
              (_doit!98385_ '0 _n98387_ _n98387_)
              (if (null? (cdr _maybe-sstart+send98383_))
                  (_doit!98385_
                   (car _maybe-sstart+send98383_)
                   _n98387_
                   _n98387_)
                  (if (null? (cddr _maybe-sstart+send98383_))
                      (_doit!98385_
                       (car _maybe-sstart+send98383_)
                       (cadr _maybe-sstart+send98383_)
                       _n98387_)
                      (error '"too many arguments"
                             std/srfi/133#vector-copy!
                             (cddr _maybe-sstart+send98383_)))))))))
  (define std/srfi/133#vector-reverse-copy!
    (lambda (_target98360_
             _tstart98361_
             _source98362_
             .
             _maybe-sstart+send98363_)
      (letrec ((_doit!98365_
                (lambda (_sstart98369_ _send98370_ _source-length98371_)
                  (let ((_tstart98373_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _tstart98361_
                          std/srfi/133#vector-reverse-copy!))
                        (_sstart98374_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _sstart98369_
                          std/srfi/133#vector-reverse-copy!))
                        (_send98375_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _send98370_
                          std/srfi/133#vector-reverse-copy!)))
                    (if (and (eq? _target98360_ _source98362_)
                             (or (std/srfi/133#between?
                                  _sstart98374_
                                  _tstart98373_
                                  _send98375_)
                                 (std/srfi/133#between?
                                  _tstart98373_
                                  _sstart98374_
                                  (+ _tstart98373_
                                     (- _send98375_ _sstart98374_)))))
                        (error '"vector range for self-copying overlaps"
                               std/srfi/133#vector-reverse-copy!
                               (cons 'vector
                                     (cons 'was (cons _target98360_ '())))
                               (cons 'tstart
                                     (cons 'was (cons _tstart98373_ '())))
                               (cons 'sstart
                                     (cons 'was (cons _sstart98374_ '())))
                               (cons 'send (cons 'was (cons _send98375_ '()))))
                        (if (and (<= '0
                                     _sstart98374_
                                     _send98375_
                                     _source-length98371_)
                                 (<= (+ _tstart98373_
                                        (- _send98375_ _sstart98374_))
                                     (vector-length _target98360_)))
                            (std/srfi/133#%vector-reverse-copy!
                             _target98360_
                             _tstart98373_
                             _source98362_
                             _sstart98374_
                             _send98375_)
                            (error '"illegal arguments"
                                   (cons 'while
                                         (cons 'calling
                                               (cons std/srfi/133#vector-reverse-copy!
                                                     '())))
                                   (cons 'target
                                         (cons 'was (cons _target98360_ '())))
                                   (cons 'target-length
                                         (cons 'was
                                               (cons (vector-length
                                                      _target98360_)
                                                     '())))
                                   (cons 'tstart
                                         (cons 'was (cons _tstart98373_ '())))
                                   (cons 'source
                                         (cons 'was (cons _source98362_ '())))
                                   (cons 'source-length
                                         (cons 'was
                                               (cons _source-length98371_
                                                     '())))
                                   (cons 'sstart
                                         (cons 'was (cons _sstart98374_ '())))
                                   (cons 'send
                                         (cons 'was
                                               (cons _send98375_ '()))))))))))
        (let ((_n98367_ (vector-length _source98362_)))
          (if (null? _maybe-sstart+send98363_)
              (_doit!98365_ '0 _n98367_ _n98367_)
              (if (null? (cdr _maybe-sstart+send98363_))
                  (_doit!98365_
                   (car _maybe-sstart+send98363_)
                   _n98367_
                   _n98367_)
                  (if (null? (cddr _maybe-sstart+send98363_))
                      (_doit!98365_
                       (car _maybe-sstart+send98363_)
                       (cadr _maybe-sstart+send98363_)
                       _n98367_)
                      (error '"too many arguments"
                             std/srfi/133#vector-reverse-copy!
                             (cddr _maybe-sstart+send98363_)))))))))
  (define std/srfi/133#vector-reverse!
    (lambda (_vec98352_ . _start+end98353_)
      (let* ((_vec98355_
              (std/srfi/133#check-type
               vector?
               _vec98352_
               std/srfi/133#vector-reverse!))
             (_g279199_
              (std/srfi/133#vector-parse-start+end
               _vec98355_
               _start+end98353_
               'start
               'end
               std/srfi/133#vector-reverse!)))
        (begin
          (let ((_g279200_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279199_) (##vector-length _g279199_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279200_ 2)))
                (error "Context expects 2 values" _g279200_)))
          (let ((_start98357_
                 (let () (declare (not safe)) (##vector-ref _g279199_ 0)))
                (_end98358_
                 (let () (declare (not safe)) (##vector-ref _g279199_ 1))))
            (std/srfi/133#%vector-reverse!
             _vec98355_
             _start98357_
             _end98358_))))))
  (define std/srfi/133#vector->list
    (lambda (_vec98338_ . _maybe-start+end98339_)
      (let* ((_vec98341_
              (std/srfi/133#check-type
               vector?
               _vec98338_
               std/srfi/133#vector->list))
             (_g279201_
              (std/srfi/133#vector-parse-start+end
               _vec98341_
               _maybe-start+end98339_
               'start
               'end
               std/srfi/133#vector->list)))
        (begin
          (let ((_g279202_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279201_) (##vector-length _g279201_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279202_ 2)))
                (error "Context expects 2 values" _g279202_)))
          (let ((_start98343_
                 (let () (declare (not safe)) (##vector-ref _g279201_ 0)))
                (_end98344_
                 (let () (declare (not safe)) (##vector-ref _g279201_ 1))))
            (let _$loop98346_ ((_i98349_ (- _end98344_ '1))
                               (_result98350_ '()))
              (if (< _i98349_ _start98343_)
                  _result98350_
                  (_$loop98346_
                   (- _i98349_ '1)
                   (cons (vector-ref _vec98341_ _i98349_)
                         _result98350_)))))))))
  (define std/srfi/133#reverse-vector->list
    (lambda (_vec98324_ . _maybe-start+end98325_)
      (let* ((_vec98327_
              (std/srfi/133#check-type
               vector?
               _vec98324_
               std/srfi/133#reverse-vector->list))
             (_g279203_
              (std/srfi/133#vector-parse-start+end
               _vec98327_
               _maybe-start+end98325_
               'start
               'end
               std/srfi/133#reverse-vector->list)))
        (begin
          (let ((_g279204_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279203_) (##vector-length _g279203_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279204_ 2)))
                (error "Context expects 2 values" _g279204_)))
          (let ((_start98329_
                 (let () (declare (not safe)) (##vector-ref _g279203_ 0)))
                (_end98330_
                 (let () (declare (not safe)) (##vector-ref _g279203_ 1))))
            (let _$loop98332_ ((_i98335_ _start98329_) (_result98336_ '()))
              (if (= _i98335_ _end98330_)
                  _result98336_
                  (_$loop98332_
                   (+ _i98335_ '1)
                   (cons (vector-ref _vec98327_ _i98335_)
                         _result98336_)))))))))
  (define std/srfi/133#list->vector
    (lambda (_lst98280_ . _maybe-start+end98281_)
      (if (null? _maybe-start+end98281_)
          (let* ((_start98283_ '0) (_end98285_ (length _lst98280_)))
            (let ((_start98288_
                   (std/srfi/133#check-type
                    std/srfi/133#nonneg-int?
                    _start98283_
                    std/srfi/133#list->vector))
                  (_end98289_
                   (std/srfi/133#check-type
                    std/srfi/133#nonneg-int?
                    _end98285_
                    std/srfi/133#list->vector)))
              ((lambda (_f98291_)
                 (std/srfi/133#vector-unfold
                  _f98291_
                  (- _end98289_ _start98288_)
                  (list-tail _lst98280_ _start98288_)))
               (lambda (_index98293_ _l98294_)
                 (if (null? _l98294_)
                     (error '"list was too short"
                            (cons 'list (cons 'was (cons _lst98280_ '())))
                            (cons 'attempted
                                  (cons 'end
                                        (cons 'was (cons _end98289_ '()))))
                            (cons 'while
                                  (cons 'calling
                                        (cons std/srfi/133#list->vector '()))))
                     (if (pair? _l98294_)
                         (values (car _l98294_) (cdr _l98294_))
                         (error '"erroneous value"
                                (list list? _lst98280_)
                                (cons 'while
                                      (cons 'calling
                                            (cons std/srfi/133#list->vector
                                                  '()))))))))))
          (let ((_start98296_ (car _maybe-start+end98281_))
                (_new-args98297_ (cdr _maybe-start+end98281_)))
            (if (null? _new-args98297_)
                (let ((_end98300_ (length _lst98280_)))
                  (let ((_start98303_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _start98296_
                          std/srfi/133#list->vector))
                        (_end98304_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _end98300_
                          std/srfi/133#list->vector)))
                    ((lambda (_f98306_)
                       (std/srfi/133#vector-unfold
                        _f98306_
                        (- _end98304_ _start98303_)
                        (list-tail _lst98280_ _start98303_)))
                     (lambda (_index98308_ _l98309_)
                       (if (null? _l98309_)
                           (error '"list was too short"
                                  (cons 'list
                                        (cons 'was (cons _lst98280_ '())))
                                  (cons 'attempted
                                        (cons 'end
                                              (cons 'was
                                                    (cons _end98304_ '()))))
                                  (cons 'while
                                        (cons 'calling
                                              (cons std/srfi/133#list->vector
                                                    '()))))
                           (if (pair? _l98309_)
                               (values (car _l98309_) (cdr _l98309_))
                               (error '"erroneous value"
                                      (list list? _lst98280_)
                                      (cons 'while
                                            (cons 'calling
                                                  (cons std/srfi/133#list->vector
                                                        '()))))))))))
                (let ((_end98311_ (car _new-args98297_))
                      (_new-args98312_ (cdr _new-args98297_)))
                  (if (null? _new-args98312_)
                      (let ()
                        (let ((_start98316_
                               (std/srfi/133#check-type
                                std/srfi/133#nonneg-int?
                                _start98296_
                                std/srfi/133#list->vector))
                              (_end98317_
                               (std/srfi/133#check-type
                                std/srfi/133#nonneg-int?
                                _end98311_
                                std/srfi/133#list->vector)))
                          ((lambda (_f98319_)
                             (std/srfi/133#vector-unfold
                              _f98319_
                              (- _end98317_ _start98316_)
                              (list-tail _lst98280_ _start98316_)))
                           (lambda (_index98321_ _l98322_)
                             (if (null? _l98322_)
                                 (error '"list was too short"
                                        (cons 'list
                                              (cons 'was
                                                    (cons _lst98280_ '())))
                                        (cons 'attempted
                                              (cons 'end
                                                    (cons 'was
                                                          (cons _end98317_
                                                                '()))))
                                        (cons 'while
                                              (cons 'calling
                                                    (cons std/srfi/133#list->vector
                                                          '()))))
                                 (if (pair? _l98322_)
                                     (values (car _l98322_) (cdr _l98322_))
                                     (error '"erroneous value"
                                            (list list? _lst98280_)
                                            (cons 'while
                                                  (cons 'calling
                                                        (cons std/srfi/133#list->vector
                                                              '()))))))))))
                      (error '"too many arguments"
                             (length _maybe-start+end98281_)
                             _maybe-start+end98281_))))))))
  (define std/srfi/133#reverse-list->vector
    (lambda (_lst98236_ . _maybe-start+end98237_)
      (if (null? _maybe-start+end98237_)
          (let* ((_start98239_ '0) (_end98241_ (length _lst98236_)))
            (let ((_start98244_
                   (std/srfi/133#check-type
                    std/srfi/133#nonneg-int?
                    _start98239_
                    std/srfi/133#reverse-list->vector))
                  (_end98245_
                   (std/srfi/133#check-type
                    std/srfi/133#nonneg-int?
                    _end98241_
                    std/srfi/133#reverse-list->vector)))
              ((lambda (_f98247_)
                 (std/srfi/133#vector-unfold-right
                  _f98247_
                  (- _end98245_ _start98244_)
                  (list-tail _lst98236_ _start98244_)))
               (lambda (_index98249_ _l98250_)
                 (if (null? _l98250_)
                     (error '"list too short"
                            (cons 'list (cons 'was (cons _lst98236_ '())))
                            (cons 'attempted
                                  (cons 'end
                                        (cons 'was (cons _end98245_ '()))))
                            (cons 'while
                                  (cons 'calling
                                        (cons std/srfi/133#reverse-list->vector
                                              '()))))
                     (if (pair? _l98250_)
                         (values (car _l98250_) (cdr _l98250_))
                         (error '"erroneous value"
                                (list list? _lst98236_)
                                (cons 'while
                                      (cons 'calling
                                            (cons std/srfi/133#reverse-list->vector
                                                  '()))))))))))
          (let ((_start98252_ (car _maybe-start+end98237_))
                (_new-args98253_ (cdr _maybe-start+end98237_)))
            (if (null? _new-args98253_)
                (let ((_end98256_ (length _lst98236_)))
                  (let ((_start98259_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _start98252_
                          std/srfi/133#reverse-list->vector))
                        (_end98260_
                         (std/srfi/133#check-type
                          std/srfi/133#nonneg-int?
                          _end98256_
                          std/srfi/133#reverse-list->vector)))
                    ((lambda (_f98262_)
                       (std/srfi/133#vector-unfold-right
                        _f98262_
                        (- _end98260_ _start98259_)
                        (list-tail _lst98236_ _start98259_)))
                     (lambda (_index98264_ _l98265_)
                       (if (null? _l98265_)
                           (error '"list too short"
                                  (cons 'list
                                        (cons 'was (cons _lst98236_ '())))
                                  (cons 'attempted
                                        (cons 'end
                                              (cons 'was
                                                    (cons _end98260_ '()))))
                                  (cons 'while
                                        (cons 'calling
                                              (cons std/srfi/133#reverse-list->vector
                                                    '()))))
                           (if (pair? _l98265_)
                               (values (car _l98265_) (cdr _l98265_))
                               (error '"erroneous value"
                                      (list list? _lst98236_)
                                      (cons 'while
                                            (cons 'calling
                                                  (cons std/srfi/133#reverse-list->vector
                                                        '()))))))))))
                (let ((_end98267_ (car _new-args98253_))
                      (_new-args98268_ (cdr _new-args98253_)))
                  (if (null? _new-args98268_)
                      (let ()
                        (let ((_start98272_
                               (std/srfi/133#check-type
                                std/srfi/133#nonneg-int?
                                _start98252_
                                std/srfi/133#reverse-list->vector))
                              (_end98273_
                               (std/srfi/133#check-type
                                std/srfi/133#nonneg-int?
                                _end98267_
                                std/srfi/133#reverse-list->vector)))
                          ((lambda (_f98275_)
                             (std/srfi/133#vector-unfold-right
                              _f98275_
                              (- _end98273_ _start98272_)
                              (list-tail _lst98236_ _start98272_)))
                           (lambda (_index98277_ _l98278_)
                             (if (null? _l98278_)
                                 (error '"list too short"
                                        (cons 'list
                                              (cons 'was
                                                    (cons _lst98236_ '())))
                                        (cons 'attempted
                                              (cons 'end
                                                    (cons 'was
                                                          (cons _end98273_
                                                                '()))))
                                        (cons 'while
                                              (cons 'calling
                                                    (cons std/srfi/133#reverse-list->vector
                                                          '()))))
                                 (if (pair? _l98278_)
                                     (values (car _l98278_) (cdr _l98278_))
                                     (error '"erroneous value"
                                            (list list? _lst98236_)
                                            (cons 'while
                                                  (cons 'calling
                                                        (cons std/srfi/133#reverse-list->vector
                                                              '()))))))))))
                      (error '"too many arguments"
                             (length _maybe-start+end98237_)
                             _maybe-start+end98237_))))))))
  (define std/srfi/133#vector->string
    (lambda (_vec98217_ . _maybe-start+end98218_)
      (let* ((_len98220_ (vector-length _vec98217_))
             (_start98222_
              (if (null? _maybe-start+end98218_)
                  '0
                  (car _maybe-start+end98218_)))
             (_end98224_
              (if (null? _maybe-start+end98218_)
                  _len98220_
                  (if (null? (cdr _maybe-start+end98218_))
                      _len98220_
                      (cadr _maybe-start+end98218_))))
             (_size98226_ (- _end98224_ _start98222_)))
        (letrec* ((_result98229_ (make-string _size98226_)))
          (let _loop98231_ ((_at98233_ '0) (_i98234_ _start98222_))
            (if (= _i98234_ _end98224_)
                _result98229_
                (begin
                  (string-set!
                   _result98229_
                   _at98233_
                   (vector-ref _vec98217_ _i98234_))
                  (_loop98231_ (+ _at98233_ '1) (+ _i98234_ '1)))))))))
  (define std/srfi/133#string->vector
    (lambda (_str98198_ . _maybe-start+end98199_)
      (let* ((_len98201_ (string-length _str98198_))
             (_start98203_
              (if (null? _maybe-start+end98199_)
                  '0
                  (car _maybe-start+end98199_)))
             (_end98205_
              (if (null? _maybe-start+end98199_)
                  _len98201_
                  (if (null? (cdr _maybe-start+end98199_))
                      _len98201_
                      (cadr _maybe-start+end98199_))))
             (_size98207_ (- _end98205_ _start98203_)))
        (letrec* ((_result98210_ (make-vector _size98207_)))
          (let _loop98212_ ((_at98214_ '0) (_i98215_ _start98203_))
            (if (= _i98215_ _end98205_)
                _result98210_
                (begin
                  (vector-set!
                   _result98210_
                   _at98214_
                   (string-ref _str98198_ _i98215_))
                  (_loop98212_ (+ _at98214_ '1) (+ _i98215_ '1))))))))))
