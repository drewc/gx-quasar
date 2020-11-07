(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/43#nonneg-int?
    (lambda (_x86870_)
      (if (integer? _x86870_) (not (negative? _x86870_)) '#f)))
  (define std/srfi/43#between?
    (lambda (_x86866_ _y86867_ _z86868_)
      (if (< _x86866_ _y86867_) (<= _y86867_ _z86868_) '#f)))
  (define std/srfi/43#unspecified-value (lambda () (if '#f '#f '#!void)))
  (define std/srfi/43#vectors-ref
    (lambda (_vectors86860_ _i86861_)
      (map (lambda (_v86863_) (vector-ref _v86863_ _i86861_)) _vectors86860_)))
  (define std/srfi/43#check-type
    (lambda (_pred?86856_ _value86857_ _callee86858_)
      (if (_pred?86856_ _value86857_)
          _value86857_
          (std/srfi/43#check-type
           _pred?86856_
           (error '"erroneous value"
                  (list _pred?86856_ _value86857_)
                  (cons 'while (cons 'calling (cons _callee86858_ '()))))
           _callee86858_))))
  (define std/srfi/43#check-index
    (lambda (_vec86850_ _index86851_ _callee86852_)
      (let ((_index86854_
             (std/srfi/43#check-type integer? _index86851_ _callee86852_)))
        (if (< _index86854_ '0)
            (std/srfi/43#check-index
             _vec86850_
             (error '"vector index too low"
                    _index86854_
                    (cons 'into (cons 'vector (cons _vec86850_ '())))
                    (cons 'while (cons 'calling (cons _callee86852_ '()))))
             _callee86852_)
            (if (>= _index86854_ (vector-length _vec86850_))
                (std/srfi/43#check-index
                 _vec86850_
                 (error '"vector index too high"
                        _index86854_
                        (cons 'into (cons 'vector (cons _vec86850_ '())))
                        (cons 'while (cons 'calling (cons _callee86852_ '()))))
                 _callee86852_)
                _index86854_)))))
  (define std/srfi/43#check-indices
    (lambda (_vec86834_
             _start86835_
             _start-name86836_
             _end86837_
             _end-name86838_
             _callee86839_)
      (let ((_lose86843_
             (lambda _things86841_
               (apply error
                      '"vector range out of bounds"
                      (append _things86841_
                              (cons 'vector (cons 'was (cons _vec86834_ '())))
                              (cons _start-name86836_
                                    (cons 'was (cons _start86835_ '())))
                              (cons _end-name86838_
                                    (cons 'was (cons _end86837_ '())))
                              (cons 'while
                                    (cons 'calling
                                          (cons _callee86839_ '())))))))
            (_start86844_
             (std/srfi/43#check-type integer? _start86835_ _callee86839_))
            (_end86845_
             (std/srfi/43#check-type integer? _end86837_ _callee86839_)))
        (if (> _start86844_ _end86845_)
            (let ((_g278109_
                   (_lose86843_
                    (cons _end-name86838_
                          (cons '< (cons _start-name86836_ '()))))))
              (begin
                (let ((_g278110_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g278109_)
                             (##vector-length _g278109_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g278110_ 2)))
                      (error "Context expects 2 values" _g278110_)))
                (let ((_new-start86847_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278109_ 0)))
                      (_new-end86848_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278109_ 1))))
                  (std/srfi/43#check-indices
                   _vec86834_
                   _new-start86847_
                   _start-name86836_
                   _new-end86848_
                   _end-name86838_
                   _callee86839_))))
            (if (< _start86844_ '0)
                (std/srfi/43#check-indices
                 _vec86834_
                 (_lose86843_ (cons _start-name86836_ (cons '< (cons '0 '()))))
                 _start-name86836_
                 _end86845_
                 _end-name86838_
                 _callee86839_)
                (if (>= _start86844_ (vector-length _vec86834_))
                    (std/srfi/43#check-indices
                     _vec86834_
                     (_lose86843_
                      (cons _start-name86836_ (cons '> (cons 'len '())))
                      (cons 'len
                            (cons 'was (cons (vector-length _vec86834_) '()))))
                     _start-name86836_
                     _end86845_
                     _end-name86838_
                     _callee86839_)
                    (if (> _end86845_ (vector-length _vec86834_))
                        (std/srfi/43#check-indices
                         _vec86834_
                         _start86844_
                         _start-name86836_
                         (_lose86843_
                          (cons _end-name86838_ (cons '> (cons 'len '())))
                          (cons 'len
                                (cons 'was
                                      (cons (vector-length _vec86834_) '()))))
                         _end-name86838_
                         _callee86839_)
                        (values _start86844_ _end86845_))))))))
  (define std/srfi/43#vector-parse-start+end
    (lambda (_vec86826_
             _args86827_
             _start-name86828_
             _end-name86829_
             _callee86830_)
      (let ((_len86832_ (vector-length _vec86826_)))
        (if (null? _args86827_)
            (values '0 _len86832_)
            (if (null? (cdr _args86827_))
                (std/srfi/43#check-indices
                 _vec86826_
                 (car _args86827_)
                 _start-name86828_
                 _len86832_
                 _end-name86829_
                 _callee86830_)
                (if (null? (cddr _args86827_))
                    (std/srfi/43#check-indices
                     _vec86826_
                     (car _args86827_)
                     _start-name86828_
                     (cadr _args86827_)
                     _end-name86829_
                     _callee86830_)
                    (error '"too many arguments"
                           (cons 'extra
                                 (cons 'args
                                       (cons 'were
                                             (cons (cddr _args86827_) '()))))
                           (cons 'while
                                 (cons 'calling
                                       (cons _callee86830_ '()))))))))))
  (define std/srfi/43#%smallest-length
    (letrec ((_loop86820_
              (lambda (_vector-list86822_ _length86823_ _callee86824_)
                (if (null? _vector-list86822_)
                    _length86823_
                    (_loop86820_
                     (cdr _vector-list86822_)
                     (min (vector-length
                           (std/srfi/43#check-type
                            vector?
                            (car _vector-list86822_)
                            _callee86824_))
                          _length86823_)
                     _callee86824_)))))
      _loop86820_))
  (define std/srfi/43#%vector-copy!
    (letrec ((_loop/l->r86799_
              (lambda (_target86802_
                       _source86803_
                       _send86804_
                       _i86805_
                       _j86806_)
                (if (< _i86805_ _send86804_)
                    (begin
                      (vector-set!
                       _target86802_
                       _j86806_
                       (vector-ref _source86803_ _i86805_))
                      (_loop/l->r86799_
                       _target86802_
                       _source86803_
                       _send86804_
                       (+ _i86805_ '1)
                       (+ _j86806_ '1)))
                    '#!void)))
             (_loop/r->l86800_
              (lambda (_target86808_
                       _source86809_
                       _sstart86810_
                       _i86811_
                       _j86812_)
                (if (>= _i86811_ _sstart86810_)
                    (begin
                      (vector-set!
                       _target86808_
                       _j86812_
                       (vector-ref _source86809_ _i86811_))
                      (_loop/r->l86800_
                       _target86808_
                       _source86809_
                       _sstart86810_
                       (- _i86811_ '1)
                       (- _j86812_ '1)))
                    '#!void))))
      (lambda (_target86814_
               _tstart86815_
               _source86816_
               _sstart86817_
               _send86818_)
        (if (> _sstart86817_ _tstart86815_)
            (_loop/l->r86799_
             _target86814_
             _source86816_
             _send86818_
             _sstart86817_
             _tstart86815_)
            (_loop/r->l86800_
             _target86814_
             _source86816_
             _sstart86817_
             (- _send86818_ '1)
             (+ '-1 _tstart86815_ _send86818_ (- _sstart86817_)))))))
  (define std/srfi/43#%vector-reverse-copy!
    (letrec ((_loop86785_
              (lambda (_target86787_
                       _source86788_
                       _sstart86789_
                       _i86790_
                       _j86791_)
                (if (>= _i86790_ _sstart86789_)
                    (begin
                      (vector-set!
                       _target86787_
                       _j86791_
                       (vector-ref _source86788_ _i86790_))
                      (_loop86785_
                       _target86787_
                       _source86788_
                       _sstart86789_
                       (- _i86790_ '1)
                       (+ _j86791_ '1)))
                    '#!void))))
      (lambda (_target86793_
               _tstart86794_
               _source86795_
               _sstart86796_
               _send86797_)
        (_loop86785_
         _target86793_
         _source86795_
         _sstart86796_
         (- _send86797_ '1)
         _tstart86794_))))
  (define std/srfi/43#%vector-reverse!
    (letrec ((_loop86773_
              (lambda (_vec86775_ _i86776_ _j86777_)
                (if (<= _i86776_ _j86777_)
                    (let ((_v86779_ (vector-ref _vec86775_ _i86776_)))
                      (vector-set!
                       _vec86775_
                       _i86776_
                       (vector-ref _vec86775_ _j86777_))
                      (vector-set! _vec86775_ _j86777_ _v86779_)
                      (_loop86773_ _vec86775_ (+ _i86776_ '1) (- _j86777_ '1)))
                    '#!void))))
      (lambda (_vec86781_ _start86782_ _end86783_)
        (_loop86773_ _vec86781_ _start86782_ (- _end86783_ '1)))))
  (define std/srfi/43#%vector-fold1
    (letrec ((_loop86760_
              (lambda (_kons86762_ _knil86763_ _len86764_ _vec86765_ _i86766_)
                (if (= _i86766_ _len86764_)
                    _knil86763_
                    (_loop86760_
                     _kons86762_
                     (_kons86762_
                      _i86766_
                      _knil86763_
                      (vector-ref _vec86765_ _i86766_))
                     _len86764_
                     _vec86765_
                     (+ _i86766_ '1))))))
      (lambda (_kons86768_ _knil86769_ _len86770_ _vec86771_)
        (_loop86760_ _kons86768_ _knil86769_ _len86770_ _vec86771_ '0))))
  (define std/srfi/43#%vector-fold2+
    (letrec ((_loop86747_
              (lambda (_kons86749_
                       _knil86750_
                       _len86751_
                       _vectors86752_
                       _i86753_)
                (if (= _i86753_ _len86751_)
                    _knil86750_
                    (_loop86747_
                     _kons86749_
                     (apply _kons86749_
                            _i86753_
                            _knil86750_
                            (std/srfi/43#vectors-ref _vectors86752_ _i86753_))
                     _len86751_
                     _vectors86752_
                     (+ _i86753_ '1))))))
      (lambda (_kons86755_ _knil86756_ _len86757_ _vectors86758_)
        (_loop86747_ _kons86755_ _knil86756_ _len86757_ _vectors86758_ '0))))
  (define std/srfi/43#%vector-map1!
    (letrec ((_loop86733_
              (lambda (_f86735_ _target86736_ _vec86737_ _i86738_)
                (if (zero? _i86738_)
                    _target86736_
                    (let ((_j86740_ (- _i86738_ '1)))
                      (vector-set!
                       _target86736_
                       _j86740_
                       (_f86735_ _j86740_ (vector-ref _vec86737_ _j86740_)))
                      (_loop86733_
                       _f86735_
                       _target86736_
                       _vec86737_
                       _j86740_))))))
      (lambda (_f86742_ _target86743_ _vec86744_ _len86745_)
        (_loop86733_ _f86742_ _target86743_ _vec86744_ _len86745_))))
  (define std/srfi/43#%vector-map2+!
    (letrec ((_loop86719_
              (lambda (_f86721_ _target86722_ _vectors86723_ _i86724_)
                (if (zero? _i86724_)
                    _target86722_
                    (let ((_j86726_ (- _i86724_ '1)))
                      (vector-set!
                       _target86722_
                       _j86726_
                       (apply _f86721_
                              _j86726_
                              (std/srfi/43#vectors-ref
                               _vectors86723_
                               _j86726_)))
                      (_loop86719_
                       _f86721_
                       _target86722_
                       _vectors86723_
                       _j86726_))))))
      (lambda (_f86728_ _target86729_ _vectors86730_ _len86731_)
        (_loop86719_ _f86728_ _target86729_ _vectors86730_ _len86731_))))
  (define std/srfi/43#vector-unfold
    (letrec ((_tabulate!86683_
              (lambda (_f86687_ _vec86688_ _i86689_ _len86690_)
                (if (< _i86689_ _len86690_)
                    (begin
                      (vector-set! _vec86688_ _i86689_ (_f86687_ _i86689_))
                      (_tabulate!86683_
                       _f86687_
                       _vec86688_
                       (+ _i86689_ '1)
                       _len86690_))
                    '#!void)))
             (_unfold1!86684_
              (lambda (_f86692_ _vec86693_ _i86694_ _len86695_ _seed86696_)
                (if (< _i86694_ _len86695_)
                    (let ((_g278111_ (_f86692_ _i86694_ _seed86696_)))
                      (begin
                        (let ((_g278112_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g278111_)
                                     (##vector-length _g278111_)
                                     1))))
                          (if (not (let ()
                                     (declare (not safe))
                                     (##fx= _g278112_ 2)))
                              (error "Context expects 2 values" _g278112_)))
                        (let ((_elt86698_
                               (let ()
                                 (declare (not safe))
                                 (##vector-ref _g278111_ 0)))
                              (_new-seed86699_
                               (let ()
                                 (declare (not safe))
                                 (##vector-ref _g278111_ 1))))
                          (begin
                            (vector-set! _vec86693_ _i86694_ _elt86698_)
                            (_unfold1!86684_
                             _f86692_
                             _vec86693_
                             (+ _i86694_ '1)
                             _len86695_
                             _new-seed86699_)))))
                    '#!void)))
             (_unfold2+!86685_
              (lambda (_f86701_ _vec86702_ _i86703_ _len86704_ _seeds86705_)
                (if (< _i86703_ _len86704_)
                    (let ((_g278113_ (apply _f86701_ _i86703_ _seeds86705_)))
                      (begin
                        (let ((_g278114_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g278113_)
                                     (##vector-length _g278113_)
                                     1))))
                          (if (not (let ()
                                     (declare (not safe))
                                     (##fx>= _g278114_ 1)))
                              (error "Context expects at least 1 values"
                                     _g278114_)))
                        (let ((_elt86707_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g278113_)
                                     (##vector-ref _g278113_ 0)
                                     _g278113_)))
                              (_new-seeds86708_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g278113_)
                                     (##cdr (##vector->list _g278113_))
                                     '()))))
                          (begin
                            (vector-set! _vec86702_ _i86703_ _elt86707_)
                            (_unfold2+!86685_
                             _f86701_
                             _vec86702_
                             (+ _i86703_ '1)
                             _len86704_
                             _new-seeds86708_)))))
                    '#!void))))
      (lambda (_f86710_ _len86711_ . _initial-seeds86712_)
        (let ((_f86714_
               (std/srfi/43#check-type
                procedure?
                _f86710_
                std/srfi/43#vector-unfold))
              (_len86715_
               (std/srfi/43#check-type
                std/srfi/43#nonneg-int?
                _len86711_
                std/srfi/43#vector-unfold)))
          (let ((_vec86717_ (make-vector _len86715_)))
            (if (null? _initial-seeds86712_)
                (_tabulate!86683_ _f86714_ _vec86717_ '0 _len86715_)
                (if (null? (cdr _initial-seeds86712_))
                    (_unfold1!86684_
                     _f86714_
                     _vec86717_
                     '0
                     _len86715_
                     (car _initial-seeds86712_))
                    (_unfold2+!86685_
                     _f86714_
                     _vec86717_
                     '0
                     _len86715_
                     _initial-seeds86712_)))
            _vec86717_)))))
  (define std/srfi/43#vector-unfold-right
    (letrec ((_tabulate!86649_
              (lambda (_f86653_ _vec86654_ _i86655_)
                (if (>= _i86655_ '0)
                    (begin
                      (vector-set! _vec86654_ _i86655_ (_f86653_ _i86655_))
                      (_tabulate!86649_ _f86653_ _vec86654_ (- _i86655_ '1)))
                    '#!void)))
             (_unfold1!86650_
              (lambda (_f86657_ _vec86658_ _i86659_ _seed86660_)
                (if (>= _i86659_ '0)
                    (let ((_g278115_ (_f86657_ _i86659_ _seed86660_)))
                      (begin
                        (let ((_g278116_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g278115_)
                                     (##vector-length _g278115_)
                                     1))))
                          (if (not (let ()
                                     (declare (not safe))
                                     (##fx= _g278116_ 2)))
                              (error "Context expects 2 values" _g278116_)))
                        (let ((_elt86662_
                               (let ()
                                 (declare (not safe))
                                 (##vector-ref _g278115_ 0)))
                              (_new-seed86663_
                               (let ()
                                 (declare (not safe))
                                 (##vector-ref _g278115_ 1))))
                          (begin
                            (vector-set! _vec86658_ _i86659_ _elt86662_)
                            (_unfold1!86650_
                             _f86657_
                             _vec86658_
                             (- _i86659_ '1)
                             _new-seed86663_)))))
                    '#!void)))
             (_unfold2+!86651_
              (lambda (_f86665_ _vec86666_ _i86667_ _seeds86668_)
                (if (>= _i86667_ '0)
                    (let ((_g278117_ (apply _f86665_ _i86667_ _seeds86668_)))
                      (begin
                        (let ((_g278118_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g278117_)
                                     (##vector-length _g278117_)
                                     1))))
                          (if (not (let ()
                                     (declare (not safe))
                                     (##fx>= _g278118_ 1)))
                              (error "Context expects at least 1 values"
                                     _g278118_)))
                        (let ((_elt86670_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g278117_)
                                     (##vector-ref _g278117_ 0)
                                     _g278117_)))
                              (_new-seeds86671_
                               (let ()
                                 (declare (not safe))
                                 (if (##values? _g278117_)
                                     (##cdr (##vector->list _g278117_))
                                     '()))))
                          (begin
                            (vector-set! _vec86666_ _i86667_ _elt86670_)
                            (_unfold2+!86651_
                             _f86665_
                             _vec86666_
                             (- _i86667_ '1)
                             _new-seeds86671_)))))
                    '#!void))))
      (lambda (_f86673_ _len86674_ . _initial-seeds86675_)
        (let ((_f86677_
               (std/srfi/43#check-type
                procedure?
                _f86673_
                std/srfi/43#vector-unfold-right))
              (_len86678_
               (std/srfi/43#check-type
                std/srfi/43#nonneg-int?
                _len86674_
                std/srfi/43#vector-unfold-right)))
          (let ((_vec86680_ (make-vector _len86678_))
                (_i86681_ (- _len86678_ '1)))
            (if (null? _initial-seeds86675_)
                (_tabulate!86649_ _f86677_ _vec86680_ _i86681_)
                (if (null? (cdr _initial-seeds86675_))
                    (_unfold1!86650_
                     _f86677_
                     _vec86680_
                     _i86681_
                     (car _initial-seeds86675_))
                    (_unfold2+!86651_
                     _f86677_
                     _vec86680_
                     _i86681_
                     _initial-seeds86675_)))
            _vec86680_)))))
  (define std/srfi/43#vector-copy
    (lambda (_vec86638_ . _args86639_)
      (let* ((_vec86641_
              (std/srfi/43#check-type
               vector?
               _vec86638_
               std/srfi/43#vector-copy))
             (_g278119_
              (std/srfi/43#vector-copy:parse-args _vec86641_ _args86639_)))
        (begin
          (let ((_g278120_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g278119_) (##vector-length _g278119_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g278120_ 3)))
                (error "Context expects 3 values" _g278120_)))
          (let ((_start86643_
                 (let () (declare (not safe)) (##vector-ref _g278119_ 0)))
                (_end86644_
                 (let () (declare (not safe)) (##vector-ref _g278119_ 1)))
                (_fill86645_
                 (let () (declare (not safe)) (##vector-ref _g278119_ 2))))
            (let ((_new-vector86647_
                   (make-vector (- _end86644_ _start86643_) _fill86645_)))
              (std/srfi/43#%vector-copy!
               _new-vector86647_
               '0
               _vec86641_
               _start86643_
               (if (> _end86644_ (vector-length _vec86641_))
                   (vector-length _vec86641_)
                   _end86644_))
              _new-vector86647_))))))
  (define std/srfi/43#vector-copy:parse-args
    (lambda (_vec86623_ _args86624_)
      (letrec ((_parse-args86626_
                (lambda (_start86630_ _end86631_ _n86632_ _fill86633_)
                  (let ((_start86635_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _start86630_
                          std/srfi/43#vector-copy))
                        (_end86636_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _end86631_
                          std/srfi/43#vector-copy)))
                    (if (and (<= '0 _start86635_ _end86636_)
                             (<= _start86635_ _n86632_))
                        (values _start86635_ _end86636_ _fill86633_)
                        (error '"illegal arguments"
                               (cons 'while
                                     (cons 'calling
                                           (cons std/srfi/43#vector-copy '())))
                               (cons 'start
                                     (cons 'was (cons _start86635_ '())))
                               (cons 'end (cons 'was (cons _end86636_ '())))
                               (cons 'vector
                                     (cons 'was (cons _vec86623_ '())))))))))
        (let ((_n86628_ (vector-length _vec86623_)))
          (if (null? _args86624_)
              (_parse-args86626_
               '0
               _n86628_
               _n86628_
               (std/srfi/43#unspecified-value))
              (if (null? (cdr _args86624_))
                  (_parse-args86626_
                   (car _args86624_)
                   _n86628_
                   _n86628_
                   (std/srfi/43#unspecified-value))
                  (if (null? (cddr _args86624_))
                      (_parse-args86626_
                       (car _args86624_)
                       (cadr _args86624_)
                       _n86628_
                       (std/srfi/43#unspecified-value))
                      (if (null? (cdddr _args86624_))
                          (_parse-args86626_
                           (car _args86624_)
                           (cadr _args86624_)
                           _n86628_
                           (caddr _args86624_))
                          (error '"too many arguments"
                                 std/srfi/43#vector-copy
                                 (cdddr _args86624_))))))))))
  (define std/srfi/43#vector-reverse-copy
    (lambda (_vec86613_ . _maybe-start+end86614_)
      (let* ((_vec86616_
              (std/srfi/43#check-type
               vector?
               _vec86613_
               std/srfi/43#vector-reverse-copy))
             (_g278121_
              (std/srfi/43#vector-parse-start+end
               _vec86616_
               _maybe-start+end86614_
               'start
               'end
               std/srfi/43#vector-reverse-copy)))
        (begin
          (let ((_g278122_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g278121_) (##vector-length _g278121_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g278122_ 2)))
                (error "Context expects 2 values" _g278122_)))
          (let ((_start86618_
                 (let () (declare (not safe)) (##vector-ref _g278121_ 0)))
                (_end86619_
                 (let () (declare (not safe)) (##vector-ref _g278121_ 1))))
            (let ((_new86621_ (make-vector (- _end86619_ _start86618_))))
              (std/srfi/43#%vector-reverse-copy!
               _new86621_
               '0
               _vec86616_
               _start86618_
               _end86619_)
              _new86621_))))))
  (define std/srfi/43#vector-append
    (lambda _vectors86611_
      (std/srfi/43#vector-concatenate:aux
       _vectors86611_
       std/srfi/43#vector-append)))
  (define std/srfi/43#vector-concatenate
    (lambda (_vector-list86609_)
      (std/srfi/43#vector-concatenate:aux
       _vector-list86609_
       std/srfi/43#vector-concatenate)))
  (define std/srfi/43#vector-concatenate:aux
    (letrec ((_compute-length86579_
              (lambda (_vectors86582_ _len86583_ _callee86584_)
                (if (null? _vectors86582_)
                    _len86583_
                    (let ((_vec86586_
                           (std/srfi/43#check-type
                            vector?
                            (car _vectors86582_)
                            _callee86584_)))
                      (_compute-length86579_
                       (cdr _vectors86582_)
                       (+ (vector-length _vec86586_) _len86583_)
                       _callee86584_)))))
             (_concatenate!86580_
              (lambda (_vectors86588_ _target86589_ _to86590_)
                (if (null? _vectors86588_)
                    _target86589_
                    (let* ((_vec186592_ (car _vectors86588_))
                           (_len86594_ (vector-length _vec186592_)))
                      (std/srfi/43#%vector-copy!
                       _target86589_
                       _to86590_
                       _vec186592_
                       '0
                       _len86594_)
                      (_concatenate!86580_
                       (cdr _vectors86588_)
                       _target86589_
                       (+ _to86590_ _len86594_)))))))
      (lambda (_vectors86597_ _callee86598_)
        (if (null? _vectors86597_)
            (make-vector '0)
            (if (null? (cdr _vectors86597_))
                (let* ((_vec86600_
                        (std/srfi/43#check-type
                         vector?
                         (car _vectors86597_)
                         _callee86598_))
                       (_len86602_ (vector-length _vec86600_))
                       (_new86604_ (make-vector _len86602_)))
                  (std/srfi/43#%vector-copy!
                   _new86604_
                   '0
                   _vec86600_
                   '0
                   _len86602_)
                  _new86604_)
                (let ((_new-vector86607_
                       (make-vector
                        (_compute-length86579_
                         _vectors86597_
                         '0
                         _callee86598_))))
                  (_concatenate!86580_ _vectors86597_ _new-vector86607_ '0)
                  _new-vector86607_))))))
  (define std/srfi/43#vector-empty?
    (lambda (_vec86575_)
      (let ((_vec86577_
             (std/srfi/43#check-type
              vector?
              _vec86575_
              std/srfi/43#vector-empty?)))
        (zero? (vector-length _vec86577_)))))
  (define std/srfi/43#vector=
    (lambda (_elt=?86560_ . _vectors86561_)
      (let ((_elt=?86563_
             (std/srfi/43#check-type
              procedure?
              _elt=?86560_
              std/srfi/43#vector=)))
        (if (null? _vectors86561_)
            '#t
            (if (null? (cdr _vectors86561_))
                (begin
                  (std/srfi/43#check-type
                   vector?
                   (car _vectors86561_)
                   std/srfi/43#vector=)
                  '#t)
                (let _loop86565_ ((_vecs86567_ _vectors86561_))
                  (let ((_vec186569_
                         (std/srfi/43#check-type
                          vector?
                          (car _vecs86567_)
                          std/srfi/43#vector=))
                        (_vec2+86570_ (cdr _vecs86567_)))
                    (let ((_$e86572_ (null? _vec2+86570_)))
                      (if _$e86572_
                          _$e86572_
                          (if (std/srfi/43#binary-vector=
                               _elt=?86563_
                               _vec186569_
                               (car _vec2+86570_))
                              (_loop86565_ _vec2+86570_)
                              '#f))))))))))
  (define std/srfi/43#binary-vector=
    (lambda (_elt=?86535_ _vector-a86536_ _vector-b86537_)
      (let ((_$e86539_ (eq? _vector-a86536_ _vector-b86537_)))
        (if _$e86539_
            _$e86539_
            (let ((_length-a86542_ (vector-length _vector-a86536_))
                  (_length-b86543_ (vector-length _vector-b86537_)))
              (letrec ((_loop86545_
                        (lambda (_i86548_)
                          (let ((_$e86550_ (= _i86548_ _length-a86542_)))
                            (if _$e86550_
                                _$e86550_
                                (if (< _i86548_ _length-b86543_)
                                    (_test86546_
                                     (vector-ref _vector-a86536_ _i86548_)
                                     (vector-ref _vector-b86537_ _i86548_)
                                     _i86548_)
                                    '#f)))))
                       (_test86546_
                        (lambda (_elt-a86553_ _elt-b86554_ _i86555_)
                          (if (or (eq? _elt-a86553_ _elt-b86554_)
                                  (_elt=?86535_ _elt-a86553_ _elt-b86554_))
                              (_loop86545_ (+ _i86555_ '1))
                              '#f))))
                (if (= _length-a86542_ _length-b86543_)
                    (_loop86545_ '0)
                    '#f)))))))
  (define std/srfi/43#vector-fold
    (lambda (_kons86527_ _knil86528_ _vec86529_ . _vectors86530_)
      (let ((_kons86532_
             (std/srfi/43#check-type
              procedure?
              _kons86527_
              std/srfi/43#vector-fold))
            (_vec86533_
             (std/srfi/43#check-type
              vector?
              _vec86529_
              std/srfi/43#vector-fold)))
        (if (null? _vectors86530_)
            (std/srfi/43#%vector-fold1
             _kons86532_
             _knil86528_
             (vector-length _vec86533_)
             _vec86533_)
            (std/srfi/43#%vector-fold2+
             _kons86532_
             _knil86528_
             (std/srfi/43#%smallest-length
              _vectors86530_
              (vector-length _vec86533_)
              std/srfi/43#vector-fold)
             (cons _vec86533_ _vectors86530_))))))
  (define std/srfi/43#vector-fold-right
    (letrec ((_loop186506_
              (lambda (_kons86509_ _knil86510_ _vec86511_ _i86512_)
                (if (negative? _i86512_)
                    _knil86510_
                    (_loop186506_
                     _kons86509_
                     (_kons86509_
                      _i86512_
                      _knil86510_
                      (vector-ref _vec86511_ _i86512_))
                     _vec86511_
                     (- _i86512_ '1)))))
             (_loop2+86507_
              (lambda (_kons86514_ _knil86515_ _vectors86516_ _i86517_)
                (if (negative? _i86517_)
                    _knil86515_
                    (_loop2+86507_
                     _kons86514_
                     (apply _kons86514_
                            _i86517_
                            _knil86515_
                            (std/srfi/43#vectors-ref _vectors86516_ _i86517_))
                     _vectors86516_
                     (- _i86517_ '1))))))
      (lambda (_kons86519_ _knil86520_ _vec86521_ . _vectors86522_)
        (let ((_kons86524_
               (std/srfi/43#check-type
                procedure?
                _kons86519_
                std/srfi/43#vector-fold-right))
              (_vec86525_
               (std/srfi/43#check-type
                vector?
                _vec86521_
                std/srfi/43#vector-fold-right)))
          (if (null? _vectors86522_)
              (_loop186506_
               _kons86524_
               _knil86520_
               _vec86525_
               (- (vector-length _vec86525_) '1))
              (_loop2+86507_
               _kons86524_
               _knil86520_
               (cons _vec86525_ _vectors86522_)
               (- (std/srfi/43#%smallest-length
                   _vectors86522_
                   (vector-length _vec86525_)
                   std/srfi/43#vector-fold-right)
                  '1)))))))
  (define std/srfi/43#vector-map
    (lambda (_f86495_ _vec86496_ . _vectors86497_)
      (let ((_f86499_
             (std/srfi/43#check-type
              procedure?
              _f86495_
              std/srfi/43#vector-map))
            (_vec86500_
             (std/srfi/43#check-type
              vector?
              _vec86496_
              std/srfi/43#vector-map)))
        (if (null? _vectors86497_)
            (let ((_len86502_ (vector-length _vec86500_)))
              (std/srfi/43#%vector-map1!
               _f86499_
               (make-vector _len86502_)
               _vec86500_
               _len86502_))
            (let ((_len86504_
                   (std/srfi/43#%smallest-length
                    _vectors86497_
                    (vector-length _vec86500_)
                    std/srfi/43#vector-map)))
              (std/srfi/43#%vector-map2+!
               _f86499_
               (make-vector _len86504_)
               (cons _vec86500_ _vectors86497_)
               _len86504_))))))
  (define std/srfi/43#vector-map!
    (lambda (_f86488_ _vec86489_ . _vectors86490_)
      (let ((_f86492_
             (std/srfi/43#check-type
              procedure?
              _f86488_
              std/srfi/43#vector-map!))
            (_vec86493_
             (std/srfi/43#check-type
              vector?
              _vec86489_
              std/srfi/43#vector-map!)))
        (if (null? _vectors86490_)
            (std/srfi/43#%vector-map1!
             _f86492_
             _vec86493_
             _vec86493_
             (vector-length _vec86493_))
            (std/srfi/43#%vector-map2+!
             _f86492_
             _vec86493_
             (cons _vec86493_ _vectors86490_)
             (std/srfi/43#%smallest-length
              _vectors86490_
              (vector-length _vec86493_)
              std/srfi/43#vector-map!)))
        (std/srfi/43#unspecified-value))))
  (define std/srfi/43#vector-for-each
    (letrec ((_for-each186468_
              (lambda (_f86471_ _vec86472_ _i86473_ _len86474_)
                (if (< _i86473_ _len86474_)
                    (begin
                      (_f86471_ _i86473_ (vector-ref _vec86472_ _i86473_))
                      (_for-each186468_
                       _f86471_
                       _vec86472_
                       (+ _i86473_ '1)
                       _len86474_))
                    '#!void)))
             (_for-each2+86469_
              (lambda (_f86476_ _vecs86477_ _i86478_ _len86479_)
                (if (< _i86478_ _len86479_)
                    (begin
                      (apply _f86476_
                             _i86478_
                             (std/srfi/43#vectors-ref _vecs86477_ _i86478_))
                      (_for-each2+86469_
                       _f86476_
                       _vecs86477_
                       (+ _i86478_ '1)
                       _len86479_))
                    '#!void))))
      (lambda (_f86481_ _vec86482_ . _vectors86483_)
        (let ((_f86485_
               (std/srfi/43#check-type
                procedure?
                _f86481_
                std/srfi/43#vector-for-each))
              (_vec86486_
               (std/srfi/43#check-type
                vector?
                _vec86482_
                std/srfi/43#vector-for-each)))
          (if (null? _vectors86483_)
              (_for-each186468_
               _f86485_
               _vec86486_
               '0
               (vector-length _vec86486_))
              (_for-each2+86469_
               _f86485_
               (cons _vec86486_ _vectors86483_)
               '0
               (std/srfi/43#%smallest-length
                _vectors86483_
                (vector-length _vec86486_)
                std/srfi/43#vector-for-each)))))))
  (define std/srfi/43#vector-count
    (lambda (_pred?86453_ _vec86454_ . _vectors86455_)
      (let ((_pred?86457_
             (std/srfi/43#check-type
              procedure?
              _pred?86453_
              std/srfi/43#vector-count))
            (_vec86458_
             (std/srfi/43#check-type
              vector?
              _vec86454_
              std/srfi/43#vector-count)))
        (if (null? _vectors86455_)
            (std/srfi/43#%vector-fold1
             (lambda (_index86460_ _count86461_ _elt86462_)
               (if (_pred?86457_ _index86460_ _elt86462_)
                   (+ _count86461_ '1)
                   _count86461_))
             '0
             (vector-length _vec86458_)
             _vec86458_)
            (std/srfi/43#%vector-fold2+
             (lambda (_index86464_ _count86465_ . _elts86466_)
               (if (apply _pred?86457_ _index86464_ _elts86466_)
                   (+ _count86465_ '1)
                   _count86465_))
             '0
             (std/srfi/43#%smallest-length
              _vectors86455_
              (vector-length _vec86458_)
              std/srfi/43#vector-count)
             (cons _vec86458_ _vectors86455_))))))
  (define std/srfi/43#vector-index
    (lambda (_pred?86449_ _vec86450_ . _vectors86451_)
      (std/srfi/43#vector-index/skip
       _pred?86449_
       _vec86450_
       _vectors86451_
       std/srfi/43#vector-index)))
  (define std/srfi/43#vector-skip
    (lambda (_pred?86443_ _vec86444_ . _vectors86445_)
      (std/srfi/43#vector-index/skip
       (lambda _elts86447_ (not (apply _pred?86443_ _elts86447_)))
       _vec86444_
       _vectors86445_
       std/srfi/43#vector-skip)))
  (define std/srfi/43#vector-index/skip
    (letrec ((_loop186422_
              (lambda (_pred?86425_ _vec86426_ _len86427_ _i86428_)
                (if (= _i86428_ _len86427_)
                    '#f
                    (if (_pred?86425_ (vector-ref _vec86426_ _i86428_))
                        _i86428_
                        (_loop186422_
                         _pred?86425_
                         _vec86426_
                         _len86427_
                         (+ _i86428_ '1))))))
             (_loop2+86423_
              (lambda (_pred?86430_ _vectors86431_ _len86432_ _i86433_)
                (if (= _i86433_ _len86432_)
                    '#f
                    (if (apply _pred?86430_
                               (std/srfi/43#vectors-ref
                                _vectors86431_
                                _i86433_))
                        _i86433_
                        (_loop2+86423_
                         _pred?86430_
                         _vectors86431_
                         _len86432_
                         (+ _i86433_ '1)))))))
      (lambda (_pred?86435_ _vec86436_ _vectors86437_ _callee86438_)
        (let ((_pred?86440_
               (std/srfi/43#check-type procedure? _pred?86435_ _callee86438_))
              (_vec86441_
               (std/srfi/43#check-type vector? _vec86436_ _callee86438_)))
          (if (null? _vectors86437_)
              (_loop186422_
               _pred?86440_
               _vec86441_
               (vector-length _vec86441_)
               '0)
              (_loop2+86423_
               _pred?86440_
               (cons _vec86441_ _vectors86437_)
               (std/srfi/43#%smallest-length
                _vectors86437_
                (vector-length _vec86441_)
                _callee86438_)
               '0))))))
  (define std/srfi/43#vector-index-right
    (lambda (_pred?86418_ _vec86419_ . _vectors86420_)
      (std/srfi/43#vector-index/skip-right
       _pred?86418_
       _vec86419_
       _vectors86420_
       std/srfi/43#vector-index-right)))
  (define std/srfi/43#vector-skip-right
    (lambda (_pred?86412_ _vec86413_ . _vectors86414_)
      (std/srfi/43#vector-index/skip-right
       (lambda _elts86416_ (not (apply _pred?86412_ _elts86416_)))
       _vec86413_
       _vectors86414_
       std/srfi/43#vector-index-right)))
  (define std/srfi/43#vector-index/skip-right
    (letrec ((_loop186393_
              (lambda (_pred?86396_ _vec86397_ _i86398_)
                (if (negative? _i86398_)
                    '#f
                    (if (_pred?86396_ (vector-ref _vec86397_ _i86398_))
                        _i86398_
                        (_loop186393_
                         _pred?86396_
                         _vec86397_
                         (- _i86398_ '1))))))
             (_loop2+86394_
              (lambda (_pred?86400_ _vectors86401_ _i86402_)
                (if (negative? _i86402_)
                    '#f
                    (if (apply _pred?86400_
                               (std/srfi/43#vectors-ref
                                _vectors86401_
                                _i86402_))
                        _i86402_
                        (_loop2+86394_
                         _pred?86400_
                         _vectors86401_
                         (- _i86402_ '1)))))))
      (lambda (_pred?86404_ _vec86405_ _vectors86406_ _callee86407_)
        (let ((_pred?86409_
               (std/srfi/43#check-type procedure? _pred?86404_ _callee86407_))
              (_vec86410_
               (std/srfi/43#check-type vector? _vec86405_ _callee86407_)))
          (if (null? _vectors86406_)
              (_loop186393_
               _pred?86409_
               _vec86410_
               (- (vector-length _vec86410_) '1))
              (_loop2+86394_
               _pred?86409_
               (cons _vec86410_ _vectors86406_)
               (- (std/srfi/43#%smallest-length
                   _vectors86406_
                   (vector-length _vec86410_)
                   _callee86407_)
                  '1)))))))
  (define std/srfi/43#vector-binary-search
    (lambda (_vec86368_ _value86369_ _cmp86370_ . _maybe-start+end86371_)
      (let* ((_cmp86373_
              (std/srfi/43#check-type
               procedure?
               _cmp86370_
               std/srfi/43#vector-binary-search))
             (_vec86375_
              (std/srfi/43#check-type
               vector?
               _vec86368_
               std/srfi/43#vector-binary-search))
             (_g278123_
              (std/srfi/43#vector-parse-start+end
               _vec86375_
               _maybe-start+end86371_
               'start
               'end
               std/srfi/43#vector-binary-search)))
        (begin
          (let ((_g278124_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g278123_) (##vector-length _g278123_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g278124_ 2)))
                (error "Context expects 2 values" _g278124_)))
          (let ((_start86377_
                 (let () (declare (not safe)) (##vector-ref _g278123_ 0)))
                (_end86378_
                 (let () (declare (not safe)) (##vector-ref _g278123_ 1))))
            (let _loop86380_ ((_start86382_ _start86377_)
                              (_end86383_ _end86378_)
                              (_j86384_ '#f))
              (let ((_i86386_ (quotient (+ _start86382_ _end86383_) '2)))
                (if (or (= _start86382_ _end86383_)
                        (and _j86384_ (= _i86386_ _j86384_)))
                    '#f
                    (let ((_comparison86391_
                           (std/srfi/43#check-type
                            integer?
                            (_cmp86373_
                             (vector-ref _vec86375_ _i86386_)
                             _value86369_)
                            (cons _cmp86373_
                                  (cons 'for
                                        (cons std/srfi/43#vector-binary-search
                                              '()))))))
                      (if (zero? _comparison86391_)
                          _i86386_
                          (if (positive? _comparison86391_)
                              (_loop86380_ _start86382_ _i86386_ _i86386_)
                              (_loop86380_
                               _i86386_
                               _end86383_
                               _i86386_))))))))))))
  (define std/srfi/43#vector-any
    (letrec ((_loop186336_
              (lambda (_pred?86339_
                       _vec86340_
                       _i86341_
                       _len86342_
                       _len-186343_)
                (if (not (= _i86341_ _len86342_))
                    (if (= _i86341_ _len-186343_)
                        (_pred?86339_ (vector-ref _vec86340_ _i86341_))
                        (let ((_$e86345_
                               (_pred?86339_
                                (vector-ref _vec86340_ _i86341_))))
                          (if _$e86345_
                              _$e86345_
                              (_loop186336_
                               _pred?86339_
                               _vec86340_
                               (+ _i86341_ '1)
                               _len86342_
                               _len-186343_))))
                    '#f)))
             (_loop2+86337_
              (lambda (_pred?86348_
                       _vectors86349_
                       _i86350_
                       _len86351_
                       _len-186352_)
                (if (not (= _i86350_ _len86351_))
                    (if (= _i86350_ _len-186352_)
                        (apply _pred?86348_
                               (std/srfi/43#vectors-ref
                                _vectors86349_
                                _i86350_))
                        (let ((_$e86354_
                               (apply _pred?86348_
                                      (std/srfi/43#vectors-ref
                                       _vectors86349_
                                       _i86350_))))
                          (if _$e86354_
                              _$e86354_
                              (_loop2+86337_
                               _pred?86348_
                               _vectors86349_
                               (+ _i86350_ '1)
                               _len86351_
                               _len-186352_))))
                    '#f))))
      (lambda (_pred?86357_ _vec86358_ . _vectors86359_)
        (let ((_pred?86361_
               (std/srfi/43#check-type
                procedure?
                _pred?86357_
                std/srfi/43#vector-any))
              (_vec86362_
               (std/srfi/43#check-type
                vector?
                _vec86358_
                std/srfi/43#vector-any)))
          (if (null? _vectors86359_)
              (let ((_len86364_ (vector-length _vec86362_)))
                (_loop186336_
                 _pred?86361_
                 _vec86362_
                 '0
                 _len86364_
                 (- _len86364_ '1)))
              (let ((_len86366_
                     (std/srfi/43#%smallest-length
                      _vectors86359_
                      (vector-length _vec86362_)
                      std/srfi/43#vector-any)))
                (_loop2+86337_
                 _pred?86361_
                 (cons _vec86362_ _vectors86359_)
                 '0
                 _len86366_
                 (- _len86366_ '1))))))))
  (define std/srfi/43#vector-every
    (letrec ((_loop186304_
              (lambda (_pred?86307_
                       _vec86308_
                       _i86309_
                       _len86310_
                       _len-186311_)
                (let ((_$e86313_ (= _i86309_ _len86310_)))
                  (if _$e86313_
                      _$e86313_
                      (if (= _i86309_ _len-186311_)
                          (_pred?86307_ (vector-ref _vec86308_ _i86309_))
                          (if (_pred?86307_ (vector-ref _vec86308_ _i86309_))
                              (_loop186304_
                               _pred?86307_
                               _vec86308_
                               (+ _i86309_ '1)
                               _len86310_
                               _len-186311_)
                              '#f))))))
             (_loop2+86305_
              (lambda (_pred?86316_
                       _vectors86317_
                       _i86318_
                       _len86319_
                       _len-186320_)
                (let ((_$e86322_ (= _i86318_ _len86319_)))
                  (if _$e86322_
                      _$e86322_
                      (if (= _i86318_ _len-186320_)
                          (apply _pred?86316_
                                 (std/srfi/43#vectors-ref
                                  _vectors86317_
                                  _i86318_))
                          (if (apply _pred?86316_
                                     (std/srfi/43#vectors-ref
                                      _vectors86317_
                                      _i86318_))
                              (_loop2+86305_
                               _pred?86316_
                               _vectors86317_
                               (+ _i86318_ '1)
                               _len86319_
                               _len-186320_)
                              '#f)))))))
      (lambda (_pred?86325_ _vec86326_ . _vectors86327_)
        (let ((_pred?86329_
               (std/srfi/43#check-type
                procedure?
                _pred?86325_
                std/srfi/43#vector-every))
              (_vec86330_
               (std/srfi/43#check-type
                vector?
                _vec86326_
                std/srfi/43#vector-every)))
          (if (null? _vectors86327_)
              (let ((_len86332_ (vector-length _vec86330_)))
                (_loop186304_
                 _pred?86329_
                 _vec86330_
                 '0
                 _len86332_
                 (- _len86332_ '1)))
              (let ((_len86334_
                     (std/srfi/43#%smallest-length
                      _vectors86327_
                      (vector-length _vec86330_)
                      std/srfi/43#vector-every)))
                (_loop2+86305_
                 _pred?86329_
                 (cons _vec86330_ _vectors86327_)
                 '0
                 _len86334_
                 (- _len86334_ '1))))))))
  (define std/srfi/43#vector-swap!
    (lambda (_vec86293_ _i86294_ _j86295_)
      (let ((_vec86297_
             (std/srfi/43#check-type
              vector?
              _vec86293_
              std/srfi/43#vector-swap!)))
        (let ((_i86299_
               (std/srfi/43#check-index
                _vec86297_
                _i86294_
                std/srfi/43#vector-swap!))
              (_j86300_
               (std/srfi/43#check-index
                _vec86297_
                _j86295_
                std/srfi/43#vector-swap!)))
          (let ((_x86302_ (vector-ref _vec86297_ _i86299_)))
            (vector-set! _vec86297_ _i86299_ (vector-ref _vec86297_ _j86300_))
            (vector-set! _vec86297_ _j86300_ _x86302_))))))
  (define std/srfi/43#%%vector-fill!
    (let ((_%vector-fill!86277_ vector-fill!))
      (lambda (_vec86279_ _value86280_ . _maybe-start+end86281_)
        (if (null? _maybe-start+end86281_)
            (_%vector-fill!86277_ _vec86279_ _value86280_)
            (let* ((_vec86283_
                    (std/srfi/43#check-type vector? _vec86279_ vector-fill!))
                   (_g278125_
                    (std/srfi/43#vector-parse-start+end
                     _vec86283_
                     _maybe-start+end86281_
                     'start
                     'end
                     vector-fill!)))
              (begin
                (let ((_g278126_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g278125_)
                             (##vector-length _g278125_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g278126_ 2)))
                      (error "Context expects 2 values" _g278126_)))
                (let ((_start86285_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278125_ 0)))
                      (_end86286_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278125_ 1))))
                  (let _$loop86288_ ((_i86291_ _start86285_))
                    (if (= _i86291_ _end86286_)
                        '#!void
                        (begin
                          (vector-set! _vec86283_ _i86291_ _value86280_)
                          (_$loop86288_ (+ _i86291_ '1))))))))))))
  (define std/srfi/43#vector-copy!
    (lambda (_target86260_
             _tstart86261_
             _source86262_
             .
             _maybe-sstart+send86263_)
      (letrec ((_doit!86265_
                (lambda (_sstart86269_ _send86270_ _source-length86271_)
                  (let ((_tstart86273_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _tstart86261_
                          std/srfi/43#vector-copy!))
                        (_sstart86274_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _sstart86269_
                          std/srfi/43#vector-copy!))
                        (_send86275_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _send86270_
                          std/srfi/43#vector-copy!)))
                    (if (and (<= '0
                                 _sstart86274_
                                 _send86275_
                                 _source-length86271_)
                             (<= (+ _tstart86273_
                                    (- _send86275_ _sstart86274_))
                                 (vector-length _target86260_)))
                        (std/srfi/43#%vector-copy!
                         _target86260_
                         _tstart86273_
                         _source86262_
                         _sstart86274_
                         _send86275_)
                        (error '"illegal arguments"
                               (cons 'while
                                     (cons 'calling
                                           (cons std/srfi/43#vector-copy!
                                                 '())))
                               (cons 'target
                                     (cons 'was (cons _target86260_ '())))
                               (cons 'target-length
                                     (cons 'was
                                           (cons (vector-length _target86260_)
                                                 '())))
                               (cons 'tstart
                                     (cons 'was (cons _tstart86273_ '())))
                               (cons 'source
                                     (cons 'was (cons _source86262_ '())))
                               (cons 'source-length
                                     (cons 'was
                                           (cons _source-length86271_ '())))
                               (cons 'sstart
                                     (cons 'was (cons _sstart86274_ '())))
                               (cons 'send
                                     (cons 'was (cons _send86275_ '())))))))))
        (let ((_n86267_ (vector-length _source86262_)))
          (if (null? _maybe-sstart+send86263_)
              (_doit!86265_ '0 _n86267_ _n86267_)
              (if (null? (cdr _maybe-sstart+send86263_))
                  (_doit!86265_
                   (car _maybe-sstart+send86263_)
                   _n86267_
                   _n86267_)
                  (if (null? (cddr _maybe-sstart+send86263_))
                      (_doit!86265_
                       (car _maybe-sstart+send86263_)
                       (cadr _maybe-sstart+send86263_)
                       _n86267_)
                      (error '"too many arguments"
                             std/srfi/43#vector-copy!
                             (cddr _maybe-sstart+send86263_)))))))))
  (define std/srfi/43#vector-reverse-copy!
    (lambda (_target86240_
             _tstart86241_
             _source86242_
             .
             _maybe-sstart+send86243_)
      (letrec ((_doit!86245_
                (lambda (_sstart86249_ _send86250_ _source-length86251_)
                  (let ((_tstart86253_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _tstart86241_
                          std/srfi/43#vector-reverse-copy!))
                        (_sstart86254_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _sstart86249_
                          std/srfi/43#vector-reverse-copy!))
                        (_send86255_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _send86250_
                          std/srfi/43#vector-reverse-copy!)))
                    (if (and (eq? _target86240_ _source86242_)
                             (or (std/srfi/43#between?
                                  _sstart86254_
                                  _tstart86253_
                                  _send86255_)
                                 (std/srfi/43#between?
                                  _tstart86253_
                                  _sstart86254_
                                  (+ _tstart86253_
                                     (- _send86255_ _sstart86254_)))))
                        (error '"vector range for self-copying overlaps"
                               std/srfi/43#vector-reverse-copy!
                               (cons 'vector
                                     (cons 'was (cons _target86240_ '())))
                               (cons 'tstart
                                     (cons 'was (cons _tstart86253_ '())))
                               (cons 'sstart
                                     (cons 'was (cons _sstart86254_ '())))
                               (cons 'send (cons 'was (cons _send86255_ '()))))
                        (if (and (<= '0
                                     _sstart86254_
                                     _send86255_
                                     _source-length86251_)
                                 (<= (+ _tstart86253_
                                        (- _send86255_ _sstart86254_))
                                     (vector-length _target86240_)))
                            (std/srfi/43#%vector-reverse-copy!
                             _target86240_
                             _tstart86253_
                             _source86242_
                             _sstart86254_
                             _send86255_)
                            (error '"illegal arguments"
                                   (cons 'while
                                         (cons 'calling
                                               (cons std/srfi/43#vector-reverse-copy!
                                                     '())))
                                   (cons 'target
                                         (cons 'was (cons _target86240_ '())))
                                   (cons 'target-length
                                         (cons 'was
                                               (cons (vector-length
                                                      _target86240_)
                                                     '())))
                                   (cons 'tstart
                                         (cons 'was (cons _tstart86253_ '())))
                                   (cons 'source
                                         (cons 'was (cons _source86242_ '())))
                                   (cons 'source-length
                                         (cons 'was
                                               (cons _source-length86251_
                                                     '())))
                                   (cons 'sstart
                                         (cons 'was (cons _sstart86254_ '())))
                                   (cons 'send
                                         (cons 'was
                                               (cons _send86255_ '()))))))))))
        (let ((_n86247_ (vector-length _source86242_)))
          (if (null? _maybe-sstart+send86243_)
              (_doit!86245_ '0 _n86247_ _n86247_)
              (if (null? (cdr _maybe-sstart+send86243_))
                  (_doit!86245_
                   (car _maybe-sstart+send86243_)
                   _n86247_
                   _n86247_)
                  (if (null? (cddr _maybe-sstart+send86243_))
                      (_doit!86245_
                       (car _maybe-sstart+send86243_)
                       (cadr _maybe-sstart+send86243_)
                       _n86247_)
                      (error '"too many arguments"
                             std/srfi/43#vector-reverse-copy!
                             (cddr _maybe-sstart+send86243_)))))))))
  (define std/srfi/43#vector-reverse!
    (lambda (_vec86232_ . _start+end86233_)
      (let* ((_vec86235_
              (std/srfi/43#check-type
               vector?
               _vec86232_
               std/srfi/43#vector-reverse!))
             (_g278127_
              (std/srfi/43#vector-parse-start+end
               _vec86235_
               _start+end86233_
               'start
               'end
               std/srfi/43#vector-reverse!)))
        (begin
          (let ((_g278128_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g278127_) (##vector-length _g278127_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g278128_ 2)))
                (error "Context expects 2 values" _g278128_)))
          (let ((_start86237_
                 (let () (declare (not safe)) (##vector-ref _g278127_ 0)))
                (_end86238_
                 (let () (declare (not safe)) (##vector-ref _g278127_ 1))))
            (std/srfi/43#%vector-reverse!
             _vec86235_
             _start86237_
             _end86238_))))))
  (define std/srfi/43#%%vector->list
    (let ((_%vector->list86216_ vector->list))
      (lambda (_vec86218_ . _maybe-start+end86219_)
        (if (null? _maybe-start+end86219_)
            (_%vector->list86216_ _vec86218_)
            (let* ((_vec86221_
                    (std/srfi/43#check-type vector? _vec86218_ vector->list))
                   (_g278129_
                    (std/srfi/43#vector-parse-start+end
                     _vec86221_
                     _maybe-start+end86219_
                     'start
                     'end
                     vector->list)))
              (begin
                (let ((_g278130_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g278129_)
                             (##vector-length _g278129_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g278130_ 2)))
                      (error "Context expects 2 values" _g278130_)))
                (let ((_start86223_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278129_ 0)))
                      (_end86224_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278129_ 1))))
                  (let _$loop86226_ ((_i86229_ (- _end86224_ '1))
                                     (_result86230_ '()))
                    (if (< _i86229_ _start86223_)
                        _result86230_
                        (_$loop86226_
                         (- _i86229_ '1)
                         (cons (vector-ref _vec86221_ _i86229_)
                               _result86230_)))))))))))
  (define std/srfi/43#reverse-vector->list
    (lambda (_vec86202_ . _maybe-start+end86203_)
      (let* ((_vec86205_
              (std/srfi/43#check-type
               vector?
               _vec86202_
               std/srfi/43#reverse-vector->list))
             (_g278131_
              (std/srfi/43#vector-parse-start+end
               _vec86205_
               _maybe-start+end86203_
               'start
               'end
               std/srfi/43#reverse-vector->list)))
        (begin
          (let ((_g278132_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g278131_) (##vector-length _g278131_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g278132_ 2)))
                (error "Context expects 2 values" _g278132_)))
          (let ((_start86207_
                 (let () (declare (not safe)) (##vector-ref _g278131_ 0)))
                (_end86208_
                 (let () (declare (not safe)) (##vector-ref _g278131_ 1))))
            (let _$loop86210_ ((_i86213_ _start86207_) (_result86214_ '()))
              (if (= _i86213_ _end86208_)
                  _result86214_
                  (_$loop86210_
                   (+ _i86213_ '1)
                   (cons (vector-ref _vec86205_ _i86213_)
                         _result86214_)))))))))
  (define std/srfi/43#%%list->vector
    (let ((_%list->vector86156_ list->vector))
      (lambda (_lst86158_ . _maybe-start+end86159_)
        (if (null? _maybe-start+end86159_)
            (_%list->vector86156_ _lst86158_)
            (if (null? _maybe-start+end86159_)
                (let* ((_start86161_ '0) (_end86163_ (length _lst86158_)))
                  (let ((_start86166_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _start86161_
                          list->vector))
                        (_end86167_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _end86163_
                          list->vector)))
                    ((lambda (_f86169_)
                       (std/srfi/43#vector-unfold
                        _f86169_
                        (- _end86167_ _start86166_)
                        (list-tail _lst86158_ _start86166_)))
                     (lambda (_index86171_ _l86172_)
                       (if (null? _l86172_)
                           (error '"list was too short"
                                  (cons 'list
                                        (cons 'was (cons _lst86158_ '())))
                                  (cons 'attempted
                                        (cons 'end
                                              (cons 'was
                                                    (cons _end86167_ '()))))
                                  (cons 'while
                                        (cons 'calling
                                              (cons std/srfi/43#%%list->vector
                                                    '()))))
                           (if (pair? _l86172_)
                               (values (car _l86172_) (cdr _l86172_))
                               (error '"erroneous value"
                                      (list list? _lst86158_)
                                      (cons 'while
                                            (cons 'calling
                                                  (cons std/srfi/43#%%list->vector
                                                        '()))))))))))
                (let ((_start86174_ (car _maybe-start+end86159_))
                      (_new-args86175_ (cdr _maybe-start+end86159_)))
                  (if (null? _new-args86175_)
                      (let ((_end86178_ (length _lst86158_)))
                        (let ((_start86181_
                               (std/srfi/43#check-type
                                std/srfi/43#nonneg-int?
                                _start86174_
                                list->vector))
                              (_end86182_
                               (std/srfi/43#check-type
                                std/srfi/43#nonneg-int?
                                _end86178_
                                list->vector)))
                          ((lambda (_f86184_)
                             (std/srfi/43#vector-unfold
                              _f86184_
                              (- _end86182_ _start86181_)
                              (list-tail _lst86158_ _start86181_)))
                           (lambda (_index86186_ _l86187_)
                             (if (null? _l86187_)
                                 (error '"list was too short"
                                        (cons 'list
                                              (cons 'was
                                                    (cons _lst86158_ '())))
                                        (cons 'attempted
                                              (cons 'end
                                                    (cons 'was
                                                          (cons _end86182_
                                                                '()))))
                                        (cons 'while
                                              (cons 'calling
                                                    (cons std/srfi/43#%%list->vector
                                                          '()))))
                                 (if (pair? _l86187_)
                                     (values (car _l86187_) (cdr _l86187_))
                                     (error '"erroneous value"
                                            (list list? _lst86158_)
                                            (cons 'while
                                                  (cons 'calling
                                                        (cons std/srfi/43#%%list->vector
                                                              '()))))))))))
                      (let ((_end86189_ (car _new-args86175_))
                            (_new-args86190_ (cdr _new-args86175_)))
                        (if (null? _new-args86190_)
                            (let ()
                              (let ((_start86194_
                                     (std/srfi/43#check-type
                                      std/srfi/43#nonneg-int?
                                      _start86174_
                                      list->vector))
                                    (_end86195_
                                     (std/srfi/43#check-type
                                      std/srfi/43#nonneg-int?
                                      _end86189_
                                      list->vector)))
                                ((lambda (_f86197_)
                                   (std/srfi/43#vector-unfold
                                    _f86197_
                                    (- _end86195_ _start86194_)
                                    (list-tail _lst86158_ _start86194_)))
                                 (lambda (_index86199_ _l86200_)
                                   (if (null? _l86200_)
                                       (error '"list was too short"
                                              (cons 'list
                                                    (cons 'was
                                                          (cons _lst86158_
                                                                '())))
                                              (cons 'attempted
                                                    (cons 'end
                                                          (cons 'was
                                                                (cons _end86195_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                              '()))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                              (cons 'while
                                                    (cons 'calling
                                                          (cons std/srfi/43#%%list->vector
                                                                '()))))
                                       (if (pair? _l86200_)
                                           (values (car _l86200_)
                                                   (cdr _l86200_))
                                           (error '"erroneous value"
                                                  (list list? _lst86158_)
                                                  (cons 'while
                                                        (cons 'calling
                                                              (cons std/srfi/43#%%list->vector
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                            '()))))))))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            (error '"too many arguments"
                                   (length _maybe-start+end86159_)
                                   _maybe-start+end86159_))))))))))
  (define std/srfi/43#reverse-list->vector
    (lambda (_lst86112_ . _maybe-start+end86113_)
      (if (null? _maybe-start+end86113_)
          (let* ((_start86115_ '0) (_end86117_ (length _lst86112_)))
            (let ((_start86120_
                   (std/srfi/43#check-type
                    std/srfi/43#nonneg-int?
                    _start86115_
                    std/srfi/43#reverse-list->vector))
                  (_end86121_
                   (std/srfi/43#check-type
                    std/srfi/43#nonneg-int?
                    _end86117_
                    std/srfi/43#reverse-list->vector)))
              ((lambda (_f86123_)
                 (std/srfi/43#vector-unfold-right
                  _f86123_
                  (- _end86121_ _start86120_)
                  (list-tail _lst86112_ _start86120_)))
               (lambda (_index86125_ _l86126_)
                 (if (null? _l86126_)
                     (error '"list too short"
                            (cons 'list (cons 'was (cons _lst86112_ '())))
                            (cons 'attempted
                                  (cons 'end
                                        (cons 'was (cons _end86121_ '()))))
                            (cons 'while
                                  (cons 'calling
                                        (cons std/srfi/43#reverse-list->vector
                                              '()))))
                     (if (pair? _l86126_)
                         (values (car _l86126_) (cdr _l86126_))
                         (error '"erroneous value"
                                (list list? _lst86112_)
                                (cons 'while
                                      (cons 'calling
                                            (cons std/srfi/43#reverse-list->vector
                                                  '()))))))))))
          (let ((_start86128_ (car _maybe-start+end86113_))
                (_new-args86129_ (cdr _maybe-start+end86113_)))
            (if (null? _new-args86129_)
                (let ((_end86132_ (length _lst86112_)))
                  (let ((_start86135_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _start86128_
                          std/srfi/43#reverse-list->vector))
                        (_end86136_
                         (std/srfi/43#check-type
                          std/srfi/43#nonneg-int?
                          _end86132_
                          std/srfi/43#reverse-list->vector)))
                    ((lambda (_f86138_)
                       (std/srfi/43#vector-unfold-right
                        _f86138_
                        (- _end86136_ _start86135_)
                        (list-tail _lst86112_ _start86135_)))
                     (lambda (_index86140_ _l86141_)
                       (if (null? _l86141_)
                           (error '"list too short"
                                  (cons 'list
                                        (cons 'was (cons _lst86112_ '())))
                                  (cons 'attempted
                                        (cons 'end
                                              (cons 'was
                                                    (cons _end86136_ '()))))
                                  (cons 'while
                                        (cons 'calling
                                              (cons std/srfi/43#reverse-list->vector
                                                    '()))))
                           (if (pair? _l86141_)
                               (values (car _l86141_) (cdr _l86141_))
                               (error '"erroneous value"
                                      (list list? _lst86112_)
                                      (cons 'while
                                            (cons 'calling
                                                  (cons std/srfi/43#reverse-list->vector
                                                        '()))))))))))
                (let ((_end86143_ (car _new-args86129_))
                      (_new-args86144_ (cdr _new-args86129_)))
                  (if (null? _new-args86144_)
                      (let ()
                        (let ((_start86148_
                               (std/srfi/43#check-type
                                std/srfi/43#nonneg-int?
                                _start86128_
                                std/srfi/43#reverse-list->vector))
                              (_end86149_
                               (std/srfi/43#check-type
                                std/srfi/43#nonneg-int?
                                _end86143_
                                std/srfi/43#reverse-list->vector)))
                          ((lambda (_f86151_)
                             (std/srfi/43#vector-unfold-right
                              _f86151_
                              (- _end86149_ _start86148_)
                              (list-tail _lst86112_ _start86148_)))
                           (lambda (_index86153_ _l86154_)
                             (if (null? _l86154_)
                                 (error '"list too short"
                                        (cons 'list
                                              (cons 'was
                                                    (cons _lst86112_ '())))
                                        (cons 'attempted
                                              (cons 'end
                                                    (cons 'was
                                                          (cons _end86149_
                                                                '()))))
                                        (cons 'while
                                              (cons 'calling
                                                    (cons std/srfi/43#reverse-list->vector
                                                          '()))))
                                 (if (pair? _l86154_)
                                     (values (car _l86154_) (cdr _l86154_))
                                     (error '"erroneous value"
                                            (list list? _lst86112_)
                                            (cons 'while
                                                  (cons 'calling
                                                        (cons std/srfi/43#reverse-list->vector
                                                              '()))))))))))
                      (error '"too many arguments"
                             (length _maybe-start+end86113_)
                             _maybe-start+end86113_)))))))))
