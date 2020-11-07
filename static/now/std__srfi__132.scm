(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/132#r7rs-vector-copy
    (lambda (_v96984_ _start96985_ _end96986_)
      (subvector _v96984_ _start96985_ _end96986_)))
  (define std/srfi/132#r7rs-vector-copy!__%
    (lambda (_v96954_ _start96955_ _v296956_ _start296957_ _end296958_)
      (subvector-move!
       _v96954_
       _start96955_
       _v296956_
       _start296957_
       _end296958_)))
  (define std/srfi/132#r7rs-vector-copy!__0
    (lambda (_v96963_ _start96964_ _v296965_)
      (let* ((_start296967_ '0) (_end296969_ (vector-length _v296965_)))
        (subvector-move!
         _v96963_
         _start96964_
         _v296965_
         _start296967_
         _end296969_))))
  (define std/srfi/132#r7rs-vector-copy!__1
    (lambda (_v96971_ _start96972_ _v296973_ _start296974_)
      (let ((_end296976_ (vector-length _v296973_)))
        (subvector-move!
         _v96971_
         _start96972_
         _v296973_
         _start296974_
         _end296976_))))
  (define std/srfi/132#r7rs-vector-copy!
    (lambda _g279004_
      (let ((_g279003_ (let () (declare (not safe)) (##length _g279004_))))
        (cond ((let () (declare (not safe)) (##fx= _g279003_ 3))
               (apply std/srfi/132#r7rs-vector-copy!__0 _g279004_))
              ((let () (declare (not safe)) (##fx= _g279003_ 4))
               (apply std/srfi/132#r7rs-vector-copy!__1 _g279004_))
              ((let () (declare (not safe)) (##fx= _g279003_ 5))
               (apply subvector-move! _g279004_))
              (else
               (##raise-wrong-number-of-arguments-exception
                std/srfi/132#r7rs-vector-copy!
                _g279004_))))))
  (define std/srfi/132#r7rs-vector-fill!
    (lambda (_v96942_ _val96943_ _start96944_ _end96945_)
      (let ((_len96947_ (vector-length _v96942_)))
        (let _lp96949_ ((_i96951_ _start96944_))
          (if (fx< _i96951_ _end96945_)
              (begin
                (vector-set! _v96942_ _i96951_ _val96943_)
                (_lp96949_ (fx+ _i96951_ '1)))
              '#!void)))))
  (define std/srfi/132#list-delete-neighbor-dups
    (lambda (_=96922_ _lis96923_)
      (if (pair? _lis96923_)
          (let* ((_x096925_ (car _lis96923_))
                 (_xs96927_ (cdr _lis96923_))
                 (_ans96939_
                  (let _recur96929_ ((_x096931_ _x096925_)
                                     (_xs96932_ _xs96927_))
                    (if (pair? _xs96932_)
                        (let ((_x196934_ (car _xs96932_))
                              (_x2+96935_ (cdr _xs96932_)))
                          (if (_=96922_ _x096931_ _x196934_)
                              (_recur96929_ _x096931_ _x2+96935_)
                              (let ((_ans-tail96937_
                                     (_recur96929_ _x196934_ _x2+96935_)))
                                (if (eq? _ans-tail96937_ _x2+96935_)
                                    _xs96932_
                                    (cons _x196934_ _ans-tail96937_)))))
                        _xs96932_))))
            (if (eq? _ans96939_ _xs96927_)
                _lis96923_
                (cons _x096925_ _ans96939_)))
          _lis96923_)))
  (define std/srfi/132#list-delete-neighbor-dups!
    (lambda (_=96903_ _lis96904_)
      (if (pair? _lis96904_)
          (let _lp196906_ ((_prev96908_ _lis96904_)
                           (_prev-elt96909_ (car _lis96904_))
                           (_lis96910_ (cdr _lis96904_)))
            (if (pair? _lis96910_)
                (let ((_lis-elt96912_ (car _lis96910_))
                      (_next96913_ (cdr _lis96910_)))
                  (if (_=96903_ _prev-elt96909_ _lis-elt96912_)
                      (let _lp296915_ ((_lis96917_ _next96913_))
                        (if (pair? _lis96917_)
                            (let ((_lis-elt96919_ (car _lis96917_))
                                  (_next96920_ (cdr _lis96917_)))
                              (if (_=96903_ _prev-elt96909_ _lis-elt96919_)
                                  (_lp296915_ _next96920_)
                                  (begin
                                    (set-cdr! _prev96908_ _lis96917_)
                                    (_lp196906_
                                     _lis96917_
                                     _lis-elt96919_
                                     _next96920_))))
                            (set-cdr! _prev96908_ _lis96917_)))
                      (_lp196906_ _lis96910_ _lis-elt96912_ _next96913_)))
                '#!void))
          '#!void)
      _lis96904_))
  (define std/srfi/132#vector-delete-neighbor-dups
    (lambda (_elt=96879_ _v96880_ . _maybe-start+end96881_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96880_ _maybe-start+end96881_))
       (lambda (_start96884_ _end96885_)
         (if (< _start96884_ _end96885_)
             (let* ((_x96887_ (vector-ref _v96880_ _start96884_))
                    (_ans96900_
                     (let _recur96889_ ((_x96891_ _x96887_)
                                        (_i96892_ _start96884_)
                                        (_j96893_ '1))
                       (if (< _i96892_ _end96885_)
                           (let ((_y96895_ (vector-ref _v96880_ _i96892_))
                                 (_nexti96896_ (+ _i96892_ '1)))
                             (if (_elt=96879_ _x96891_ _y96895_)
                                 (_recur96889_ _x96891_ _nexti96896_ _j96893_)
                                 (let ((_ansvec96898_
                                        (_recur96889_
                                         _y96895_
                                         _nexti96896_
                                         (+ _j96893_ '1))))
                                   (vector-set!
                                    _ansvec96898_
                                    _j96893_
                                    _y96895_)
                                   _ansvec96898_)))
                           (make-vector _j96893_)))))
               (vector-set! _ans96900_ '0 _x96887_)
               _ans96900_)
             '#())))))
  (define std/srfi/132#vector-delete-neighbor-dups!
    (lambda (_elt=96847_ _v96848_ . _maybe-start+end96849_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96848_ _maybe-start+end96849_))
       (lambda (_start96852_ _end96853_)
         (if (>= _start96852_ _end96853_)
             _end96853_
             (let _skip96855_ ((_j96857_ _start96852_)
                               (_vj96858_ (vector-ref _v96848_ _start96852_)))
               (let ((_j+196860_ (+ _j96857_ '1)))
                 (if (>= _j+196860_ _end96853_)
                     _end96853_
                     (let ((_vj+196862_ (vector-ref _v96848_ _j+196860_)))
                       (if (not (_elt=96847_ _vj96858_ _vj+196862_))
                           (_skip96855_ _j+196860_ _vj+196862_)
                           (let _lp296864_ ((_j96866_ _j96857_)
                                            (_vj96867_ _vj96858_)
                                            (_k96868_ (+ _j96857_ '2)))
                             (let _lp396870_ ((_k96872_ _k96868_))
                               (if (>= _k96872_ _end96853_)
                                   (+ _j96866_ '1)
                                   (let ((_vk96874_
                                          (vector-ref _v96848_ _k96872_))
                                         (_k+196875_ (+ _k96872_ '1)))
                                     (if (_elt=96847_ _vj96867_ _vk96874_)
                                         (_lp396870_ _k+196875_)
                                         (let ((_j+196877_ (+ _j96866_ '1)))
                                           (vector-set!
                                            _v96848_
                                            _j+196877_
                                            _vk96874_)
                                           (_lp296864_
                                            _j+196877_
                                            _vk96874_
                                            _k+196875_)))))))))))))))))
  (define std/srfi/132#list-merge-sort
    (lambda (_elt<96764_ _lis96765_)
      (letrec ((_getrun96767_
                (lambda (_lis96836_)
                  (let _lp96838_ ((_ans96840_ '())
                                  (_i96841_ '1)
                                  (_prev96842_ (car _lis96836_))
                                  (_xs96843_ (cdr _lis96836_)))
                    (if (pair? _xs96843_)
                        (let ((_x96845_ (car _xs96843_)))
                          (if (_elt<96764_ _x96845_ _prev96842_)
                              (values (_append-reverse96768_
                                       _ans96840_
                                       (cons _prev96842_ '()))
                                      _i96841_
                                      _xs96843_)
                              (_lp96838_
                               (cons _prev96842_ _ans96840_)
                               (+ _i96841_ '1)
                               _x96845_
                               (cdr _xs96843_))))
                        (values (_append-reverse96768_
                                 _ans96840_
                                 (cons _prev96842_ '()))
                                _i96841_
                                _xs96843_)))))
               (_append-reverse96768_
                (lambda (_rev-head96828_ _tail96829_)
                  (let _lp96831_ ((_rev-head96833_ _rev-head96828_)
                                  (_tail96834_ _tail96829_))
                    (if (_null-list?96769_ _rev-head96833_)
                        _tail96834_
                        (_lp96831_
                         (cdr _rev-head96833_)
                         (cons (car _rev-head96833_) _tail96834_))))))
               (_null-list?96769_
                (lambda (_l96826_)
                  (if (pair? _l96826_)
                      '#f
                      (if (null? _l96826_)
                          '#t
                          (error '"argument out of domain" _l96826_)))))
               (_merge96770_
                (lambda (_a96812_ _b96813_)
                  (let _recur96815_ ((_x96817_ (car _a96812_))
                                     (_a96818_ _a96812_)
                                     (_y96819_ (car _b96813_))
                                     (_b96820_ _b96813_))
                    (if (_elt<96764_ _y96819_ _x96817_)
                        (cons _y96819_
                              (let ((_b96822_ (cdr _b96820_)))
                                (if (pair? _b96822_)
                                    (_recur96815_
                                     _x96817_
                                     _a96818_
                                     (car _b96822_)
                                     _b96822_)
                                    _a96818_)))
                        (cons _x96817_
                              (let ((_a96824_ (cdr _a96818_)))
                                (if (pair? _a96824_)
                                    (_recur96815_
                                     (car _a96824_)
                                     _a96824_
                                     _y96819_
                                     _b96820_)
                                    _b96820_)))))))
               (_grow96771_
                (lambda (_s96785_ _ls96786_ _ls296787_ _u96788_ _lw96789_)
                  (if (or (<= _lw96789_ _ls96786_) (not (pair? _u96788_)))
                      (values _s96785_ _ls96786_ _u96788_)
                      (let ((_ls296800_
                             (let _lp96794_ ((_ls296796_ _ls296787_))
                               (let ((_ls2*296798_ (+ _ls296796_ _ls296796_)))
                                 (if (<= _ls2*296798_ _ls96786_)
                                     (_lp96794_ _ls2*296798_)
                                     _ls296796_)))))
                        (call-with-values
                         (lambda () (_getrun96767_ _u96788_))
                         (lambda (_r96803_ _lr96804_ _u296805_)
                           (call-with-values
                            (lambda ()
                              (_grow96771_
                               _r96803_
                               _lr96804_
                               '1
                               _u296805_
                               _ls296800_))
                            (lambda (_t96808_ _lt96809_ _u396810_)
                              (_grow96771_
                               (_merge96770_ _s96785_ _t96808_)
                               (+ _ls96786_ _lt96809_)
                               (+ _ls296800_ _ls296800_)
                               _u396810_
                               _lw96789_))))))))))
        (if (pair? _lis96765_)
            (call-with-values
             (lambda () (_getrun96767_ _lis96765_))
             (lambda (_r96774_ _lr96775_ _tail96776_)
               (let ((_infinity96778_ '16777216))
                 (call-with-values
                  (lambda ()
                    (_grow96771_
                     _r96774_
                     _lr96775_
                     '1
                     _tail96776_
                     _infinity96778_))
                  (lambda (_a96781_ _la96782_ _v96783_) _a96781_)))))
            '()))))
  (define std/srfi/132#list-merge-sort!
    (lambda (_elt<96664_ _lis96665_)
      (letrec ((_getrun96667_
                (lambda (_lis96753_)
                  (let _lp96755_ ((_lis96757_ _lis96753_)
                                  (_x96758_ (car _lis96753_))
                                  (_i96759_ '1)
                                  (_next96760_ (cdr _lis96753_)))
                    (if (pair? _next96760_)
                        (let ((_y96762_ (car _next96760_)))
                          (if (_elt<96664_ _y96762_ _x96758_)
                              (values _i96759_ _lis96757_ _next96760_)
                              (_lp96755_
                               _next96760_
                               _y96762_
                               (+ _i96759_ '1)
                               (cdr _next96760_))))
                        (values _i96759_ _lis96757_ _next96760_)))))
               (_merge!96668_
                (lambda (_a96714_ _enda96715_ _b96716_ _endb96717_)
                  (letrec ((_scan-a96719_
                            (lambda (_prev96723_
                                     _x96724_
                                     _a96725_
                                     _y96726_
                                     _b96727_)
                              (if (_elt<96664_ _y96726_ _x96724_)
                                  (begin
                                    (set-cdr! _prev96723_ _b96727_)
                                    (let ((_next-b96729_ (cdr _b96727_)))
                                      (if (eq? _b96727_ _endb96717_)
                                          (begin
                                            (set-cdr! _b96727_ _a96725_)
                                            _enda96715_)
                                          (_scan-b96720_
                                           _b96727_
                                           _x96724_
                                           _a96725_
                                           (car _next-b96729_)
                                           _next-b96729_))))
                                  (if (eq? _a96725_ _enda96715_)
                                      (begin
                                        (_maybe-set-cdr!96721_
                                         _a96725_
                                         _b96727_)
                                        _endb96717_)
                                      (let ((_next-a96731_ (cdr _a96725_)))
                                        (_scan-a96719_
                                         _a96725_
                                         (car _next-a96731_)
                                         _next-a96731_
                                         _y96726_
                                         _b96727_))))))
                           (_scan-b96720_
                            (lambda (_prev96733_
                                     _x96734_
                                     _a96735_
                                     _y96736_
                                     _b96737_)
                              (if (_elt<96664_ _y96736_ _x96734_)
                                  (if (eq? _b96737_ _endb96717_)
                                      (begin
                                        (set-cdr! _b96737_ _a96735_)
                                        _enda96715_)
                                      (let ((_next-b96739_ (cdr _b96737_)))
                                        (_scan-b96720_
                                         _b96737_
                                         _x96734_
                                         _a96735_
                                         (car _next-b96739_)
                                         _next-b96739_)))
                                  (begin
                                    (set-cdr! _prev96733_ _a96735_)
                                    (if (eq? _a96735_ _enda96715_)
                                        (begin
                                          (_maybe-set-cdr!96721_
                                           _a96735_
                                           _b96737_)
                                          _endb96717_)
                                        (let ((_next-a96741_ (cdr _a96735_)))
                                          (_scan-a96719_
                                           _a96735_
                                           (car _next-a96741_)
                                           _next-a96741_
                                           _y96736_
                                           _b96737_)))))))
                           (_maybe-set-cdr!96721_
                            (lambda (_pair96743_ _val96744_)
                              (if (not (eq? (cdr _pair96743_) _val96744_))
                                  (set-cdr! _pair96743_ _val96744_)
                                  '#!void))))
                    (let ((_x96746_ (car _a96714_)) (_y96747_ (car _b96716_)))
                      (if (_elt<96664_ _y96747_ _x96746_)
                          (values _b96716_
                                  (if (eq? _b96716_ _endb96717_)
                                      (begin
                                        (set-cdr! _b96716_ _a96714_)
                                        _enda96715_)
                                      (let ((_next-b96749_ (cdr _b96716_)))
                                        (_scan-b96720_
                                         _b96716_
                                         _x96746_
                                         _a96714_
                                         (car _next-b96749_)
                                         _next-b96749_))))
                          (values _a96714_
                                  (if (eq? _a96714_ _enda96715_)
                                      (begin
                                        (_maybe-set-cdr!96721_
                                         _a96714_
                                         _b96716_)
                                        _endb96717_)
                                      (let ((_next-a96751_ (cdr _a96714_)))
                                        (_scan-a96719_
                                         _a96714_
                                         (car _next-a96751_)
                                         _next-a96751_
                                         _y96747_
                                         _b96716_)))))))))
               (_grow96669_
                (lambda (_s96684_
                         _ends96685_
                         _ls96686_
                         _ls296687_
                         _u96688_
                         _lw96689_)
                  (if (and (pair? _u96688_) (< _ls96686_ _lw96689_))
                      (let ((_ls296697_
                             (let _lp96691_ ((_ls296693_ _ls296687_))
                               (let ((_ls2*296695_ (+ _ls296693_ _ls296693_)))
                                 (if (<= _ls2*296695_ _ls96686_)
                                     (_lp96691_ _ls2*296695_)
                                     _ls296693_)))))
                        (call-with-values
                         (lambda () (_getrun96667_ _u96688_))
                         (lambda (_lr96700_ _endr96701_ _u296702_)
                           (call-with-values
                            (lambda ()
                              (_grow96669_
                               _u96688_
                               _endr96701_
                               _lr96700_
                               '1
                               _u296702_
                               _ls296697_))
                            (lambda (_t96705_ _endt96706_ _lt96707_ _u396708_)
                              (call-with-values
                               (lambda ()
                                 (_merge!96668_
                                  _s96684_
                                  _ends96685_
                                  _t96705_
                                  _endt96706_))
                               (lambda (_st96711_ _end-st96712_)
                                 (_grow96669_
                                  _st96711_
                                  _end-st96712_
                                  (+ _ls96686_ _lt96707_)
                                  (+ _ls296697_ _ls296697_)
                                  _u396708_
                                  _lw96689_))))))))
                      (values _s96684_ _ends96685_ _ls96686_ _u96688_)))))
        (if (pair? _lis96665_)
            (call-with-values
             (lambda () (_getrun96667_ _lis96665_))
             (lambda (_lr96672_ _endr96673_ _rest96674_)
               (let ((_infinity96676_ '16777216))
                 (call-with-values
                  (lambda ()
                    (_grow96669_
                     _lis96665_
                     _endr96673_
                     _lr96672_
                     '1
                     _rest96674_
                     _infinity96676_))
                  (lambda (_a96679_ _enda96680_ _la96681_ _v96682_)
                    (set-cdr! _enda96680_ '())
                    _a96679_)))))
            '()))))
  (define std/srfi/132#list-merge
    (lambda (_<96649_ _a96650_ _b96651_)
      (if (not (pair? _a96650_))
          _b96651_
          (if (not (pair? _b96651_))
              _a96650_
              (let _recur96653_ ((_x96655_ (car _a96650_))
                                 (_a96656_ _a96650_)
                                 (_y96657_ (car _b96651_))
                                 (_b96658_ _b96651_))
                (if (_<96649_ _y96657_ _x96655_)
                    (let ((_b96660_ (cdr _b96658_)))
                      (if (pair? _b96660_)
                          (cons _y96657_
                                (_recur96653_
                                 _x96655_
                                 _a96656_
                                 (car _b96660_)
                                 _b96660_))
                          (cons _y96657_ _a96656_)))
                    (let ((_a96662_ (cdr _a96656_)))
                      (if (pair? _a96662_)
                          (cons _x96655_
                                (_recur96653_
                                 (car _a96662_)
                                 _a96662_
                                 _y96657_
                                 _b96658_))
                          (cons _x96655_ _b96658_)))))))))
  (define std/srfi/132#list-merge!
    (lambda (_<96618_ _a96619_ _b96620_)
      (letrec ((_scan-a96622_
                (lambda (_prev96625_ _a96626_ _x96627_ _b96628_ _y96629_)
                  (if (_<96618_ _y96629_ _x96627_)
                      (let ((_next-b96631_ (cdr _b96628_)))
                        (set-cdr! _prev96625_ _b96628_)
                        (if (pair? _next-b96631_)
                            (_scan-b96623_
                             _b96628_
                             _a96626_
                             _x96627_
                             _next-b96631_
                             (car _next-b96631_))
                            (set-cdr! _b96628_ _a96626_)))
                      (let ((_next-a96633_ (cdr _a96626_)))
                        (if (pair? _next-a96633_)
                            (_scan-a96622_
                             _a96626_
                             _next-a96633_
                             (car _next-a96633_)
                             _b96628_
                             _y96629_)
                            (set-cdr! _a96626_ _b96628_))))))
               (_scan-b96623_
                (lambda (_prev96635_ _a96636_ _x96637_ _b96638_ _y96639_)
                  (if (_<96618_ _y96639_ _x96637_)
                      (let ((_next-b96641_ (cdr _b96638_)))
                        (if (pair? _next-b96641_)
                            (_scan-b96623_
                             _b96638_
                             _a96636_
                             _x96637_
                             _next-b96641_
                             (car _next-b96641_))
                            (set-cdr! _b96638_ _a96636_)))
                      (let ((_next-a96643_ (cdr _a96636_)))
                        (set-cdr! _prev96635_ _a96636_)
                        (if (pair? _next-a96643_)
                            (_scan-a96622_
                             _a96636_
                             _next-a96643_
                             (car _next-a96643_)
                             _b96638_
                             _y96639_)
                            (set-cdr! _a96636_ _b96638_)))))))
        (if (not (pair? _a96619_))
            _b96620_
            (if (not (pair? _b96620_))
                _a96619_
                (if (_<96618_ (car _b96620_) (car _a96619_))
                    (begin
                      (let ((_next-b96645_ (cdr _b96620_)))
                        (if (null? _next-b96645_)
                            (set-cdr! _b96620_ _a96619_)
                            (_scan-b96623_
                             _b96620_
                             _a96619_
                             (car _a96619_)
                             _next-b96645_
                             (car _next-b96645_))))
                      _b96620_)
                    (begin
                      (let ((_next-a96647_ (cdr _a96619_)))
                        (if (null? _next-a96647_)
                            (set-cdr! _a96619_ _b96620_)
                            (_scan-a96622_
                             _a96619_
                             _next-a96647_
                             (car _next-a96647_)
                             _b96620_
                             (car _b96620_))))
                      _a96619_)))))))
  (define std/srfi/132#list-sorted?
    (lambda (_<96602_ _list96603_)
      (let ((_$e96605_ (not (pair? _list96603_))))
        (if _$e96605_
            _$e96605_
            (let _lp96608_ ((_prev96610_ (car _list96603_))
                            (_tail96611_ (cdr _list96603_)))
              (let ((_$e96613_ (not (pair? _tail96611_))))
                (if _$e96613_
                    _$e96613_
                    (let ((_next96616_ (car _tail96611_)))
                      (if (not (_<96602_ _next96616_ _prev96610_))
                          (_lp96608_ _next96616_ (cdr _tail96611_))
                          '#f)))))))))
  (define std/srfi/132#vector-sorted?
    (lambda (_elt<96581_ _v96582_ . _maybe-start+end96583_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96582_ _maybe-start+end96583_))
       (lambda (_start96586_ _end96587_)
         (let ((_$e96589_ (>= _start96586_ _end96587_)))
           (if _$e96589_
               _$e96589_
               (let _lp96592_ ((_i96594_ (+ _start96586_ '1))
                               (_vi-196595_
                                (vector-ref _v96582_ _start96586_)))
                 (let ((_$e96597_ (>= _i96594_ _end96587_)))
                   (if _$e96597_
                       _$e96597_
                       (let ((_vi96600_ (vector-ref _v96582_ _i96594_)))
                         (if (not (_elt<96581_ _vi96600_ _vi-196595_))
                             (_lp96592_ (+ _i96594_ '1) _vi96600_)
                             '#f)))))))))))
  (define std/srfi/132#vector-portion-copy
    (lambda (_vec96564_ _start96565_ _end96566_)
      (let* ((_len96568_ (vector-length _vec96564_))
             (_new-len96570_ (- _end96566_ _start96565_))
             (_new96572_ (make-vector _new-len96570_)))
        (let _$loop96575_ ((_i96578_ _start96565_) (_j96579_ '0))
          (if (= _i96578_ _end96566_)
              _new96572_
              (begin
                (vector-set!
                 _new96572_
                 _j96579_
                 (vector-ref _vec96564_ _i96578_))
                (_$loop96575_ (+ _i96578_ '1) (+ _j96579_ '1))))))))
  (define std/srfi/132#vector-copy
    (lambda (_vec96562_)
      (std/srfi/132#vector-portion-copy
       _vec96562_
       '0
       (vector-length _vec96562_))))
  (define std/srfi/132#vector-portion-copy!
    (lambda (_target96549_ _src96550_ _start96551_ _end96552_)
      (let ((_len96554_ (- _end96552_ _start96551_)))
        (let _$loop96556_ ((_i96559_ (- _len96554_ '1))
                           (_j96560_ (- _end96552_ '1)))
          (if (< _i96559_ '0)
              '#!void
              (begin
                (vector-set!
                 _target96549_
                 _i96559_
                 (vector-ref _src96550_ _j96560_))
                (_$loop96556_ (- _i96559_ '1) (- _j96560_ '1))))))))
  (define std/srfi/132#has-element
    (lambda (_list96546_ _index96547_)
      (if (zero? _index96547_)
          (if (pair? _list96546_)
              (values '#t (car _list96546_))
              (values '#f '#f))
          (if (null? _list96546_)
              (values '#f '#f)
              (std/srfi/132#has-element
               (cdr _list96546_)
               (- _index96547_ '1))))))
  (define std/srfi/132#list-ref-or-default
    (lambda (_list96538_ _index96539_ _default96540_)
      (call-with-values
       (lambda () (std/srfi/132#has-element _list96538_ _index96539_))
       (lambda (_has?96543_ _maybe96544_)
         (if _has?96543_ _maybe96544_ _default96540_)))))
  (define std/srfi/132#vector-start+end
    (lambda (_vector96532_ _maybe-start+end96533_)
      (let ((_start96535_
             (std/srfi/132#list-ref-or-default _maybe-start+end96533_ '0 '0))
            (_end96536_
             (std/srfi/132#list-ref-or-default
              _maybe-start+end96533_
              '1
              (vector-length _vector96532_))))
        (values _start96535_ _end96536_))))
  (define std/srfi/132#vectors-start+end-2
    (lambda (_vector-196523_ _vector-296524_ _maybe-start+end96525_)
      (let ((_start-196527_
             (std/srfi/132#list-ref-or-default _maybe-start+end96525_ '0 '0))
            (_end-196528_
             (std/srfi/132#list-ref-or-default
              _maybe-start+end96525_
              '1
              (vector-length _vector-196523_)))
            (_start-296529_
             (std/srfi/132#list-ref-or-default _maybe-start+end96525_ '2 '0))
            (_end-296530_
             (std/srfi/132#list-ref-or-default
              _maybe-start+end96525_
              '3
              (vector-length _vector-296524_))))
        (values _start-196527_ _end-196528_ _start-296529_ _end-296530_))))
  (define std/srfi/132#really-vector-heap-sort!
    (lambda (_elt<96473_ _v96474_ _start96475_ _end96476_)
      (letrec ((_restore-heap!96478_
                (lambda (_end96494_ _i96495_)
                  (let* ((_vi96497_ (vector-ref _v96474_ _i96495_))
                         (_first-leaf96499_
                          (quotient (+ _start96475_ _end96494_) '2))
                         (_final-k96520_
                          (let _lp96501_ ((_k96503_ _i96495_))
                            (if (>= _k96503_ _first-leaf96499_)
                                _k96503_
                                (let* ((_k*2-start96505_
                                        (+ _k96503_ (- _k96503_ _start96475_)))
                                       (_child196507_ (+ '1 _k*2-start96505_))
                                       (_child296509_ (+ '2 _k*2-start96505_))
                                       (_child1-val96511_
                                        (vector-ref _v96474_ _child196507_)))
                                  (call-with-values
                                   (lambda ()
                                     (if (< _child296509_ _end96494_)
                                         (let ((_child2-val96515_
                                                (vector-ref
                                                 _v96474_
                                                 _child296509_)))
                                           (if (_elt<96473_
                                                _child2-val96515_
                                                _child1-val96511_)
                                               (values _child196507_
                                                       _child1-val96511_)
                                               (values _child296509_
                                                       _child2-val96515_)))
                                         (values _child196507_
                                                 _child1-val96511_)))
                                   (lambda (_max-child96517_
                                            _max-child-val96518_)
                                     (if (_elt<96473_
                                          _vi96497_
                                          _max-child-val96518_)
                                         (begin
                                           (vector-set!
                                            _v96474_
                                            _k96503_
                                            _max-child-val96518_)
                                           (_lp96501_ _max-child96517_))
                                         _k96503_))))))))
                    (vector-set! _v96474_ _final-k96520_ _vi96497_)))))
        (let ((_first-leaf96480_ (quotient (+ _start96475_ _end96476_) '2)))
          (let _$loop96482_ ((_i96485_ (- _first-leaf96480_ '1)))
            (if (< _i96485_ _start96475_)
                '#!void
                (begin
                  (_restore-heap!96478_ _end96476_ _i96485_)
                  (_$loop96482_ (- _i96485_ '1))))))
        (let _$loop96487_ ((_i96490_ (- _end96476_ '1)))
          (if (<= _i96490_ _start96475_)
              '#!void
              (begin
                (let ((_top96492_ (vector-ref _v96474_ _start96475_)))
                  (vector-set!
                   _v96474_
                   _start96475_
                   (vector-ref _v96474_ _i96490_))
                  (vector-set! _v96474_ _i96490_ _top96492_)
                  (_restore-heap!96478_ _i96490_ _start96475_))
                (_$loop96487_ (- _i96490_ '1))))))))
  (define std/srfi/132#vector-heap-sort!
    (lambda (_elt<96465_ _v96466_ . _maybe-start+end96467_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96466_ _maybe-start+end96467_))
       (lambda (_start96470_ _end96471_)
         (std/srfi/132#really-vector-heap-sort!
          _elt<96465_
          _v96466_
          _start96470_
          _end96471_)))))
  (define std/srfi/132#vector-heap-sort
    (lambda (_elt<96455_ _v96456_ . _maybe-start+end96457_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96456_ _maybe-start+end96457_))
       (lambda (_start96460_ _end96461_)
         (let ((_ans96463_
                (std/srfi/132#vector-portion-copy
                 _v96456_
                 _start96460_
                 _end96461_)))
           (std/srfi/132#really-vector-heap-sort!
            _elt<96455_
            _ans96463_
            '0
            (- _end96461_ _start96460_))
           _ans96463_)))))
  (define std/srfi/132#vector-insert-sort
    (lambda (_elt<96445_ _v96446_ . _maybe-start+end96447_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96446_ _maybe-start+end96447_))
       (lambda (_start96450_ _end96451_)
         (let ((_ans96453_
                (std/srfi/132#vector-portion-copy
                 _v96446_
                 _start96450_
                 _end96451_)))
           (std/srfi/132#%vector-insert-sort!
            _elt<96445_
            _ans96453_
            '0
            (- _end96451_ _start96450_))
           _ans96453_)))))
  (define std/srfi/132#vector-insert-sort!
    (lambda (_<96437_ _v96438_ . _maybe-start+end96439_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96438_ _maybe-start+end96439_))
       (lambda (_start96442_ _end96443_)
         (std/srfi/132#%vector-insert-sort!
          _<96437_
          _v96438_
          _start96442_
          _end96443_)))))
  (define std/srfi/132#%vector-insert-sort!
    (lambda (_elt<96416_ _v96417_ _start96418_ _end96419_)
      (let _$loop96421_ ((_i96424_ (+ '1 _start96418_)))
        (if (>= _i96424_ _end96419_)
            '#!void
            (begin
              (let ((_val96426_ (vector-ref _v96417_ _i96424_)))
                (vector-set!
                 _v96417_
                 (let _lp96428_ ((_j96430_ _i96424_))
                   (if (<= _j96430_ _start96418_)
                       _start96418_
                       (let* ((_j-196432_ (- _j96430_ '1))
                              (_vj-196434_ (vector-ref _v96417_ _j-196432_)))
                         (if (_elt<96416_ _val96426_ _vj-196434_)
                             (begin
                               (vector-set! _v96417_ _j96430_ _vj-196434_)
                               (_lp96428_ _j-196432_))
                             _j96430_))))
                 _val96426_))
              (_$loop96421_ (+ _i96424_ '1)))))))
  (define std/srfi/132#vector-merge
    (lambda (_<96403_ _v196404_ _v296405_ . _maybe-starts+ends96406_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vectors-start+end-2
          _v196404_
          _v296405_
          _maybe-starts+ends96406_))
       (lambda (_start196409_ _end196410_ _start296411_ _end296412_)
         (let ((_ans96414_
                (make-vector
                 (+ (- _end196410_ _start196409_)
                    (- _end296412_ _start296411_)))))
           (std/srfi/132#%vector-merge!
            _<96403_
            _ans96414_
            _v196404_
            _v296405_
            '0
            _start196409_
            _end196410_
            _start296411_
            _end296412_)
           _ans96414_)))))
  (define std/srfi/132#vector-merge!
    (lambda (_<96387_ _v96388_ _v196389_ _v296390_ . _maybe-starts+ends96391_)
      (call-with-values
       (lambda ()
         (if (pair? _maybe-starts+ends96391_)
             (values (car _maybe-starts+ends96391_)
                     (cdr _maybe-starts+ends96391_))
             (values '0 '())))
       (lambda (_start96394_ _rest96395_)
         (call-with-values
          (lambda ()
            (std/srfi/132#vectors-start+end-2 _v196389_ _v296390_ _rest96395_))
          (lambda (_start196398_ _end196399_ _start296400_ _end296401_)
            (std/srfi/132#%vector-merge!
             _<96387_
             _v96388_
             _v196389_
             _v296390_
             _start96394_
             _start196398_
             _end196399_
             _start296400_
             _end296401_)))))))
  (define std/srfi/132#%vector-merge!
    (lambda (_elt<96349_
             _v96350_
             _v196351_
             _v296352_
             _start96353_
             _start196354_
             _end196355_
             _start296356_
             _end296357_)
      (letrec ((_vblit96359_
                (lambda (_fromv96361_ _j96362_ _i96363_ _end96364_)
                  (let _lp96366_ ((_j96368_ _j96362_) (_i96369_ _i96363_))
                    (vector-set!
                     _v96350_
                     _i96369_
                     (vector-ref _fromv96361_ _j96368_))
                    (let ((_j96371_ (+ _j96368_ '1)))
                      (if (< _j96371_ _end96364_)
                          (_lp96366_ _j96371_ (+ _i96369_ '1))
                          '#!void))))))
        (if (<= _end196355_ _start196354_)
            (if (< _start296356_ _end296357_)
                (_vblit96359_ _v296352_ _start296356_ _start96353_ _end296357_)
                '#!void)
            (if (<= _end296357_ _start296356_)
                (_vblit96359_ _v196351_ _start196354_ _start96353_ _end196355_)
                (let _lp96373_ ((_i96375_ _start96353_)
                                (_j96376_ _start196354_)
                                (_x96377_ (vector-ref _v196351_ _start196354_))
                                (_k96378_ _start296356_)
                                (_y96379_
                                 (vector-ref _v296352_ _start296356_)))
                  (let ((_i196381_ (+ _i96375_ '1)))
                    (if (_elt<96349_ _y96379_ _x96377_)
                        (let ((_k96383_ (+ _k96378_ '1)))
                          (vector-set! _v96350_ _i96375_ _y96379_)
                          (if (< _k96383_ _end296357_)
                              (_lp96373_
                               _i196381_
                               _j96376_
                               _x96377_
                               _k96383_
                               (vector-ref _v296352_ _k96383_))
                              (_vblit96359_
                               _v196351_
                               _j96376_
                               _i196381_
                               _end196355_)))
                        (let ((_j96385_ (+ _j96376_ '1)))
                          (vector-set! _v96350_ _i96375_ _x96377_)
                          (if (< _j96385_ _end196355_)
                              (_lp96373_
                               _i196381_
                               _j96385_
                               (vector-ref _v196351_ _j96385_)
                               _k96378_
                               _y96379_)
                              (_vblit96359_
                               _v296352_
                               _k96378_
                               _i196381_
                               _end296357_)))))))))))
  (define std/srfi/132#vector-merge-sort!
    (lambda (_<96339_ _v96340_ . _maybe-args96341_)
      (call-with-values
       (lambda () (std/srfi/132#vector-start+end _v96340_ _maybe-args96341_))
       (lambda (_start96344_ _end96345_)
         (let ((_temp96347_
                (if (and (pair? _maybe-args96341_)
                         (pair? (cdr _maybe-args96341_))
                         (pair? (cddr _maybe-args96341_)))
                    (caddr _maybe-args96341_)
                    (std/srfi/132#vector-copy _v96340_))))
           (std/srfi/132#%vector-merge-sort!
            _<96339_
            _v96340_
            _start96344_
            _end96345_
            _temp96347_))))))
  (define std/srfi/132#vector-merge-sort
    (lambda (_<96329_ _v96330_ . _maybe-args96331_)
      (call-with-values
       (lambda () (std/srfi/132#vector-start+end _v96330_ _maybe-args96331_))
       (lambda (_start96334_ _end96335_)
         (let ((_ans96337_ (subvector _v96330_ _start96334_ _end96335_)))
           (std/srfi/132#vector-merge-sort! _<96329_ _ans96337_)
           _ans96337_)))))
  (define std/srfi/132#%vector-merge-sort!
    (lambda (_elt<96227_ _v096228_ _l96229_ _r96230_ _temp096231_)
      (letrec ((_xor96233_
                (lambda (_a96326_ _b96327_) (not (eq? _a96326_ _b96327_))))
               (_merge96234_
                (lambda (_target96285_
                         _v196286_
                         _v296287_
                         _l96288_
                         _len196289_
                         _len296290_
                         _v2=target?96291_)
                  (letrec ((_vblit96293_
                            (lambda (_fromv96295_ _j96296_ _i96297_ _end96298_)
                              (let _lp96300_ ((_j96302_ _j96296_)
                                              (_i96303_ _i96297_))
                                (vector-set!
                                 _target96285_
                                 _i96303_
                                 (vector-ref _fromv96295_ _j96302_))
                                (let ((_j96305_ (+ _j96302_ '1)))
                                  (if (< _j96305_ _end96298_)
                                      (_lp96300_ _j96305_ (+ _i96303_ '1))
                                      '#!void))))))
                    (let* ((_r196307_ (+ _l96288_ _len196289_))
                           (_r296309_ (+ _r196307_ _len296290_)))
                      (let _lp96312_ ((_n96314_ _l96288_)
                                      (_j96315_ _l96288_)
                                      (_x96316_
                                       (vector-ref _v196286_ _l96288_))
                                      (_k96317_ _r196307_)
                                      (_y96318_
                                       (vector-ref _v296287_ _r196307_)))
                        (let ((_n+196320_ (+ _n96314_ '1)))
                          (if (_elt<96227_ _y96318_ _x96316_)
                              (let ((_k96322_ (+ _k96317_ '1)))
                                (vector-set! _target96285_ _n96314_ _y96318_)
                                (if (< _k96322_ _r296309_)
                                    (_lp96312_
                                     _n+196320_
                                     _j96315_
                                     _x96316_
                                     _k96322_
                                     (vector-ref _v296287_ _k96322_))
                                    (_vblit96293_
                                     _v196286_
                                     _j96315_
                                     _n+196320_
                                     _r196307_)))
                              (let ((_j96324_ (+ _j96315_ '1)))
                                (vector-set! _target96285_ _n96314_ _x96316_)
                                (if (< _j96324_ _r196307_)
                                    (_lp96312_
                                     _n+196320_
                                     _j96324_
                                     (vector-ref _v196286_ _j96324_)
                                     _k96317_
                                     _y96318_)
                                    (if (not _v2=target?96291_)
                                        (_vblit96293_
                                         _v296287_
                                         _k96317_
                                         _n+196320_
                                         _r296309_)
                                        '#!void))))))))))
               (_getrun96235_
                (lambda (_v96274_ _l96275_ _r96276_)
                  (let _lp96278_ ((_i96280_ (+ _l96275_ '1))
                                  (_x96281_ (vector-ref _v96274_ _l96275_)))
                    (if (>= _i96280_ _r96276_)
                        (- _i96280_ _l96275_)
                        (let ((_y96283_ (vector-ref _v96274_ _i96280_)))
                          (if (_elt<96227_ _y96283_ _x96281_)
                              (- _i96280_ _l96275_)
                              (_lp96278_ (+ _i96280_ '1) _y96283_))))))))
        (if (< _l96229_ _r96230_)
            (call-with-values
             (lambda ()
               (let _recur96238_ ((_l96240_ _l96229_)
                                  (_want96241_ (- _r96230_ _l96229_)))
                 (let ((_len96243_ (- _r96230_ _l96240_)))
                   (let _lp96245_ ((_pfxlen96247_
                                    (_getrun96235_
                                     _v096228_
                                     _l96240_
                                     _r96230_))
                                   (_pfxlen296248_ '1)
                                   (_v96249_ _v096228_)
                                   (_temp96250_ _temp096231_)
                                   (_v=v0?96251_ '#t))
                     (if (or (>= _pfxlen96247_ _want96241_)
                             (= _pfxlen96247_ _len96243_))
                         (values _pfxlen96247_ _v96249_ _v=v0?96251_)
                         (let ((_pfxlen296262_
                                (let _lp96256_ ((_j96258_ _pfxlen296248_))
                                  (let ((_j*296260_ (+ _j96258_ _j96258_)))
                                    (if (<= _j96258_ _pfxlen96247_)
                                        (_lp96256_ _j*296260_)
                                        _j96258_))))
                               (_tail-len96263_ (- _len96243_ _pfxlen96247_)))
                           (call-with-values
                            (lambda ()
                              (_recur96238_
                               (+ _pfxlen96247_ _l96240_)
                               _pfxlen296262_))
                            (lambda (_nr-len96266_
                                     _nr-vec96267_
                                     _nrvec=v0?96268_)
                              (_merge96234_
                               _temp96250_
                               _v96249_
                               _nr-vec96267_
                               _l96240_
                               _pfxlen96247_
                               _nr-len96266_
                               (_xor96233_ _nrvec=v0?96268_ _v=v0?96251_))
                              (_lp96245_
                               (+ _pfxlen96247_ _nr-len96266_)
                               (+ _pfxlen296262_ _pfxlen296262_)
                               _temp96250_
                               _v96249_
                               (not _v=v0?96251_))))))))))
             (lambda (_ignored-len96270_
                      _ignored-ansvec96271_
                      _ansvec=v0?96272_)
               (if (not _ansvec=v0?96272_)
                   (subvector-move!
                    _v096228_
                    _l96229_
                    _temp096231_
                    _l96229_
                    _r96230_)
                   '#!void)))
            '#!void))))
  (define std/srfi/132#vector-quick-sort!
    (lambda (_<96219_ _v96220_ . _maybe-start+end96221_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96220_ _maybe-start+end96221_))
       (lambda (_start96224_ _end96225_)
         (std/srfi/132#%quick-sort!
          _<96219_
          _v96220_
          _start96224_
          _end96225_)))))
  (define std/srfi/132#vector-quick-sort
    (lambda (_<96209_ _v96210_ . _maybe-start+end96211_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96210_ _maybe-start+end96211_))
       (lambda (_start96214_ _end96215_)
         (let ((_ans96217_ (make-vector (- _end96215_ _start96214_))))
           (std/srfi/132#vector-portion-copy!
            _ans96217_
            _v96210_
            _start96214_
            _end96215_)
           (std/srfi/132#%quick-sort!
            _<96209_
            _ans96217_
            '0
            (- _end96215_ _start96214_))
           _ans96217_)))))
  (define std/srfi/132#%quick-sort!
    (lambda (_elt<96139_ _v96140_ _start96141_ _end96142_)
      (letrec ((_swap96144_
                (lambda (_l96202_ _r96203_ _n96204_)
                  (if (> _n96204_ '0)
                      (let ((_x96206_ (vector-ref _v96140_ _l96202_))
                            (_r-196207_ (- _r96203_ '1)))
                        (vector-set!
                         _v96140_
                         _l96202_
                         (vector-ref _v96140_ _r-196207_))
                        (vector-set! _v96140_ _r-196207_ _x96206_)
                        (_swap96144_
                         (+ _l96202_ '1)
                         _r-196207_
                         (- _n96204_ '1)))
                      '#!void)))
               (_median96145_
                (lambda (_v196194_ _v296195_ _v396196_)
                  (call-with-values
                   (lambda ()
                     (if (_elt<96139_ _v196194_ _v296195_)
                         (values _v196194_ _v296195_)
                         (values _v296195_ _v196194_)))
                   (lambda (_little96199_ _big96200_)
                     (if (_elt<96139_ _big96200_ _v396196_)
                         _big96200_
                         (if (_elt<96139_ _little96199_ _v396196_)
                             _v396196_
                             _little96199_)))))))
        (let _recur96147_ ((_l96149_ _start96141_) (_r96150_ _end96142_))
          (if (< '10 (- _r96150_ _l96149_))
              (let ((_pivot96152_
                     (_median96145_
                      (vector-ref _v96140_ _l96149_)
                      (vector-ref _v96140_ (quotient (+ _l96149_ _r96150_) '2))
                      (vector-ref _v96140_ (- _r96150_ '1)))))
                (letrec ((_lscan96154_
                          (lambda (_i96158_ _j96159_ _k96160_ _m96161_)
                            (let _lp96163_ ((_i96165_ _i96158_)
                                            (_j96166_ _j96159_))
                              (if (> _j96166_ _k96160_)
                                  (_done96156_ _i96165_ _j96166_ _m96161_)
                                  (let ((_x96168_
                                         (vector-ref _v96140_ _j96166_)))
                                    (if (_elt<96139_ _x96168_ _pivot96152_)
                                        (_lp96163_ _i96165_ (+ _j96166_ '1))
                                        (if (_elt<96139_ _pivot96152_ _x96168_)
                                            (_rscan96155_
                                             _i96165_
                                             _j96166_
                                             _k96160_
                                             _m96161_)
                                            (begin
                                              (if (< _i96165_ _j96166_)
                                                  (begin
                                                    (vector-set!
                                                     _v96140_
                                                     _j96166_
                                                     (vector-ref
                                                      _v96140_
                                                      _i96165_))
                                                    (vector-set!
                                                     _v96140_
                                                     _i96165_
                                                     _x96168_))
                                                  '#!void)
                                              (_lp96163_
                                               (+ _i96165_ '1)
                                               (+ _j96166_ '1))))))))))
                         (_rscan96155_
                          (lambda (_i96170_ _j96171_ _k96172_ _m96173_)
                            (let _lp96175_ ((_k96177_ _k96172_)
                                            (_m96178_ _m96173_))
                              (if (<= _k96177_ _j96171_)
                                  (_done96156_ _i96170_ _j96171_ _m96178_)
                                  (let ((_x96180_
                                         (vector-ref _v96140_ _k96177_)))
                                    (if (_elt<96139_ _pivot96152_ _x96180_)
                                        (_lp96175_ (- _k96177_ '1) _m96178_)
                                        (if (_elt<96139_ _x96180_ _pivot96152_)
                                            (begin
                                              (vector-set!
                                               _v96140_
                                               _k96177_
                                               (vector-ref _v96140_ _j96171_))
                                              (vector-set!
                                               _v96140_
                                               _j96171_
                                               _x96180_)
                                              (_lscan96154_
                                               _i96170_
                                               (+ _j96171_ '1)
                                               (- _k96177_ '1)
                                               _m96178_))
                                            (begin
                                              (if (< _k96177_ _m96178_)
                                                  (begin
                                                    (vector-set!
                                                     _v96140_
                                                     _k96177_
                                                     (vector-ref
                                                      _v96140_
                                                      _m96178_))
                                                    (vector-set!
                                                     _v96140_
                                                     _m96178_
                                                     _x96180_))
                                                  '#!void)
                                              (_lp96175_
                                               (- _k96177_ '1)
                                               (- _m96178_ '1))))))))))
                         (_done96156_
                          (lambda (_i96183_ _j96184_ _m96185_)
                            (let ((_num<96187_ (- _j96184_ _i96183_))
                                  (_num>96188_ (+ '1 (- _m96185_ _j96184_)))
                                  (_num=l96189_ (- _i96183_ _l96149_))
                                  (_num=r96190_ (- (- _r96150_ _m96185_) '1)))
                              (_swap96144_
                               _l96149_
                               _j96184_
                               (min _num<96187_ _num=l96189_))
                              (_swap96144_
                               _j96184_
                               _r96150_
                               (min _num>96188_ _num=r96190_))
                              (if (<= _num<96187_ _num>96188_)
                                  (begin
                                    (_recur96147_
                                     _l96149_
                                     (+ _l96149_ _num<96187_))
                                    (_recur96147_
                                     (- _r96150_ _num>96188_)
                                     _r96150_))
                                  (begin
                                    (_recur96147_
                                     (- _r96150_ _num>96188_)
                                     _r96150_)
                                    (_recur96147_
                                     _l96149_
                                     (+ _l96149_ _num<96187_))))))))
                  (let ((_r-196192_ (- _r96150_ '1)))
                    (_lscan96154_ _l96149_ _l96149_ _r-196192_ _r-196192_))))
              (std/srfi/132#%vector-insert-sort!
               _elt<96139_
               _v96140_
               _l96149_
               _r96150_))))))
  (define std/srfi/132#vector-quick-sort3!
    (lambda (_c96131_ _v96132_ . _maybe-start+end96133_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96132_ _maybe-start+end96133_))
       (lambda (_start96136_ _end96137_)
         (std/srfi/132#%quick-sort3!
          _c96131_
          _v96132_
          _start96136_
          _end96137_)))))
  (define std/srfi/132#vector-quick-sort3
    (lambda (_c96121_ _v96122_ . _maybe-start+end96123_)
      (call-with-values
       (lambda ()
         (std/srfi/132#vector-start+end _v96122_ _maybe-start+end96123_))
       (lambda (_start96126_ _end96127_)
         (let ((_ans96129_ (make-vector (- _end96127_ _start96126_))))
           (std/srfi/132#vector-portion-copy!
            _ans96129_
            _v96122_
            _start96126_
            _end96127_)
           (std/srfi/132#%quick-sort3!
            _c96121_
            _ans96129_
            '0
            (- _end96127_ _start96126_))
           _ans96129_)))))
  (define std/srfi/132#%quick-sort3!
    (lambda (_c96030_ _v96031_ _start96032_ _end96033_)
      (letrec ((_swap96035_
                (lambda (_l96114_ _r96115_ _n96116_)
                  (if (> _n96116_ '0)
                      (let ((_x96118_ (vector-ref _v96031_ _l96114_))
                            (_r-196119_ (- _r96115_ '1)))
                        (vector-set!
                         _v96031_
                         _l96114_
                         (vector-ref _v96031_ _r-196119_))
                        (vector-set! _v96031_ _r-196119_ _x96118_)
                        (_swap96035_
                         (+ _l96114_ '1)
                         _r-196119_
                         (- _n96116_ '1)))
                      '#!void)))
               (_sort396036_
                (lambda (_v196106_ _v296107_ _v396108_)
                  (call-with-values
                   (lambda ()
                     (if (< (_c96030_ _v196106_ _v296107_) '0)
                         (values _v196106_ _v296107_)
                         (values _v296107_ _v196106_)))
                   (lambda (_little96111_ _big96112_)
                     (if (< (_c96030_ _big96112_ _v396108_) '0)
                         (values _little96111_ _big96112_ _v396108_)
                         (if (< (_c96030_ _little96111_ _v396108_) '0)
                             (values _little96111_ _v396108_ _big96112_)
                             (values _v396108_ _little96111_ _big96112_)))))))
               (_elt<96037_
                (lambda (_v196103_ _v296104_)
                  (negative? (_c96030_ _v196103_ _v296104_)))))
        (let _recur96039_ ((_l96041_ _start96032_) (_r96042_ _end96033_))
          (if (< '10 (- _r96042_ _l96041_))
              (let* ((_r-196044_ (- _r96042_ '1))
                     (_mid96046_ (quotient (+ _l96041_ _r96042_) '2))
                     (_l+196048_ (+ _l96041_ '1))
                     (_pivot96057_
                      (call-with-values
                       (lambda ()
                         (_sort396036_
                          (vector-ref _v96031_ _l96041_)
                          (vector-ref _v96031_ _mid96046_)
                          (vector-ref _v96031_ _r-196044_)))
                       (lambda (_lo96051_ _piv96052_ _hi96053_)
                         (let ((_tmp96055_ (vector-ref _v96031_ _l+196048_)))
                           (vector-set! _v96031_ _l96041_ _piv96052_)
                           (vector-set! _v96031_ _r-196044_ _hi96053_)
                           (vector-set! _v96031_ _l+196048_ _lo96051_)
                           (vector-set! _v96031_ _mid96046_ _tmp96055_)
                           _piv96052_)))))
                (letrec ((_lscan96060_
                          (lambda (_i96064_ _j96065_ _k96066_ _m96067_)
                            (let _lp96069_ ((_i96071_ _i96064_)
                                            (_j96072_ _j96065_))
                              (if (> _j96072_ _k96066_)
                                  (_done96062_ _i96071_ _j96072_ _m96067_)
                                  (let* ((_x96074_
                                          (vector-ref _v96031_ _j96072_))
                                         (_sign96076_
                                          (_c96030_ _x96074_ _pivot96057_)))
                                    (if (< _sign96076_ '0)
                                        (_lp96069_ _i96071_ (+ _j96072_ '1))
                                        (if (= _sign96076_ '0)
                                            (begin
                                              (if (< _i96071_ _j96072_)
                                                  (begin
                                                    (vector-set!
                                                     _v96031_
                                                     _j96072_
                                                     (vector-ref
                                                      _v96031_
                                                      _i96071_))
                                                    (vector-set!
                                                     _v96031_
                                                     _i96071_
                                                     _x96074_))
                                                  '#!void)
                                              (_lp96069_
                                               (+ _i96071_ '1)
                                               (+ _j96072_ '1)))
                                            (if (> _sign96076_ '0)
                                                (_rscan96061_
                                                 _i96071_
                                                 _j96072_
                                                 _k96066_
                                                 _m96067_)
                                                '#!void))))))))
                         (_rscan96061_
                          (lambda (_i96079_ _j96080_ _k96081_ _m96082_)
                            (let _lp96084_ ((_k96086_ _k96081_)
                                            (_m96087_ _m96082_))
                              (if (<= _k96086_ _j96080_)
                                  (_done96062_ _i96079_ _j96080_ _m96087_)
                                  (let* ((_x96089_
                                          (vector-ref _v96031_ _k96086_))
                                         (_sign96091_
                                          (_c96030_ _x96089_ _pivot96057_)))
                                    (if (> _sign96091_ '0)
                                        (_lp96084_ (- _k96086_ '1) _m96087_)
                                        (if (= _sign96091_ '0)
                                            (begin
                                              (if (< _k96086_ _m96087_)
                                                  (begin
                                                    (vector-set!
                                                     _v96031_
                                                     _k96086_
                                                     (vector-ref
                                                      _v96031_
                                                      _m96087_))
                                                    (vector-set!
                                                     _v96031_
                                                     _m96087_
                                                     _x96089_))
                                                  '#!void)
                                              (_lp96084_
                                               (- _k96086_ '1)
                                               (- _m96087_ '1)))
                                            (if (< _sign96091_ '0)
                                                (begin
                                                  (vector-set!
                                                   _v96031_
                                                   _k96086_
                                                   (vector-ref
                                                    _v96031_
                                                    _j96080_))
                                                  (vector-set!
                                                   _v96031_
                                                   _j96080_
                                                   _x96089_)
                                                  (_lscan96060_
                                                   _i96079_
                                                   (+ _j96080_ '1)
                                                   (- _k96086_ '1)
                                                   _m96087_))
                                                '#!void))))))))
                         (_done96062_
                          (lambda (_i96094_ _j96095_ _m96096_)
                            (let ((_num<96098_ (- _j96095_ _i96094_))
                                  (_num>96099_ (+ '1 (- _m96096_ _j96095_)))
                                  (_num=l96100_ (- _i96094_ _l96041_))
                                  (_num=r96101_ (- (- _r96042_ _m96096_) '1)))
                              (_swap96035_
                               _l96041_
                               _j96095_
                               (min _num<96098_ _num=l96100_))
                              (_swap96035_
                               _j96095_
                               _r96042_
                               (min _num>96099_ _num=r96101_))
                              (if (<= _num<96098_ _num>96099_)
                                  (begin
                                    (_recur96039_
                                     _l96041_
                                     (+ _l96041_ _num<96098_))
                                    (_recur96039_
                                     (- _r96042_ _num>96099_)
                                     _r96042_))
                                  (begin
                                    (_recur96039_
                                     (- _r96042_ _num>96099_)
                                     _r96042_)
                                    (_recur96039_
                                     _l96041_
                                     (+ _l96041_ _num<96098_))))))))
                  (_lscan96060_
                   _l+196048_
                   (+ _l96041_ '2)
                   (- _r96042_ '2)
                   _r-196044_)))
              (std/srfi/132#%vector-insert-sort!
               _elt<96037_
               _v96031_
               _l96041_
               _r96042_))))))
  (define std/srfi/132#list-sort
    (lambda (_<96025_ _l96026_)
      (let ((_v96028_ (list->vector _l96026_)))
        (std/srfi/132#vector-heap-sort! _<96025_ _v96028_)
        (vector->list _v96028_))))
  (define std/srfi/132#list-sort! std/srfi/132#list-merge-sort!)
  (define std/srfi/132#list-stable-sort std/srfi/132#list-merge-sort)
  (define std/srfi/132#list-stable-sort! std/srfi/132#list-merge-sort!)
  (define std/srfi/132#vector-sort std/srfi/132#vector-quick-sort)
  (define std/srfi/132#vector-sort! std/srfi/132#vector-quick-sort!)
  (define std/srfi/132#vector-stable-sort std/srfi/132#vector-merge-sort)
  (define std/srfi/132#vector-stable-sort! std/srfi/132#vector-merge-sort!)
  (define std/srfi/132#vector-find-median
    (lambda (_<96008_ _v96009_ _knil96010_ . _rest96011_)
      (let* ((_mean96016_
              (if (null? _rest96011_)
                  (lambda (_a96013_ _b96014_) (/ (+ _a96013_ _b96014_) '2))
                  (car _rest96011_)))
             (_n96018_ (vector-length _v96009_)))
        (if (zero? _n96018_)
            _knil96010_
            (if (odd? _n96018_)
                (std/srfi/132#%vector-select
                 _<96008_
                 _v96009_
                 (quotient _n96018_ '2)
                 '0
                 _n96018_)
                (call-with-values
                 (lambda ()
                   (std/srfi/132#%vector-select2
                    _<96008_
                    _v96009_
                    (- (quotient _n96018_ '2) '1)
                    '0
                    _n96018_))
                 (lambda (_a96022_ _b96023_)
                   (_mean96016_ _a96022_ _b96023_))))))))
  (define std/srfi/132#vector-find-median!
    (lambda (_<95995_ _v95996_ _knil95997_ . _rest95998_)
      (let* ((_mean96003_
              (if (null? _rest95998_)
                  (lambda (_a96000_ _b96001_) (/ (+ _a96000_ _b96001_) '2))
                  (car _rest95998_)))
             (_n96005_ (vector-length _v95996_)))
        (std/srfi/132#vector-sort! _<95995_ _v95996_)
        (if (zero? _n96005_)
            _knil95997_
            (if (odd? _n96005_)
                (vector-ref _v95996_ (quotient _n96005_ '2))
                (_mean96003_
                 (vector-ref _v95996_ (- (quotient _n96005_ '2) '1))
                 (vector-ref _v95996_ (quotient _n96005_ '2))))))))
  (define std/srfi/132#vector-select
    (lambda (_<95985_ _v95986_ _k95987_ . _rest95988_)
      (let* ((_start95990_ (if (null? _rest95988_) '0 (car _rest95988_)))
             (_end95992_
              (if (and (pair? _rest95988_) (pair? (cdr _rest95988_)))
                  (car (cdr _rest95988_))
                  (vector-length _v95986_))))
        (std/srfi/132#%vector-select
         _<95985_
         _v95986_
         _k95987_
         _start95990_
         _end95992_))))
  (define std/srfi/132#vector-select! std/srfi/132#vector-select)
  (define std/srfi/132#vector-separate!
    (lambda (_<95964_ _v95965_ _k95966_ . _rest95967_)
      (let* ((_start95969_ (if (null? _rest95967_) '0 (car _rest95967_)))
             (_end95971_
              (if (and (pair? _rest95967_) (pair? (cdr _rest95967_)))
                  (car (cdr _rest95967_))
                  (vector-length _v95965_))))
        (if (and (> _k95966_ '0) (> _end95971_ _start95969_))
            (let ((_pivot95974_
                   (std/srfi/132#vector-select
                    _<95964_
                    _v95965_
                    (- _k95966_ '1)
                    _start95969_
                    _end95971_)))
              (call-with-values
               (lambda ()
                 (std/srfi/132#count-smaller
                  _<95964_
                  _pivot95974_
                  _v95965_
                  _start95969_
                  _end95971_
                  '0
                  '0))
               (lambda (_count95977_ _count295978_)
                 (let* ((_v295980_ (make-vector _count95977_))
                        (_v395982_
                         (make-vector
                          (- _end95971_
                             _start95969_
                             _count95977_
                             _count295978_))))
                   (std/srfi/132#copy-smaller!
                    _<95964_
                    _pivot95974_
                    _v295980_
                    '0
                    _v95965_
                    _start95969_
                    _end95971_)
                   (std/srfi/132#copy-bigger!
                    _<95964_
                    _pivot95974_
                    _v395982_
                    '0
                    _v95965_
                    _start95969_
                    _end95971_)
                   (std/srfi/132#r7rs-vector-copy!__0
                    _v95965_
                    _start95969_
                    _v295980_)
                   (std/srfi/132#r7rs-vector-fill!
                    _v95965_
                    _pivot95974_
                    (+ _start95969_ _count95977_)
                    (+ _start95969_ _count95977_ _count295978_))
                   (std/srfi/132#r7rs-vector-copy!__0
                    _v95965_
                    (+ _start95969_ _count95977_ _count295978_)
                    _v395982_)))))
            '#!void))))
  (define std/srfi/132#just-sort-it-threshold '50)
  (define std/srfi/132#%vector-select
    (lambda (_<?95958_ _v95959_ _k95960_ _start95961_ _end95962_)
      (if (and 'vector-select
               (procedure? _<?95958_)
               (vector? _v95959_)
               (exact-integer? _k95960_)
               (exact-integer? _start95961_)
               (exact-integer? _end95962_)
               (<= '0 _k95960_ (- _end95962_ _start95961_ '1))
               (<= '0 _start95961_ _end95962_ (vector-length _v95959_)))
          '#!void
          (error '"assertion failure"))
      (std/srfi/132#%%vector-select
       _<?95958_
       _v95959_
       _k95960_
       _start95961_
       _end95962_)))
  (define std/srfi/132#%vector-select2
    (lambda (_<?95952_ _v95953_ _k95954_ _start95955_ _end95956_)
      (if (and 'vector-select
               (procedure? _<?95952_)
               (vector? _v95953_)
               (exact-integer? _k95954_)
               (exact-integer? _start95955_)
               (exact-integer? _end95956_)
               (<= '0 _k95954_ (- _end95956_ _start95955_ '1 '1))
               (<= '0 _start95955_ _end95956_ (vector-length _v95953_)))
          '#!void
          (error '"assertion failure"))
      (std/srfi/132#%%vector-select2
       _<?95952_
       _v95953_
       _k95954_
       _start95955_
       _end95956_)))
  (define std/srfi/132#%%vector-select
    (lambda (_<?95923_ _v95924_ _k95925_ _start95926_ _end95927_)
      (let ((_size95929_ (- _end95927_ _start95926_)))
        (if (= '1 _size95929_)
            (vector-ref _v95924_ (+ _k95925_ _start95926_))
            (if (= '2 _size95929_)
                (if (_<?95923_
                     (vector-ref _v95924_ _start95926_)
                     (vector-ref _v95924_ (+ _start95926_ '1)))
                    (vector-ref _v95924_ (+ _k95925_ _start95926_))
                    (vector-ref _v95924_ (+ (- '1 _k95925_) _start95926_)))
                (if (< _size95929_ std/srfi/132#just-sort-it-threshold)
                    (vector-ref
                     (std/srfi/132#vector-sort
                      _<?95923_
                      (subvector _v95924_ _start95926_ _end95927_))
                     _k95925_)
                    (let* ((_ip95931_ (random-integer _size95929_))
                           (_pivot95933_
                            (vector-ref _v95924_ (+ _start95926_ _ip95931_))))
                      (call-with-values
                       (lambda ()
                         (std/srfi/132#count-smaller
                          _<?95923_
                          _pivot95933_
                          _v95924_
                          _start95926_
                          _end95927_
                          '0
                          '0))
                       (lambda (_count95937_ _count295938_)
                         (if (< _k95925_ _count95937_)
                             (let* ((_n95940_ _count95937_)
                                    (_v295942_ (make-vector _n95940_)))
                               (std/srfi/132#copy-smaller!
                                _<?95923_
                                _pivot95933_
                                _v295942_
                                '0
                                _v95924_
                                _start95926_
                                _end95927_)
                               (std/srfi/132#%%vector-select
                                _<?95923_
                                _v295942_
                                _k95925_
                                '0
                                _n95940_))
                             (if (< _k95925_ (+ _count95937_ _count295938_))
                                 _pivot95933_
                                 (let* ((_n95945_
                                         (- _size95929_
                                            _count95937_
                                            _count295938_))
                                        (_v295947_ (make-vector _n95945_))
                                        (_k295949_
                                         (- _k95925_
                                            _count95937_
                                            _count295938_)))
                                   (std/srfi/132#copy-bigger!
                                    _<?95923_
                                    _pivot95933_
                                    _v295947_
                                    '0
                                    _v95924_
                                    _start95926_
                                    _end95927_)
                                   (std/srfi/132#%%vector-select
                                    _<?95923_
                                    _v295947_
                                    _k295949_
                                    '0
                                    _n95945_)))))))))))))
  (define std/srfi/132#%%vector-select2
    (lambda (_<?95889_ _v95890_ _k95891_ _start95892_ _end95893_)
      (let ((_size95895_ (- _end95893_ _start95892_)))
        (if (= '2 _size95895_)
            (let ((_a95897_ (vector-ref _v95890_ _start95892_))
                  (_b95898_ (vector-ref _v95890_ (+ _start95892_ '1))))
              (if (_<?95889_ _a95897_ _b95898_)
                  (values _a95897_ _b95898_)
                  (values _b95898_ _a95897_)))
            (if (< _size95895_ std/srfi/132#just-sort-it-threshold)
                (let ((_v295900_
                       (std/srfi/132#vector-sort
                        _<?95889_
                        (subvector _v95890_ _start95892_ _end95893_))))
                  (values (vector-ref _v295900_ _k95891_)
                          (vector-ref _v295900_ (+ _k95891_ '1))))
                (let* ((_ip95902_ (random-integer _size95895_))
                       (_pivot95904_
                        (vector-ref _v95890_ (+ _start95892_ _ip95902_))))
                  (call-with-values
                   (lambda ()
                     (std/srfi/132#count-smaller
                      _<?95889_
                      _pivot95904_
                      _v95890_
                      _start95892_
                      _end95893_
                      '0
                      '0))
                   (lambda (_count95908_ _count295909_)
                     (if (= (+ _k95891_ '1) _count95908_)
                         (values (std/srfi/132#%%vector-select
                                  _<?95889_
                                  _v95890_
                                  _k95891_
                                  _start95892_
                                  _end95893_)
                                 _pivot95904_)
                         (if (< _k95891_ _count95908_)
                             (let* ((_n95911_ _count95908_)
                                    (_v295913_ (make-vector _n95911_)))
                               (std/srfi/132#copy-smaller!
                                _<?95889_
                                _pivot95904_
                                _v295913_
                                '0
                                _v95890_
                                _start95892_
                                _end95893_)
                               (std/srfi/132#%%vector-select2
                                _<?95889_
                                _v295913_
                                _k95891_
                                '0
                                _n95911_))
                             (if (< _k95891_ (+ _count95908_ _count295909_))
                                 (values _pivot95904_
                                         (if (< (+ _k95891_ '1)
                                                (+ _count95908_ _count295909_))
                                             _pivot95904_
                                             (std/srfi/132#%%vector-select
                                              _<?95889_
                                              _v95890_
                                              (+ _k95891_ '1)
                                              _start95892_
                                              _end95893_)))
                                 (let* ((_n95916_
                                         (- _size95895_
                                            _count95908_
                                            _count295909_))
                                        (_v295918_ (make-vector _n95916_))
                                        (_k295920_
                                         (- _k95891_
                                            _count95908_
                                            _count295909_)))
                                   (std/srfi/132#copy-bigger!
                                    _<?95889_
                                    _pivot95904_
                                    _v295918_
                                    '0
                                    _v95890_
                                    _start95892_
                                    _end95893_)
                                   (std/srfi/132#%%vector-select2
                                    _<?95889_
                                    _v295918_
                                    _k295920_
                                    '0
                                    _n95916_)))))))))))))
  (define std/srfi/132#count-smaller
    (lambda (_<?95881_
             _pivot95882_
             _v95883_
             _i95884_
             _end95885_
             _count95886_
             _count295887_)
      (if (= _i95884_ _end95885_)
          (values _count95886_ _count295887_)
          (if (_<?95881_ (vector-ref _v95883_ _i95884_) _pivot95882_)
              (std/srfi/132#count-smaller
               _<?95881_
               _pivot95882_
               _v95883_
               (+ _i95884_ '1)
               _end95885_
               (+ _count95886_ '1)
               _count295887_)
              (if (_<?95881_ _pivot95882_ (vector-ref _v95883_ _i95884_))
                  (std/srfi/132#count-smaller
                   _<?95881_
                   _pivot95882_
                   _v95883_
                   (+ _i95884_ '1)
                   _end95885_
                   _count95886_
                   _count295887_)
                  (std/srfi/132#count-smaller
                   _<?95881_
                   _pivot95882_
                   _v95883_
                   (+ _i95884_ '1)
                   _end95885_
                   _count95886_
                   (+ _count295887_ '1)))))))
  (define std/srfi/132#copy-smaller!
    (lambda (_<?95873_
             _pivot95874_
             _dst95875_
             _at95876_
             _src95877_
             _start95878_
             _end95879_)
      (if (= _start95878_ _end95879_)
          _dst95875_
          (if (_<?95873_ (vector-ref _src95877_ _start95878_) _pivot95874_)
              (begin
                (vector-set!
                 _dst95875_
                 _at95876_
                 (vector-ref _src95877_ _start95878_))
                (std/srfi/132#copy-smaller!
                 _<?95873_
                 _pivot95874_
                 _dst95875_
                 (+ _at95876_ '1)
                 _src95877_
                 (+ _start95878_ '1)
                 _end95879_))
              (std/srfi/132#copy-smaller!
               _<?95873_
               _pivot95874_
               _dst95875_
               _at95876_
               _src95877_
               (+ _start95878_ '1)
               _end95879_)))))
  (define std/srfi/132#copy-bigger!
    (lambda (_<?95865_
             _pivot95866_
             _dst95867_
             _at95868_
             _src95869_
             _start95870_
             _end95871_)
      (if (= _start95870_ _end95871_)
          _dst95867_
          (if (_<?95865_ _pivot95866_ (vector-ref _src95869_ _start95870_))
              (begin
                (vector-set!
                 _dst95867_
                 _at95868_
                 (vector-ref _src95869_ _start95870_))
                (std/srfi/132#copy-bigger!
                 _<?95865_
                 _pivot95866_
                 _dst95867_
                 (+ _at95868_ '1)
                 _src95869_
                 (+ _start95870_ '1)
                 _end95871_))
              (std/srfi/132#copy-bigger!
               _<?95865_
               _pivot95866_
               _dst95867_
               _at95868_
               _src95869_
               (+ _start95870_ '1)
               _end95871_))))))
