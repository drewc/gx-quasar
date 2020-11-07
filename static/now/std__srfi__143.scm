(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/143#fx-width ##fixnum-width)
  (define std/srfi/143#fx-greatest ##max-fixnum)
  (define std/srfi/143#fx-least ##min-fixnum)
  (define std/srfi/143#fxneg (lambda (_x103068_) (fx- _x103068_)))
  (define std/srfi/143#fxsqrt
    (lambda (_x103066_)
      (let () (declare (not safe)) (##integer-sqrt _x103066_))))
  (define std/srfi/143#fxcopy-bit
    (lambda (_index103062_ _to103063_ _bool103064_)
      (if _bool103064_
          (fxior _to103063_ (fxarithmetic-shift-left '1 _index103062_))
          (fxand _to103063_
                 (fxnot (fxarithmetic-shift-left '1 _index103062_))))))
  (define std/srfi/143#fxfirst-set-bit
    (lambda (_i103060_)
      (fx- (fxbit-count (fxxor _i103060_ (fx- _i103060_ '1))) '1)))
  (define std/srfi/143#mask
    (lambda (_start103057_ _end103058_)
      (fxnot (fxarithmetic-shift-left '-1 (fx- _end103058_ _start103057_)))))
  (define std/srfi/143#fxbit-field
    (lambda (_n103053_ _start103054_ _end103055_)
      (fxand (std/srfi/143#mask _start103054_ _end103055_)
             (fxarithmetic-shift _n103053_ (fx- _start103054_)))))
  (define std/srfi/143#fxbit-field-rotate
    (lambda (_n103042_ _count103043_ _start103044_ _end103045_)
      (letrec* ((_width103047_ (fx- _end103045_ _start103044_)))
        (set! _count103043_ (fxmodulo _count103043_ _width103047_))
        (let ((_mask103049_ (fxnot (fxarithmetic-shift '-1 _width103047_))))
          (letrec* ((_zn103051_
                     (fxand _mask103049_
                            (fxarithmetic-shift
                             _n103042_
                             (fx- _start103044_)))))
            (fxior (fxarithmetic-shift
                    (fxior (fxand _mask103049_
                                  (fxarithmetic-shift
                                   _zn103051_
                                   _count103043_))
                           (fxarithmetic-shift
                            _zn103051_
                            (fx- _count103043_ _width103047_)))
                    _start103044_)
                   (fxand (fxnot (fxarithmetic-shift
                                  _mask103049_
                                  _start103044_))
                          _n103042_)))))))
  (define std/srfi/143#fxreverse
    (lambda (_k103032_ _n103033_)
      (let _$loop103035_ ((_m103038_
                           (if (fxnegative? _n103033_)
                               (fxnot _n103033_)
                               _n103033_))
                          (_k103039_ (fx+ '-1 _k103032_))
                          (_rvs103040_ '0))
        (if (fxnegative? _k103039_)
            (if (fxnegative? _n103033_) (fxnot _rvs103040_) _rvs103040_)
            (_$loop103035_
             (fxarithmetic-shift-right _m103038_ '1)
             (fx+ '-1 _k103039_)
             (fxior (fxarithmetic-shift-left _rvs103040_ '1)
                    (fxand '1 _m103038_)))))))
  (define std/srfi/143#fxbit-field-reverse
    (lambda (_n103022_ _start103023_ _end103024_)
      (letrec* ((_width103026_ (fx- _end103024_ _start103023_)))
        (let ((_mask103028_
               (fxnot (fxarithmetic-shift-left '-1 _width103026_))))
          (letrec* ((_zn103030_
                     (fxand _mask103028_
                            (fxarithmetic-shift-right
                             _n103022_
                             _start103023_))))
            (fxior (fxarithmetic-shift-left
                    (std/srfi/143#fxreverse _width103026_ _zn103030_)
                    _start103023_)
                   (fxand (fxnot (fxarithmetic-shift-left
                                  _mask103028_
                                  _start103023_))
                          _n103022_)))))))
  (define std/srfi/143#exp-width (expt '2 std/srfi/143#fx-width))
  (define std/srfi/143#fx+/carry
    (lambda (_i103012_ _j103013_ _k103014_)
      (let* ((_s103016_ (+ _i103012_ _j103013_ _k103014_))
             (_g279235_
              (std/srfi/143#balanced/ _s103016_ std/srfi/143#exp-width)))
        (begin
          (let ((_g279236_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279235_) (##vector-length _g279235_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279236_ 2)))
                (error "Context expects 2 values" _g279236_)))
          (let ((_q103018_
                 (let () (declare (not safe)) (##vector-ref _g279235_ 0)))
                (_r103019_
                 (let () (declare (not safe)) (##vector-ref _g279235_ 1))))
            (let () (values _r103019_ _q103018_)))))))
  (define std/srfi/143#fx-/carry
    (lambda (_i103002_ _j103003_ _k103004_)
      (let* ((_d103006_ (- _i103002_ _j103003_ _k103004_))
             (_g279237_
              (std/srfi/143#balanced/ _d103006_ std/srfi/143#exp-width)))
        (begin
          (let ((_g279238_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279237_) (##vector-length _g279237_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279238_ 2)))
                (error "Context expects 2 values" _g279238_)))
          (let ((_q103008_
                 (let () (declare (not safe)) (##vector-ref _g279237_ 0)))
                (_r103009_
                 (let () (declare (not safe)) (##vector-ref _g279237_ 1))))
            (let () (values _r103009_ _q103008_)))))))
  (define std/srfi/143#fx*/carry
    (lambda (_i102992_ _j102993_ _k102994_)
      (let* ((_s102996_ (+ (* _i102992_ _j102993_) _k102994_))
             (_g279239_
              (std/srfi/143#balanced/ _s102996_ std/srfi/143#exp-width)))
        (begin
          (let ((_g279240_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g279239_) (##vector-length _g279239_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g279240_ 2)))
                (error "Context expects 2 values" _g279240_)))
          (let ((_q102998_
                 (let () (declare (not safe)) (##vector-ref _g279239_ 0)))
                (_r102999_
                 (let () (declare (not safe)) (##vector-ref _g279239_ 1))))
            (let () (values _r102999_ _q102998_)))))))
  (define std/srfi/143#floor-/+
    (lambda (_n102984_ _d102985_)
      (let ((_n102987_ (- '0 _n102984_)))
        (let ((_q102989_ (quotient _n102987_ _d102985_))
              (_r102990_ (remainder _n102987_ _d102985_)))
          (if (zero? _r102990_)
              (values (- '0 _q102989_) _r102990_)
              (values (- (- '0 _q102989_) '1) (- _d102985_ _r102990_)))))))
  (define std/srfi/143#ceiling-/-
    (lambda (_n102975_ _d102976_)
      (let ((_n102978_ (- '0 _n102975_)) (_d102979_ (- '0 _d102976_)))
        (let ((_q102981_ (quotient _n102978_ _d102979_))
              (_r102982_ (remainder _n102978_ _d102979_)))
          (if (zero? _r102982_)
              (values _q102981_ _r102982_)
              (values (+ _q102981_ '1) (- _d102979_ _r102982_)))))))
  (define std/srfi/143#euclidean/
    (lambda (_n102968_ _d102969_)
      (if (and (exact-integer? _n102968_) (exact-integer? _d102969_))
          (if (and (negative? _n102968_) (negative? _d102969_))
              (std/srfi/143#ceiling-/- _n102968_ _d102969_)
              (if (negative? _n102968_)
                  (std/srfi/143#floor-/+ _n102968_ _d102969_)
                  (if (negative? _d102969_)
                      (let ((_d102971_ (- '0 _d102969_)))
                        (values (- '0 (quotient _n102968_ _d102971_))
                                (remainder _n102968_ _d102971_)))
                      (values (quotient _n102968_ _d102969_)
                              (remainder _n102968_ _d102969_)))))
          (let ((_q102973_
                 (if (negative? _d102969_)
                     (ceiling (/ _n102968_ _d102969_))
                     (floor (/ _n102968_ _d102969_)))))
            (values _q102973_ (- _n102968_ (* _d102969_ _q102973_)))))))
  (define std/srfi/143#balanced/
    (lambda (_x102961_ _y102962_)
      (call-with-values
       (lambda () (std/srfi/143#euclidean/ _x102961_ _y102962_))
       (lambda (_q102965_ _r102966_)
         (if (< _r102966_ (abs (/ _y102962_ '2)))
             (values _q102965_ _r102966_)
             (if (> _y102962_ '0)
                 (values (+ _q102965_ '1)
                         (- _x102961_ (* (+ _q102965_ '1) _y102962_)))
                 (values (- _q102965_ '1)
                         (- _x102961_ (* (- _q102965_ '1) _y102962_))))))))))
