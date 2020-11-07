(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/121#any
    (lambda (_pred94456_ _ls94457_)
      (if (null? (cdr _ls94457_))
          (_pred94456_ (car _ls94457_))
          ((lambda (_x94459_)
             (if _x94459_
                 _x94459_
                 (std/srfi/121#any _pred94456_ (cdr _ls94457_))))
           (_pred94456_ (car _ls94457_))))))
  (define std/srfi/121#every
    (lambda (_pred94453_ _ls94454_)
      (if (null? (cdr _ls94454_))
          (_pred94453_ (car _ls94454_))
          (if (_pred94453_ (car _ls94454_))
              (std/srfi/121#every _pred94453_ (cdr _ls94454_))
              '#f))))
  (define std/srfi/121#generator
    (lambda _args94448_
      (lambda ()
        (if (null? _args94448_)
            (eof-object)
            (let ((_next94451_ (car _args94448_)))
              (set! _args94448_ (cdr _args94448_))
              _next94451_)))))
  (define std/srfi/121#make-iota-generator__0
    (lambda (_count94439_) (std/srfi/121#make-iota _count94439_ '0 '1)))
  (define std/srfi/121#make-iota-generator__1
    (lambda (_count94441_ _start94442_)
      (std/srfi/121#make-iota _count94441_ _start94442_ '1)))
  (define std/srfi/121#make-iota-generator
    (lambda _g278783_
      (let ((_g278782_ (let () (declare (not safe)) (##length _g278783_))))
        (cond ((let () (declare (not safe)) (##fx= _g278782_ 1))
               (apply std/srfi/121#make-iota-generator__0 _g278783_))
              ((let () (declare (not safe)) (##fx= _g278782_ 2))
               (apply std/srfi/121#make-iota-generator__1 _g278783_))
              ((let () (declare (not safe)) (##fx= _g278782_ 3))
               (apply std/srfi/121#make-iota _g278783_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#make-iota-generator
                _g278783_))))))
  (define std/srfi/121#make-iota
    (lambda (_count94432_ _start94433_ _step94434_)
      (lambda ()
        (if (<= _count94432_ '0)
            (eof-object)
            (let ((_result94437_ _start94433_))
              (set! _count94432_ (- _count94432_ '1))
              (set! _start94433_ (+ _start94433_ _step94434_))
              _result94437_)))))
  (define std/srfi/121#make-range-generator__0
    (lambda (_start94420_ _end94421_)
      (std/srfi/121#make-range-generator__2 _start94420_ _end94421_ '1)))
  (define std/srfi/121#make-range-generator__2
    (lambda (_start94425_ _end94426_ _step94427_)
      (set! _start94425_ (- (+ _start94425_ _step94427_) _step94427_))
      (lambda ()
        (if (< _start94425_ _end94426_)
            (let ((_v94430_ _start94425_))
              (set! _start94425_ (+ _start94425_ _step94427_))
              _v94430_)
            (eof-object)))))
  (define std/srfi/121#make-range-generator
    (lambda _g278785_
      (let ((_g278784_ (let () (declare (not safe)) (##length _g278785_))))
        (cond ((let () (declare (not safe)) (##fx= _g278784_ 2))
               (apply std/srfi/121#make-range-generator__0 _g278785_))
              ((let () (declare (not safe)) (##fx= _g278784_ 1))
               (apply std/srfi/121#make-infinite-range-generator _g278785_))
              ((let () (declare (not safe)) (##fx= _g278784_ 3))
               (apply std/srfi/121#make-range-generator__2 _g278785_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#make-range-generator
                _g278785_))))))
  (define std/srfi/121#make-infinite-range-generator
    (lambda (_start94415_)
      (lambda ()
        (let ((_result94418_ _start94415_))
          (set! _start94415_ (+ _start94415_ '1))
          _result94418_))))
  (define std/srfi/121#make-coroutine-generator
    (lambda (_proc94400_)
      (letrec* ((_return94402_ '#f)
                (_resume94403_ '#f)
                (_yield94404_
                 (lambda (_v94411_)
                   (call-with-current-continuation
                    (lambda (_r94413_)
                      (set! _resume94403_ _r94413_)
                      (_return94402_ _v94411_))))))
        (lambda ()
          (call-with-current-continuation
           (lambda (_cc94407_)
             (set! _return94402_ _cc94407_)
             (if _resume94403_
                 (_resume94403_ (if '#f '#f '#!void))
                 (begin
                   (_proc94400_ _yield94404_)
                   (set! _resume94403_
                         (lambda (_v94409_) (_return94402_ (eof-object))))
                   (_return94402_ (eof-object))))))))))
  (define std/srfi/121#list->generator
    (lambda (_lst94395_)
      (lambda ()
        (if (null? _lst94395_)
            (eof-object)
            (let ((_next94398_ (car _lst94395_)))
              (set! _lst94395_ (cdr _lst94395_))
              _next94398_)))))
  (define std/srfi/121#vector->generator__0
    (lambda (_vec94383_)
      (std/srfi/121#vector->generator__2
       _vec94383_
       '0
       (vector-length _vec94383_))))
  (define std/srfi/121#vector->generator__1
    (lambda (_vec94385_ _start94386_)
      (std/srfi/121#vector->generator__2
       _vec94385_
       _start94386_
       (vector-length _vec94385_))))
  (define std/srfi/121#vector->generator__2
    (lambda (_vec94388_ _start94389_ _end94390_)
      (lambda ()
        (if (>= _start94389_ _end94390_)
            (eof-object)
            (let ((_next94393_ (vector-ref _vec94388_ _start94389_)))
              (set! _start94389_ (+ _start94389_ '1))
              _next94393_)))))
  (define std/srfi/121#vector->generator
    (lambda _g278787_
      (let ((_g278786_ (let () (declare (not safe)) (##length _g278787_))))
        (cond ((let () (declare (not safe)) (##fx= _g278786_ 1))
               (apply std/srfi/121#vector->generator__0 _g278787_))
              ((let () (declare (not safe)) (##fx= _g278786_ 2))
               (apply std/srfi/121#vector->generator__1 _g278787_))
              ((let () (declare (not safe)) (##fx= _g278786_ 3))
               (apply std/srfi/121#vector->generator__2 _g278787_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#vector->generator
                _g278787_))))))
  (define std/srfi/121#reverse-vector->generator__0
    (lambda (_vec94371_)
      (std/srfi/121#reverse-vector->generator__2
       _vec94371_
       '0
       (vector-length _vec94371_))))
  (define std/srfi/121#reverse-vector->generator__1
    (lambda (_vec94373_ _start94374_)
      (std/srfi/121#reverse-vector->generator__2
       _vec94373_
       _start94374_
       (vector-length _vec94373_))))
  (define std/srfi/121#reverse-vector->generator__2
    (lambda (_vec94376_ _start94377_ _end94378_)
      (lambda ()
        (if (>= _start94377_ _end94378_)
            (eof-object)
            (let ((_next94381_ (vector-ref _vec94376_ (- _end94378_ '1))))
              (set! _end94378_ (- _end94378_ '1))
              _next94381_)))))
  (define std/srfi/121#reverse-vector->generator
    (lambda _g278789_
      (let ((_g278788_ (let () (declare (not safe)) (##length _g278789_))))
        (cond ((let () (declare (not safe)) (##fx= _g278788_ 1))
               (apply std/srfi/121#reverse-vector->generator__0 _g278789_))
              ((let () (declare (not safe)) (##fx= _g278788_ 2))
               (apply std/srfi/121#reverse-vector->generator__1 _g278789_))
              ((let () (declare (not safe)) (##fx= _g278788_ 3))
               (apply std/srfi/121#reverse-vector->generator__2 _g278789_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#reverse-vector->generator
                _g278789_))))))
  (define std/srfi/121#string->generator__0
    (lambda (_str94359_)
      (std/srfi/121#string->generator__2
       _str94359_
       '0
       (string-length _str94359_))))
  (define std/srfi/121#string->generator__1
    (lambda (_str94361_ _start94362_)
      (std/srfi/121#string->generator__2
       _str94361_
       _start94362_
       (string-length _str94361_))))
  (define std/srfi/121#string->generator__2
    (lambda (_str94364_ _start94365_ _end94366_)
      (lambda ()
        (if (>= _start94365_ _end94366_)
            (eof-object)
            (let ((_next94369_ (string-ref _str94364_ _start94365_)))
              (set! _start94365_ (+ _start94365_ '1))
              _next94369_)))))
  (define std/srfi/121#string->generator
    (lambda _g278791_
      (let ((_g278790_ (let () (declare (not safe)) (##length _g278791_))))
        (cond ((let () (declare (not safe)) (##fx= _g278790_ 1))
               (apply std/srfi/121#string->generator__0 _g278791_))
              ((let () (declare (not safe)) (##fx= _g278790_ 2))
               (apply std/srfi/121#string->generator__1 _g278791_))
              ((let () (declare (not safe)) (##fx= _g278790_ 3))
               (apply std/srfi/121#string->generator__2 _g278791_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#string->generator
                _g278791_))))))
  (define std/srfi/121#bytevector->generator__0
    (lambda (_str94347_)
      (std/srfi/121#bytevector->generator__2
       _str94347_
       '0
       (u8vector-length _str94347_))))
  (define std/srfi/121#bytevector->generator__1
    (lambda (_str94349_ _start94350_)
      (std/srfi/121#bytevector->generator__2
       _str94349_
       _start94350_
       (u8vector-length _str94349_))))
  (define std/srfi/121#bytevector->generator__2
    (lambda (_str94352_ _start94353_ _end94354_)
      (lambda ()
        (if (>= _start94353_ _end94354_)
            (eof-object)
            (let ((_next94357_ (u8vector-ref _str94352_ _start94353_)))
              (set! _start94353_ (+ _start94353_ '1))
              _next94357_)))))
  (define std/srfi/121#bytevector->generator
    (lambda _g278793_
      (let ((_g278792_ (let () (declare (not safe)) (##length _g278793_))))
        (cond ((let () (declare (not safe)) (##fx= _g278792_ 1))
               (apply std/srfi/121#bytevector->generator__0 _g278793_))
              ((let () (declare (not safe)) (##fx= _g278792_ 2))
               (apply std/srfi/121#bytevector->generator__1 _g278793_))
              ((let () (declare (not safe)) (##fx= _g278792_ 3))
               (apply std/srfi/121#bytevector->generator__2 _g278793_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#bytevector->generator
                _g278793_))))))
  (define std/srfi/121#make-for-each-generator
    (lambda (_for-each94342_ _obj94343_)
      (std/srfi/121#make-coroutine-generator
       (lambda (_yield94345_) (_for-each94342_ _yield94345_ _obj94343_)))))
  (define std/srfi/121#make-unfold-generator
    (lambda (_stop?94331_ _mapper94332_ _successor94333_ _seed94334_)
      (std/srfi/121#make-coroutine-generator
       (lambda (_yield94336_)
         (let _loop94338_ ((_s94340_ _seed94334_))
           (if (_stop?94331_ _s94340_)
               (if '#f '#f '#!void)
               (begin
                 (_yield94336_ (_mapper94332_ _s94340_))
                 (_loop94338_ (_successor94333_ _s94340_)))))))))
  (define std/srfi/121#gcons*
    (lambda _args94326_
      (lambda ()
        (if (null? _args94326_)
            (eof-object)
            (if (= (length _args94326_) '1)
                ((car _args94326_))
                (let ((_v94329_ (car _args94326_)))
                  (set! _args94326_ (cdr _args94326_))
                  _v94329_))))))
  (define std/srfi/121#gappend
    (lambda _args94319_
      (lambda ()
        (if (null? _args94319_)
            (eof-object)
            (let _loop94322_ ((_v94324_ ((car _args94319_))))
              (if (eof-object? _v94324_)
                  (begin
                    (set! _args94319_ (cdr _args94319_))
                    (if (null? _args94319_)
                        (eof-object)
                        (_loop94322_ ((car _args94319_)))))
                  _v94324_))))))
  (define std/srfi/121#gcombine
    (lambda (_proc94306_ _seed94307_ . _gens94308_)
      (lambda ()
        (letrec* ((_items94311_
                   (map (lambda (_x94317_) (_x94317_)) _gens94308_)))
          (if (std/srfi/121#any eof-object? _items94311_)
              (eof-object)
              (let ()
                (letrec* ((_g278794_
                           (let ((_g278795_
                                  (apply _proc94306_
                                         (append _items94311_
                                                 (list _seed94307_)))))
                             (let ((_g278796_
                                    (let ()
                                      (declare (not safe))
                                      (if (##values? _g278795_)
                                          (##vector-length _g278795_)
                                          1))))
                               (if (not (let ()
                                          (declare (not safe))
                                          (##fx= _g278796_ 2)))
                                   (error "Context expects 2 values"
                                          _g278796_)))
                             _g278795_))
                          (_value94314_
                           (let ()
                             (declare (not safe))
                             (##vector-ref _g278794_ 0)))
                          (_newseed94315_
                           (let ()
                             (declare (not safe))
                             (##vector-ref _g278794_ 1))))
                  (begin (set! _seed94307_ _newseed94315_) _value94314_))))))))
  (define std/srfi/121#gfilter
    (lambda (_pred94294_ _gen94295_)
      (lambda ()
        (let _loop94298_ ()
          (let ((_next94301_ (_gen94295_)))
            (if (or (eof-object? _next94301_) (_pred94294_ _next94301_))
                _next94301_
                (_loop94298_)))))))
  (define std/srfi/121#gremove
    (lambda (_pred94289_ _gen94290_)
      (std/srfi/121#gfilter
       (lambda (_v94292_) (not (_pred94289_ _v94292_)))
       _gen94290_)))
  (define std/srfi/121#gtake__0
    (lambda (_gen94275_ _k94276_)
      (std/srfi/121#gtake__1 _gen94275_ _k94276_ (eof-object))))
  (define std/srfi/121#gtake__1
    (lambda (_gen94278_ _k94279_ _padding94280_)
      (std/srfi/121#make-coroutine-generator
       (lambda (_yield94282_)
         (if (> _k94279_ '0)
             (let _loop94284_ ((_i94286_ '0) (_v94287_ (_gen94278_)))
               (if (eof-object? _v94287_)
                   (_yield94282_ _padding94280_)
                   (_yield94282_ _v94287_))
               (if (< (+ '1 _i94286_) _k94279_)
                   (_loop94284_ (+ '1 _i94286_) (_gen94278_))
                   (eof-object)))
             (eof-object))))))
  (define std/srfi/121#gtake
    (lambda _g278798_
      (let ((_g278797_ (let () (declare (not safe)) (##length _g278798_))))
        (cond ((let () (declare (not safe)) (##fx= _g278797_ 2))
               (apply std/srfi/121#gtake__0 _g278798_))
              ((let () (declare (not safe)) (##fx= _g278797_ 3))
               (apply std/srfi/121#gtake__1 _g278798_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#gtake
                _g278798_))))))
  (define std/srfi/121#gdrop
    (lambda (_gen94267_ _k94268_)
      (lambda ()
        (let _$loop94271_ ()
          (if (<= _k94268_ '0)
              '#!void
              (begin
                (set! _k94268_ (- _k94268_ '1))
                (_gen94267_)
                (_$loop94271_))))
        (_gen94267_))))
  (define std/srfi/121#gdrop-while
    (lambda (_pred94256_ _gen94257_)
      (letrec* ((_found94259_ '#f))
        (lambda ()
          (let _loop94262_ ()
            (let ((_val94265_ (_gen94257_)))
              (if _found94259_
                  _val94265_
                  (if (and (not (eof-object? _val94265_))
                           (_pred94256_ _val94265_))
                      (_loop94262_)
                      (begin (set! _found94259_ '#t) _val94265_)))))))))
  (define std/srfi/121#gtake-while
    (lambda (_pred94250_ _gen94251_)
      (lambda ()
        (let ((_next94254_ (_gen94251_)))
          (if (eof-object? _next94254_)
              _next94254_
              (if (_pred94250_ _next94254_)
                  _next94254_
                  (begin
                    (set! _gen94251_ (std/srfi/121#generator))
                    (_gen94251_))))))))
  (define std/srfi/121#gdelete__0
    (lambda (_item94238_ _gen94239_)
      (std/srfi/121#gdelete__1 _item94238_ _gen94239_ equal?)))
  (define std/srfi/121#gdelete__1
    (lambda (_item94241_ _gen94242_ _==94243_)
      (lambda ()
        (let _loop94246_ ((_v94248_ (_gen94242_)))
          (if (eof-object? _v94248_)
              (eof-object)
              (if (_==94243_ _item94241_ _v94248_)
                  (_loop94246_ (_gen94242_))
                  _v94248_))))))
  (define std/srfi/121#gdelete
    (lambda _g278800_
      (let ((_g278799_ (let () (declare (not safe)) (##length _g278800_))))
        (cond ((let () (declare (not safe)) (##fx= _g278799_ 2))
               (apply std/srfi/121#gdelete__0 _g278800_))
              ((let () (declare (not safe)) (##fx= _g278799_ 3))
               (apply std/srfi/121#gdelete__1 _g278800_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#gdelete
                _g278800_))))))
  (define std/srfi/121#gdelete-neighbor-dups__0
    (lambda (_gen94225_)
      (std/srfi/121#gdelete-neighbor-dups__1 _gen94225_ equal?)))
  (define std/srfi/121#gdelete-neighbor-dups__1
    (lambda (_gen94227_ _==94228_)
      (letrec* ((_firsttime94230_ '#t) (_prev94231_ '#f))
        (lambda ()
          (if _firsttime94230_
              (begin
                (set! _firsttime94230_ '#f)
                (set! _prev94231_ (_gen94227_))
                _prev94231_)
              (let _loop94234_ ((_v94236_ (_gen94227_)))
                (if (eof-object? _v94236_)
                    _v94236_
                    (if (_==94228_ _prev94231_ _v94236_)
                        (_loop94234_ (_gen94227_))
                        (begin (set! _prev94231_ _v94236_) _v94236_)))))))))
  (define std/srfi/121#gdelete-neighbor-dups
    (lambda _g278802_
      (let ((_g278801_ (let () (declare (not safe)) (##length _g278802_))))
        (cond ((let () (declare (not safe)) (##fx= _g278801_ 1))
               (apply std/srfi/121#gdelete-neighbor-dups__0 _g278802_))
              ((let () (declare (not safe)) (##fx= _g278801_ 2))
               (apply std/srfi/121#gdelete-neighbor-dups__1 _g278802_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#gdelete-neighbor-dups
                _g278802_))))))
  (define std/srfi/121#gindex
    (lambda (_value-gen94210_ _index-gen94211_)
      (let ((_done?94213_ '#f) (_count94214_ '0))
        (lambda ()
          (if _done?94213_
              (eof-object)
              (let _loop94217_ ((_value94219_ (_value-gen94210_))
                                (_index94220_ (_index-gen94211_)))
                (if (or (eof-object? _value94219_) (eof-object? _index94220_))
                    (begin (set! _done?94213_ '#t) (eof-object))
                    (if (= _index94220_ _count94214_)
                        (begin
                          (set! _count94214_ (+ _count94214_ '1))
                          _value94219_)
                        (begin
                          (set! _count94214_ (+ _count94214_ '1))
                          (_loop94217_
                           (_value-gen94210_)
                           _index94220_))))))))))
  (define std/srfi/121#gselect
    (lambda (_value-gen94196_ _truth-gen94197_)
      (let ((_done?94199_ '#f))
        (lambda ()
          (if _done?94199_
              (eof-object)
              (let _loop94202_ ((_value94204_ (_value-gen94196_))
                                (_truth94205_ (_truth-gen94197_)))
                (if (or (eof-object? _value94204_) (eof-object? _truth94205_))
                    (begin (set! _done?94199_ '#t) (eof-object))
                    (if _truth94205_
                        _value94204_
                        (_loop94202_
                         (_value-gen94196_)
                         (_truth-gen94197_))))))))))
  (define std/srfi/121#generator->list__0
    (lambda (_gen94191_ _n94192_)
      (std/srfi/121#generator->list__1
       (std/srfi/121#gtake__0 _gen94191_ _n94192_))))
  (define std/srfi/121#generator->list__1
    (lambda (_gen94194_)
      (reverse (std/srfi/121#generator->reverse-list__1 _gen94194_))))
  (define std/srfi/121#generator->list
    (lambda _g278804_
      (let ((_g278803_ (let () (declare (not safe)) (##length _g278804_))))
        (cond ((let () (declare (not safe)) (##fx= _g278803_ 2))
               (apply std/srfi/121#generator->list__0 _g278804_))
              ((let () (declare (not safe)) (##fx= _g278803_ 1))
               (apply std/srfi/121#generator->list__1 _g278804_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#generator->list
                _g278804_))))))
  (define std/srfi/121#generator->reverse-list__0
    (lambda (_gen94186_ _n94187_)
      (std/srfi/121#generator->reverse-list__1
       (std/srfi/121#gtake__0 _gen94186_ _n94187_))))
  (define std/srfi/121#generator->reverse-list__1
    (lambda (_gen94189_) (std/srfi/121#generator-fold cons '() _gen94189_)))
  (define std/srfi/121#generator->reverse-list
    (lambda _g278806_
      (let ((_g278805_ (let () (declare (not safe)) (##length _g278806_))))
        (cond ((let () (declare (not safe)) (##fx= _g278805_ 2))
               (apply std/srfi/121#generator->reverse-list__0 _g278806_))
              ((let () (declare (not safe)) (##fx= _g278805_ 1))
               (apply std/srfi/121#generator->reverse-list__1 _g278806_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#generator->reverse-list
                _g278806_))))))
  (define std/srfi/121#generator->vector__0
    (lambda (_gen94181_)
      (list->vector (std/srfi/121#generator->list__1 _gen94181_))))
  (define std/srfi/121#generator->vector__1
    (lambda (_gen94183_ _n94184_)
      (list->vector (std/srfi/121#generator->list__0 _gen94183_ _n94184_))))
  (define std/srfi/121#generator->vector
    (lambda _g278808_
      (let ((_g278807_ (let () (declare (not safe)) (##length _g278808_))))
        (cond ((let () (declare (not safe)) (##fx= _g278807_ 1))
               (apply std/srfi/121#generator->vector__0 _g278808_))
              ((let () (declare (not safe)) (##fx= _g278807_ 2))
               (apply std/srfi/121#generator->vector__1 _g278808_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#generator->vector
                _g278808_))))))
  (define std/srfi/121#generator->vector!
    (lambda (_vector94171_ _at94172_ _gen94173_)
      (let _loop94175_ ((_value94177_ (_gen94173_))
                        (_count94178_ '0)
                        (_at94179_ _at94172_))
        (if (eof-object? _value94177_)
            _count94178_
            (if (>= _at94179_ (vector-length _vector94171_))
                _count94178_
                (begin
                  (vector-set! _vector94171_ _at94179_ _value94177_)
                  (_loop94175_
                   (_gen94173_)
                   (+ _count94178_ '1)
                   (+ _at94179_ '1))))))))
  (define std/srfi/121#generator->string__0
    (lambda (_gen94166_)
      (list->string (std/srfi/121#generator->list__1 _gen94166_))))
  (define std/srfi/121#generator->string__1
    (lambda (_gen94168_ _n94169_)
      (list->string (std/srfi/121#generator->list__0 _gen94168_ _n94169_))))
  (define std/srfi/121#generator->string
    (lambda _g278810_
      (let ((_g278809_ (let () (declare (not safe)) (##length _g278810_))))
        (cond ((let () (declare (not safe)) (##fx= _g278809_ 1))
               (apply std/srfi/121#generator->string__0 _g278810_))
              ((let () (declare (not safe)) (##fx= _g278809_ 2))
               (apply std/srfi/121#generator->string__1 _g278810_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/121#generator->string
                _g278810_))))))
  (define std/srfi/121#generator-fold
    (lambda (_f94154_ _seed94155_ . _gs94156_)
      (letrec ((_inner-fold94158_
                (lambda (_seed94160_)
                  (let ((_vs94164_
                         (map (lambda (_g94162_) (_g94162_)) _gs94156_)))
                    (if (std/srfi/121#any eof-object? _vs94164_)
                        _seed94160_
                        (_inner-fold94158_
                         (apply _f94154_
                                (append _vs94164_ (list _seed94160_)))))))))
        (_inner-fold94158_ _seed94155_))))
  (define std/srfi/121#generator-for-each
    (lambda (_f94144_ . _gs94145_)
      (let _loop94147_ ()
        (let ((_vs94152_ (map (lambda (_g94150_) (_g94150_)) _gs94145_)))
          (if (std/srfi/121#any eof-object? _vs94152_)
              (if '#f '#f '#!void)
              (begin (apply _f94144_ _vs94152_) (_loop94147_)))))))
  (define std/srfi/121#generator-find
    (lambda (_pred94134_ _g94135_)
      (let _loop94137_ ((_v94139_ (_g94135_)))
        (if (or (_pred94134_ _v94139_) (eof-object? _v94139_))
            _v94139_
            (_loop94137_ (_g94135_))))))
  (define std/srfi/121#generator-count
    (lambda (_pred94128_ _g94129_)
      (std/srfi/121#generator-fold
       (lambda (_v94131_ _n94132_)
         (if (_pred94128_ _v94131_) (+ '1 _n94132_) _n94132_))
       '0
       _g94129_)))
  (define std/srfi/121#generator-any
    (lambda (_pred94121_ _g94122_)
      (let _loop94124_ ((_v94126_ (_g94122_)))
        (if (eof-object? _v94126_)
            '#f
            (if (_pred94121_ _v94126_) '#t (_loop94124_ (_g94122_)))))))
  (define std/srfi/121#generator-every
    (lambda (_pred94114_ _g94115_)
      (let _loop94117_ ((_v94119_ (_g94115_)))
        (if (eof-object? _v94119_)
            '#t
            (if (_pred94114_ _v94119_) (_loop94117_ (_g94115_)) '#f)))))
  (define std/srfi/121#generator-unfold
    (lambda (_g94106_ _unfold94107_ . _args94108_)
      (apply _unfold94107_
             eof-object?
             (lambda (_x94110_) _x94110_)
             (lambda (_x94112_) (_g94106_))
             (_g94106_)
             _args94108_))))
