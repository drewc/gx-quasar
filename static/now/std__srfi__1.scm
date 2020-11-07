(declare (block) (standard-bindings) (extended-bindings))
(begin
  (declare (fixnum))
  (define std/srfi/1#srfi-1-map
    (lambda _g272991_
      (let ((_g272990_ (let () (declare (not safe)) (##length _g272991_))))
        (cond ((let () (declare (not safe)) (##fx= _g272990_ 2))
               (apply map _g272991_))
              ((let () (declare (not safe)) (##fx= _g272990_ 3))
               (apply std/srfi/1#map2 _g272991_))
              ((let () (declare (not safe)) (##fx>= _g272990_ 3))
               (apply std/srfi/1#mapN _g272991_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/1#srfi-1-map
                _g272991_))))))
  (define std/srfi/1#map2
    (lambda (_f2875_ _lst12876_ _lst22877_)
      (let _recur2879_ ((_rest12881_ _lst12876_) (_rest22882_ _lst22877_))
        (let ((_rest128832894_ _rest12881_) (_rest228842896_ _rest22882_))
          (let* ((_else28862904_ (lambda () '()))
                 (_K28882912_
                  (lambda (_rest12907_ _x12908_ _rest22909_ _x22910_)
                    (cons (_f2875_ _x12908_ _x22910_)
                          (_recur2879_ _rest12907_ _rest22909_)))))
            (if (let () (declare (not safe)) (##pair? _rest128832894_))
                (let ((_hd28912915_
                       (let () (declare (not safe)) (##car _rest128832894_)))
                      (_tl28922917_
                       (let () (declare (not safe)) (##cdr _rest128832894_))))
                  (let* ((_x12920_ _hd28912915_) (_rest12922_ _tl28922917_))
                    (if (let () (declare (not safe)) (##pair? _rest228842896_))
                        (let ((_hd28892924_
                               (let ()
                                 (declare (not safe))
                                 (##car _rest228842896_)))
                              (_tl28902926_
                               (let ()
                                 (declare (not safe))
                                 (##cdr _rest228842896_))))
                          (let* ((_x22929_ _hd28892924_)
                                 (_rest22931_ _tl28902926_))
                            (_K28882912_
                             _rest12922_
                             _x12920_
                             _rest22931_
                             _x22929_)))
                        (_else28862904_))))
                (_else28862904_)))))))
  (define std/srfi/1#mapN
    (lambda (_f2868_ . _lsts2869_)
      (let _recur2871_ ((_rest2873_ _lsts2869_))
        (if (andmap1 pair? _rest2873_)
            (cons (apply _f2868_ (map car _rest2873_))
                  (_recur2871_ (map cdr _rest2873_)))
            '()))))
  (define std/srfi/1#srfi-1-for-each
    (lambda _g272993_
      (let ((_g272992_ (let () (declare (not safe)) (##length _g272993_))))
        (cond ((let () (declare (not safe)) (##fx= _g272992_ 2))
               (apply for-each _g272993_))
              ((let () (declare (not safe)) (##fx= _g272992_ 3))
               (apply std/srfi/1#for-each2 _g272993_))
              ((let () (declare (not safe)) (##fx>= _g272992_ 3))
               (apply std/srfi/1#for-eachN _g272993_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/1#srfi-1-for-each
                _g272993_))))))
  (define std/srfi/1#for-each2
    (lambda (_f2798_ _lst12799_ _lst22800_)
      (let _lp2802_ ((_rest12804_ _lst12799_) (_rest22805_ _lst22800_))
        (let ((_rest128062817_ _rest12804_) (_rest228072819_ _rest22805_))
          (let* ((_else28092827_ (lambda () '#!void))
                 (_K28112835_
                  (lambda (_rest12830_ _x12831_ _rest22832_ _x22833_)
                    (_f2798_ _x12831_ _x22833_)
                    (_lp2802_ _rest12830_ _rest22832_))))
            (if (let () (declare (not safe)) (##pair? _rest128062817_))
                (let ((_hd28142838_
                       (let () (declare (not safe)) (##car _rest128062817_)))
                      (_tl28152840_
                       (let () (declare (not safe)) (##cdr _rest128062817_))))
                  (let* ((_x12843_ _hd28142838_) (_rest12845_ _tl28152840_))
                    (if (let () (declare (not safe)) (##pair? _rest228072819_))
                        (let ((_hd28122847_
                               (let ()
                                 (declare (not safe))
                                 (##car _rest228072819_)))
                              (_tl28132849_
                               (let ()
                                 (declare (not safe))
                                 (##cdr _rest228072819_))))
                          (let* ((_x22852_ _hd28122847_)
                                 (_rest22854_ _tl28132849_))
                            (_K28112835_
                             _rest12845_
                             _x12843_
                             _rest22854_
                             _x22852_)))
                        '#!void)))
                '#!void))))))
  (define std/srfi/1#for-eachN
    (lambda (_f2791_ . _lsts2792_)
      (let _lp2794_ ((_rest2796_ _lsts2792_))
        (if (andmap1 pair? _rest2796_)
            (begin
              (apply _f2791_ (map car _rest2796_))
              (_lp2794_ (map cdr _rest2796_)))
            '#!void))))
  (define std/srfi/1#srfi-1-assoc__1
    (lambda (_x2785_ _lst2786_ _eqf2787_)
      (find (lambda (_p2789_) (_eqf2787_ (car _p2789_) _x2785_)) _lst2786_)))
  (define std/srfi/1#srfi-1-assoc
    (lambda _g272995_
      (let ((_g272994_ (let () (declare (not safe)) (##length _g272995_))))
        (cond ((let () (declare (not safe)) (##fx= _g272994_ 2))
               (apply assoc _g272995_))
              ((let () (declare (not safe)) (##fx= _g272994_ 3))
               (apply std/srfi/1#srfi-1-assoc__1 _g272995_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/1#srfi-1-assoc
                _g272995_))))))
  (define std/srfi/1#srfi-1-member__1
    (lambda (_x2774_ _lst2775_ _eqf2776_)
      (std/srfi/1#find-tail
       (lambda (_g27772779_) (_eqf2776_ _g27772779_ _x2774_))
       _lst2775_)))
  (define std/srfi/1#srfi-1-member
    (lambda _g272997_
      (let ((_g272996_ (let () (declare (not safe)) (##length _g272997_))))
        (cond ((let () (declare (not safe)) (##fx= _g272996_ 2))
               (apply member _g272997_))
              ((let () (declare (not safe)) (##fx= _g272996_ 3))
               (apply std/srfi/1#srfi-1-member__1 _g272997_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/1#srfi-1-member
                _g272997_))))))
  (define std/srfi/1#xcons (lambda (_d2768_ _a2769_) (cons _a2769_ _d2768_)))
  (define std/srfi/1#tree-copy
    (lambda (_x2762_)
      (let _recur2764_ ((_x2766_ _x2762_))
        (if (not (pair? _x2766_))
            _x2766_
            (cons (_recur2764_ (car _x2766_)) (_recur2764_ (cdr _x2766_)))))))
  (define std/srfi/1#list-tabulate
    (lambda (_len2751_ _proc2752_)
      (if ((lambda (_n2754_) (and (integer? _n2754_) (>= _n2754_ '0)))
           _len2751_)
          _len2751_
          (error '"Bad argument"
                 _len2751_
                 '(lambda (n) (and (integer? n) (>= n 0)))
                 'list-tabulate))
      (if (procedure? _proc2752_)
          _proc2752_
          (error '"Bad argument" _proc2752_ 'procedure? 'list-tabulate))
      (let _$loop2756_ ((_i2759_ (- _len2751_ '1)) (_ans2760_ '()))
        (if (< _i2759_ '0)
            _ans2760_
            (_$loop2756_
             (- _i2759_ '1)
             (cons (_proc2752_ _i2759_) _ans2760_))))))
  (define std/srfi/1#list-copy
    (lambda (_lis2745_)
      (let _recur2747_ ((_lis2749_ _lis2745_))
        (if (pair? _lis2749_)
            (cons (car _lis2749_) (_recur2747_ (cdr _lis2749_)))
            _lis2749_))))
  (define std/srfi/1#circular-list
    (lambda (_val12740_ . _vals2741_)
      (let ((_ans2743_ (cons _val12740_ _vals2741_)))
        (set-cdr! (last-pair _ans2743_) _ans2743_)
        _ans2743_)))
  (define std/srfi/1#proper-list?
    (lambda (_x2728_)
      (let _lp2730_ ((_x2732_ _x2728_) (_lag2733_ _x2728_))
        (if (pair? _x2732_)
            (let ((_x2735_ (cdr _x2732_)))
              (if (pair? _x2735_)
                  (let ((_x2737_ (cdr _x2735_)) (_lag2738_ (cdr _lag2733_)))
                    (if (not (eq? _x2737_ _lag2738_))
                        (_lp2730_ _x2737_ _lag2738_)
                        '#f))
                  (null? _x2735_)))
            (null? _x2732_)))))
  (define std/srfi/1#dotted-list?
    (lambda (_x2716_)
      (let _lp2718_ ((_x2720_ _x2716_) (_lag2721_ _x2716_))
        (if (pair? _x2720_)
            (let ((_x2723_ (cdr _x2720_)))
              (if (pair? _x2723_)
                  (let ((_x2725_ (cdr _x2723_)) (_lag2726_ (cdr _lag2721_)))
                    (if (not (eq? _x2725_ _lag2726_))
                        (_lp2718_ _x2725_ _lag2726_)
                        '#f))
                  (not (null? _x2723_))))
            (not (null? _x2720_))))))
  (define std/srfi/1#circular-list?
    (lambda (_x2701_)
      (let _lp2703_ ((_x2705_ _x2701_) (_lag2706_ _x2701_))
        (if (pair? _x2705_)
            (let ((_x2708_ (cdr _x2705_)))
              (if (pair? _x2708_)
                  (let ((_x2710_ (cdr _x2708_)) (_lag2711_ (cdr _lag2706_)))
                    (let ((_$e2713_ (eq? _x2710_ _lag2711_)))
                      (if _$e2713_ _$e2713_ (_lp2703_ _x2710_ _lag2711_))))
                  '#f))
            '#f))))
  (define std/srfi/1#not-pair? (lambda (_x2699_) (not (pair? _x2699_))))
  (define std/srfi/1#null-list?
    (lambda (_l2697_)
      (if (pair? _l2697_)
          '#f
          (if (null? _l2697_)
              '#t
              (error '"null-list?: argument out of domain" _l2697_)))))
  (define std/srfi/1#list=
    (lambda (_=2675_ . _lists2676_)
      (let ((_$e2678_ (null? _lists2676_)))
        (if _$e2678_
            _$e2678_
            (let _lp12681_ ((_list-a2683_ (car _lists2676_))
                            (_others2684_ (cdr _lists2676_)))
              (let ((_$e2686_ (null? _others2684_)))
                (if _$e2686_
                    _$e2686_
                    (let ((_list-b2689_ (car _others2684_))
                          (_others2690_ (cdr _others2684_)))
                      (if (eq? _list-a2683_ _list-b2689_)
                          (_lp12681_ _list-b2689_ _others2690_)
                          (let _lp22692_ ((_list-a2694_ _list-a2683_)
                                          (_list-b2695_ _list-b2689_))
                            (if (std/srfi/1#null-list? _list-a2694_)
                                (if (std/srfi/1#null-list? _list-b2695_)
                                    (_lp12681_ _list-b2695_ _others2690_)
                                    '#f)
                                (if (not (std/srfi/1#null-list? _list-b2695_))
                                    (if (_=2675_ (car _list-a2694_)
                                                 (car _list-b2695_))
                                        (_lp22692_
                                         (cdr _list-a2694_)
                                         (cdr _list-b2695_))
                                        '#f)
                                    '#f))))))))))))
  (define std/srfi/1#length+
    (lambda (_x2660_)
      (let _lp2662_ ((_x2664_ _x2660_) (_lag2665_ _x2660_) (_len2666_ '0))
        (if (pair? _x2664_)
            (let ((_x2668_ (cdr _x2664_)) (_len2669_ (+ _len2666_ '1)))
              (if (pair? _x2668_)
                  (let ((_x2671_ (cdr _x2668_))
                        (_lag2672_ (cdr _lag2665_))
                        (_len2673_ (+ _len2669_ '1)))
                    (if (not (eq? _x2671_ _lag2672_))
                        (_lp2662_ _x2671_ _lag2672_ _len2673_)
                        '#f))
                  _len2669_))
            _len2666_))))
  (define std/srfi/1#zip
    (lambda (_list12657_ . _more-lists2658_)
      (apply map list _list12657_ _more-lists2658_)))
  (define std/srfi/1#first car)
  (define std/srfi/1#second cadr)
  (define std/srfi/1#third caddr)
  (define std/srfi/1#fourth cadddr)
  (define std/srfi/1#fifth (lambda (_x2655_) (car (cddddr _x2655_))))
  (define std/srfi/1#sixth (lambda (_x2653_) (cadr (cddddr _x2653_))))
  (define std/srfi/1#seventh (lambda (_x2651_) (caddr (cddddr _x2651_))))
  (define std/srfi/1#eighth (lambda (_x2649_) (cadddr (cddddr _x2649_))))
  (define std/srfi/1#ninth (lambda (_x2647_) (car (cddddr (cddddr _x2647_)))))
  (define std/srfi/1#tenth (lambda (_x2645_) (cadr (cddddr (cddddr _x2645_)))))
  (define std/srfi/1#car+cdr
    (lambda (_pair2643_) (values (car _pair2643_) (cdr _pair2643_))))
  (define std/srfi/1#take
    (lambda (_lis2635_ _k2636_)
      (if (integer? _k2636_)
          _k2636_
          (error '"Bad argument" _k2636_ 'integer? 'take))
      (let _recur2638_ ((_lis2640_ _lis2635_) (_k2641_ _k2636_))
        (if (zero? _k2641_)
            '()
            (cons (car _lis2640_)
                  (_recur2638_ (cdr _lis2640_) (- _k2641_ '1)))))))
  (define std/srfi/1#drop
    (lambda (_lis2627_ _k2628_)
      (if (integer? _k2628_)
          _k2628_
          (error '"Bad argument" _k2628_ 'integer? 'drop))
      (let _iter2630_ ((_lis2632_ _lis2627_) (_k2633_ _k2628_))
        (if (zero? _k2633_)
            _lis2632_
            (_iter2630_ (cdr _lis2632_) (- _k2633_ '1))))))
  (define std/srfi/1#take!
    (lambda (_lis2624_ _k2625_)
      (if (integer? _k2625_)
          _k2625_
          (error '"Bad argument" _k2625_ 'integer? 'take!))
      (if (zero? _k2625_)
          '()
          (begin
            (set-cdr! (std/srfi/1#drop _lis2624_ (- _k2625_ '1)) '())
            _lis2624_))))
  (define std/srfi/1#take-right
    (lambda (_lis2616_ _k2617_)
      (if (integer? _k2617_)
          _k2617_
          (error '"Bad argument" _k2617_ 'integer? 'take-right))
      (let _lp2619_ ((_lag2621_ _lis2616_)
                     (_lead2622_ (std/srfi/1#drop _lis2616_ _k2617_)))
        (if (pair? _lead2622_)
            (_lp2619_ (cdr _lag2621_) (cdr _lead2622_))
            _lag2621_))))
  (define std/srfi/1#drop-right
    (lambda (_lis2608_ _k2609_)
      (if (integer? _k2609_)
          _k2609_
          (error '"Bad argument" _k2609_ 'integer? 'drop-right))
      (let _recur2611_ ((_lag2613_ _lis2608_)
                        (_lead2614_ (std/srfi/1#drop _lis2608_ _k2609_)))
        (if (pair? _lead2614_)
            (cons (car _lag2613_)
                  (_recur2611_ (cdr _lag2613_) (cdr _lead2614_)))
            '()))))
  (define std/srfi/1#drop-right!
    (lambda (_lis2598_ _k2599_)
      (if (integer? _k2599_)
          _k2599_
          (error '"Bad argument" _k2599_ 'integer? 'drop-right!))
      (let ((_lead2601_ (std/srfi/1#drop _lis2598_ _k2599_)))
        (if (pair? _lead2601_)
            (let _lp2603_ ((_lag2605_ _lis2598_) (_lead2606_ (cdr _lead2601_)))
              (if (pair? _lead2606_)
                  (_lp2603_ (cdr _lag2605_) (cdr _lead2606_))
                  (begin (set-cdr! _lag2605_ '()) _lis2598_)))
            '()))))
  (define std/srfi/1#split-at
    (lambda (_x2587_ _k2588_)
      (if (integer? _k2588_)
          _k2588_
          (error '"Bad argument" _k2588_ 'integer? 'split-at))
      (let _recur2590_ ((_lis2592_ _x2587_) (_k2593_ _k2588_))
        (if (zero? _k2593_)
            (values '() _lis2592_)
            (let ((_g272998_ (_recur2590_ (cdr _lis2592_) (- _k2593_ '1))))
              (begin
                (let ((_g272999_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g272998_)
                             (##vector-length _g272998_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g272999_ 2)))
                      (error "Context expects 2 values" _g272999_)))
                (let ((_prefix2595_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g272998_ 0)))
                      (_suffix2596_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g272998_ 1))))
                  (values (cons (car _lis2592_) _prefix2595_)
                          _suffix2596_))))))))
  (define std/srfi/1#split-at!
    (lambda (_x2579_ _k2580_)
      (if (integer? _k2580_)
          _k2580_
          (error '"Bad argument" _k2580_ 'integer? 'split-at!))
      (if (zero? _k2580_)
          (values '() _x2579_)
          (let* ((_prev2582_ (std/srfi/1#drop _x2579_ (- _k2580_ '1)))
                 (_suffix2584_ (cdr _prev2582_)))
            (set-cdr! _prev2582_ '())
            (values _x2579_ _suffix2584_)))))
  (define std/srfi/1#unzip1 (lambda (_lis2577_) (map car _lis2577_)))
  (define std/srfi/1#unzip2
    (lambda (_lis2566_)
      (let _recur2568_ ((_lis2570_ _lis2566_))
        (if (std/srfi/1#null-list? _lis2570_)
            (values _lis2570_ _lis2570_)
            (let* ((_elt2572_ (car _lis2570_))
                   (_g273000_ (_recur2568_ (cdr _lis2570_))))
              (begin
                (let ((_g273001_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g273000_)
                             (##vector-length _g273000_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g273001_ 2)))
                      (error "Context expects 2 values" _g273001_)))
                (let ((_a2574_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273000_ 0)))
                      (_b2575_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273000_ 1))))
                  (values (cons (car _elt2572_) _a2574_)
                          (cons (cadr _elt2572_) _b2575_)))))))))
  (define std/srfi/1#unzip3
    (lambda (_lis2554_)
      (let _recur2556_ ((_lis2558_ _lis2554_))
        (if (std/srfi/1#null-list? _lis2558_)
            (values _lis2558_ _lis2558_ _lis2558_)
            (let* ((_elt2560_ (car _lis2558_))
                   (_g273002_ (_recur2556_ (cdr _lis2558_))))
              (begin
                (let ((_g273003_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g273002_)
                             (##vector-length _g273002_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g273003_ 3)))
                      (error "Context expects 3 values" _g273003_)))
                (let ((_a2562_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273002_ 0)))
                      (_b2563_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273002_ 1)))
                      (_c2564_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273002_ 2))))
                  (values (cons (car _elt2560_) _a2562_)
                          (cons (cadr _elt2560_) _b2563_)
                          (cons (caddr _elt2560_) _c2564_)))))))))
  (define std/srfi/1#unzip4
    (lambda (_lis2541_)
      (let _recur2543_ ((_lis2545_ _lis2541_))
        (if (std/srfi/1#null-list? _lis2545_)
            (values _lis2545_ _lis2545_ _lis2545_ _lis2545_)
            (let* ((_elt2547_ (car _lis2545_))
                   (_g273004_ (_recur2543_ (cdr _lis2545_))))
              (begin
                (let ((_g273005_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g273004_)
                             (##vector-length _g273004_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g273005_ 4)))
                      (error "Context expects 4 values" _g273005_)))
                (let ((_a2549_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273004_ 0)))
                      (_b2550_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273004_ 1)))
                      (_c2551_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273004_ 2)))
                      (_d2552_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273004_ 3))))
                  (values (cons (car _elt2547_) _a2549_)
                          (cons (cadr _elt2547_) _b2550_)
                          (cons (caddr _elt2547_) _c2551_)
                          (cons (cadddr _elt2547_) _d2552_)))))))))
  (define std/srfi/1#unzip5
    (lambda (_lis2527_)
      (let _recur2529_ ((_lis2531_ _lis2527_))
        (if (std/srfi/1#null-list? _lis2531_)
            (values _lis2531_ _lis2531_ _lis2531_ _lis2531_ _lis2531_)
            (let* ((_elt2533_ (car _lis2531_))
                   (_g273006_ (_recur2529_ (cdr _lis2531_))))
              (begin
                (let ((_g273007_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g273006_)
                             (##vector-length _g273006_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g273007_ 5)))
                      (error "Context expects 5 values" _g273007_)))
                (let ((_a2535_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273006_ 0)))
                      (_b2536_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273006_ 1)))
                      (_c2537_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273006_ 2)))
                      (_d2538_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273006_ 3)))
                      (_e2539_ (let ()
                                 (declare (not safe))
                                 (##vector-ref _g273006_ 4))))
                  (values (cons (car _elt2533_) _a2535_)
                          (cons (cadr _elt2533_) _b2536_)
                          (cons (caddr _elt2533_) _c2537_)
                          (cons (cadddr _elt2533_) _d2538_)
                          (cons (car (cddddr _elt2533_)) _e2539_)))))))))
  (define std/srfi/1#append!
    (lambda _lists2509_
      (let _lp2511_ ((_lists2513_ _lists2509_) (_prev2514_ '()))
        (if (not (pair? _lists2513_))
            _prev2514_
            (let ((_first2516_ (car _lists2513_))
                  (_rest2517_ (cdr _lists2513_)))
              (if (not (pair? _first2516_))
                  (_lp2511_ _rest2517_ _first2516_)
                  (let _lp22519_ ((_tail-cons2521_ (last-pair _first2516_))
                                  (_rest2522_ _rest2517_))
                    (if (pair? _rest2522_)
                        (let ((_next2524_ (car _rest2522_))
                              (_rest2525_ (cdr _rest2522_)))
                          (set-cdr! _tail-cons2521_ _next2524_)
                          (_lp22519_
                           (if (pair? _next2524_)
                               (last-pair _next2524_)
                               _tail-cons2521_)
                           _rest2525_))
                        _first2516_))))))))
  (define std/srfi/1#append-reverse
    (lambda (_rev-head2501_ _tail2502_)
      (let _lp2504_ ((_rev-head2506_ _rev-head2501_) (_tail2507_ _tail2502_))
        (if (std/srfi/1#null-list? _rev-head2506_)
            _tail2507_
            (_lp2504_
             (cdr _rev-head2506_)
             (cons (car _rev-head2506_) _tail2507_))))))
  (define std/srfi/1#append-reverse!
    (lambda (_rev-head2491_ _tail2492_)
      (let _lp2494_ ((_rev-head2496_ _rev-head2491_) (_tail2497_ _tail2492_))
        (if (std/srfi/1#null-list? _rev-head2496_)
            _tail2497_
            (let ((_next-rev2499_ (cdr _rev-head2496_)))
              (set-cdr! _rev-head2496_ _tail2497_)
              (_lp2494_ _next-rev2499_ _rev-head2496_))))))
  (define std/srfi/1#concatenate
    (lambda (_lists2489_) (std/srfi/1#reduce-right append '() _lists2489_)))
  (define std/srfi/1#concatenate!
    (lambda (_lists2487_)
      (std/srfi/1#reduce-right std/srfi/1#append! '() _lists2487_)))
  (define std/srfi/1#%cdrs
    (lambda (_lists2477_)
      (call-with-current-continuation
       (lambda (_abort2479_)
         (let _recur2481_ ((_lists2483_ _lists2477_))
           (if (pair? _lists2483_)
               (let ((_lis2485_ (car _lists2483_)))
                 (if (std/srfi/1#null-list? _lis2485_)
                     (_abort2479_ '())
                     (cons (cdr _lis2485_) (_recur2481_ (cdr _lists2483_)))))
               '()))))))
  (define std/srfi/1#%cars+
    (lambda (_lists2470_ _last-elt2471_)
      (let _recur2473_ ((_lists2475_ _lists2470_))
        (if (pair? _lists2475_)
            (cons (caar _lists2475_) (_recur2473_ (cdr _lists2475_)))
            (list _last-elt2471_)))))
  (define std/srfi/1#%cars+cdrs
    (lambda (_lists2453_)
      (call-with-current-continuation
       (lambda (_abort2455_)
         (let _recur2457_ ((_lists2459_ _lists2453_))
           (if (pair? _lists2459_)
               (let ((_g273008_ (std/srfi/1#car+cdr _lists2459_)))
                 (begin
                   (let ((_g273009_
                          (let ()
                            (declare (not safe))
                            (if (##values? _g273008_)
                                (##vector-length _g273008_)
                                1))))
                     (if (not (let ()
                                (declare (not safe))
                                (##fx= _g273009_ 2)))
                         (error "Context expects 2 values" _g273009_)))
                   (let ((_list2461_
                          (let ()
                            (declare (not safe))
                            (##vector-ref _g273008_ 0)))
                         (_other-lists2462_
                          (let ()
                            (declare (not safe))
                            (##vector-ref _g273008_ 1))))
                     (if (std/srfi/1#null-list? _list2461_)
                         (_abort2455_ '() '())
                         (let ((_g273010_ (std/srfi/1#car+cdr _list2461_)))
                           (begin
                             (let ((_g273011_
                                    (let ()
                                      (declare (not safe))
                                      (if (##values? _g273010_)
                                          (##vector-length _g273010_)
                                          1))))
                               (if (not (let ()
                                          (declare (not safe))
                                          (##fx= _g273011_ 2)))
                                   (error "Context expects 2 values"
                                          _g273011_)))
                             (let ((_a2464_ (let ()
                                              (declare (not safe))
                                              (##vector-ref _g273010_ 0)))
                                   (_d2465_ (let ()
                                              (declare (not safe))
                                              (##vector-ref _g273010_ 1))))
                               (let ((_g273012_
                                      (_recur2457_ _other-lists2462_)))
                                 (begin
                                   (let ((_g273013_
                                          (let ()
                                            (declare (not safe))
                                            (if (##values? _g273012_)
                                                (##vector-length _g273012_)
                                                1))))
                                     (if (not (let ()
                                                (declare (not safe))
                                                (##fx= _g273013_ 2)))
                                         (error "Context expects 2 values"
                                                _g273013_)))
                                   (let ((_cars2467_
                                          (let ()
                                            (declare (not safe))
                                            (##vector-ref _g273012_ 0)))
                                         (_cdrs2468_
                                          (let ()
                                            (declare (not safe))
                                            (##vector-ref _g273012_ 1))))
                                     (values (cons _a2464_ _cars2467_)
                                             (cons _d2465_
                                                   _cdrs2468_))))))))))))
               (values '() '())))))))
  (define std/srfi/1#%cars+cdrs+
    (lambda (_lists2435_ _cars-final2436_)
      (call-with-current-continuation
       (lambda (_abort2438_)
         (let _recur2440_ ((_lists2442_ _lists2435_))
           (if (pair? _lists2442_)
               (let ((_g273014_ (std/srfi/1#car+cdr _lists2442_)))
                 (begin
                   (let ((_g273015_
                          (let ()
                            (declare (not safe))
                            (if (##values? _g273014_)
                                (##vector-length _g273014_)
                                1))))
                     (if (not (let ()
                                (declare (not safe))
                                (##fx= _g273015_ 2)))
                         (error "Context expects 2 values" _g273015_)))
                   (let ((_list2444_
                          (let ()
                            (declare (not safe))
                            (##vector-ref _g273014_ 0)))
                         (_other-lists2445_
                          (let ()
                            (declare (not safe))
                            (##vector-ref _g273014_ 1))))
                     (if (std/srfi/1#null-list? _list2444_)
                         (_abort2438_ '() '())
                         (let ((_g273016_ (std/srfi/1#car+cdr _list2444_)))
                           (begin
                             (let ((_g273017_
                                    (let ()
                                      (declare (not safe))
                                      (if (##values? _g273016_)
                                          (##vector-length _g273016_)
                                          1))))
                               (if (not (let ()
                                          (declare (not safe))
                                          (##fx= _g273017_ 2)))
                                   (error "Context expects 2 values"
                                          _g273017_)))
                             (let ((_a2447_ (let ()
                                              (declare (not safe))
                                              (##vector-ref _g273016_ 0)))
                                   (_d2448_ (let ()
                                              (declare (not safe))
                                              (##vector-ref _g273016_ 1))))
                               (let ((_g273018_
                                      (_recur2440_ _other-lists2445_)))
                                 (begin
                                   (let ((_g273019_
                                          (let ()
                                            (declare (not safe))
                                            (if (##values? _g273018_)
                                                (##vector-length _g273018_)
                                                1))))
                                     (if (not (let ()
                                                (declare (not safe))
                                                (##fx= _g273019_ 2)))
                                         (error "Context expects 2 values"
                                                _g273019_)))
                                   (let ((_cars2450_
                                          (let ()
                                            (declare (not safe))
                                            (##vector-ref _g273018_ 0)))
                                         (_cdrs2451_
                                          (let ()
                                            (declare (not safe))
                                            (##vector-ref _g273018_ 1))))
                                     (values (cons _a2447_ _cars2450_)
                                             (cons _d2448_
                                                   _cdrs2451_))))))))))))
               (values (list _cars-final2436_) '())))))))
  (define std/srfi/1#%cars+cdrs/no-test
    (lambda (_lists2420_)
      (let _recur2422_ ((_lists2424_ _lists2420_))
        (if (pair? _lists2424_)
            (let ((_g273020_ (std/srfi/1#car+cdr _lists2424_)))
              (begin
                (let ((_g273021_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g273020_)
                             (##vector-length _g273020_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g273021_ 2)))
                      (error "Context expects 2 values" _g273021_)))
                (let ((_list2426_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g273020_ 0)))
                      (_other-lists2427_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g273020_ 1))))
                  (let ((_g273022_ (std/srfi/1#car+cdr _list2426_)))
                    (begin
                      (let ((_g273023_
                             (let ()
                               (declare (not safe))
                               (if (##values? _g273022_)
                                   (##vector-length _g273022_)
                                   1))))
                        (if (not (let ()
                                   (declare (not safe))
                                   (##fx= _g273023_ 2)))
                            (error "Context expects 2 values" _g273023_)))
                      (let ((_a2429_ (let ()
                                       (declare (not safe))
                                       (##vector-ref _g273022_ 0)))
                            (_d2430_ (let ()
                                       (declare (not safe))
                                       (##vector-ref _g273022_ 1))))
                        (let ((_g273024_ (_recur2422_ _other-lists2427_)))
                          (begin
                            (let ((_g273025_
                                   (let ()
                                     (declare (not safe))
                                     (if (##values? _g273024_)
                                         (##vector-length _g273024_)
                                         1))))
                              (if (not (let ()
                                         (declare (not safe))
                                         (##fx= _g273025_ 2)))
                                  (error "Context expects 2 values"
                                         _g273025_)))
                            (let ((_cars2432_
                                   (let ()
                                     (declare (not safe))
                                     (##vector-ref _g273024_ 0)))
                                  (_cdrs2433_
                                   (let ()
                                     (declare (not safe))
                                     (##vector-ref _g273024_ 1))))
                              (values (cons _a2429_ _cars2432_)
                                      (cons _d2430_ _cdrs2433_)))))))))))
            (values '() '())))))
  (define std/srfi/1#count
    (lambda (_pred2402_ _list12403_ . _lists2404_)
      (if (procedure? _pred2402_)
          _pred2402_
          (error '"Bad argument" _pred2402_ 'procedure? 'count))
      (if (pair? _lists2404_)
          (let _lp2406_ ((_list12408_ _list12403_)
                         (_lists2409_ _lists2404_)
                         (_i2410_ '0))
            (if (std/srfi/1#null-list? _list12408_)
                _i2410_
                (let ((_g273026_ (std/srfi/1#%cars+cdrs _lists2409_)))
                  (begin
                    (let ((_g273027_
                           (let ()
                             (declare (not safe))
                             (if (##values? _g273026_)
                                 (##vector-length _g273026_)
                                 1))))
                      (if (not (let ()
                                 (declare (not safe))
                                 (##fx= _g273027_ 2)))
                          (error "Context expects 2 values" _g273027_)))
                    (let ((_as2412_
                           (let ()
                             (declare (not safe))
                             (##vector-ref _g273026_ 0)))
                          (_ds2413_
                           (let ()
                             (declare (not safe))
                             (##vector-ref _g273026_ 1))))
                      (if (null? _as2412_)
                          _i2410_
                          (_lp2406_
                           (cdr _list12408_)
                           _ds2413_
                           (if (apply _pred2402_ (car _list12408_) _as2412_)
                               (+ _i2410_ '1)
                               _i2410_))))))))
          (let _lp2415_ ((_lis2417_ _list12403_) (_i2418_ '0))
            (if (std/srfi/1#null-list? _lis2417_)
                _i2418_
                (_lp2415_
                 (cdr _lis2417_)
                 (if (_pred2402_ (car _lis2417_)) (+ _i2418_ '1) _i2418_)))))))
  (define std/srfi/1#unfold-right
    (lambda (_p2388_ _f2389_ _g2390_ _seed2391_ . _maybe-tail2392_)
      (if (procedure? _p2388_)
          _p2388_
          (error '"Bad argument" _p2388_ 'procedure? 'unfold-right))
      (if (procedure? _f2389_)
          _f2389_
          (error '"Bad argument" _f2389_ 'procedure? 'unfold-right))
      (if (procedure? _g2390_)
          _g2390_
          (error '"Bad argument" _g2390_ 'procedure? 'unfold-right))
      (let _lp2394_ ((_seed2396_ _seed2391_)
                     (_ans2397_
                      (let ((_maybe-arg2399_ _maybe-tail2392_))
                        (if (null? _maybe-arg2399_)
                            '()
                            (if (null? (cdr _maybe-arg2399_))
                                (car _maybe-arg2399_)
                                (error '"too many optional arguments"
                                       _maybe-arg2399_))))))
        (if (_p2388_ _seed2396_)
            _ans2397_
            (_lp2394_
             (_g2390_ _seed2396_)
             (cons (_f2389_ _seed2396_) _ans2397_))))))
  (define std/srfi/1#unfold
    (lambda (_p2372_ _f2373_ _g2374_ _seed2375_ . _maybe-tail-gen2376_)
      (if (procedure? _p2372_)
          _p2372_
          (error '"Bad argument" _p2372_ 'procedure? 'unfold))
      (if (procedure? _f2373_)
          _f2373_
          (error '"Bad argument" _f2373_ 'procedure? 'unfold))
      (if (procedure? _g2374_)
          _g2374_
          (error '"Bad argument" _g2374_ 'procedure? 'unfold))
      (if (pair? _maybe-tail-gen2376_)
          (let ((_tail-gen2378_ (car _maybe-tail-gen2376_)))
            (if (pair? (cdr _maybe-tail-gen2376_))
                (apply error
                       '"Too many arguments"
                       std/srfi/1#unfold
                       _p2372_
                       _f2373_
                       _g2374_
                       _seed2375_
                       _maybe-tail-gen2376_)
                (let _recur2380_ ((_seed2382_ _seed2375_))
                  (if (_p2372_ _seed2382_)
                      (_tail-gen2378_ _seed2382_)
                      (cons (_f2373_ _seed2382_)
                            (_recur2380_ (_g2374_ _seed2382_)))))))
          (let _recur2384_ ((_seed2386_ _seed2375_))
            (if (_p2372_ _seed2386_)
                '()
                (cons (_f2373_ _seed2386_)
                      (_recur2384_ (_g2374_ _seed2386_))))))))
  (define std/srfi/1#pair-fold-right
    (lambda (_f2357_ _zero2358_ _lis12359_ . _lists2360_)
      (if (procedure? _f2357_)
          _f2357_
          (error '"Bad argument" _f2357_ 'procedure? 'pair-fold-right))
      (if (pair? _lists2360_)
          (let _recur2362_ ((_lists2364_ (cons _lis12359_ _lists2360_)))
            (let ((_cdrs2366_ (std/srfi/1#%cdrs _lists2364_)))
              (if (null? _cdrs2366_)
                  _zero2358_
                  (apply _f2357_
                         (std/srfi/1#append!
                          _lists2364_
                          (list (_recur2362_ _cdrs2366_)))))))
          (let _recur2368_ ((_lis2370_ _lis12359_))
            (if (std/srfi/1#null-list? _lis2370_)
                _zero2358_
                (_f2357_ _lis2370_ (_recur2368_ (cdr _lis2370_))))))))
  (define std/srfi/1#pair-fold
    (lambda (_f2338_ _zero2339_ _lis12340_ . _lists2341_)
      (if (procedure? _f2338_)
          _f2338_
          (error '"Bad argument" _f2338_ 'procedure? 'pair-fold))
      (if (pair? _lists2341_)
          (let _lp2343_ ((_lists2345_ (cons _lis12340_ _lists2341_))
                         (_ans2346_ _zero2339_))
            (let ((_tails2348_ (std/srfi/1#%cdrs _lists2345_)))
              (if (null? _tails2348_)
                  _ans2346_
                  (_lp2343_
                   _tails2348_
                   (apply _f2338_
                          (std/srfi/1#append!
                           _lists2345_
                           (list _ans2346_)))))))
          (let _lp2350_ ((_lis2352_ _lis12340_) (_ans2353_ _zero2339_))
            (if (std/srfi/1#null-list? _lis2352_)
                _ans2353_
                (let ((_tail2355_ (cdr _lis2352_)))
                  (_lp2350_ _tail2355_ (_f2338_ _lis2352_ _ans2353_))))))))
  (define std/srfi/1#reduce
    (lambda (_f2334_ _ridentity2335_ _lis2336_)
      (if (procedure? _f2334_)
          _f2334_
          (error '"Bad argument" _f2334_ 'procedure? 'reduce))
      (if (std/srfi/1#null-list? _lis2336_)
          _ridentity2335_
          (foldl1 _f2334_ (car _lis2336_) (cdr _lis2336_)))))
  (define std/srfi/1#reduce-right
    (lambda (_f2325_ _ridentity2326_ _lis2327_)
      (if (procedure? _f2325_)
          _f2325_
          (error '"Bad argument" _f2325_ 'procedure? 'reduce-right))
      (if (std/srfi/1#null-list? _lis2327_)
          _ridentity2326_
          (let _recur2329_ ((_head2331_ (car _lis2327_))
                            (_lis2332_ (cdr _lis2327_)))
            (if (pair? _lis2332_)
                (_f2325_ _head2331_
                         (_recur2329_ (car _lis2332_) (cdr _lis2332_)))
                _head2331_)))))
  (define std/srfi/1#append-map
    (lambda (_f2321_ _lis12322_ . _lists2323_)
      (std/srfi/1#really-append-map
       std/srfi/1#append-map
       append
       _f2321_
       _lis12322_
       _lists2323_)))
  (define std/srfi/1#append-map!
    (lambda (_f2317_ _lis12318_ . _lists2319_)
      (std/srfi/1#really-append-map
       std/srfi/1#append-map!
       std/srfi/1#append!
       _f2317_
       _lis12318_
       _lists2319_)))
  (define std/srfi/1#really-append-map
    (lambda (_who2291_ _appender2292_ _f2293_ _lis12294_ _lists2295_)
      (if (procedure? _f2293_)
          _f2293_
          (error '"Bad argument" _f2293_ 'procedure? 'who))
      (if (pair? _lists2295_)
          (let ((_g273028_
                 (std/srfi/1#%cars+cdrs (cons _lis12294_ _lists2295_))))
            (begin
              (let ((_g273029_
                     (let ()
                       (declare (not safe))
                       (if (##values? _g273028_)
                           (##vector-length _g273028_)
                           1))))
                (if (not (let () (declare (not safe)) (##fx= _g273029_ 2)))
                    (error "Context expects 2 values" _g273029_)))
              (let ((_cars2297_
                     (let () (declare (not safe)) (##vector-ref _g273028_ 0)))
                    (_cdrs2298_
                     (let () (declare (not safe)) (##vector-ref _g273028_ 1))))
                (if (null? _cars2297_)
                    '()
                    (let _recur2300_ ((_cars2302_ _cars2297_)
                                      (_cdrs2303_ _cdrs2298_))
                      (let* ((_vals2305_ (apply _f2293_ _cars2302_))
                             (_g273030_ (std/srfi/1#%cars+cdrs _cdrs2303_)))
                        (begin
                          (let ((_g273031_
                                 (let ()
                                   (declare (not safe))
                                   (if (##values? _g273030_)
                                       (##vector-length _g273030_)
                                       1))))
                            (if (not (let ()
                                       (declare (not safe))
                                       (##fx= _g273031_ 2)))
                                (error "Context expects 2 values" _g273031_)))
                          (let ((_cars22307_
                                 (let ()
                                   (declare (not safe))
                                   (##vector-ref _g273030_ 0)))
                                (_cdrs22308_
                                 (let ()
                                   (declare (not safe))
                                   (##vector-ref _g273030_ 1))))
                            (if (null? _cars22307_)
                                _vals2305_
                                (_appender2292_
                                 _vals2305_
                                 (_recur2300_
                                  _cars22307_
                                  _cdrs22308_)))))))))))
          (if (std/srfi/1#null-list? _lis12294_)
              '()
              (let _recur2310_ ((_elt2312_ (car _lis12294_))
                                (_rest2313_ (cdr _lis12294_)))
                (let ((_vals2315_ (_f2293_ _elt2312_)))
                  (if (std/srfi/1#null-list? _rest2313_)
                      _vals2315_
                      (_appender2292_
                       _vals2315_
                       (_recur2310_ (car _rest2313_) (cdr _rest2313_))))))))))
  (define std/srfi/1#pair-for-each
    (lambda (_proc2275_ _lis12276_ . _lists2277_)
      (if (procedure? _proc2275_)
          _proc2275_
          (error '"Bad argument" _proc2275_ 'procedure? 'pair-for-each))
      (if (pair? _lists2277_)
          (let _lp2279_ ((_lists2281_ (cons _lis12276_ _lists2277_)))
            (let ((_tails2283_ (std/srfi/1#%cdrs _lists2281_)))
              (if (pair? _tails2283_)
                  (begin (apply _proc2275_ _lists2281_) (_lp2279_ _tails2283_))
                  '#!void)))
          (let _lp2285_ ((_lis2287_ _lis12276_))
            (if (not (std/srfi/1#null-list? _lis2287_))
                (let ((_tail2289_ (cdr _lis2287_)))
                  (_proc2275_ _lis2287_)
                  (_lp2285_ _tail2289_))
                '#!void)))))
  (define std/srfi/1#map!
    (lambda (_f2261_ _lis12262_ . _lists2263_)
      (if (procedure? _f2261_)
          _f2261_
          (error '"Bad argument" _f2261_ 'procedure? 'map!))
      (if (pair? _lists2263_)
          (let _lp2265_ ((_lis12267_ _lis12262_) (_lists2268_ _lists2263_))
            (if (not (std/srfi/1#null-list? _lis12267_))
                (let ((_g273032_ (std/srfi/1#%cars+cdrs/no-test _lists2268_)))
                  (begin
                    (let ((_g273033_
                           (let ()
                             (declare (not safe))
                             (if (##values? _g273032_)
                                 (##vector-length _g273032_)
                                 1))))
                      (if (not (let ()
                                 (declare (not safe))
                                 (##fx= _g273033_ 2)))
                          (error "Context expects 2 values" _g273033_)))
                    (let ((_heads2270_
                           (let ()
                             (declare (not safe))
                             (##vector-ref _g273032_ 0)))
                          (_tails2271_
                           (let ()
                             (declare (not safe))
                             (##vector-ref _g273032_ 1))))
                      (begin
                        (set-car!
                         _lis12267_
                         (apply _f2261_ (car _lis12267_) _heads2270_))
                        (_lp2265_ (cdr _lis12267_) _tails2271_)))))
                '#!void))
          (std/srfi/1#pair-for-each
           (lambda (_pair2273_)
             (set-car! _pair2273_ (_f2261_ (car _pair2273_))))
           _lis12262_))
      _lis12262_))
  (define std/srfi/1#map-in-order
    (lambda (_f2241_ _lis12242_ . _lists2243_)
      (if (procedure? _f2241_)
          _f2241_
          (error '"Bad argument" _f2241_ 'procedure? 'map-in-order))
      (if (pair? _lists2243_)
          (let _recur2245_ ((_lists2247_ (cons _lis12242_ _lists2243_)))
            (let ((_g273034_ (std/srfi/1#%cars+cdrs _lists2247_)))
              (begin
                (let ((_g273035_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g273034_)
                             (##vector-length _g273034_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g273035_ 2)))
                      (error "Context expects 2 values" _g273035_)))
                (let ((_cars2249_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g273034_ 0)))
                      (_cdrs2250_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g273034_ 1))))
                  (if (pair? _cars2249_)
                      (let ((_x2252_ (apply _f2241_ _cars2249_)))
                        (cons _x2252_ (_recur2245_ _cdrs2250_)))
                      '())))))
          (let _recur2254_ ((_lis2256_ _lis12242_))
            (if (std/srfi/1#null-list? _lis2256_)
                _lis2256_
                (let ((_tail2258_ (cdr _lis2256_))
                      (_x2259_ (_f2241_ (car _lis2256_))))
                  (cons _x2259_ (_recur2254_ _tail2258_))))))))
  (define std/srfi/1#filter!
    (lambda (_pred2221_ _lis2222_)
      (if (procedure? _pred2221_)
          _pred2221_
          (error '"Bad argument" _pred2221_ 'procedure? 'filter!))
      (let _lp2224_ ((_ans2226_ _lis2222_))
        (if (std/srfi/1#null-list? _ans2226_)
            _ans2226_
            (if (not (_pred2221_ (car _ans2226_)))
                (_lp2224_ (cdr _ans2226_))
                (letrec ((_scan-in2228_
                          (lambda (_prev2231_ _lis2232_)
                            (if (pair? _lis2232_)
                                (if (_pred2221_ (car _lis2232_))
                                    (_scan-in2228_ _lis2232_ (cdr _lis2232_))
                                    (_scan-out2229_
                                     _prev2231_
                                     (cdr _lis2232_)))
                                '#!void)))
                         (_scan-out2229_
                          (lambda (_prev2234_ _lis2235_)
                            (let _lp2237_ ((_lis2239_ _lis2235_))
                              (if (pair? _lis2239_)
                                  (if (_pred2221_ (car _lis2239_))
                                      (begin
                                        (set-cdr! _prev2234_ _lis2239_)
                                        (_scan-in2228_
                                         _lis2239_
                                         (cdr _lis2239_)))
                                      (_lp2237_ (cdr _lis2239_)))
                                  (set-cdr! _prev2234_ _lis2239_))))))
                  (_scan-in2228_ _ans2226_ (cdr _ans2226_))
                  _ans2226_))))))
  (define std/srfi/1#partition
    (lambda (_pred2208_ _lis2209_)
      (if (procedure? _pred2208_)
          _pred2208_
          (error '"Bad argument" _pred2208_ 'procedure? 'partition))
      (let _recur2211_ ((_lis2213_ _lis2209_))
        (if (std/srfi/1#null-list? _lis2213_)
            (values _lis2213_ _lis2213_)
            (let ((_elt2215_ (car _lis2213_)) (_tail2216_ (cdr _lis2213_)))
              (let ((_g273036_ (_recur2211_ _tail2216_)))
                (begin
                  (let ((_g273037_
                         (let ()
                           (declare (not safe))
                           (if (##values? _g273036_)
                               (##vector-length _g273036_)
                               1))))
                    (if (not (let () (declare (not safe)) (##fx= _g273037_ 2)))
                        (error "Context expects 2 values" _g273037_)))
                  (let ((_in2218_
                         (let ()
                           (declare (not safe))
                           (##vector-ref _g273036_ 0)))
                        (_out2219_
                         (let ()
                           (declare (not safe))
                           (##vector-ref _g273036_ 1))))
                    (if (_pred2208_ _elt2215_)
                        (values (if (pair? _out2219_)
                                    (cons _elt2215_ _in2218_)
                                    _lis2213_)
                                _out2219_)
                        (values _in2218_
                                (if (pair? _in2218_)
                                    (cons _elt2215_ _out2219_)
                                    _lis2213_)))))))))))
  (define std/srfi/1#partition!
    (lambda (_pred2174_ _lis2175_)
      (if (procedure? _pred2174_)
          _pred2174_
          (error '"Bad argument" _pred2174_ 'procedure? 'partition!))
      (if (std/srfi/1#null-list? _lis2175_)
          (values _lis2175_ _lis2175_)
          (letrec ((_scan-in2177_
                    (lambda (_in-prev2180_ _out-prev2181_ _lis2182_)
                      (let _lp2184_ ((_in-prev2186_ _in-prev2180_)
                                     (_lis2187_ _lis2182_))
                        (if (pair? _lis2187_)
                            (if (_pred2174_ (car _lis2187_))
                                (_lp2184_ _lis2187_ (cdr _lis2187_))
                                (begin
                                  (set-cdr! _out-prev2181_ _lis2187_)
                                  (_scan-out2178_
                                   _in-prev2186_
                                   _lis2187_
                                   (cdr _lis2187_))))
                            (set-cdr! _out-prev2181_ _lis2187_)))))
                   (_scan-out2178_
                    (lambda (_in-prev2189_ _out-prev2190_ _lis2191_)
                      (let _lp2193_ ((_out-prev2195_ _out-prev2190_)
                                     (_lis2196_ _lis2191_))
                        (if (pair? _lis2196_)
                            (if (_pred2174_ (car _lis2196_))
                                (begin
                                  (set-cdr! _in-prev2189_ _lis2196_)
                                  (_scan-in2177_
                                   _lis2196_
                                   _out-prev2195_
                                   (cdr _lis2196_)))
                                (_lp2193_ _lis2196_ (cdr _lis2196_)))
                            (set-cdr! _in-prev2189_ _lis2196_))))))
            (if (_pred2174_ (car _lis2175_))
                (let _lp2198_ ((_prev-l2200_ _lis2175_)
                               (_l2201_ (cdr _lis2175_)))
                  (if (not (pair? _l2201_))
                      (values _lis2175_ _l2201_)
                      (if (_pred2174_ (car _l2201_))
                          (_lp2198_ _l2201_ (cdr _l2201_))
                          (begin
                            (_scan-out2178_ _prev-l2200_ _l2201_ (cdr _l2201_))
                            (values _lis2175_ _l2201_)))))
                (let _lp2203_ ((_prev-l2205_ _lis2175_)
                               (_l2206_ (cdr _lis2175_)))
                  (if (not (pair? _l2206_))
                      (values _l2206_ _lis2175_)
                      (if (_pred2174_ (car _l2206_))
                          (begin
                            (_scan-in2177_ _l2206_ _prev-l2205_ (cdr _l2206_))
                            (values _l2206_ _lis2175_))
                          (_lp2203_ _l2206_ (cdr _l2206_))))))))))
  (define std/srfi/1#remove
    (lambda (_pred2169_ _l2170_)
      (filter (lambda (_x2172_) (not (_pred2169_ _x2172_))) _l2170_)))
  (define std/srfi/1#remove!
    (lambda (_pred2164_ _l2165_)
      (std/srfi/1#filter!
       (lambda (_x2167_) (not (_pred2164_ _x2167_)))
       _l2165_)))
  (define std/srfi/1#delete
    (lambda (_x2153_ _lis2154_ . _maybe-=2155_)
      (let ((_=2160_ (let ((_maybe-arg2157_ _maybe-=2155_))
                       (if (null? _maybe-arg2157_)
                           equal?
                           (if (null? (cdr _maybe-arg2157_))
                               (car _maybe-arg2157_)
                               (error '"too many optional arguments"
                                      _maybe-arg2157_))))))
        (filter (lambda (_y2162_) (not (_=2160_ _x2153_ _y2162_)))
                _lis2154_))))
  (define std/srfi/1#delete!
    (lambda (_x2142_ _lis2143_ . _maybe-=2144_)
      (let ((_=2149_ (let ((_maybe-arg2146_ _maybe-=2144_))
                       (if (null? _maybe-arg2146_)
                           equal?
                           (if (null? (cdr _maybe-arg2146_))
                               (car _maybe-arg2146_)
                               (error '"too many optional arguments"
                                      _maybe-arg2146_))))))
        (std/srfi/1#filter!
         (lambda (_y2151_) (not (_=2149_ _x2142_ _y2151_)))
         _lis2143_))))
  (define std/srfi/1#delete-duplicates
    (lambda (_lis2123_ . _maybe-=2124_)
      (let ((_elt=2129_
             (let ((_maybe-arg2126_ _maybe-=2124_))
               (if (null? _maybe-arg2126_)
                   equal?
                   (if (null? (cdr _maybe-arg2126_))
                       (car _maybe-arg2126_)
                       (error '"too many optional arguments"
                              _maybe-arg2126_))))))
        (if (procedure? _elt=2129_)
            _elt=2129_
            (error '"Bad argument" _elt=2129_ 'procedure? 'delete-duplicates))
        (let _recur2131_ ((_lis2133_ _lis2123_))
          (if (std/srfi/1#null-list? _lis2133_)
              _lis2133_
              (let* ((_x2135_ (car _lis2133_))
                     (_tail2137_ (cdr _lis2133_))
                     (_new-tail2139_
                      (_recur2131_
                       (std/srfi/1#delete _x2135_ _tail2137_ _elt=2129_))))
                (if (eq? _tail2137_ _new-tail2139_)
                    _lis2133_
                    (cons _x2135_ _new-tail2139_))))))))
  (define std/srfi/1#delete-duplicates!
    (lambda (_lis2104_ . _maybe-=2105_)
      (let ((_elt=2110_
             (let ((_maybe-arg2107_ _maybe-=2105_))
               (if (null? _maybe-arg2107_)
                   equal?
                   (if (null? (cdr _maybe-arg2107_))
                       (car _maybe-arg2107_)
                       (error '"too many optional arguments"
                              _maybe-arg2107_))))))
        (if (procedure? _elt=2110_)
            _elt=2110_
            (error '"Bad argument" _elt=2110_ 'procedure? 'delete-duplicates!))
        (let _recur2112_ ((_lis2114_ _lis2104_))
          (if (std/srfi/1#null-list? _lis2114_)
              _lis2114_
              (let* ((_x2116_ (car _lis2114_))
                     (_tail2118_ (cdr _lis2114_))
                     (_new-tail2120_
                      (_recur2112_
                       (std/srfi/1#delete! _x2116_ _tail2118_ _elt=2110_))))
                (if (eq? _tail2118_ _new-tail2120_)
                    _lis2114_
                    (cons _x2116_ _new-tail2120_))))))))
  (define std/srfi/1#alist-cons
    (lambda (_key2100_ _datum2101_ _alist2102_)
      (cons (cons _key2100_ _datum2101_) _alist2102_)))
  (define std/srfi/1#alist-copy
    (lambda (_alist2096_)
      (map (lambda (_elt2098_) (cons (car _elt2098_) (cdr _elt2098_)))
           _alist2096_)))
  (define std/srfi/1#alist-delete
    (lambda (_key2085_ _alist2086_ . _maybe-=2087_)
      (let ((_=2092_ (let ((_maybe-arg2089_ _maybe-=2087_))
                       (if (null? _maybe-arg2089_)
                           equal?
                           (if (null? (cdr _maybe-arg2089_))
                               (car _maybe-arg2089_)
                               (error '"too many optional arguments"
                                      _maybe-arg2089_))))))
        (filter (lambda (_elt2094_) (not (_=2092_ _key2085_ (car _elt2094_))))
                _alist2086_))))
  (define std/srfi/1#alist-delete!
    (lambda (_key2074_ _alist2075_ . _maybe-=2076_)
      (let ((_=2081_ (let ((_maybe-arg2078_ _maybe-=2076_))
                       (if (null? _maybe-arg2078_)
                           equal?
                           (if (null? (cdr _maybe-arg2078_))
                               (car _maybe-arg2078_)
                               (error '"too many optional arguments"
                                      _maybe-arg2078_))))))
        (std/srfi/1#filter!
         (lambda (_elt2083_) (not (_=2081_ _key2074_ (car _elt2083_))))
         _alist2075_))))
  (define std/srfi/1#find-tail
    (lambda (_pred2067_ _list2068_)
      (if (procedure? _pred2067_)
          _pred2067_
          (error '"Bad argument" _pred2067_ 'procedure? 'find-tail))
      (let _lp2070_ ((_list2072_ _list2068_))
        (if (not (std/srfi/1#null-list? _list2072_))
            (if (_pred2067_ (car _list2072_))
                _list2072_
                (_lp2070_ (cdr _list2072_)))
            '#f))))
  (define std/srfi/1#take-while
    (lambda (_pred2058_ _lis2059_)
      (if (procedure? _pred2058_)
          _pred2058_
          (error '"Bad argument" _pred2058_ 'procedure? 'take-while))
      (let _recur2061_ ((_lis2063_ _lis2059_))
        (if (std/srfi/1#null-list? _lis2063_)
            '()
            (let ((_x2065_ (car _lis2063_)))
              (if (_pred2058_ _x2065_)
                  (cons _x2065_ (_recur2061_ (cdr _lis2063_)))
                  '()))))))
  (define std/srfi/1#drop-while
    (lambda (_pred2051_ _lis2052_)
      (if (procedure? _pred2051_)
          _pred2051_
          (error '"Bad argument" _pred2051_ 'procedure? 'drop-while))
      (let _lp2054_ ((_lis2056_ _lis2052_))
        (if (std/srfi/1#null-list? _lis2056_)
            '()
            (if (_pred2051_ (car _lis2056_))
                (_lp2054_ (cdr _lis2056_))
                _lis2056_)))))
  (define std/srfi/1#take-while!
    (lambda (_pred2038_ _lis2039_)
      (if (procedure? _pred2038_)
          _pred2038_
          (error '"Bad argument" _pred2038_ 'procedure? 'take-while!))
      (if (or (std/srfi/1#null-list? _lis2039_)
              (not (_pred2038_ (car _lis2039_))))
          '()
          (begin
            (let _lp2044_ ((_prev2046_ _lis2039_) (_rest2047_ (cdr _lis2039_)))
              (if (pair? _rest2047_)
                  (let ((_x2049_ (car _rest2047_)))
                    (if (_pred2038_ _x2049_)
                        (_lp2044_ _rest2047_ (cdr _rest2047_))
                        (set-cdr! _prev2046_ '())))
                  '#!void))
            _lis2039_))))
  (define std/srfi/1#span
    (lambda (_pred2026_ _lis2027_)
      (if (procedure? _pred2026_)
          _pred2026_
          (error '"Bad argument" _pred2026_ 'procedure? 'span))
      (let _recur2029_ ((_lis2031_ _lis2027_))
        (if (std/srfi/1#null-list? _lis2031_)
            (values '() '())
            (let ((_x2033_ (car _lis2031_)))
              (if (_pred2026_ _x2033_)
                  (let ((_g273038_ (_recur2029_ (cdr _lis2031_))))
                    (begin
                      (let ((_g273039_
                             (let ()
                               (declare (not safe))
                               (if (##values? _g273038_)
                                   (##vector-length _g273038_)
                                   1))))
                        (if (not (let ()
                                   (declare (not safe))
                                   (##fx= _g273039_ 2)))
                            (error "Context expects 2 values" _g273039_)))
                      (let ((_prefix2035_
                             (let ()
                               (declare (not safe))
                               (##vector-ref _g273038_ 0)))
                            (_suffix2036_
                             (let ()
                               (declare (not safe))
                               (##vector-ref _g273038_ 1))))
                        (values (cons _x2033_ _prefix2035_) _suffix2036_))))
                  (values '() _lis2031_)))))))
  (define std/srfi/1#span!
    (lambda (_pred2011_ _lis2012_)
      (if (procedure? _pred2011_)
          _pred2011_
          (error '"Bad argument" _pred2011_ 'procedure? 'span!))
      (if (or (std/srfi/1#null-list? _lis2012_)
              (not (_pred2011_ (car _lis2012_))))
          (values '() _lis2012_)
          (let ((_suffix2024_
                 (let _lp2017_ ((_prev2019_ _lis2012_)
                                (_rest2020_ (cdr _lis2012_)))
                   (if (std/srfi/1#null-list? _rest2020_)
                       _rest2020_
                       (let ((_x2022_ (car _rest2020_)))
                         (if (_pred2011_ _x2022_)
                             (_lp2017_ _rest2020_ (cdr _rest2020_))
                             (begin (set-cdr! _prev2019_ '()) _rest2020_)))))))
            (values _lis2012_ _suffix2024_)))))
  (define std/srfi/1#break
    (lambda (_pred2006_ _lis2007_)
      (std/srfi/1#span
       (lambda (_x2009_) (not (_pred2006_ _x2009_)))
       _lis2007_)))
  (define std/srfi/1#break!
    (lambda (_pred2001_ _lis2002_)
      (std/srfi/1#span!
       (lambda (_x2004_) (not (_pred2001_ _x2004_)))
       _lis2002_)))
  (define std/srfi/1#any
    (lambda (_pred1975_ _lis11976_ . _lists1977_)
      (if (procedure? _pred1975_)
          _pred1975_
          (error '"Bad argument" _pred1975_ 'procedure? 'any))
      (if (pair? _lists1977_)
          (let ((_g273040_
                 (std/srfi/1#%cars+cdrs (cons _lis11976_ _lists1977_))))
            (begin
              (let ((_g273041_
                     (let ()
                       (declare (not safe))
                       (if (##values? _g273040_)
                           (##vector-length _g273040_)
                           1))))
                (if (not (let () (declare (not safe)) (##fx= _g273041_ 2)))
                    (error "Context expects 2 values" _g273041_)))
              (let ((_heads1979_
                     (let () (declare (not safe)) (##vector-ref _g273040_ 0)))
                    (_tails1980_
                     (let () (declare (not safe)) (##vector-ref _g273040_ 1))))
                (if (pair? _heads1979_)
                    (let _lp1982_ ((_heads1984_ _heads1979_)
                                   (_tails1985_ _tails1980_))
                      (let ((_g273042_ (std/srfi/1#%cars+cdrs _tails1985_)))
                        (begin
                          (let ((_g273043_
                                 (let ()
                                   (declare (not safe))
                                   (if (##values? _g273042_)
                                       (##vector-length _g273042_)
                                       1))))
                            (if (not (let ()
                                       (declare (not safe))
                                       (##fx= _g273043_ 2)))
                                (error "Context expects 2 values" _g273043_)))
                          (let ((_next-heads1987_
                                 (let ()
                                   (declare (not safe))
                                   (##vector-ref _g273042_ 0)))
                                (_next-tails1988_
                                 (let ()
                                   (declare (not safe))
                                   (##vector-ref _g273042_ 1))))
                            (if (pair? _next-heads1987_)
                                (let ((_$e1990_
                                       (apply _pred1975_ _heads1984_)))
                                  (if _$e1990_
                                      _$e1990_
                                      (_lp1982_
                                       _next-heads1987_
                                       _next-tails1988_)))
                                (apply _pred1975_ _heads1984_))))))
                    '#f))))
          (if (not (std/srfi/1#null-list? _lis11976_))
              (let _lp1993_ ((_head1995_ (car _lis11976_))
                             (_tail1996_ (cdr _lis11976_)))
                (if (std/srfi/1#null-list? _tail1996_)
                    (_pred1975_ _head1995_)
                    (let ((_$e1998_ (_pred1975_ _head1995_)))
                      (if _$e1998_
                          _$e1998_
                          (_lp1993_ (car _tail1996_) (cdr _tail1996_))))))
              '#f))))
  (define std/srfi/1#every
    (lambda (_pred1949_ _lis11950_ . _lists1951_)
      (if (procedure? _pred1949_)
          _pred1949_
          (error '"Bad argument" _pred1949_ 'procedure? 'every))
      (if (pair? _lists1951_)
          (let ((_g273044_
                 (std/srfi/1#%cars+cdrs (cons _lis11950_ _lists1951_))))
            (begin
              (let ((_g273045_
                     (let ()
                       (declare (not safe))
                       (if (##values? _g273044_)
                           (##vector-length _g273044_)
                           1))))
                (if (not (let () (declare (not safe)) (##fx= _g273045_ 2)))
                    (error "Context expects 2 values" _g273045_)))
              (let ((_heads1953_
                     (let () (declare (not safe)) (##vector-ref _g273044_ 0)))
                    (_tails1954_
                     (let () (declare (not safe)) (##vector-ref _g273044_ 1))))
                (let ((_$e1956_ (not (pair? _heads1953_))))
                  (if _$e1956_
                      _$e1956_
                      (let _lp1959_ ((_heads1961_ _heads1953_)
                                     (_tails1962_ _tails1954_))
                        (let ((_g273046_ (std/srfi/1#%cars+cdrs _tails1962_)))
                          (begin
                            (let ((_g273047_
                                   (let ()
                                     (declare (not safe))
                                     (if (##values? _g273046_)
                                         (##vector-length _g273046_)
                                         1))))
                              (if (not (let ()
                                         (declare (not safe))
                                         (##fx= _g273047_ 2)))
                                  (error "Context expects 2 values"
                                         _g273047_)))
                            (let ((_next-heads1964_
                                   (let ()
                                     (declare (not safe))
                                     (##vector-ref _g273046_ 0)))
                                  (_next-tails1965_
                                   (let ()
                                     (declare (not safe))
                                     (##vector-ref _g273046_ 1))))
                              (if (pair? _next-heads1964_)
                                  (if (apply _pred1949_ _heads1961_)
                                      (_lp1959_
                                       _next-heads1964_
                                       _next-tails1965_)
                                      '#f)
                                  (apply _pred1949_ _heads1961_)))))))))))
          (let ((_$e1967_ (std/srfi/1#null-list? _lis11950_)))
            (if _$e1967_
                _$e1967_
                (let _lp1970_ ((_head1972_ (car _lis11950_))
                               (_tail1973_ (cdr _lis11950_)))
                  (if (std/srfi/1#null-list? _tail1973_)
                      (_pred1949_ _head1972_)
                      (if (_pred1949_ _head1972_)
                          (_lp1970_ (car _tail1973_) (cdr _tail1973_))
                          '#f))))))))
  (define std/srfi/1#list-index
    (lambda (_pred1932_ _lis11933_ . _lists1934_)
      (if (procedure? _pred1932_)
          _pred1932_
          (error '"Bad argument" _pred1932_ 'procedure? 'list-index))
      (if (pair? _lists1934_)
          (let _lp1936_ ((_lists1938_ (cons _lis11933_ _lists1934_))
                         (_n1939_ '0))
            (let ((_g273048_ (std/srfi/1#%cars+cdrs _lists1938_)))
              (begin
                (let ((_g273049_
                       (let ()
                         (declare (not safe))
                         (if (##values? _g273048_)
                             (##vector-length _g273048_)
                             1))))
                  (if (not (let () (declare (not safe)) (##fx= _g273049_ 2)))
                      (error "Context expects 2 values" _g273049_)))
                (let ((_heads1941_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g273048_ 0)))
                      (_tails1942_
                       (let ()
                         (declare (not safe))
                         (##vector-ref _g273048_ 1))))
                  (if (pair? _heads1941_)
                      (if (apply _pred1932_ _heads1941_)
                          _n1939_
                          (_lp1936_ _tails1942_ (+ _n1939_ '1)))
                      '#f)))))
          (let _lp1944_ ((_lis1946_ _lis11933_) (_n1947_ '0))
            (if (not (std/srfi/1#null-list? _lis1946_))
                (if (_pred1932_ (car _lis1946_))
                    _n1947_
                    (_lp1944_ (cdr _lis1946_) (+ _n1947_ '1)))
                '#f)))))
  (define std/srfi/1#reverse!
    (lambda (_lis1923_)
      (let _lp1925_ ((_lis1927_ _lis1923_) (_ans1928_ '()))
        (if (std/srfi/1#null-list? _lis1927_)
            _ans1928_
            (let ((_tail1930_ (cdr _lis1927_)))
              (set-cdr! _lis1927_ _ans1928_)
              (_lp1925_ _tail1930_ _lis1927_))))))
  (define std/srfi/1#%lset2<=
    (lambda (_=1917_ _lis11918_ _lis21919_)
      (std/srfi/1#every
       (lambda (_x1921_)
         (std/srfi/1#srfi-1-member__1 _x1921_ _lis21919_ _=1917_))
       _lis11918_)))
  (define std/srfi/1#flip
    (lambda (_proc1912_)
      (lambda (_x1914_ _y1915_) (_proc1912_ _y1915_ _x1914_))))
  (define std/srfi/1#lset<=
    (lambda (_=1892_ . _lists1893_)
      (if (procedure? _=1892_)
          _=1892_
          (error '"Bad argument" _=1892_ 'procedure? 'lset<=))
      (let ((_$e1895_ (not (pair? _lists1893_))))
        (if _$e1895_
            _$e1895_
            (let _lp1898_ ((_s11900_ (car _lists1893_))
                           (_rest1901_ (cdr _lists1893_)))
              (let ((_$e1903_ (not (pair? _rest1901_))))
                (if _$e1903_
                    _$e1903_
                    (let ((_s21906_ (car _rest1901_))
                          (_rest1907_ (cdr _rest1901_)))
                      (if (or (eq? _s21906_ _s11900_)
                              (std/srfi/1#%lset2<=
                               (std/srfi/1#flip _=1892_)
                               _s11900_
                               _s21906_))
                          (_lp1898_ _s21906_ _rest1907_)
                          '#f)))))))))
  (define std/srfi/1#lset=
    (lambda (_=1872_ . _lists1873_)
      (if (procedure? _=1872_)
          _=1872_
          (error '"Bad argument" _=1872_ 'procedure? 'lset=))
      (let ((_$e1875_ (not (pair? _lists1873_))))
        (if _$e1875_
            _$e1875_
            (let _lp1878_ ((_s11880_ (car _lists1873_))
                           (_rest1881_ (cdr _lists1873_)))
              (let ((_$e1883_ (not (pair? _rest1881_))))
                (if _$e1883_
                    _$e1883_
                    (let ((_s21886_ (car _rest1881_))
                          (_rest1887_ (cdr _rest1881_)))
                      (if (or (eq? _s11880_ _s21886_)
                              (and (std/srfi/1#%lset2<=
                                    (std/srfi/1#flip _=1872_)
                                    _s11880_
                                    _s21886_)
                                   (std/srfi/1#%lset2<=
                                    _=1872_
                                    _s21886_
                                    _s11880_)))
                          (_lp1878_ _s21886_ _rest1887_)
                          '#f)))))))))
  (define std/srfi/1#lset-adjoin
    (lambda (_=1865_ _lis1866_ . _elts1867_)
      (if (procedure? _=1865_)
          _=1865_
          (error '"Bad argument" _=1865_ 'procedure? 'lset-adjoin))
      (foldl1 (lambda (_elt1869_ _ans1870_)
                (if (std/srfi/1#srfi-1-member__1 _elt1869_ _ans1870_ _=1865_)
                    _ans1870_
                    (cons _elt1869_ _ans1870_)))
              _lis1866_
              _elts1867_)))
  (define std/srfi/1#lset-union
    (lambda (_=1854_ . _lists1855_)
      (if (procedure? _=1854_)
          _=1854_
          (error '"Bad argument" _=1854_ 'procedure? 'lset-union))
      (std/srfi/1#reduce
       (lambda (_lis1857_ _ans1858_)
         (if (null? _lis1857_)
             _ans1858_
             (if (null? _ans1858_)
                 _lis1857_
                 (if (eq? _lis1857_ _ans1858_)
                     _ans1858_
                     (foldl1 (lambda (_elt1860_ _ans1861_)
                               (if (std/srfi/1#any
                                    (lambda (_x1863_)
                                      (_=1854_ _x1863_ _elt1860_))
                                    _ans1861_)
                                   _ans1861_
                                   (cons _elt1860_ _ans1861_)))
                             _ans1858_
                             _lis1857_)))))
       '()
       _lists1855_)))
  (define std/srfi/1#lset-union!
    (lambda (_=1841_ . _lists1842_)
      (if (procedure? _=1841_)
          _=1841_
          (error '"Bad argument" _=1841_ 'procedure? 'lset-union!))
      (std/srfi/1#reduce
       (lambda (_lis1844_ _ans1845_)
         (if (null? _lis1844_)
             _ans1845_
             (if (null? _ans1845_)
                 _lis1844_
                 (if (eq? _lis1844_ _ans1845_)
                     _ans1845_
                     (std/srfi/1#pair-fold
                      (lambda (_pair1847_ _ans1848_)
                        (let ((_elt1850_ (car _pair1847_)))
                          (if (std/srfi/1#any
                               (lambda (_x1852_) (_=1841_ _x1852_ _elt1850_))
                               _ans1848_)
                              _ans1848_
                              (begin
                                (set-cdr! _pair1847_ _ans1848_)
                                _pair1847_))))
                      _ans1845_
                      _lis1844_)))))
       '()
       _lists1842_)))
  (define std/srfi/1#lset-intersection
    (lambda (_=1831_ _lis11832_ . _lists1833_)
      (if (procedure? _=1831_)
          _=1831_
          (error '"Bad argument" _=1831_ 'procedure? 'lset-intersection))
      (let ((_lists1835_ (std/srfi/1#delete _lis11832_ _lists1833_ eq?)))
        (if (std/srfi/1#any std/srfi/1#null-list? _lists1835_)
            '()
            (if (null? _lists1835_)
                _lis11832_
                (filter (lambda (_x1837_)
                          (std/srfi/1#every
                           (lambda (_lis1839_)
                             (std/srfi/1#srfi-1-member__1
                              _x1837_
                              _lis1839_
                              _=1831_))
                           _lists1835_))
                        _lis11832_))))))
  (define std/srfi/1#lset-intersection!
    (lambda (_=1821_ _lis11822_ . _lists1823_)
      (if (procedure? _=1821_)
          _=1821_
          (error '"Bad argument" _=1821_ 'procedure? 'lset-intersection!))
      (let ((_lists1825_ (std/srfi/1#delete _lis11822_ _lists1823_ eq?)))
        (if (std/srfi/1#any std/srfi/1#null-list? _lists1825_)
            '()
            (if (null? _lists1825_)
                _lis11822_
                (std/srfi/1#filter!
                 (lambda (_x1827_)
                   (std/srfi/1#every
                    (lambda (_lis1829_)
                      (std/srfi/1#srfi-1-member__1 _x1827_ _lis1829_ _=1821_))
                    _lists1825_))
                 _lis11822_))))))
  (define std/srfi/1#lset-difference
    (lambda (_=1811_ _lis11812_ . _lists1813_)
      (if (procedure? _=1811_)
          _=1811_
          (error '"Bad argument" _=1811_ 'procedure? 'lset-difference))
      (let ((_lists1815_ (filter pair? _lists1813_)))
        (if (null? _lists1815_)
            _lis11812_
            (if (memq _lis11812_ _lists1815_)
                '()
                (filter (lambda (_x1817_)
                          (std/srfi/1#every
                           (lambda (_lis1819_)
                             (not (std/srfi/1#srfi-1-member__1
                                   _x1817_
                                   _lis1819_
                                   _=1811_)))
                           _lists1815_))
                        _lis11812_))))))
  (define std/srfi/1#lset-difference!
    (lambda (_=1801_ _lis11802_ . _lists1803_)
      (if (procedure? _=1801_)
          _=1801_
          (error '"Bad argument" _=1801_ 'procedure? 'lset-difference!))
      (let ((_lists1805_ (filter pair? _lists1803_)))
        (if (null? _lists1805_)
            _lis11802_
            (if (memq _lis11802_ _lists1805_)
                '()
                (std/srfi/1#filter!
                 (lambda (_x1807_)
                   (std/srfi/1#every
                    (lambda (_lis1809_)
                      (not (std/srfi/1#srfi-1-member__1
                            _x1807_
                            _lis1809_
                            _=1801_)))
                    _lists1805_))
                 _lis11802_))))))
  (define std/srfi/1#lset-xor
    (lambda (_=1789_ . _lists1790_)
      (if (procedure? _=1789_)
          _=1789_
          (error '"Bad argument" _=1789_ 'procedure? 'lset-xor))
      (std/srfi/1#reduce
       (lambda (_b1792_ _a1793_)
         (let ((_g273050_
                (std/srfi/1#lset-diff+intersection _=1789_ _a1793_ _b1792_)))
           (begin
             (let ((_g273051_
                    (let ()
                      (declare (not safe))
                      (if (##values? _g273050_)
                          (##vector-length _g273050_)
                          1))))
               (if (not (let () (declare (not safe)) (##fx= _g273051_ 2)))
                   (error "Context expects 2 values" _g273051_)))
             (let ((_a-b1795_
                    (let () (declare (not safe)) (##vector-ref _g273050_ 0)))
                   (_a-int-b1796_
                    (let () (declare (not safe)) (##vector-ref _g273050_ 1))))
               (if (null? _a-b1795_)
                   (std/srfi/1#lset-difference _=1789_ _b1792_ _a1793_)
                   (if (null? _a-int-b1796_)
                       (append _b1792_ _a1793_)
                       (foldl1 (lambda (_xb1798_ _ans1799_)
                                 (if (std/srfi/1#srfi-1-member__1
                                      _xb1798_
                                      _a-int-b1796_
                                      _=1789_)
                                     _ans1799_
                                     (cons _xb1798_ _ans1799_)))
                               _a-b1795_
                               _b1792_)))))))
       '()
       _lists1790_)))
  (define std/srfi/1#lset-xor!
    (lambda (_=1777_ . _lists1778_)
      (if (procedure? _=1777_)
          _=1777_
          (error '"Bad argument" _=1777_ 'procedure? 'lset-xor!))
      (std/srfi/1#reduce
       (lambda (_b1780_ _a1781_)
         (let ((_g273052_
                (std/srfi/1#lset-diff+intersection! _=1777_ _a1781_ _b1780_)))
           (begin
             (let ((_g273053_
                    (let ()
                      (declare (not safe))
                      (if (##values? _g273052_)
                          (##vector-length _g273052_)
                          1))))
               (if (not (let () (declare (not safe)) (##fx= _g273053_ 2)))
                   (error "Context expects 2 values" _g273053_)))
             (let ((_a-b1783_
                    (let () (declare (not safe)) (##vector-ref _g273052_ 0)))
                   (_a-int-b1784_
                    (let () (declare (not safe)) (##vector-ref _g273052_ 1))))
               (if (null? _a-b1783_)
                   (std/srfi/1#lset-difference! _=1777_ _b1780_ _a1781_)
                   (if (null? _a-int-b1784_)
                       (std/srfi/1#append! _b1780_ _a1781_)
                       (std/srfi/1#pair-fold
                        (lambda (_b-pair1786_ _ans1787_)
                          (if (std/srfi/1#srfi-1-member__1
                               (car _b-pair1786_)
                               _a-int-b1784_
                               _=1777_)
                              _ans1787_
                              (begin
                                (set-cdr! _b-pair1786_ _ans1787_)
                                _b-pair1786_)))
                        _a-b1783_
                        _b1780_)))))))
       '()
       _lists1778_)))
  (define std/srfi/1#lset-diff+intersection
    (lambda (_=1769_ _lis11770_ . _lists1771_)
      (if (procedure? _=1769_)
          _=1769_
          (error '"Bad argument" _=1769_ 'procedure? 'lset-diff+intersection))
      (if (std/srfi/1#every std/srfi/1#null-list? _lists1771_)
          (values _lis11770_ '())
          (if (memq _lis11770_ _lists1771_)
              (values '() _lis11770_)
              (std/srfi/1#partition
               (lambda (_elt1773_)
                 (not (std/srfi/1#any
                       (lambda (_lis1775_)
                         (std/srfi/1#srfi-1-member__1
                          _elt1773_
                          _lis1775_
                          _=1769_))
                       _lists1771_)))
               _lis11770_)))))
  (define std/srfi/1#lset-diff+intersection!
    (lambda (_=1761_ _lis11762_ . _lists1763_)
      (if (procedure? _=1761_)
          _=1761_
          (error '"Bad argument" _=1761_ 'procedure? 'lset-diff+intersection!))
      (if (std/srfi/1#every std/srfi/1#null-list? _lists1763_)
          (values _lis11762_ '())
          (if (memq _lis11762_ _lists1763_)
              (values '() _lis11762_)
              (std/srfi/1#partition!
               (lambda (_elt1765_)
                 (not (std/srfi/1#any
                       (lambda (_lis1767_)
                         (std/srfi/1#srfi-1-member__1
                          _elt1765_
                          _lis1767_
                          _=1761_))
                       _lists1763_)))
               _lis11762_))))))
