(declare (block) (standard-bindings) (extended-bindings))
(begin
  (declare (fixnum))
  (define std/pregexp#*pregexp-version* '20050502)
  (define std/pregexp#*pregexp-comment-char* '#\;)
  (define std/pregexp#*pregexp-nul-char-int* (- (char->integer '#\a) '97))
  (define std/pregexp#*pregexp-return-char*
    (integer->char (+ '13 std/pregexp#*pregexp-nul-char-int*)))
  (define std/pregexp#*pregexp-tab-char*
    (integer->char (+ '9 std/pregexp#*pregexp-nul-char-int*)))
  (define std/pregexp#pregexp-space-sensitive? (make-parameter '#t))
  (define std/pregexp#pregexp-reverse!
    (lambda (_s44360_)
      (let _loop44362_ ((_s44364_ _s44360_) (_r44365_ '()))
        (if (null? _s44364_)
            _r44365_
            (let ((_d44367_ (cdr _s44364_)))
              (set-cdr! _s44364_ _r44365_)
              (_loop44362_ _d44367_ _s44364_))))))
  (define std/pregexp#pregexp-error
    (lambda _args44358_ (apply error '"Regular expression error" _args44358_)))
  (define std/pregexp#pregexp-read-pattern
    (lambda (_s44344_ _i44345_ _n44346_)
      (if (>= _i44345_ _n44346_)
          (list (list ':or (list ':seq)) _i44345_)
          (let _loop44348_ ((_branches44350_ '()) (_i44351_ _i44345_))
            (if (or (>= _i44351_ _n44346_)
                    (char=? (let ()
                              (declare (not safe))
                              (##string-ref _s44344_ _i44351_))
                            '#\)))
                (list (cons ':or
                            (std/pregexp#pregexp-reverse! _branches44350_))
                      _i44351_)
                (let ((_vv44356_
                       (std/pregexp#pregexp-read-branch
                        _s44344_
                        (if (char=? (let ()
                                      (declare (not safe))
                                      (##string-ref _s44344_ _i44351_))
                                    '#\|)
                            (+ _i44351_ '1)
                            _i44351_)
                        _n44346_)))
                  (_loop44348_
                   (cons (car _vv44356_) _branches44350_)
                   (cadr _vv44356_))))))))
  (define std/pregexp#pregexp-read-branch
    (lambda (_s44328_ _i44329_ _n44330_)
      (let _loop44332_ ((_pieces44334_ '()) (_i44335_ _i44329_))
        (if (>= _i44335_ _n44330_)
            (list (cons ':seq (std/pregexp#pregexp-reverse! _pieces44334_))
                  _i44335_)
            (if (let ((_c44337_
                       (let ()
                         (declare (not safe))
                         (##string-ref _s44328_ _i44335_))))
                  (or (char=? _c44337_ '#\|) (char=? _c44337_ '#\))))
                (list (cons ':seq (std/pregexp#pregexp-reverse! _pieces44334_))
                      _i44335_)
                (let ((_vv44342_
                       (std/pregexp#pregexp-read-piece
                        _s44328_
                        _i44335_
                        _n44330_)))
                  (_loop44332_
                   (cons (car _vv44342_) _pieces44334_)
                   (cadr _vv44342_))))))))
  (define std/pregexp#pregexp-read-piece
    (lambda (_s44278_ _i44279_ _n44280_)
      (let* ((_c44282_
              (let () (declare (not safe)) (##string-ref _s44278_ _i44279_)))
             (_$e44284_ _c44282_))
        (let ((_default4428644300_
               (lambda ()
                 (if (or (std/pregexp#pregexp-space-sensitive?)
                         (and (not (char-whitespace? _c44282_))
                              (not (char=? _c44282_
                                           std/pregexp#*pregexp-comment-char*))))
                     (std/pregexp#pregexp-wrap-quantifier-if-any
                      (list _c44282_ (+ _i44279_ '1))
                      _s44278_
                      _n44280_)
                     (let _loop44293_ ((_i44295_ _i44279_)
                                       (_in-comment?44296_ '#f))
                       (if (>= _i44295_ _n44280_)
                           (list ':empty _i44295_)
                           (let ((_c44298_
                                  (let ()
                                    (declare (not safe))
                                    (##string-ref _s44278_ _i44295_))))
                             (if _in-comment?44296_
                                 (_loop44293_
                                  (+ _i44295_ '1)
                                  (not (char=? _c44298_ '#\newline)))
                                 (if (char-whitespace? _c44298_)
                                     (_loop44293_ (+ _i44295_ '1) '#f)
                                     (if (char=? _c44298_
                                                 std/pregexp#*pregexp-comment-char*)
                                         (_loop44293_ (+ _i44295_ '1) '#t)
                                         (list ':empty _i44295_))))))))))
              (_table4428744302_
               '#(#f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  1
                  #f
                  #f
                  #f
                  4
                  #f
                  #f
                  #f
                  #f
                  #f
                  2
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  3
                  5
                  #f
                  0)))
          (if (char? _$e44284_)
              (let ((_ix44305_
                     (let ()
                       (declare (not safe))
                       (##char->integer _$e44284_))))
                (if (let () (declare (not safe)) (##fx< _ix44305_ '95))
                    (let ((_x44308_
                           (let ()
                             (declare (not safe))
                             (##vector-ref _table4428744302_ _ix44305_))))
                      (if _x44308_
                          (if (let () (declare (not safe)) (##fx< _x44308_ '3))
                              (if (let ()
                                    (declare (not safe))
                                    (##fx= _x44308_ '0))
                                  (list ':bos (+ _i44279_ '1))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx= _x44308_ '1))
                                      (list ':eos (+ _i44279_ '1))
                                      (std/pregexp#pregexp-wrap-quantifier-if-any
                                       (list ':any (+ _i44279_ '1))
                                       _s44278_
                                       _n44280_)))
                              (if (let ()
                                    (declare (not safe))
                                    (##fx= _x44308_ '3))
                                  (let ((_i+144311_ (+ _i44279_ '1)))
                                    (std/pregexp#pregexp-wrap-quantifier-if-any
                                     (let ((_$e44313_
                                            (if (< _i+144311_ _n44280_)
                                                (let ()
                                                  (declare (not safe))
                                                  (##string-ref
                                                   _s44278_
                                                   _i+144311_))
                                                '#f)))
                                       (if (eq? '#\^ _$e44313_)
                                           (let ((_vv44316_
                                                  (std/pregexp#pregexp-read-char-list
                                                   _s44278_
                                                   (+ _i44279_ '2)
                                                   _n44280_)))
                                             (list (list ':neg-char
                                                         (car _vv44316_))
                                                   (cadr _vv44316_)))
                                           (std/pregexp#pregexp-read-char-list
                                            _s44278_
                                            _i+144311_
                                            _n44280_)))
                                     _s44278_
                                     _n44280_))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx= _x44308_ '4))
                                      (std/pregexp#pregexp-wrap-quantifier-if-any
                                       (std/pregexp#pregexp-read-subpattern
                                        _s44278_
                                        (+ _i44279_ '1)
                                        _n44280_)
                                       _s44278_
                                       _n44280_)
                                      (std/pregexp#pregexp-wrap-quantifier-if-any
                                       (let ((_$e44318_
                                              (std/pregexp#pregexp-read-escaped-number
                                               _s44278_
                                               _i44279_
                                               _n44280_)))
                                         (if _$e44318_
                                             ((lambda (_num-i44321_)
                                                (list (list ':backref
                                                            (car _num-i44321_))
                                                      (cadr _num-i44321_)))
                                              _$e44318_)
                                             (let ((_$e44323_
                                                    (std/pregexp#pregexp-read-escaped-char
                                                     _s44278_
                                                     _i44279_
                                                     _n44280_)))
                                               (if _$e44323_
                                                   ((lambda (_char-i44326_)
                                                      (list (car _char-i44326_)
                                                            (cadr _char-i44326_)))
                                                    _$e44323_)
                                                   (std/pregexp#pregexp-error
                                                    'pregexp-read-piece
                                                    'backslash)))))
                                       _s44278_
                                       _n44280_))))
                          (_default4428644300_)))
                    (_default4428644300_)))
              (_default4428644300_))))))
  (define std/pregexp#pregexp-read-escaped-number
    (lambda (_s44265_ _i44266_ _n44267_)
      (if (< (+ _i44266_ '1) _n44267_)
          (let ((_c44269_
                 (let ((__tmp270867 (+ _i44266_ '1)))
                   (declare (not safe))
                   (##string-ref _s44265_ __tmp270867))))
            (if (char-numeric? _c44269_)
                (let _loop44271_ ((_i44273_ (+ _i44266_ '2))
                                  (_r44274_ (list _c44269_)))
                  (if (>= _i44273_ _n44267_)
                      (list (string->number
                             (list->string
                              (std/pregexp#pregexp-reverse! _r44274_)))
                            _i44273_)
                      (let ((_c44276_
                             (let ()
                               (declare (not safe))
                               (##string-ref _s44265_ _i44273_))))
                        (if (char-numeric? _c44276_)
                            (_loop44271_
                             (+ _i44273_ '1)
                             (cons _c44276_ _r44274_))
                            (list (string->number
                                   (list->string
                                    (std/pregexp#pregexp-reverse! _r44274_)))
                                  _i44273_)))))
                '#f))
          '#f)))
  (define std/pregexp#pregexp-read-escaped-char
    (lambda (_s44242_ _i44243_ _n44244_)
      (if (< (+ _i44243_ '1) _n44244_)
          (let* ((_c44246_
                  (let ((__tmp270868 (+ _i44243_ '1)))
                    (declare (not safe))
                    (##string-ref _s44242_ __tmp270868)))
                 (_$e44248_ _c44246_))
            (let ((_default4425044254_
                   (lambda () (list _c44246_ (+ _i44243_ '2))))
                  (_table4425144256_
                   '#(#f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      1
                      #f
                      3
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      7
                      #f
                      #f
                      #f
                      10
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      0
                      #f
                      2
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      #f
                      4
                      #f
                      #f
                      #f
                      5
                      6
                      8
                      #f
                      #f
                      9)))
              (if (char? _$e44248_)
                  (let ((_ix44259_
                         (let ()
                           (declare (not safe))
                           (##char->integer _$e44248_))))
                    (if (let () (declare (not safe)) (##fx< _ix44259_ '120))
                        (let ((_x44262_
                               (let ()
                                 (declare (not safe))
                                 (##vector-ref _table4425144256_ _ix44259_))))
                          (if _x44262_
                              (if (let ()
                                    (declare (not safe))
                                    (##fx< _x44262_ '5))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx< _x44262_ '2))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44262_ '0))
                                          (list ':wbdry (+ _i44243_ '2))
                                          (list ':not-wbdry (+ _i44243_ '2)))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44262_ '2))
                                          (list ':digit (+ _i44243_ '2))
                                          (if (let ()
                                                (declare (not safe))
                                                (##fx= _x44262_ '3))
                                              (list '(:neg-char :digit)
                                                    (+ _i44243_ '2))
                                              (list '#\newline
                                                    (+ _i44243_ '2)))))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx< _x44262_ '8))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44262_ '5))
                                          (list std/pregexp#*pregexp-return-char*
                                                (+ _i44243_ '2))
                                          (if (let ()
                                                (declare (not safe))
                                                (##fx= _x44262_ '6))
                                              (list ':space (+ _i44243_ '2))
                                              (list '(:neg-char :space)
                                                    (+ _i44243_ '2))))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44262_ '8))
                                          (list std/pregexp#*pregexp-tab-char*
                                                (+ _i44243_ '2))
                                          (if (let ()
                                                (declare (not safe))
                                                (##fx= _x44262_ '9))
                                              (list ':word (+ _i44243_ '2))
                                              (list '(:neg-char :word)
                                                    (+ _i44243_ '2))))))
                              (_default4425044254_)))
                        (_default4425044254_)))
                  (_default4425044254_))))
          '#f)))
  (define std/pregexp#pregexp-read-posix-char-class
    (lambda (_s44224_ _i44225_ _n44226_)
      (let ((_neg?44228_ '#f))
        (let _loop44230_ ((_i44232_ _i44225_) (_r44233_ (list '#\:)))
          (if (>= _i44232_ _n44226_)
              (std/pregexp#pregexp-error 'pregexp-read-posix-char-class)
              (let ((_c44235_
                     (let ()
                       (declare (not safe))
                       (##string-ref _s44224_ _i44232_))))
                (if (char=? _c44235_ '#\^)
                    (begin
                      (set! _neg?44228_ '#t)
                      (_loop44230_ (+ _i44232_ '1) _r44233_))
                    (if (char-alphabetic? _c44235_)
                        (_loop44230_ (+ _i44232_ '1) (cons _c44235_ _r44233_))
                        (if (char=? _c44235_ '#\:)
                            (if (or (>= (+ _i44232_ '1) _n44226_)
                                    (not (char=? (let ((__tmp270869
                                                        (+ _i44232_ '1)))
                                                   (declare (not safe))
                                                   (##string-ref
                                                    _s44224_
                                                    __tmp270869))
                                                 '#\])))
                                (std/pregexp#pregexp-error
                                 'pregexp-read-posix-char-class)
                                (let ((_posix-class44240_
                                       (string->symbol
                                        (list->string
                                         (std/pregexp#pregexp-reverse!
                                          _r44233_)))))
                                  (list (if _neg?44228_
                                            (list ':neg-char
                                                  _posix-class44240_)
                                            _posix-class44240_)
                                        (+ _i44232_ '2))))
                            (std/pregexp#pregexp-error
                             'pregexp-read-posix-char-class))))))))))
  (define std/pregexp#pregexp-read-cluster-type
    (lambda (_s44196_ _i44197_ _n44198_)
      (let* ((_c44200_
              (let () (declare (not safe)) (##string-ref _s44196_ _i44197_)))
             (_$e44202_ _c44200_))
        (if (eq? '#\? _$e44202_)
            (let* ((_i44205_ (+ _i44197_ '1))
                   (_$e44207_
                    (let ()
                      (declare (not safe))
                      (##string-ref _s44196_ _i44205_))))
              (if (eq? '#\: _$e44207_)
                  (list '() (+ _i44205_ '1))
                  (if (eq? '#\= _$e44207_)
                      (list '(:lookahead) (+ _i44205_ '1))
                      (if (eq? '#\! _$e44207_)
                          (list '(:neg-lookahead) (+ _i44205_ '1))
                          (if (eq? '#\> _$e44207_)
                              (list '(:no-backtrack) (+ _i44205_ '1))
                              (if (eq? '#\< _$e44207_)
                                  (list (let ((_$e44210_
                                               (let ((__tmp270870
                                                      (+ _i44205_ '1)))
                                                 (declare (not safe))
                                                 (##string-ref
                                                  _s44196_
                                                  __tmp270870))))
                                          (if (eq? '#\= _$e44210_)
                                              '(:lookbehind)
                                              (if (eq? '#\! _$e44210_)
                                                  '(:neg-lookbehind)
                                                  (std/pregexp#pregexp-error
                                                   'pregexp-read-cluster-type))))
                                        (+ _i44205_ '2))
                                  (let _loop44213_ ((_i44215_ _i44205_)
                                                    (_r44216_ '())
                                                    (_inv?44217_ '#f))
                                    (let* ((_c44219_
                                            (let ()
                                              (declare (not safe))
                                              (##string-ref
                                               _s44196_
                                               _i44215_)))
                                           (_$e44221_ _c44219_))
                                      (if (eq? '#\- _$e44221_)
                                          (_loop44213_
                                           (+ _i44215_ '1)
                                           _r44216_
                                           '#t)
                                          (if (eq? '#\i _$e44221_)
                                              (_loop44213_
                                               (+ _i44215_ '1)
                                               (cons (if _inv?44217_
                                                         ':case-sensitive
                                                         ':case-insensitive)
                                                     _r44216_)
                                               '#f)
                                              (if (eq? '#\x _$e44221_)
                                                  (begin
                                                    (std/pregexp#pregexp-space-sensitive?
                                                     _inv?44217_)
                                                    (_loop44213_
                                                     (+ _i44215_ '1)
                                                     _r44216_
                                                     '#f))
                                                  (if (eq? '#\: _$e44221_)
                                                      (list _r44216_
                                                            (+ _i44215_ '1))
                                                      (std/pregexp#pregexp-error
                                                       'pregexp-read-cluster-type)))))))))))))
            (list '(:sub) _i44197_)))))
  (define std/pregexp#pregexp-read-subpattern
    (lambda (_s44173_ _i44174_ _n44175_)
      (let* ((_remember-space-sensitive?44177_
              (std/pregexp#pregexp-space-sensitive?))
             (_ctyp-i44179_
              (std/pregexp#pregexp-read-cluster-type
               _s44173_
               _i44174_
               _n44175_))
             (_ctyp44181_ (car _ctyp-i44179_))
             (_i44183_ (cadr _ctyp-i44179_))
             (_vv44185_
              (std/pregexp#pregexp-read-pattern _s44173_ _i44183_ _n44175_)))
        (std/pregexp#pregexp-space-sensitive? _remember-space-sensitive?44177_)
        (let ((_vv-re44188_ (car _vv44185_)) (_vv-i44189_ (cadr _vv44185_)))
          (if (and (< _vv-i44189_ _n44175_)
                   (char=? (let ()
                             (declare (not safe))
                             (##string-ref _s44173_ _vv-i44189_))
                           '#\)))
              (list (let _loop44191_ ((_ctyp44193_ _ctyp44181_)
                                      (_re44194_ _vv-re44188_))
                      (if (null? _ctyp44193_)
                          _re44194_
                          (_loop44191_
                           (cdr _ctyp44193_)
                           (list (car _ctyp44193_) _re44194_))))
                    (+ _vv-i44189_ '1))
              (std/pregexp#pregexp-error 'pregexp-read-subpattern))))))
  (define std/pregexp#pregexp-wrap-quantifier-if-any
    (lambda (_vv44133_ _s44134_ _n44135_)
      (let ((_re44137_ (car _vv44133_)))
        (let _loop44139_ ((_i44141_ (cadr _vv44133_)))
          (if (>= _i44141_ _n44135_)
              _vv44133_
              (let ((_c44143_
                     (let ()
                       (declare (not safe))
                       (##string-ref _s44134_ _i44141_))))
                (if (and (char-whitespace? _c44143_)
                         (not (std/pregexp#pregexp-space-sensitive?)))
                    (_loop44139_ (+ _i44141_ '1))
                    (let ((_$e44145_ _c44143_))
                      (if (or (eq? '#\* _$e44145_)
                              (eq? '#\+ _$e44145_)
                              (eq? '#\? _$e44145_)
                              (eq? '#\{ _$e44145_))
                          (let* ((_new-re44157_
                                  (list ':between
                                        'minimal?
                                        'at-least
                                        'at-most
                                        _re44137_))
                                 (_new-vv44159_ (list _new-re44157_ 'next-i)))
                            (let ((_$e44162_ _c44143_))
                              (if (eq? '#\* _$e44162_)
                                  (begin
                                    (set-car! (cddr _new-re44157_) '0)
                                    (set-car! (cdddr _new-re44157_) '#f))
                                  (if (eq? '#\+ _$e44162_)
                                      (begin
                                        (set-car! (cddr _new-re44157_) '1)
                                        (set-car! (cdddr _new-re44157_) '#f))
                                      (if (eq? '#\? _$e44162_)
                                          (begin
                                            (set-car! (cddr _new-re44157_) '0)
                                            (set-car!
                                             (cdddr _new-re44157_)
                                             '1))
                                          (if (eq? '#\{ _$e44162_)
                                              (let ((_pq44165_
                                                     (std/pregexp#pregexp-read-nums
                                                      _s44134_
                                                      (+ _i44141_ '1)
                                                      _n44135_)))
                                                (if (not _pq44165_)
                                                    (std/pregexp#pregexp-error
                                                     'pregexp-wrap-quantifier-if-any
                                                     'left-brace-must-be-followed-by-number)
                                                    '#!void)
                                                (set-car!
                                                 (cddr _new-re44157_)
                                                 (car _pq44165_))
                                                (set-car!
                                                 (cdddr _new-re44157_)
                                                 (cadr _pq44165_))
                                                (set! _i44141_
                                                      (caddr _pq44165_)))
                                              '#!void)))))
                            (let _loop44167_ ((_i44169_ (+ _i44141_ '1)))
                              (if (>= _i44169_ _n44135_)
                                  (begin
                                    (set-car! (cdr _new-re44157_) '#f)
                                    (set-car! (cdr _new-vv44159_) _i44169_))
                                  (let ((_c44171_
                                         (let ()
                                           (declare (not safe))
                                           (##string-ref _s44134_ _i44169_))))
                                    (if (and (char-whitespace? _c44171_)
                                             (not (std/pregexp#pregexp-space-sensitive?)))
                                        (_loop44167_ (+ _i44169_ '1))
                                        (if (char=? _c44171_ '#\?)
                                            (begin
                                              (set-car!
                                               (cdr _new-re44157_)
                                               '#t)
                                              (set-car!
                                               (cdr _new-vv44159_)
                                               (+ _i44169_ '1)))
                                            (begin
                                              (set-car!
                                               (cdr _new-re44157_)
                                               '#f)
                                              (set-car!
                                               (cdr _new-vv44159_)
                                               _i44169_)))))))
                            _new-vv44159_)
                          _vv44133_)))))))))
  (define std/pregexp#pregexp-read-nums
    (lambda (_s44117_ _i44118_ _n44119_)
      (let _loop44121_ ((_p44123_ '())
                        (_q44124_ '())
                        (_k44125_ _i44118_)
                        (_reading44126_ '1))
        (if (>= _k44125_ _n44119_)
            (std/pregexp#pregexp-error 'pregexp-read-nums)
            '#!void)
        (let ((_c44128_
               (let () (declare (not safe)) (##string-ref _s44117_ _k44125_))))
          (if (char-numeric? _c44128_)
              (if (= _reading44126_ '1)
                  (_loop44121_
                   (cons _c44128_ _p44123_)
                   _q44124_
                   (+ _k44125_ '1)
                   '1)
                  (_loop44121_
                   _p44123_
                   (cons _c44128_ _q44124_)
                   (+ _k44125_ '1)
                   '2))
              (if (and (char-whitespace? _c44128_)
                       (not (std/pregexp#pregexp-space-sensitive?)))
                  (_loop44121_
                   _p44123_
                   _q44124_
                   (+ _k44125_ '1)
                   _reading44126_)
                  (if (and (char=? _c44128_ '#\,) (= _reading44126_ '1))
                      (_loop44121_ _p44123_ _q44124_ (+ _k44125_ '1) '2)
                      (if (char=? _c44128_ '#\})
                          (let ((_p44130_
                                 (string->number
                                  (list->string
                                   (std/pregexp#pregexp-reverse! _p44123_))))
                                (_q44131_
                                 (string->number
                                  (list->string
                                   (std/pregexp#pregexp-reverse! _q44124_)))))
                            (if (and (not _p44130_) (= _reading44126_ '1))
                                (list '0 '#f _k44125_)
                                (if (= _reading44126_ '1)
                                    (list _p44130_ _p44130_ _k44125_)
                                    (list _p44130_ _q44131_ _k44125_))))
                          '#f))))))))
  (define std/pregexp#pregexp-invert-char-list
    (lambda (_vv44115_) (set-car! (car _vv44115_) ':none-of-chars) _vv44115_))
  (define std/pregexp#pregexp-read-char-list
    (lambda (_s44090_ _i44091_ _n44092_)
      (let _loop44094_ ((_r44096_ '()) (_i44097_ _i44091_))
        (if (>= _i44097_ _n44092_)
            (std/pregexp#pregexp-error
             'pregexp-read-char-list
             'character-class-ended-too-soon)
            (let* ((_c44099_
                    (let ()
                      (declare (not safe))
                      (##string-ref _s44090_ _i44097_)))
                   (_$e44101_ _c44099_))
              (if (eq? '#\] _$e44101_)
                  (if (null? _r44096_)
                      (_loop44094_ (cons _c44099_ _r44096_) (+ _i44097_ '1))
                      (list (cons ':one-of-chars
                                  (std/pregexp#pregexp-reverse! _r44096_))
                            (+ _i44097_ '1)))
                  (if (eq? '#\\ _$e44101_)
                      (let ((_char-i44104_
                             (std/pregexp#pregexp-read-escaped-char
                              _s44090_
                              _i44097_
                              _n44092_)))
                        (if _char-i44104_
                            (_loop44094_
                             (cons (car _char-i44104_) _r44096_)
                             (cadr _char-i44104_))
                            (std/pregexp#pregexp-error
                             'pregexp-read-char-list
                             'backslash)))
                      (if (eq? '#\- _$e44101_)
                          (if (or (null? _r44096_)
                                  (let ((_i+144109_ (+ _i44097_ '1)))
                                    (and (< _i+144109_ _n44092_)
                                         (char=? (let ()
                                                   (declare (not safe))
                                                   (##string-ref
                                                    _s44090_
                                                    _i+144109_))
                                                 '#\]))))
                              (_loop44094_
                               (cons _c44099_ _r44096_)
                               (+ _i44097_ '1))
                              (let ((_c-prev44111_ (car _r44096_)))
                                (if (char? _c-prev44111_)
                                    (_loop44094_
                                     (cons (list ':char-range
                                                 _c-prev44111_
                                                 (let ((__tmp270871
                                                        (+ _i44097_ '1)))
                                                   (declare (not safe))
                                                   (##string-ref
                                                    _s44090_
                                                    __tmp270871)))
                                           (cdr _r44096_))
                                     (+ _i44097_ '2))
                                    (_loop44094_
                                     (cons _c44099_ _r44096_)
                                     (+ _i44097_ '1)))))
                          (if (eq? '#\[ _$e44101_)
                              (if (char=? (let ((__tmp270872 (+ _i44097_ '1)))
                                            (declare (not safe))
                                            (##string-ref
                                             _s44090_
                                             __tmp270872))
                                          '#\:)
                                  (let ((_posix-char-class-i44113_
                                         (std/pregexp#pregexp-read-posix-char-class
                                          _s44090_
                                          (+ _i44097_ '2)
                                          _n44092_)))
                                    (_loop44094_
                                     (cons (car _posix-char-class-i44113_)
                                           _r44096_)
                                     (cadr _posix-char-class-i44113_)))
                                  (_loop44094_
                                   (cons _c44099_ _r44096_)
                                   (+ _i44097_ '1)))
                              (_loop44094_
                               (cons _c44099_ _r44096_)
                               (+ _i44097_ '1)))))))))))
  (define std/pregexp#pregexp-string-match
    (lambda (_s144076_ _s44077_ _i44078_ _n44079_ _sk44080_ _fk44081_)
      (let ((_n144083_ (string-length _s144076_)))
        (if (> _n144083_ _n44079_)
            (_fk44081_)
            (let _loop44085_ ((_j44087_ '0) (_k44088_ _i44078_))
              (if (>= _j44087_ _n144083_)
                  (_sk44080_ _k44088_)
                  (if (>= _k44088_ _n44079_)
                      (_fk44081_)
                      (if (char=? (let ()
                                    (declare (not safe))
                                    (##string-ref _s144076_ _j44087_))
                                  (let ()
                                    (declare (not safe))
                                    (##string-ref _s44077_ _k44088_)))
                          (_loop44085_ (+ _j44087_ '1) (+ _k44088_ '1))
                          (_fk44081_)))))))))
  (define std/pregexp#pregexp-char-word?
    (lambda (_c44068_)
      (let ((_$e44070_ (char-alphabetic? _c44068_)))
        (if _$e44070_
            _$e44070_
            (let ((_$e44073_ (char-numeric? _c44068_)))
              (if _$e44073_ _$e44073_ (char=? _c44068_ '#\_)))))))
  (define std/pregexp#pregexp-at-word-boundary?
    (lambda (_s44049_ _i44050_ _n44051_)
      (let ((_$e44053_ (= _i44050_ '0)))
        (if _$e44053_
            _$e44053_
            (let ((_$e44056_ (>= _i44050_ _n44051_)))
              (if _$e44056_
                  _$e44056_
                  (let ((_c/i44059_
                         (let ()
                           (declare (not safe))
                           (##string-ref _s44049_ _i44050_)))
                        (_c/i-144060_
                         (let ((__tmp270873 (- _i44050_ '1)))
                           (declare (not safe))
                           (##string-ref _s44049_ __tmp270873))))
                    (let ((_c/i/w?44062_
                           (std/pregexp#pregexp-check-if-in-char-class?
                            _c/i44059_
                            ':word))
                          (_c/i-1/w?44063_
                           (std/pregexp#pregexp-check-if-in-char-class?
                            _c/i-144060_
                            ':word)))
                      (let ((_$e44065_
                             (if _c/i/w?44062_ (not _c/i-1/w?44063_) '#f)))
                        (if _$e44065_
                            _$e44065_
                            (if (not _c/i/w?44062_)
                                _c/i-1/w?44063_
                                '#f)))))))))))
  (define std/pregexp#pregexp-check-if-in-char-class?
    (lambda (_c43992_ _char-class43993_)
      (let ((_$e43995_ _char-class43993_))
        (let ((_default4399744001_
               (lambda ()
                 (std/pregexp#pregexp-error 'pregexp-check-if-in-char-class?)))
              (_table4399844003_
               '#(#f
                  #f
                  #f
                  #f
                  #f
                  #f
                  (:digit . 6)
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  (:alnum . 1)
                  (:word . 13)
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  (:cntrl . 5)
                  #f
                  #f
                  #f
                  #f
                  (:alpha . 2)
                  #f
                  #f
                  (:lower . 8)
                  #f
                  #f
                  #f
                  #f
                  #f
                  (:xdigit . 14)
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  (:space . 11)
                  #f
                  (:upper . 12)
                  #f
                  #f
                  #f
                  (:punct . 10)
                  #f
                  (:any . 0)
                  #f
                  #f
                  (:print . 9)
                  (:blank . 4)
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  (:ascii . 3)
                  #f
                  #f
                  #f
                  #f
                  #f
                  #f
                  (:graph . 7))))
          (if (symbol? _$e43995_)
              (let* ((_h44006_
                      (let () (declare (not safe)) (##symbol-hash _$e43995_)))
                     (_ix44009_
                      (let () (declare (not safe)) (##fxmodulo _h44006_ '100)))
                     (_q44012_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _table4399844003_ _ix44009_))))
                (if _q44012_
                    (if (eq? (let () (declare (not safe)) (##car _q44012_))
                             _$e43995_)
                        (let ((_x44016_
                               (let () (declare (not safe)) (##cdr _q44012_))))
                          (if (let () (declare (not safe)) (##fx< _x44016_ '7))
                              (if (let ()
                                    (declare (not safe))
                                    (##fx< _x44016_ '3))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx= _x44016_ '0))
                                      (not (char=? _c43992_ '#\newline))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44016_ '1))
                                          (let ((_$e44019_
                                                 (char-alphabetic? _c43992_)))
                                            (if _$e44019_
                                                _$e44019_
                                                (char-numeric? _c43992_)))
                                          (char-alphabetic? _c43992_)))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx< _x44016_ '5))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44016_ '3))
                                          (< (char->integer _c43992_) '128)
                                          (let ((_$e44022_
                                                 (char=? _c43992_ '#\space)))
                                            (if _$e44022_
                                                _$e44022_
                                                (char=? _c43992_
                                                        std/pregexp#*pregexp-tab-char*))))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44016_ '5))
                                          (< (char->integer _c43992_) '32)
                                          (char-numeric? _c43992_))))
                              (if (let ()
                                    (declare (not safe))
                                    (##fx< _x44016_ '11))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx< _x44016_ '9))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44016_ '7))
                                          (if (>= (char->integer _c43992_) '32)
                                              (not (char-whitespace? _c43992_))
                                              '#f)
                                          (char-lower-case? _c43992_))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44016_ '9))
                                          (>= (char->integer _c43992_) '32)
                                          (if (>= (char->integer _c43992_) '32)
                                              (if (not (char-whitespace?
                                                        _c43992_))
                                                  (if (not (char-alphabetic?
                                                            _c43992_))
                                                      (not (char-numeric?
                                                            _c43992_))
                                                      '#f)
                                                  '#f)
                                              '#f)))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx< _x44016_ '13))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44016_ '11))
                                          (char-whitespace? _c43992_)
                                          (char-upper-case? _c43992_))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x44016_ '13))
                                          (let ((_$e44025_
                                                 (char-alphabetic? _c43992_)))
                                            (if _$e44025_
                                                _$e44025_
                                                (let ((_$e44028_
                                                       (char-numeric?
                                                        _c43992_)))
                                                  (if _$e44028_
                                                      _$e44028_
                                                      (char=? _c43992_
                                                              '#\_)))))
                                          (let ((_$e44031_
                                                 (char-numeric? _c43992_)))
                                            (if _$e44031_
                                                _$e44031_
                                                (let ((_$e44034_
                                                       (char-ci=?
                                                        _c43992_
                                                        '#\a)))
                                                  (if _$e44034_
                                                      _$e44034_
                                                      (let ((_$e44037_
                                                             (char-ci=?
                                                              _c43992_
                                                              '#\b)))
                                                        (if _$e44037_
                                                            _$e44037_
                                                            (let ((_$e44040_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                           (char-ci=? _c43992_ '#\c)))
                      (if _$e44040_
                          _$e44040_
                          (let ((_$e44043_ (char-ci=? _c43992_ '#\d)))
                            (if _$e44043_
                                _$e44043_
                                (let ((_$e44046_ (char-ci=? _c43992_ '#\e)))
                                  (if _$e44046_
                                      _$e44046_
                                      (char-ci=?
                                       _c43992_
                                       '#\f))))))))))))))))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        (_default4399744001_))
                    (_default4399744001_)))
              (_default4399744001_))))))
  (define std/pregexp#pregexp-list-ref
    (lambda (_s43984_ _i43985_)
      (let _loop43987_ ((_s43989_ _s43984_) (_k43990_ '0))
        (if (null? _s43989_)
            '#f
            (if (= _k43990_ _i43985_)
                (car _s43989_)
                (_loop43987_ (cdr _s43989_) (+ _k43990_ '1)))))))
  (define std/pregexp#pregexp-make-backref-list
    (lambda (_re43975_)
      (let _sub43977_ ((_re43979_ _re43975_))
        (if (pair? _re43979_)
            (let ((_car-re43981_ (car _re43979_))
                  (_sub-cdr-re43982_ (_sub43977_ (cdr _re43979_))))
              (if (eqv? _car-re43981_ ':sub)
                  (cons (cons _re43979_ '#f) _sub-cdr-re43982_)
                  (append (_sub43977_ _car-re43981_) _sub-cdr-re43982_)))
            '()))))
  (define std/pregexp#pregexp-match-positions-aux
    (lambda (_re43823_ _s43824_ _sn43825_ _start43826_ _n43827_ _i43828_)
      (let ((_identity43832_ (lambda (_x43830_) _x43830_))
            (_backrefs43833_ (std/pregexp#pregexp-make-backref-list _re43823_))
            (_case-sensitive?43834_ '#t))
        (let _sub43836_ ((_re43838_ _re43823_)
                         (_i43839_ _i43828_)
                         (_sk43840_ _identity43832_)
                         (_fk43841_ (lambda () '#f)))
          (if (eqv? _re43838_ ':bos)
              (if (= _i43839_ _start43826_) (_sk43840_ _i43839_) (_fk43841_))
              (if (eqv? _re43838_ ':eos)
                  (if (>= _i43839_ _n43827_) (_sk43840_ _i43839_) (_fk43841_))
                  (if (eqv? _re43838_ ':empty)
                      (_sk43840_ _i43839_)
                      (if (eqv? _re43838_ ':wbdry)
                          (if (std/pregexp#pregexp-at-word-boundary?
                               _s43824_
                               _i43839_
                               _n43827_)
                              (_sk43840_ _i43839_)
                              (_fk43841_))
                          (if (eqv? _re43838_ ':not-wbdry)
                              (if (std/pregexp#pregexp-at-word-boundary?
                                   _s43824_
                                   _i43839_
                                   _n43827_)
                                  (_fk43841_)
                                  (_sk43840_ _i43839_))
                              (if (and (char? _re43838_) (< _i43839_ _n43827_))
                                  (if ((if _case-sensitive?43834_
                                           char=?
                                           char-ci=?)
                                       (let ()
                                         (declare (not safe))
                                         (##string-ref _s43824_ _i43839_))
                                       _re43838_)
                                      (_sk43840_ (+ _i43839_ '1))
                                      (_fk43841_))
                                  (if (and (not (pair? _re43838_))
                                           (< _i43839_ _n43827_))
                                      (if (std/pregexp#pregexp-check-if-in-char-class?
                                           (let ()
                                             (declare (not safe))
                                             (##string-ref _s43824_ _i43839_))
                                           _re43838_)
                                          (_sk43840_ (+ _i43839_ '1))
                                          (_fk43841_))
                                      (if (and (pair? _re43838_)
                                               (eqv? (car _re43838_)
                                                     ':char-range)
                                               (< _i43839_ _n43827_))
                                          (let ((_c43843_
                                                 (let ()
                                                   (declare (not safe))
                                                   (##string-ref
                                                    _s43824_
                                                    _i43839_))))
                                            (if (let ((_c<43845_
                                                       (if _case-sensitive?43834_
                                                           char<=?
                                                           char-ci<=?)))
                                                  (and (_c<43845_
                                                        (cadr _re43838_)
                                                        _c43843_)
                                                       (_c<43845_
                                                        _c43843_
                                                        (caddr _re43838_))))
                                                (_sk43840_ (+ _i43839_ '1))
                                                (_fk43841_)))
                                          (if (pair? _re43838_)
                                              (let ((_$e43847_
                                                     (car _re43838_)))
                                                (let ((_default4384943853_
                                                       (lambda ()
                                                         (std/pregexp#pregexp-error
                                                          'pregexp-match-positions-aux)))
                                                      (_table4385043855_
                                                       '#(#f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          (:neg-char . 2)
                                                          #f
                                                          #f
                                                          #f
                                                          (:neg-lookahead . 8)
                                                          (:sub . 6)
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          (:or . 4)
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          (:char-range . 0)
                                                          #f
                                                          #f
                                                          #f
                                                          (:case-insensitive
                                                           .
                                                           12)
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          (:lookahead . 7)
                                                          #f
                                                          #f
                                                          #f
                                                          (:between . 13)
                                                          #f
                                                          #f
                                                          #f
                                                          (:one-of-chars . 1)
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          (:backref . 5)
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          (:lookbehind . 9)
                                                          (:neg-lookbehind
                                                           .
                                                           10)
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          (:case-sensitive
                                                           .
                                                           12)
                                                          #f
                                                          #f
                                                          #f
                                                          (:seq . 3)
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          #f
                                                          (:no-backtrack . 11)
                                                          #f
                                                          #f)))
                                                  (if (symbol? _$e43847_)
                                                      (let* ((_h43858_
                                                              (let ()
                                                                (declare
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                          (not safe))
                        (##symbol-hash _$e43847_)))
                     (_ix43861_
                      (let () (declare (not safe)) (##fxmodulo _h43858_ '100)))
                     (_q43864_
                      (let ()
                        (declare (not safe))
                        (##vector-ref _table4385043855_ _ix43861_))))
                (if _q43864_
                    (if (eq? (let () (declare (not safe)) (##car _q43864_))
                             _$e43847_)
                        (let ((_x43868_
                               (let () (declare (not safe)) (##cdr _q43864_))))
                          (if (let () (declare (not safe)) (##fx< _x43868_ '7))
                              (if (let ()
                                    (declare (not safe))
                                    (##fx< _x43868_ '3))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx= _x43868_ '0))
                                      (if (>= _i43839_ _n43827_)
                                          (_fk43841_)
                                          (std/pregexp#pregexp-error
                                           'pregexp-match-positions-aux))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x43868_ '1))
                                          (if (>= _i43839_ _n43827_)
                                              (_fk43841_)
                                              (let _loup-one-of-chars43871_ ((_chars43873_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                                      (cdr _re43838_)))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                (if (null? _chars43873_)
                                                    (_fk43841_)
                                                    (_sub43836_
                                                     (car _chars43873_)
                                                     _i43839_
                                                     _sk43840_
                                                     (lambda ()
                                                       (_loup-one-of-chars43871_
                                                        (cdr _chars43873_)))))))
                                          (if (>= _i43839_ _n43827_)
                                              (_fk43841_)
                                              (_sub43836_
                                               (cadr _re43838_)
                                               _i43839_
                                               (lambda (_i143876_) (_fk43841_))
                                               (lambda ()
                                                 (_sk43840_
                                                  (+ _i43839_ '1)))))))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx< _x43868_ '5))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x43868_ '3))
                                          (let _loup-seq43879_ ((_res43881_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                         (cdr _re43838_))
                        (_i43882_ _i43839_))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                            (if (null? _res43881_)
                                                (_sk43840_ _i43882_)
                                                (_sub43836_
                                                 (car _res43881_)
                                                 _i43882_
                                                 (lambda (_i143884_)
                                                   (_loup-seq43879_
                                                    (cdr _res43881_)
                                                    _i143884_))
                                                 _fk43841_)))
                                          (let _loup-or43886_ ((_res43888_
                                                                (cdr _re43838_)))
                                            (if (null? _res43888_)
                                                (_fk43841_)
                                                (_sub43836_
                                                 (car _res43888_)
                                                 _i43839_
                                                 (lambda (_i143890_)
                                                   (let ((_$e43892_
                                                          (_sk43840_
                                                           _i143890_)))
                                                     (if _$e43892_
                                                         _$e43892_
                                                         (_loup-or43886_
                                                          (cdr _res43888_)))))
                                                 (lambda ()
                                                   (_loup-or43886_
                                                    (cdr _res43888_)))))))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x43868_ '5))
                                          (let* ((_c43896_
                                                  (std/pregexp#pregexp-list-ref
                                                   _backrefs43833_
                                                   (cadr _re43838_)))
                                                 (_backref43901_
                                                  (let ((_$e43898_ _c43896_))
                                                    (if _$e43898_
                                                        (cdr _$e43898_)
                                                        (begin
                                                          (std/pregexp#pregexp-error
                                                           'pregexp-match-positions-aux
                                                           'non-existent-backref
                                                           _re43838_)
                                                          '#f)))))
                                            (if _backref43901_
                                                (std/pregexp#pregexp-string-match
                                                 (substring
                                                  _s43824_
                                                  (car _backref43901_)
                                                  (cdr _backref43901_))
                                                 _s43824_
                                                 _i43839_
                                                 _n43827_
                                                 (lambda (_i43904_)
                                                   (_sk43840_ _i43904_))
                                                 _fk43841_)
                                                (_sk43840_ _i43839_)))
                                          (_sub43836_
                                           (cadr _re43838_)
                                           _i43839_
                                           (lambda (_i143906_)
                                             (set-cdr!
                                              (assv _re43838_ _backrefs43833_)
                                              (cons _i43839_ _i143906_))
                                             (_sk43840_ _i143906_))
                                           _fk43841_))))
                              (if (let ()
                                    (declare (not safe))
                                    (##fx< _x43868_ '10))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx= _x43868_ '7))
                                      (let ((_found-it?43909_
                                             (_sub43836_
                                              (cadr _re43838_)
                                              _i43839_
                                              _identity43832_
                                              (lambda () '#f))))
                                        (if _found-it?43909_
                                            (_sk43840_ _i43839_)
                                            (_fk43841_)))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x43868_ '8))
                                          (let ((_found-it?43912_
                                                 (_sub43836_
                                                  (cadr _re43838_)
                                                  _i43839_
                                                  _identity43832_
                                                  (lambda () '#f))))
                                            (if _found-it?43912_
                                                (_fk43841_)
                                                (_sk43840_ _i43839_)))
                                          (let ((_n-actual43914_ _n43827_)
                                                (_sn-actual43915_ _sn43825_))
                                            (set! _n43827_ _i43839_)
                                            (set! _sn43825_ _i43839_)
                                            (let ((_found-it?43918_
                                                   (_sub43836_
                                                    (list ':seq
                                                          '(:between
                                                            #f
                                                            0
                                                            #f
                                                            :any)
                                                          (cadr _re43838_)
                                                          ':eos)
                                                    '0
                                                    _identity43832_
                                                    (lambda () '#f))))
                                              (set! _n43827_ _n-actual43914_)
                                              (set! _sn43825_ _sn-actual43915_)
                                              (if _found-it?43918_
                                                  (_sk43840_ _i43839_)
                                                  (_fk43841_))))))
                                  (if (let ()
                                        (declare (not safe))
                                        (##fx< _x43868_ '12))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x43868_ '10))
                                          (let ((_n-actual43920_ _n43827_)
                                                (_sn-actual43921_ _sn43825_))
                                            (set! _n43827_ _i43839_)
                                            (set! _sn43825_ _i43839_)
                                            (let ((_found-it?43924_
                                                   (_sub43836_
                                                    (list ':seq
                                                          '(:between
                                                            #f
                                                            0
                                                            #f
                                                            :any)
                                                          (cadr _re43838_)
                                                          ':eos)
                                                    '0
                                                    _identity43832_
                                                    (lambda () '#f))))
                                              (set! _n43827_ _n-actual43920_)
                                              (set! _sn43825_ _sn-actual43921_)
                                              (if _found-it?43924_
                                                  (_fk43841_)
                                                  (_sk43840_ _i43839_))))
                                          (let ((_found-it?43927_
                                                 (_sub43836_
                                                  (cadr _re43838_)
                                                  _i43839_
                                                  _identity43832_
                                                  (lambda () '#f))))
                                            (if _found-it?43927_
                                                (_sk43840_ _found-it?43927_)
                                                (_fk43841_))))
                                      (if (let ()
                                            (declare (not safe))
                                            (##fx= _x43868_ '12))
                                          (let ((_old43929_
                                                 _case-sensitive?43834_))
                                            (set! _case-sensitive?43834_
                                                  (eqv? (car _re43838_)
                                                        ':case-sensitive))
                                            (_sub43836_
                                             (cadr _re43838_)
                                             _i43839_
                                             (lambda (_i143931_)
                                               (set! _case-sensitive?43834_
                                                     _old43929_)
                                               (_sk43840_ _i143931_))
                                             (lambda ()
                                               (set! _case-sensitive?43834_
                                                     _old43929_)
                                               (_fk43841_))))
                                          (let* ((_maximal?43934_
                                                  (not (cadr _re43838_)))
                                                 (_p43936_ (caddr _re43838_))
                                                 (_q43938_ (cadddr _re43838_))
                                                 (_could-loop-infinitely?43940_
                                                  (if _maximal?43934_
                                                      (not _q43938_)
                                                      '#f))
                                                 (_re43942_
                                                  (car (cddddr _re43838_))))
                                            (let _loup-p43945_ ((_k43947_ '0)
                                                                (_i43948_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                         _i43839_))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                              (if (< _k43947_ _p43936_)
                                                  (_sub43836_
                                                   _re43942_
                                                   _i43948_
                                                   (lambda (_i143950_)
                                                     (if (and _could-loop-infinitely?43940_
                                                              (= _i143950_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                         _i43948_))
                 (std/pregexp#pregexp-error
                  'pregexp-match-positions-aux
                  'greedy-quantifier-operand-could-be-empty)
                 '#!void)
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                     (_loup-p43945_
                                                      (+ _k43947_ '1)
                                                      _i143950_))
                                                   _fk43841_)
                                                  (let ((_q43952_
                                                         (if _q43938_
                                                             (- _q43938_
                                                                _p43936_)
                                                             '#f)))
                                                    (let _loup-q43954_ ((_k43956_
;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                                 '0)
                                (_i43957_ _i43948_))
              (let ((_fk43960_ (lambda () (_sk43840_ _i43957_))))
                (if (and _q43952_ (>= _k43956_ _q43952_))
                    (_fk43960_)
                    (if _maximal?43934_
                        (_sub43836_
                         _re43942_
                         _i43957_
                         (lambda (_i143962_)
                           (if (and _could-loop-infinitely?43940_
                                    (= _i143962_ _i43957_))
                               (std/pregexp#pregexp-error
                                'pregexp-match-positions-aux
                                'greedy-quantifier-operand-could-be-empty)
                               '#!void)
                           (let ((_$e43964_
                                  (_loup-q43954_ (+ _k43956_ '1) _i143962_)))
                             (if _$e43964_ _$e43964_ (_fk43960_))))
                         _fk43960_)
                        (let ((_$e43967_ (_fk43960_)))
                          (if _$e43967_
                              _$e43967_
                              (_sub43836_
                               _re43942_
                               _i43957_
                               (lambda (_i143970_)
                                 (_loup-q43954_ (+ _k43956_ '1) _i143970_))
                               _fk43960_))))))))))))))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        (_default4384943853_))
                    (_default4384943853_)))
              (_default4384943853_))))
;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                              (if (>= _i43839_ _n43827_)
                                                  (_fk43841_)
                                                  (std/pregexp#pregexp-error
                                                   'pregexp-match-positions-aux))))))))))))
        (let ((_backrefs43973_ (map cdr _backrefs43833_)))
          (if (car _backrefs43973_) _backrefs43973_ '#f)))))
  (define std/pregexp#pregexp-replace-aux
    (lambda (_str43800_ _ins43801_ _n43802_ _backrefs43803_)
      (let _loop43805_ ((_i43807_ '0) (_r43808_ '""))
        (if (>= _i43807_ _n43802_)
            _r43808_
            (let ((_c43810_
                   (let ()
                     (declare (not safe))
                     (##string-ref _ins43801_ _i43807_))))
              (if (char=? _c43810_ '#\\)
                  (let* ((_br-i43812_
                          (std/pregexp#pregexp-read-escaped-number
                           _ins43801_
                           _i43807_
                           _n43802_))
                         (_br43814_
                          (if _br-i43812_
                              (car _br-i43812_)
                              (if (char=? (let ((__tmp270874 (+ _i43807_ '1)))
                                            (declare (not safe))
                                            (##string-ref
                                             _ins43801_
                                             __tmp270874))
                                          '#\&)
                                  '0
                                  '#f)))
                         (_i43816_
                          (if _br-i43812_
                              (cadr _br-i43812_)
                              (if _br43814_ (+ _i43807_ '2) (+ _i43807_ '1)))))
                    (if (not _br43814_)
                        (let ((_c243819_
                               (let ()
                                 (declare (not safe))
                                 (##string-ref _ins43801_ _i43816_))))
                          (_loop43805_
                           (+ _i43816_ '1)
                           (if (char=? _c243819_ '#\$)
                               _r43808_
                               (string-append _r43808_ (string _c243819_)))))
                        (_loop43805_
                         _i43816_
                         (let ((_backref43821_
                                (std/pregexp#pregexp-list-ref
                                 _backrefs43803_
                                 _br43814_)))
                           (if _backref43821_
                               (string-append
                                _r43808_
                                (substring
                                 _str43800_
                                 (car _backref43821_)
                                 (cdr _backref43821_)))
                               _r43808_)))))
                  (_loop43805_
                   (+ _i43807_ '1)
                   (string-append _r43808_ (string _c43810_)))))))))
  (define std/pregexp#pregexp
    (lambda (_s43797_)
      (call-with-parameters
       (lambda ()
         (list ':sub
               (car (std/pregexp#pregexp-read-pattern
                     _s43797_
                     '0
                     (string-length _s43797_)))))
       std/pregexp#pregexp-space-sensitive?
       '#t)))
  (define std/pregexp#pregexp-match-positions__%
    (lambda (_pat43757_ _str43758_ _start43759_ _end43760_)
      (if (string? _pat43757_)
          (set! _pat43757_ (std/pregexp#pregexp _pat43757_))
          (if (pair? _pat43757_)
              '#t
              (std/pregexp#pregexp-error
               'pregexp-match-positions
               'pattern-must-be-compiled-or-string-regexp
               _pat43757_)))
      (let* ((_str-len43762_ (string-length _str43758_))
             (_start43764_
              (if _start43759_
                  (if (fixnum? _start43759_)
                      (if (and (>= _start43759_ '0)
                               (< _start43759_ _str-len43762_))
                          _start43759_
                          (error '"Start index out of range" _start43759_))
                      (error '"Expected nonnegative fixnum" _start43759_))
                  '0))
             (_end43766_
              (if _end43760_
                  (if (fixnum? _end43760_)
                      (if (<= _end43760_ _str-len43762_)
                          _end43760_
                          (error '"End index out of range" _end43760_))
                      (error '"Expected fixnum" _end43760_))
                  _str-len43762_)))
        (let _loop43769_ ((_i43771_ _start43764_))
          (if (<= _i43771_ _end43766_)
              (let ((_$e43773_
                     (std/pregexp#pregexp-match-positions-aux
                      _pat43757_
                      _str43758_
                      _str-len43762_
                      _start43764_
                      _end43766_
                      _i43771_)))
                (if _$e43773_ _$e43773_ (_loop43769_ (+ _i43771_ '1))))
              '#f)))))
  (define std/pregexp#pregexp-match-positions__0
    (lambda (_pat43779_ _str43780_)
      (let* ((_start43782_ '#f) (_end43784_ '#f))
        (std/pregexp#pregexp-match-positions__%
         _pat43779_
         _str43780_
         _start43782_
         _end43784_))))
  (define std/pregexp#pregexp-match-positions__1
    (lambda (_pat43786_ _str43787_ _start43788_)
      (let ((_end43790_ '#f))
        (std/pregexp#pregexp-match-positions__%
         _pat43786_
         _str43787_
         _start43788_
         _end43790_))))
  (define std/pregexp#pregexp-match-positions
    (lambda _g270876_
      (let ((_g270875_ (let () (declare (not safe)) (##length _g270876_))))
        (cond ((let () (declare (not safe)) (##fx= _g270875_ 2))
               (apply std/pregexp#pregexp-match-positions__0 _g270876_))
              ((let () (declare (not safe)) (##fx= _g270875_ 3))
               (apply std/pregexp#pregexp-match-positions__1 _g270876_))
              ((let () (declare (not safe)) (##fx= _g270875_ 4))
               (apply std/pregexp#pregexp-match-positions__% _g270876_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/pregexp#pregexp-match-positions
                _g270876_))))))
  (define std/pregexp#pregexp-match
    (lambda (_pat43748_ _str43749_ . _opt-args43750_)
      (let ((_ix-prs43752_
             (apply std/pregexp#pregexp-match-positions
                    _pat43748_
                    _str43749_
                    _opt-args43750_)))
        (if _ix-prs43752_
            (map (lambda (_ix-pr43754_)
                   (if _ix-pr43754_
                       (substring
                        _str43749_
                        (car _ix-pr43754_)
                        (cdr _ix-pr43754_))
                       '#f))
                 _ix-prs43752_)
            '#f))))
  (define std/pregexp#pregexp-split
    (lambda (_pat43727_ _str43728_)
      (let ((_n43730_ (string-length _str43728_)))
        (let _loop43732_ ((_i43734_ '0)
                          (_r43735_ '())
                          (_picked-up-one-undelimited-char?43736_ '#f))
          (if (>= _i43734_ _n43730_)
              (std/pregexp#pregexp-reverse! _r43735_)
              (let ((_$e43738_
                     (std/pregexp#pregexp-match-positions__%
                      _pat43727_
                      _str43728_
                      _i43734_
                      _n43730_)))
                (if _$e43738_
                    ((lambda (_y43741_)
                       (let ((_jk43743_ (car _y43741_)))
                         (let ((_j43745_ (car _jk43743_))
                               (_k43746_ (cdr _jk43743_)))
                           (if (= _j43745_ _k43746_)
                               (_loop43732_
                                (+ _k43746_ '1)
                                (cons (substring
                                       _str43728_
                                       _i43734_
                                       (+ _j43745_ '1))
                                      _r43735_)
                                '#t)
                               (if (and (= _j43745_ _i43734_)
                                        _picked-up-one-undelimited-char?43736_)
                                   (_loop43732_ _k43746_ _r43735_ '#f)
                                   (_loop43732_
                                    _k43746_
                                    (cons (substring
                                           _str43728_
                                           _i43734_
                                           _j43745_)
                                          _r43735_)
                                    '#f))))))
                     _$e43738_)
                    (_loop43732_
                     _n43730_
                     (cons (substring _str43728_ _i43734_ _n43730_) _r43735_)
                     '#f))))))))
  (define std/pregexp#pregexp-replace
    (lambda (_pat43714_ _str43715_ _ins43716_)
      (let* ((_n43718_ (string-length _str43715_))
             (_pp43720_
              (std/pregexp#pregexp-match-positions__%
               _pat43714_
               _str43715_
               '0
               _n43718_)))
        (if (not _pp43720_)
            _str43715_
            (let ((_ins-len43723_ (string-length _ins43716_))
                  (_m-i43724_ (caar _pp43720_))
                  (_m-n43725_ (cdar _pp43720_)))
              (string-append
               (substring _str43715_ '0 _m-i43724_)
               (std/pregexp#pregexp-replace-aux
                _str43715_
                _ins43716_
                _ins-len43723_
                _pp43720_)
               (substring _str43715_ _m-n43725_ _n43718_)))))))
  (define std/pregexp#pregexp-replace*
    (lambda (_pat43699_ _str43700_ _ins43701_)
      (let ((_pat43703_
             (if (string? _pat43699_)
                 (std/pregexp#pregexp _pat43699_)
                 _pat43699_))
            (_n43704_ (string-length _str43700_))
            (_ins-len43705_ (string-length _ins43701_)))
        (let _loop43707_ ((_i43709_ '0) (_r43710_ '""))
          (if (>= _i43709_ _n43704_)
              _r43710_
              (let ((_pp43712_
                     (std/pregexp#pregexp-match-positions__%
                      _pat43703_
                      _str43700_
                      _i43709_
                      _n43704_)))
                (if (not _pp43712_)
                    (if (= _i43709_ '0)
                        _str43700_
                        (string-append
                         _r43710_
                         (substring _str43700_ _i43709_ _n43704_)))
                    (_loop43707_
                     (cdar _pp43712_)
                     (string-append
                      _r43710_
                      (substring _str43700_ _i43709_ (caar _pp43712_))
                      (std/pregexp#pregexp-replace-aux
                       _str43700_
                       _ins43701_
                       _ins-len43705_
                       _pp43712_))))))))))
  (define std/pregexp#pregexp-quote
    (lambda (_s43690_)
      (let _loop43692_ ((_i43694_ (- (string-length _s43690_) '1))
                        (_r43695_ '()))
        (if (< _i43694_ '0)
            (list->string _r43695_)
            (_loop43692_
             (- _i43694_ '1)
             (let ((_c43697_
                    (let ()
                      (declare (not safe))
                      (##string-ref _s43690_ _i43694_))))
               (if (memv _c43697_
                         '(#\\
                           #\.
                           #\?
                           #\*
                           #\+
                           #\|
                           #\^
                           #\$
                           #\[
                           #\]
                           #\{
                           #\}
                           #\(
                           #\)))
                   (cons '#\\ (cons _c43697_ _r43695_))
                   (cons _c43697_ _r43695_)))))))))
