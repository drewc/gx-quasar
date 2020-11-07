(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/101#kons::t
    (make-struct-type
     'std/srfi/101#kons::t
     '#f
     '3
     'kons
     '()
     '#f
     '(size tree rest)))
  (define std/srfi/101#kons? (make-struct-predicate std/srfi/101#kons::t))
  (define std/srfi/101#make-kons
    (lambda _$args89434_
      (apply make-struct-instance std/srfi/101#kons::t _$args89434_)))
  (define std/srfi/101#kons-size
    (make-struct-field-accessor std/srfi/101#kons::t '0))
  (define std/srfi/101#kons-tree
    (make-struct-field-accessor std/srfi/101#kons::t '1))
  (define std/srfi/101#kons-rest
    (make-struct-field-accessor std/srfi/101#kons::t '2))
  (define std/srfi/101#kons-size-set!
    (make-struct-field-mutator std/srfi/101#kons::t '0))
  (define std/srfi/101#kons-tree-set!
    (make-struct-field-mutator std/srfi/101#kons::t '1))
  (define std/srfi/101#kons-rest-set!
    (make-struct-field-mutator std/srfi/101#kons::t '2))
  (define std/srfi/101#node::t
    (make-struct-type
     'std/srfi/101#node::t
     '#f
     '3
     'node
     '()
     '#f
     '(val left right)))
  (define std/srfi/101#node? (make-struct-predicate std/srfi/101#node::t))
  (define std/srfi/101#make-node
    (lambda _$args89431_
      (apply make-struct-instance std/srfi/101#node::t _$args89431_)))
  (define std/srfi/101#node-val
    (make-struct-field-accessor std/srfi/101#node::t '0))
  (define std/srfi/101#node-left
    (make-struct-field-accessor std/srfi/101#node::t '1))
  (define std/srfi/101#node-right
    (make-struct-field-accessor std/srfi/101#node::t '2))
  (define std/srfi/101#node-val-set!
    (make-struct-field-mutator std/srfi/101#node::t '0))
  (define std/srfi/101#node-left-set!
    (make-struct-field-mutator std/srfi/101#node::t '1))
  (define std/srfi/101#node-right-set!
    (make-struct-field-mutator std/srfi/101#node::t '2))
  (define std/srfi/101#sub1 (lambda (_n89429_) (- _n89429_ '1)))
  (define std/srfi/101#add1 (lambda (_n89427_) (+ _n89427_ '1)))
  (define std/srfi/101#tree-val
    (lambda (_t89425_)
      (if (let ()
            (declare (not safe))
            (##structure-instance-of? _t89425_ 'std/srfi/101#node::t))
          (##structure-ref _t89425_ '1 std/srfi/101#node::t '#f)
          _t89425_)))
  (define std/srfi/101#tree-map
    (lambda (_f89422_ _t89423_)
      (if (let ()
            (declare (not safe))
            (##structure-instance-of? _t89423_ 'std/srfi/101#node::t))
          (let ((__tmp278695
                 (_f89422_
                  (##structure-ref _t89423_ '1 std/srfi/101#node::t '#f)))
                (__tmp278694
                 (std/srfi/101#tree-map
                  _f89422_
                  (##structure-ref _t89423_ '2 std/srfi/101#node::t '#f)))
                (__tmp278693
                 (std/srfi/101#tree-map
                  _f89422_
                  (##structure-ref _t89423_ '3 std/srfi/101#node::t '#f))))
            (declare (not safe))
            (##structure
             std/srfi/101#node::t
             __tmp278695
             __tmp278694
             __tmp278693))
          (_f89422_ _t89423_))))
  (define std/srfi/101#tree-for-each
    (lambda (_f89419_ _t89420_)
      (if (let ()
            (declare (not safe))
            (##structure-instance-of? _t89420_ 'std/srfi/101#node::t))
          (begin
            (_f89419_ (##structure-ref _t89420_ '1 std/srfi/101#node::t '#f))
            (std/srfi/101#tree-for-each
             _f89419_
             (##structure-ref _t89420_ '2 std/srfi/101#node::t '#f))
            (std/srfi/101#tree-for-each
             _f89419_
             (##structure-ref _t89420_ '3 std/srfi/101#node::t '#f)))
          (_f89419_ _t89420_))))
  (define std/srfi/101#tree-map/n
    (lambda (_f89412_ _ts89413_)
      (let _recr89415_ ((_ts89417_ _ts89413_))
        (if (and (pair? _ts89417_)
                 (let ((__tmp278696 (car _ts89417_)))
                   (declare (not safe))
                   (##structure-instance-of?
                    __tmp278696
                    'std/srfi/101#node::t)))
            (let ((__tmp278699
                   (apply _f89412_ (map std/srfi/101#node-val _ts89417_)))
                  (__tmp278698
                   (_recr89415_ (map std/srfi/101#node-left _ts89417_)))
                  (__tmp278697
                   (_recr89415_ (map std/srfi/101#node-right _ts89417_))))
              (declare (not safe))
              (##structure
               std/srfi/101#node::t
               __tmp278699
               __tmp278698
               __tmp278697))
            (apply _f89412_ _ts89417_)))))
  (define std/srfi/101#tree-for-each/n
    (lambda (_f89405_ _ts89406_)
      (let _recr89408_ ((_ts89410_ _ts89406_))
        (if (and (pair? _ts89410_)
                 (let ((__tmp278700 (car _ts89410_)))
                   (declare (not safe))
                   (##structure-instance-of?
                    __tmp278700
                    'std/srfi/101#node::t)))
            (begin
              (apply _f89405_ (map std/srfi/101#node-val _ts89410_))
              (_recr89408_ (map std/srfi/101#node-left _ts89410_))
              (_recr89408_ (map std/srfi/101#node-right _ts89410_)))
            (apply _f89405_ _ts89410_)))))
  (define std/srfi/101#build-tree
    (lambda (_i89395_ _f89396_)
      (let _rec89398_ ((_i89400_ _i89395_) (_o89401_ '0))
        (if (= '1 _i89400_)
            (_f89396_ _o89401_)
            (let ((_i/289403_ (std/srfi/101#half _i89400_)))
              (let ((__tmp278703 (_f89396_ _o89401_))
                    (__tmp278702
                     (_rec89398_ _i/289403_ (std/srfi/101#add1 _o89401_)))
                    (__tmp278701
                     (_rec89398_ _i/289403_ (+ '1 _o89401_ _i/289403_))))
                (declare (not safe))
                (##structure
                 std/srfi/101#node::t
                 __tmp278703
                 __tmp278702
                 __tmp278701)))))))
  (define std/srfi/101#half
    (lambda (_n89393_) (arithmetic-shift _n89393_ '-1)))
  (define std/srfi/101#tr:make-tree
    (lambda (_i89384_ _x89385_)
      (let _recr89387_ ((_i89389_ _i89384_))
        (if (= '1 _i89389_)
            _x89385_
            (let ((_n89391_ (_recr89387_ (std/srfi/101#half _i89389_))))
              (declare (not safe))
              (##structure
               std/srfi/101#node::t
               _x89385_
               _n89391_
               _n89391_))))))
  (define std/srfi/101#tree-ref/update
    (lambda (_mid89373_ _t89374_ _i89375_ _f89376_)
      (if (zero? _i89375_)
          (if (let ()
                (declare (not safe))
                (##structure-instance-of? _t89374_ 'std/srfi/101#node::t))
              (values (##structure-ref _t89374_ '1 std/srfi/101#node::t '#f)
                      (let ((__tmp278706
                             (_f89376_
                              (##structure-ref
                               _t89374_
                               '1
                               std/srfi/101#node::t
                               '#f)))
                            (__tmp278705
                             (##structure-ref
                              _t89374_
                              '2
                              std/srfi/101#node::t
                              '#f))
                            (__tmp278704
                             (##structure-ref
                              _t89374_
                              '3
                              std/srfi/101#node::t
                              '#f)))
                        (declare (not safe))
                        (##structure
                         std/srfi/101#node::t
                         __tmp278706
                         __tmp278705
                         __tmp278704)))
              (values _t89374_ (_f89376_ _t89374_)))
          (if (<= _i89375_ _mid89373_)
              (let ((_g278707_
                     (std/srfi/101#tree-ref/update
                      (std/srfi/101#half (std/srfi/101#sub1 _mid89373_))
                      (##structure-ref _t89374_ '2 std/srfi/101#node::t '#f)
                      (std/srfi/101#sub1 _i89375_)
                      _f89376_)))
                (begin
                  (let ((_g278708_
                         (let ()
                           (declare (not safe))
                           (if (##values? _g278707_)
                               (##vector-length _g278707_)
                               1))))
                    (if (not (let () (declare (not safe)) (##fx= _g278708_ 2)))
                        (error "Context expects 2 values" _g278708_)))
                  (let ((_v*89378_
                         (let ()
                           (declare (not safe))
                           (##vector-ref _g278707_ 0)))
                        (_t*89379_
                         (let ()
                           (declare (not safe))
                           (##vector-ref _g278707_ 1))))
                    (values _v*89378_
                            (let ((__tmp278710
                                   (##structure-ref
                                    _t89374_
                                    '1
                                    std/srfi/101#node::t
                                    '#f))
                                  (__tmp278709
                                   (##structure-ref
                                    _t89374_
                                    '3
                                    std/srfi/101#node::t
                                    '#f)))
                              (declare (not safe))
                              (##structure
                               std/srfi/101#node::t
                               __tmp278710
                               _t*89379_
                               __tmp278709))))))
              (let ((_g278711_
                     (std/srfi/101#tree-ref/update
                      (std/srfi/101#half (std/srfi/101#sub1 _mid89373_))
                      (##structure-ref _t89374_ '3 std/srfi/101#node::t '#f)
                      (std/srfi/101#sub1 (- _i89375_ _mid89373_))
                      _f89376_)))
                (begin
                  (let ((_g278712_
                         (let ()
                           (declare (not safe))
                           (if (##values? _g278711_)
                               (##vector-length _g278711_)
                               1))))
                    (if (not (let () (declare (not safe)) (##fx= _g278712_ 2)))
                        (error "Context expects 2 values" _g278712_)))
                  (let ((_v*89381_
                         (let ()
                           (declare (not safe))
                           (##vector-ref _g278711_ 0)))
                        (_t*89382_
                         (let ()
                           (declare (not safe))
                           (##vector-ref _g278711_ 1))))
                    (values _v*89381_
                            (let ((__tmp278714
                                   (##structure-ref
                                    _t89374_
                                    '1
                                    std/srfi/101#node::t
                                    '#f))
                                  (__tmp278713
                                   (##structure-ref
                                    _t89374_
                                    '2
                                    std/srfi/101#node::t
                                    '#f)))
                              (declare (not safe))
                              (##structure
                               std/srfi/101#node::t
                               __tmp278714
                               __tmp278713
                               _t*89382_))))))))))
  (define std/srfi/101#tree-ref/a
    (lambda (_t89369_ _i89370_ _mid89371_)
      (if (zero? _i89370_)
          (std/srfi/101#tree-val _t89369_)
          (if (<= _i89370_ _mid89371_)
              (std/srfi/101#tree-ref/a
               (##structure-ref _t89369_ '2 std/srfi/101#node::t '#f)
               (std/srfi/101#sub1 _i89370_)
               (std/srfi/101#half (std/srfi/101#sub1 _mid89371_)))
              (std/srfi/101#tree-ref/a
               (##structure-ref _t89369_ '3 std/srfi/101#node::t '#f)
               (std/srfi/101#sub1 (- _i89370_ _mid89371_))
               (std/srfi/101#half (std/srfi/101#sub1 _mid89371_)))))))
  (define std/srfi/101#tree-ref
    (lambda (_size89365_ _t89366_ _i89367_)
      (if (zero? _i89367_)
          (std/srfi/101#tree-val _t89366_)
          (std/srfi/101#tree-ref/a
           _t89366_
           _i89367_
           (std/srfi/101#half (std/srfi/101#sub1 _size89365_))))))
  (define std/srfi/101#tree-update
    (lambda (_size89354_ _t89355_ _i89356_ _f89357_)
      (let _recr89359_ ((_mid89361_
                         (std/srfi/101#half (std/srfi/101#sub1 _size89354_)))
                        (_t89362_ _t89355_)
                        (_i89363_ _i89356_))
        (if (zero? _i89363_)
            (if (let ()
                  (declare (not safe))
                  (##structure-instance-of? _t89362_ 'std/srfi/101#node::t))
                (let ((__tmp278717
                       (_f89357_
                        (##structure-ref
                         _t89362_
                         '1
                         std/srfi/101#node::t
                         '#f)))
                      (__tmp278716
                       (##structure-ref _t89362_ '2 std/srfi/101#node::t '#f))
                      (__tmp278715
                       (##structure-ref _t89362_ '3 std/srfi/101#node::t '#f)))
                  (declare (not safe))
                  (##structure
                   std/srfi/101#node::t
                   __tmp278717
                   __tmp278716
                   __tmp278715))
                (_f89357_ _t89362_))
            (if (<= _i89363_ _mid89361_)
                (let ((__tmp278720
                       (##structure-ref _t89362_ '1 std/srfi/101#node::t '#f))
                      (__tmp278719
                       (_recr89359_
                        (std/srfi/101#half (std/srfi/101#sub1 _mid89361_))
                        (##structure-ref _t89362_ '2 std/srfi/101#node::t '#f)
                        (std/srfi/101#sub1 _i89363_)))
                      (__tmp278718
                       (##structure-ref _t89362_ '3 std/srfi/101#node::t '#f)))
                  (declare (not safe))
                  (##structure
                   std/srfi/101#node::t
                   __tmp278720
                   __tmp278719
                   __tmp278718))
                (let ((__tmp278723
                       (##structure-ref _t89362_ '1 std/srfi/101#node::t '#f))
                      (__tmp278722
                       (##structure-ref _t89362_ '2 std/srfi/101#node::t '#f))
                      (__tmp278721
                       (_recr89359_
                        (std/srfi/101#half (std/srfi/101#sub1 _mid89361_))
                        (##structure-ref _t89362_ '3 std/srfi/101#node::t '#f)
                        (std/srfi/101#sub1 (- _i89363_ _mid89361_)))))
                  (declare (not safe))
                  (##structure
                   std/srfi/101#node::t
                   __tmp278723
                   __tmp278722
                   __tmp278721)))))))
  (define std/srfi/101#ra:null '())
  (define std/srfi/101#ra:pair? std/srfi/101#kons?)
  (define std/srfi/101#ra:null? null?)
  (define std/srfi/101#ra:cons
    (lambda (_x89349_ _ls89350_)
      (if (let ()
            (declare (not safe))
            (##structure-instance-of? _ls89350_ 'std/srfi/101#kons::t))
          (let ((_s89352_
                 (##structure-ref _ls89350_ '1 std/srfi/101#kons::t '#f)))
            (if (and (let ((__tmp278724
                            (##structure-ref
                             _ls89350_
                             '3
                             std/srfi/101#kons::t
                             '#f)))
                       (declare (not safe))
                       (##structure-instance-of?
                        __tmp278724
                        'std/srfi/101#kons::t))
                     (= (##structure-ref
                         (##structure-ref
                          _ls89350_
                          '3
                          std/srfi/101#kons::t
                          '#f)
                         '1
                         std/srfi/101#kons::t
                         '#f)
                        _s89352_))
                (let ((__tmp278729 (+ '1 _s89352_ _s89352_))
                      (__tmp278726
                       (let ((__tmp278728
                              (##structure-ref
                               _ls89350_
                               '2
                               std/srfi/101#kons::t
                               '#f))
                             (__tmp278727
                              (##structure-ref
                               (##structure-ref
                                _ls89350_
                                '3
                                std/srfi/101#kons::t
                                '#f)
                               '2
                               std/srfi/101#kons::t
                               '#f)))
                         (declare (not safe))
                         (##structure
                          std/srfi/101#node::t
                          _x89349_
                          __tmp278728
                          __tmp278727)))
                      (__tmp278725
                       (##structure-ref
                        (##structure-ref _ls89350_ '3 std/srfi/101#kons::t '#f)
                        '3
                        std/srfi/101#kons::t
                        '#f)))
                  (declare (not safe))
                  (##structure
                   std/srfi/101#kons::t
                   __tmp278729
                   __tmp278726
                   __tmp278725))
                (let ()
                  (declare (not safe))
                  (##structure std/srfi/101#kons::t '1 _x89349_ _ls89350_))))
          (let ()
            (declare (not safe))
            (##structure std/srfi/101#kons::t '1 _x89349_ _ls89350_)))))
  (define std/srfi/101#ra:car+cdr
    (lambda (_p89345_)
      (if (let ()
            (declare (not safe))
            (##structure-instance-of? _p89345_ 'std/srfi/101#kons::t))
          '#!void
          (error '"assertion failure" '(kons? p)))
      (if (let ((__tmp278730
                 (##structure-ref _p89345_ '2 std/srfi/101#kons::t '#f)))
            (declare (not safe))
            (##structure-instance-of? __tmp278730 'std/srfi/101#node::t))
          (let ((_s*89347_
                 (std/srfi/101#half
                  (##structure-ref _p89345_ '1 std/srfi/101#kons::t '#f))))
            (values (std/srfi/101#tree-val
                     (##structure-ref _p89345_ '2 std/srfi/101#kons::t '#f))
                    (let ((__tmp278734
                           (##structure-ref
                            (##structure-ref
                             _p89345_
                             '2
                             std/srfi/101#kons::t
                             '#f)
                            '2
                            std/srfi/101#node::t
                            '#f))
                          (__tmp278731
                           (let ((__tmp278733
                                  (##structure-ref
                                   (##structure-ref
                                    _p89345_
                                    '2
                                    std/srfi/101#kons::t
                                    '#f)
                                   '3
                                   std/srfi/101#node::t
                                   '#f))
                                 (__tmp278732
                                  (##structure-ref
                                   _p89345_
                                   '3
                                   std/srfi/101#kons::t
                                   '#f)))
                             (declare (not safe))
                             (##structure
                              std/srfi/101#kons::t
                              _s*89347_
                              __tmp278733
                              __tmp278732))))
                      (declare (not safe))
                      (##structure
                       std/srfi/101#kons::t
                       _s*89347_
                       __tmp278734
                       __tmp278731))))
          (values (##structure-ref _p89345_ '2 std/srfi/101#kons::t '#f)
                  (##structure-ref _p89345_ '3 std/srfi/101#kons::t '#f)))))
  (define std/srfi/101#ra:car
    (lambda (_p89339_)
      (call-with-values
       (lambda () (std/srfi/101#ra:car+cdr _p89339_))
       (lambda (_car89342_ _cdr89343_) _car89342_))))
  (define std/srfi/101#ra:cdr
    (lambda (_p89333_)
      (call-with-values
       (lambda () (std/srfi/101#ra:car+cdr _p89333_))
       (lambda (_car89336_ _cdr89337_) _cdr89337_))))
  (define std/srfi/101#ra:list-ref/update
    (lambda (_ls89318_ _i89319_ _f89320_)
      (let _recr89322_ ((_xs89324_ _ls89318_) (_j89325_ _i89319_))
        (if (< _j89325_
               (##structure-ref _xs89324_ '1 std/srfi/101#kons::t '#f))
            (let ((_g278735_
                   (std/srfi/101#tree-ref/update
                    (std/srfi/101#half
                     (std/srfi/101#sub1
                      (##structure-ref _xs89324_ '1 std/srfi/101#kons::t '#f)))
                    (##structure-ref _xs89324_ '2 std/srfi/101#kons::t '#f)
                    _j89325_
                    _f89320_)))
              (begin
                (let ((_g278736_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g278735_)
                             (##vector-length _g278735_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g278736_ 2)))
                      (error "Context expects 2 values" _g278736_)))
                (let ((_v*89327_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278735_ 0)))
                      (_t*89328_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278735_ 1))))
                  (values _v*89327_
                          (let ((__tmp278738
                                 (##structure-ref
                                  _xs89324_
                                  '1
                                  std/srfi/101#kons::t
                                  '#f))
                                (__tmp278737
                                 (##structure-ref
                                  _xs89324_
                                  '3
                                  std/srfi/101#kons::t
                                  '#f)))
                            (declare (not safe))
                            (##structure
                             std/srfi/101#kons::t
                             __tmp278738
                             _t*89328_
                             __tmp278737))))))
            (let ((_g278739_
                   (_recr89322_
                    (##structure-ref _xs89324_ '3 std/srfi/101#kons::t '#f)
                    (- _j89325_
                       (##structure-ref
                        _xs89324_
                        '1
                        std/srfi/101#kons::t
                        '#f)))))
              (begin
                (let ((_g278740_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g278739_)
                             (##vector-length _g278739_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g278740_ 2)))
                      (error "Context expects 2 values" _g278740_)))
                (let ((_v*89330_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278739_ 0)))
                      (_r*89331_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g278739_ 1))))
                  (values _v*89330_
                          (let ((__tmp278742
                                 (##structure-ref
                                  _xs89324_
                                  '1
                                  std/srfi/101#kons::t
                                  '#f))
                                (__tmp278741
                                 (##structure-ref
                                  _xs89324_
                                  '2
                                  std/srfi/101#kons::t
                                  '#f)))
                            (declare (not safe))
                            (##structure
                             std/srfi/101#kons::t
                             __tmp278742
                             __tmp278741
                             _r*89331_))))))))))
  (define std/srfi/101#ra:list-update
    (lambda (_ls89307_ _i89308_ _f89309_)
      (let _recr89311_ ((_xs89313_ _ls89307_) (_j89314_ _i89308_))
        (let ((_s89316_
               (##structure-ref _xs89313_ '1 std/srfi/101#kons::t '#f)))
          (if (< _j89314_ _s89316_)
              (let ((__tmp278744
                     (std/srfi/101#tree-update
                      _s89316_
                      (##structure-ref _xs89313_ '2 std/srfi/101#kons::t '#f)
                      _j89314_
                      _f89309_))
                    (__tmp278743
                     (##structure-ref _xs89313_ '3 std/srfi/101#kons::t '#f)))
                (declare (not safe))
                (##structure
                 std/srfi/101#kons::t
                 _s89316_
                 __tmp278744
                 __tmp278743))
              (let ((__tmp278746
                     (##structure-ref _xs89313_ '2 std/srfi/101#kons::t '#f))
                    (__tmp278745
                     (_recr89311_
                      (##structure-ref _xs89313_ '3 std/srfi/101#kons::t '#f)
                      (- _j89314_ _s89316_))))
                (declare (not safe))
                (##structure
                 std/srfi/101#kons::t
                 _s89316_
                 __tmp278746
                 __tmp278745)))))))
  (define std/srfi/101#ra:list-ref/set
    (lambda (_ls89302_ _i89303_ _v89304_)
      (std/srfi/101#ra:list-ref/update
       _ls89302_
       _i89303_
       (lambda (_g278747_) _v89304_))))
  (define std/srfi/101#ra:list
    (lambda _xs89300_
      (foldr1 std/srfi/101#ra:cons std/srfi/101#ra:null _xs89300_)))
  (define std/srfi/101#ra:make-list__0
    (lambda (_k89288_) (std/srfi/101#ra:make-list__1 _k89288_ '0)))
  (define std/srfi/101#ra:make-list__1
    (lambda (_k89290_ _obj89291_)
      (let _loop89293_ ((_n89295_ _k89290_) (_a89296_ std/srfi/101#ra:null))
        (if (zero? _n89295_)
            _a89296_
            (let ((_t89298_ (std/srfi/101#largest-skew-binary _n89295_)))
              (_loop89293_
               (- _n89295_ _t89298_)
               (let ((__tmp278748
                      (std/srfi/101#tr:make-tree _t89298_ _obj89291_)))
                 (declare (not safe))
                 (##structure
                  std/srfi/101#kons::t
                  _t89298_
                  __tmp278748
                  _a89296_))))))))
  (define std/srfi/101#ra:make-list
    (lambda _g278750_
      (let ((_g278749_ (let () (declare (not safe)) (##length _g278750_))))
        (cond ((let () (declare (not safe)) (##fx= _g278749_ 1))
               (apply std/srfi/101#ra:make-list__0 _g278750_))
              ((let () (declare (not safe)) (##fx= _g278749_ 2))
               (apply std/srfi/101#ra:make-list__1 _g278750_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/101#ra:make-list
                _g278750_))))))
  (define std/srfi/101#skew-succ
    (lambda (_t89286_) (std/srfi/101#add1 (arithmetic-shift _t89286_ '1))))
  (define std/srfi/101#largest-skew-binary
    (lambda (_n89279_)
      (if (= '1 _n89279_)
          '1
          (let* ((_t89281_
                  (std/srfi/101#largest-skew-binary
                   (std/srfi/101#half _n89279_)))
                 (_s89283_ (std/srfi/101#skew-succ _t89281_)))
            (if (> _s89283_ _n89279_) _t89281_ _s89283_)))))
  (define std/srfi/101#ra:list?
    (lambda (_x89274_)
      (let ((_$e89276_ (std/srfi/101#ra:null? _x89274_)))
        (if _$e89276_
            _$e89276_
            (if (let ()
                  (declare (not safe))
                  (##structure-instance-of? _x89274_ 'std/srfi/101#kons::t))
                (std/srfi/101#ra:list?
                 (##structure-ref _x89274_ '3 std/srfi/101#kons::t '#f))
                '#f)))))
  (define std/srfi/101#ra:caar
    (lambda (_ls89272_) (std/srfi/101#ra:car (std/srfi/101#ra:car _ls89272_))))
  (define std/srfi/101#ra:cadr
    (lambda (_ls89270_) (std/srfi/101#ra:car (std/srfi/101#ra:cdr _ls89270_))))
  (define std/srfi/101#ra:cddr
    (lambda (_ls89268_) (std/srfi/101#ra:cdr (std/srfi/101#ra:cdr _ls89268_))))
  (define std/srfi/101#ra:cdar
    (lambda (_ls89266_) (std/srfi/101#ra:cdr (std/srfi/101#ra:car _ls89266_))))
  (define std/srfi/101#ra:caaar
    (lambda (_ls89264_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:car (std/srfi/101#ra:car _ls89264_)))))
  (define std/srfi/101#ra:caadr
    (lambda (_ls89262_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:car (std/srfi/101#ra:cdr _ls89262_)))))
  (define std/srfi/101#ra:caddr
    (lambda (_ls89260_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:cdr (std/srfi/101#ra:cdr _ls89260_)))))
  (define std/srfi/101#ra:cadar
    (lambda (_ls89258_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:cdr (std/srfi/101#ra:car _ls89258_)))))
  (define std/srfi/101#ra:cdaar
    (lambda (_ls89256_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:car (std/srfi/101#ra:car _ls89256_)))))
  (define std/srfi/101#ra:cdadr
    (lambda (_ls89254_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:car (std/srfi/101#ra:cdr _ls89254_)))))
  (define std/srfi/101#ra:cdddr
    (lambda (_ls89252_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:cdr (std/srfi/101#ra:cdr _ls89252_)))))
  (define std/srfi/101#ra:cddar
    (lambda (_ls89250_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:cdr (std/srfi/101#ra:car _ls89250_)))))
  (define std/srfi/101#ra:caaaar
    (lambda (_ls89248_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:car
        (std/srfi/101#ra:car (std/srfi/101#ra:car _ls89248_))))))
  (define std/srfi/101#ra:caaadr
    (lambda (_ls89246_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:car
        (std/srfi/101#ra:car (std/srfi/101#ra:cdr _ls89246_))))))
  (define std/srfi/101#ra:caaddr
    (lambda (_ls89244_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:car
        (std/srfi/101#ra:cdr (std/srfi/101#ra:cdr _ls89244_))))))
  (define std/srfi/101#ra:caadar
    (lambda (_ls89242_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:car
        (std/srfi/101#ra:cdr (std/srfi/101#ra:car _ls89242_))))))
  (define std/srfi/101#ra:cadaar
    (lambda (_ls89240_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:cdr
        (std/srfi/101#ra:car (std/srfi/101#ra:car _ls89240_))))))
  (define std/srfi/101#ra:cadadr
    (lambda (_ls89238_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:cdr
        (std/srfi/101#ra:car (std/srfi/101#ra:cdr _ls89238_))))))
  (define std/srfi/101#ra:cadddr
    (lambda (_ls89236_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:cdr
        (std/srfi/101#ra:cdr (std/srfi/101#ra:cdr _ls89236_))))))
  (define std/srfi/101#ra:caddar
    (lambda (_ls89234_)
      (std/srfi/101#ra:car
       (std/srfi/101#ra:cdr
        (std/srfi/101#ra:cdr (std/srfi/101#ra:car _ls89234_))))))
  (define std/srfi/101#ra:cdaaar
    (lambda (_ls89232_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:car
        (std/srfi/101#ra:car (std/srfi/101#ra:car _ls89232_))))))
  (define std/srfi/101#ra:cdaadr
    (lambda (_ls89230_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:car
        (std/srfi/101#ra:car (std/srfi/101#ra:cdr _ls89230_))))))
  (define std/srfi/101#ra:cdaddr
    (lambda (_ls89228_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:car
        (std/srfi/101#ra:cdr (std/srfi/101#ra:cdr _ls89228_))))))
  (define std/srfi/101#ra:cdadar
    (lambda (_ls89226_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:car
        (std/srfi/101#ra:cdr (std/srfi/101#ra:car _ls89226_))))))
  (define std/srfi/101#ra:cddaar
    (lambda (_ls89224_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:cdr
        (std/srfi/101#ra:car (std/srfi/101#ra:car _ls89224_))))))
  (define std/srfi/101#ra:cddadr
    (lambda (_ls89222_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:cdr
        (std/srfi/101#ra:car (std/srfi/101#ra:cdr _ls89222_))))))
  (define std/srfi/101#ra:cddddr
    (lambda (_ls89220_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:cdr
        (std/srfi/101#ra:cdr (std/srfi/101#ra:cdr _ls89220_))))))
  (define std/srfi/101#ra:cdddar
    (lambda (_ls89218_)
      (std/srfi/101#ra:cdr
       (std/srfi/101#ra:cdr
        (std/srfi/101#ra:cdr (std/srfi/101#ra:car _ls89218_))))))
  (define std/srfi/101#ra:length
    (lambda (_ls89212_)
      (if (std/srfi/101#ra:list? _ls89212_)
          '#!void
          (error '"assertion failure" '(ra:list? ls)))
      (let _recr89214_ ((_ls89216_ _ls89212_))
        (if (let ()
              (declare (not safe))
              (##structure-instance-of? _ls89216_ 'std/srfi/101#kons::t))
            (+ (##structure-ref _ls89216_ '1 std/srfi/101#kons::t '#f)
               (_recr89214_
                (##structure-ref _ls89216_ '3 std/srfi/101#kons::t '#f)))
            '0))))
  (define std/srfi/101#make-foldl
    (lambda (_empty?89202_ _first89203_ _rest89204_)
      (letrec ((_f89206_
                (lambda (_cons89208_ _empty89209_ _ls89210_)
                  (if (_empty?89202_ _ls89210_)
                      _empty89209_
                      (_f89206_
                       _cons89208_
                       (_cons89208_ (_first89203_ _ls89210_) _empty89209_)
                       (_rest89204_ _ls89210_))))))
        _f89206_)))
  (define std/srfi/101#make-foldr
    (lambda (_empty?89192_ _first89193_ _rest89194_)
      (letrec ((_f89196_
                (lambda (_cons89198_ _empty89199_ _ls89200_)
                  (if (_empty?89192_ _ls89200_)
                      _empty89199_
                      (_cons89198_
                       (_first89193_ _ls89200_)
                       (_f89196_
                        _cons89198_
                        _empty89199_
                        (_rest89194_ _ls89200_)))))))
        _f89196_)))
  (define std/srfi/101#ra:foldl/1
    (std/srfi/101#make-foldl
     std/srfi/101#ra:null?
     std/srfi/101#ra:car
     std/srfi/101#ra:cdr))
  (define std/srfi/101#ra:foldr/1
    (std/srfi/101#make-foldr
     std/srfi/101#ra:null?
     std/srfi/101#ra:car
     std/srfi/101#ra:cdr))
  (define std/srfi/101#ra:append
    (lambda _lss89186_
      (if (null? _lss89186_)
          std/srfi/101#ra:null
          (let _recr89188_ ((_lss89190_ _lss89186_))
            (if (null? (cdr _lss89190_))
                (car _lss89190_)
                (std/srfi/101#ra:foldr/1
                 std/srfi/101#ra:cons
                 (_recr89188_ (cdr _lss89190_))
                 (car _lss89190_)))))))
  (define std/srfi/101#ra:reverse
    (lambda (_ls89184_)
      (std/srfi/101#ra:foldl/1
       std/srfi/101#ra:cons
       std/srfi/101#ra:null
       _ls89184_)))
  (define std/srfi/101#ra:list-tail
    (lambda (_ls89176_ _i89177_)
      (let _loop89179_ ((_xs89181_ _ls89176_) (_j89182_ _i89177_))
        (if (zero? _j89182_)
            _xs89181_
            (_loop89179_
             (std/srfi/101#ra:cdr _xs89181_)
             (std/srfi/101#sub1 _j89182_))))))
  (define std/srfi/101#ra:list-ref
    (lambda (_ls89168_ _i89169_)
      (let _loop89171_ ((_xs89173_ _ls89168_) (_j89174_ _i89169_))
        (if (< _j89174_
               (##structure-ref _xs89173_ '1 std/srfi/101#kons::t '#f))
            (std/srfi/101#tree-ref
             (##structure-ref _xs89173_ '1 std/srfi/101#kons::t '#f)
             (##structure-ref _xs89173_ '2 std/srfi/101#kons::t '#f)
             _j89174_)
            (_loop89171_
             (##structure-ref _xs89173_ '3 std/srfi/101#kons::t '#f)
             (- _j89174_
                (##structure-ref _xs89173_ '1 std/srfi/101#kons::t '#f)))))))
  (define std/srfi/101#ra:list-set
    (lambda (_ls89162_ _i89163_ _v89164_)
      (let ((_g278751_
             (std/srfi/101#ra:list-ref/set _ls89162_ _i89163_ _v89164_)))
        (begin
          (let ((_g278752_
                 (let ()
                   (declare (not safe))
                   (if (##values? _g278751_) (##vector-length _g278751_) 1))))
            (if (not (let () (declare (not safe)) (##fx= _g278752_ 2)))
                (error "Context expects 2 values" _g278752_)))
          (let ((_l*89166_
                 (let () (declare (not safe)) (##vector-ref _g278751_ 1))))
            _l*89166_)))))
  (define std/srfi/101#ra:map__0
    (lambda (_f89148_ _ls89149_)
      (let _recr89151_ ((_ls89153_ _ls89149_))
        (if (let ()
              (declare (not safe))
              (##structure-instance-of? _ls89153_ 'std/srfi/101#kons::t))
            (let ((__tmp278755
                   (##structure-ref _ls89153_ '1 std/srfi/101#kons::t '#f))
                  (__tmp278754
                   (std/srfi/101#tree-map
                    _f89148_
                    (##structure-ref _ls89153_ '2 std/srfi/101#kons::t '#f)))
                  (__tmp278753
                   (_recr89151_
                    (##structure-ref _ls89153_ '3 std/srfi/101#kons::t '#f))))
              (declare (not safe))
              (##structure
               std/srfi/101#kons::t
               __tmp278755
               __tmp278754
               __tmp278753))
            std/srfi/101#ra:null))))
  (define std/srfi/101#ra:map__1
    (lambda (_f89155_ . _lss89156_)
      (let _recr89158_ ((_lss89160_ _lss89156_))
        (if (std/srfi/101#ra:null? (car _lss89160_))
            std/srfi/101#ra:null
            (let ((__tmp278758
                   (##structure-ref
                    (car _lss89160_)
                    '1
                    std/srfi/101#kons::t
                    '#f))
                  (__tmp278757
                   (std/srfi/101#tree-map/n
                    _f89155_
                    (map std/srfi/101#kons-tree _lss89160_)))
                  (__tmp278756
                   (_recr89158_ (map std/srfi/101#kons-rest _lss89160_))))
              (declare (not safe))
              (##structure
               std/srfi/101#kons::t
               __tmp278758
               __tmp278757
               __tmp278756))))))
  (define std/srfi/101#ra:map
    (lambda _g278760_
      (let ((_g278759_ (let () (declare (not safe)) (##length _g278760_))))
        (cond ((let () (declare (not safe)) (##fx= _g278759_ 2))
               (apply std/srfi/101#ra:map__0 _g278760_))
              ((let () (declare (not safe)) (##fx>= _g278759_ 1))
               (apply std/srfi/101#ra:map__1 _g278760_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/101#ra:map
                _g278760_))))))
  (define std/srfi/101#ra:for-each__0
    (lambda (_f89138_ _ls89139_)
      (if (let ()
            (declare (not safe))
            (##structure-instance-of? _ls89139_ 'std/srfi/101#kons::t))
          (begin
            (std/srfi/101#tree-for-each
             _f89138_
             (##structure-ref _ls89139_ '2 std/srfi/101#kons::t '#f))
            (std/srfi/101#ra:for-each__0
             _f89138_
             (##structure-ref _ls89139_ '3 std/srfi/101#kons::t '#f)))
          '#!void)))
  (define std/srfi/101#ra:for-each__1
    (lambda (_f89141_ . _lss89142_)
      (let _recr89144_ ((_lss89146_ _lss89142_))
        (if (let ((__tmp278761 (car _lss89146_)))
              (declare (not safe))
              (##structure-instance-of? __tmp278761 'std/srfi/101#kons::t))
            (begin
              (std/srfi/101#tree-map/n
               _f89141_
               (map std/srfi/101#kons-tree _lss89146_))
              (_recr89144_ (map std/srfi/101#kons-rest _lss89146_)))
            '#!void))))
  (define std/srfi/101#ra:for-each
    (lambda _g278763_
      (let ((_g278762_ (let () (declare (not safe)) (##length _g278763_))))
        (cond ((let () (declare (not safe)) (##fx= _g278762_ 2))
               (apply std/srfi/101#ra:for-each__0 _g278763_))
              ((let () (declare (not safe)) (##fx>= _g278762_ 1))
               (apply std/srfi/101#ra:for-each__1 _g278763_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/101#ra:for-each
                _g278763_))))))
  (define std/srfi/101#ra:random-access-list->linear-access-list
    (lambda (_x89136_) (std/srfi/101#ra:foldr/1 cons '() _x89136_)))
  (define std/srfi/101#ra:linear-access-list->random-access-list
    (lambda (_x89134_) (foldr1 std/srfi/101#ra:cons '() _x89134_)))
  (define std/srfi/101#get-cached
    (let ((_h89118_ (make-table 'test: eq?)))
      (lambda (_x89120_)
        (letrec ((_f89122_
                  (lambda (_x89132_)
                    (if (pair? _x89132_)
                        (std/srfi/101#ra:cons
                         (_f89122_ (car _x89132_))
                         (_f89122_ (cdr _x89132_)))
                        (if (vector? _x89132_)
                            (vector-map _f89122_ _x89132_)
                            _x89132_)))))
          (if (not (or (pair? _x89120_) (vector? _x89120_)))
              _x89120_
              (let ((_$e89127_ (table-ref _h89118_ _x89120_ '#f)))
                (if _$e89127_
                    _$e89127_
                    (let ((_v89130_ (_f89122_ _x89120_)))
                      (table-set! _h89118_ _x89120_ _v89130_)
                      _v89130_)))))))))
