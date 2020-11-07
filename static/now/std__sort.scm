(declare (block) (standard-bindings) (extended-bindings))
(begin
  (declare (fixnum) (not safe))
  (define std/sort#sort
    (lambda (_seq19449_ _elt<19451_)
      (if (procedure? _elt<19451_)
          '#!void
          (error '"Expected procedure" _elt<19451_))
      (if (null? _seq19449_)
          _seq19449_
          (if (pair? _seq19449_)
              (std/sort#list-merge-sort _seq19449_ _elt<19451_)
              (if (vector? _seq19449_)
                  (std/sort#heap-sort _seq19449_ _elt<19451_)
                  (error '"Expected list or vector" _seq19449_))))))
  (define std/sort#sort!
    (lambda (_seq19444_ _elt<19446_)
      (if (procedure? _elt<19446_)
          '#!void
          (error '"Expected procedure" _elt<19446_))
      (if (null? _seq19444_)
          _seq19444_
          (if (pair? _seq19444_)
              (std/sort#list-merge-sort! _seq19444_ _elt<19446_)
              (if (vector? _seq19444_)
                  (std/sort#vector-heap-sort! _seq19444_ _elt<19446_)
                  (error '"Expected list or vector" _seq19444_))))))
  (define std/sort#stable-sort
    (lambda (_seq19439_ _elt<19441_)
      (if (procedure? _elt<19441_)
          '#!void
          (error '"Expected procedure" _elt<19441_))
      (if (null? _seq19439_)
          _seq19439_
          (if (pair? _seq19439_)
              (std/sort#list-merge-sort _seq19439_ _elt<19441_)
              (if (vector? _seq19439_)
                  (std/sort#vector-merge-sort _seq19439_ _elt<19441_)
                  (error '"Expected list or vector" _seq19439_))))))
  (define std/sort#stable-sort!
    (lambda (_seq19434_ _elt<19436_)
      (if (procedure? _elt<19436_)
          '#!void
          (error '"Expected procedure" _elt<19436_))
      (if (null? _seq19434_)
          _seq19434_
          (if (pair? _seq19434_)
              (std/sort#list-merge-sort! _seq19434_ _elt<19436_)
              (if (vector? _seq19434_)
                  (std/sort#vector-merge-sort! _seq19434_ _elt<19436_)
                  (error '"Expected list or vector" _seq19434_))))))
  (define std/sort#vector-copy!
    (lambda (_target19429_ _src19430_ _start19431_ _end19432_)
      (subvector-move! _src19430_ _start19431_ _end19432_ _target19429_ '0)))
  (define std/sort#vector-merge-sort!
    (lambda (_v19426_ _elt<19427_)
      (std/sort#%vector-merge-sort!
       _v19426_
       _elt<19427_
       '0
       (vector-length _v19426_)
       (vector-copy _v19426_))
      _v19426_))
  (define std/sort#vector-merge-sort
    (lambda (_v19423_ _elt<19424_)
      (std/sort#vector-merge-sort! (vector-copy _v19423_) _elt<19424_)))
  (define std/sort#vector-heap-sort!
    (lambda (_v19420_ _elt<19421_)
      (std/sort#heap-sort! _v19420_ _elt<19421_)
      _v19420_))
  (define std/sort#parse-vector-start+end
    (lambda (_proc19399_ _v19400_ _args19401_)
      (let ((_vlen19403_ (vector-length _v19400_)))
        (if (pair? _args19401_)
            (let ((_start19405_ (car _args19401_))
                  (_args19406_ (cdr _args19401_)))
              (if (or (not (integer? _start19405_)) (< _start19405_ '0))
                  (error '"Illegal subvector START spec"
                         _proc19399_
                         _start19405_
                         _v19400_)
                  (let ((_g271108_
                         (if (pair? _args19406_)
                             (let ((_end19411_ (car _args19406_))
                                   (_args19412_ (cdr _args19406_)))
                               (if (or (not (integer? _end19411_))
                                       (< _vlen19403_ _end19411_))
                                   (error '"Illegal subvector END spec"
                                          _proc19399_
                                          _end19411_
                                          _v19400_)
                                   (values _end19411_ _args19412_)))
                             (values _vlen19403_ _args19406_))))
                    (begin
                      (let ((_g271109_
                             (if (##values? _g271108_)
                                 (##vector-length _g271108_)
                                 1)))
                        (if (not (##fx= _g271109_ 2))
                            (error "Context expects 2 values" _g271109_)))
                      (let ((_end19417_ (##vector-ref _g271108_ 0))
                            (_args19418_ (##vector-ref _g271108_ 1)))
                        (if (<= _start19405_ _end19417_)
                            (values _start19405_ _end19417_ _args19418_)
                            (error '"Illegal subvector START/END spec"
                                   _proc19399_
                                   _start19405_
                                   _end19417_
                                   _v19400_)))))))
            (values '0 (vector-length _v19400_) '())))))
  (define std/sort#parse-vector-final-start+end
    (lambda (_proc19391_ _v19392_ _args19393_)
      (let ((_g271110_
             (std/sort#parse-vector-start+end
              _proc19391_
              _v19392_
              _args19393_)))
        (begin
          (let ((_g271111_
                 (if (##values? _g271110_) (##vector-length _g271110_) 1)))
            (if (not (##fx= _g271111_ 3))
                (error "Context expects 3 values" _g271111_)))
          (let ((_start19395_ (##vector-ref _g271110_ 0))
                (_end19396_ (##vector-ref _g271110_ 1))
                (_rest19397_ (##vector-ref _g271110_ 2)))
            (if (pair? _rest19397_)
                (error '"Extra arguments to procedure" _proc19391_ _rest19397_)
                (values _start19395_ _end19396_)))))))
  (define std/sort#list-merge-sort
    (lambda (_lis19315_ _elt<19316_)
      (letrec ((_getrun19318_
                (lambda (_lis19381_)
                  (let _lp19383_ ((_xs19385_ (cdr _lis19381_))
                                  (_prev19386_ (car _lis19381_))
                                  (_i19387_ '1))
                    (if (pair? _xs19385_)
                        (let ((_x19389_ (car _xs19385_)))
                          (if (_elt<19316_ _x19389_ _prev19386_)
                              (values _i19387_ _xs19385_)
                              (_lp19383_
                               (cdr _xs19385_)
                               _x19389_
                               (+ _i19387_ '1))))
                        (values _i19387_ _xs19385_)))))
               (_cmerge19319_
                (lambda (_a19359_ _la19360_ _b19361_ _lb19362_)
                  (let _recur19364_ ((_x19366_ (car _a19359_))
                                     (_a19367_ _a19359_)
                                     (_la19368_ _la19360_)
                                     (_y19369_ (car _b19361_))
                                     (_b19370_ _b19361_)
                                     (_lb19371_ _lb19362_))
                    (if (_elt<19316_ _y19369_ _x19366_)
                        (cons _y19369_
                              (let ((_lb19373_ (- _lb19371_ '1)))
                                (if (= _lb19373_ '0)
                                    _a19367_
                                    (let ((_b19375_ (cdr _b19370_)))
                                      (_recur19364_
                                       _x19366_
                                       _a19367_
                                       _la19368_
                                       (car _b19375_)
                                       _b19375_
                                       _lb19373_)))))
                        (cons _x19366_
                              (let ((_la19377_ (- _la19368_ '1)))
                                (if (= _la19377_ '0)
                                    _b19370_
                                    (let ((_a19379_ (cdr _a19367_)))
                                      (_recur19364_
                                       (car _a19379_)
                                       _a19379_
                                       _la19377_
                                       _y19369_
                                       _b19370_
                                       _lb19371_)))))))))
               (_grow19320_
                (lambda (_s19335_ _ls19336_ _ls219337_ _u19338_ _lw19339_)
                  (if (or (<= _lw19339_ _ls19336_) (not (pair? _u19338_)))
                      (values _s19335_ _ls19336_ _u19338_)
                      (let* ((_ls219350_
                              (let _lp19344_ ((_ls219346_ _ls219337_))
                                (let ((_ls2*219348_ (+ _ls219346_ _ls219346_)))
                                  (if (<= _ls2*219348_ _ls19336_)
                                      (_lp19344_ _ls2*219348_)
                                      _ls219346_))))
                             (_g271112_ (_getrun19318_ _u19338_)))
                        (begin
                          (let ((_g271113_
                                 (if (##values? _g271112_)
                                     (##vector-length _g271112_)
                                     1)))
                            (if (not (##fx= _g271113_ 2))
                                (error "Context expects 2 values" _g271113_)))
                          (let ((_lr19352_ (##vector-ref _g271112_ 0))
                                (_u219353_ (##vector-ref _g271112_ 1)))
                            (let ((_g271114_
                                   (_grow19320_
                                    _u19338_
                                    _lr19352_
                                    '1
                                    _u219353_
                                    _ls219350_)))
                              (begin
                                (let ((_g271115_
                                       (if (##values? _g271114_)
                                           (##vector-length _g271114_)
                                           1)))
                                  (if (not (##fx= _g271115_ 3))
                                      (error "Context expects 3 values"
                                             _g271115_)))
                                (let ((_t19355_ (##vector-ref _g271114_ 0))
                                      (_lt19356_ (##vector-ref _g271114_ 1))
                                      (_u319357_ (##vector-ref _g271114_ 2)))
                                  (_grow19320_
                                   (_cmerge19319_
                                    _s19335_
                                    _ls19336_
                                    _t19355_
                                    _lt19356_)
                                   (+ _ls19336_ _lt19356_)
                                   (+ _ls219350_ _ls219350_)
                                   _u319357_
                                   _lw19339_))))))))))
               (_first19321_
                (lambda (_lis19332_ _i19333_)
                  (if (= '0 _i19333_)
                      '()
                      (cons (car _lis19332_)
                            (_first19321_
                             (cdr _lis19332_)
                             (- _i19333_ '1)))))))
        (if (not (pair? _lis19315_))
            '()
            (let ((_g271116_ (_getrun19318_ _lis19315_)))
              (begin
                (let ((_g271117_
                       (if (##values? _g271116_)
                           (##vector-length _g271116_)
                           1)))
                  (if (not (##fx= _g271117_ 2))
                      (error "Context expects 2 values" _g271117_)))
                (let ((_lr19323_ (##vector-ref _g271116_ 0))
                      (_tail19324_ (##vector-ref _g271116_ 1)))
                  (let* ((_infinity19326_ '16777216)
                         (_g271118_
                          (_grow19320_
                           _lis19315_
                           _lr19323_
                           '1
                           _tail19324_
                           _infinity19326_)))
                    (begin
                      (let ((_g271119_
                             (if (##values? _g271118_)
                                 (##vector-length _g271118_)
                                 1)))
                        (if (not (##fx= _g271119_ 3))
                            (error "Context expects 3 values" _g271119_)))
                      (let ((_a19328_ (##vector-ref _g271118_ 0))
                            (_la19329_ (##vector-ref _g271118_ 1))
                            (_v19330_ (##vector-ref _g271118_ 2)))
                        (_first19321_ _a19328_ _la19329_)))))))))))
  (define std/sort#list-merge-sort!
    (lambda (_lis19220_ _elt<19221_)
      (letrec ((_getrun19223_
                (lambda (_lis19304_)
                  (let _lp19306_ ((_lis19308_ _lis19304_)
                                  (_x19309_ (car _lis19304_))
                                  (_i19310_ '1)
                                  (_next19311_ (cdr _lis19304_)))
                    (if (pair? _next19311_)
                        (let ((_y19313_ (car _next19311_)))
                          (if (_elt<19221_ _y19313_ _x19309_)
                              (values _i19310_ _lis19308_ _next19311_)
                              (_lp19306_
                               _next19311_
                               _y19313_
                               (+ _i19310_ '1)
                               (cdr _next19311_))))
                        (values _i19310_ _lis19308_ _next19311_)))))
               (_merge!19224_
                (lambda (_a19265_ _enda19266_ _b19267_ _endb19268_)
                  (letrec ((_scan-a19270_
                            (lambda (_prev19274_
                                     _x19275_
                                     _a19276_
                                     _y19277_
                                     _b19278_)
                              (if (_elt<19221_ _y19277_ _x19275_)
                                  (begin
                                    (set-cdr! _prev19274_ _b19278_)
                                    (let ((_next-b19280_ (cdr _b19278_)))
                                      (if (eq? _b19278_ _endb19268_)
                                          (begin
                                            (set-cdr! _b19278_ _a19276_)
                                            _enda19266_)
                                          (_scan-b19271_
                                           _b19278_
                                           _x19275_
                                           _a19276_
                                           (car _next-b19280_)
                                           _next-b19280_))))
                                  (if (eq? _a19276_ _enda19266_)
                                      (begin
                                        (_maybe-set-cdr!19272_
                                         _a19276_
                                         _b19278_)
                                        _endb19268_)
                                      (let ((_next-a19282_ (cdr _a19276_)))
                                        (_scan-a19270_
                                         _a19276_
                                         (car _next-a19282_)
                                         _next-a19282_
                                         _y19277_
                                         _b19278_))))))
                           (_scan-b19271_
                            (lambda (_prev19284_
                                     _x19285_
                                     _a19286_
                                     _y19287_
                                     _b19288_)
                              (if (_elt<19221_ _y19287_ _x19285_)
                                  (if (eq? _b19288_ _endb19268_)
                                      (begin
                                        (set-cdr! _b19288_ _a19286_)
                                        _enda19266_)
                                      (let ((_next-b19290_ (cdr _b19288_)))
                                        (_scan-b19271_
                                         _b19288_
                                         _x19285_
                                         _a19286_
                                         (car _next-b19290_)
                                         _next-b19290_)))
                                  (begin
                                    (set-cdr! _prev19284_ _a19286_)
                                    (if (eq? _a19286_ _enda19266_)
                                        (begin
                                          (_maybe-set-cdr!19272_
                                           _a19286_
                                           _b19288_)
                                          _endb19268_)
                                        (let ((_next-a19292_ (cdr _a19286_)))
                                          (_scan-a19270_
                                           _a19286_
                                           (car _next-a19292_)
                                           _next-a19292_
                                           _y19287_
                                           _b19288_)))))))
                           (_maybe-set-cdr!19272_
                            (lambda (_pair19294_ _val19295_)
                              (if (not (eq? (cdr _pair19294_) _val19295_))
                                  (set-cdr! _pair19294_ _val19295_)
                                  '#!void))))
                    (let ((_x19297_ (car _a19265_)) (_y19298_ (car _b19267_)))
                      (if (_elt<19221_ _y19298_ _x19297_)
                          (values _b19267_
                                  (if (eq? _b19267_ _endb19268_)
                                      (begin
                                        (set-cdr! _b19267_ _a19265_)
                                        _enda19266_)
                                      (let ((_next-b19300_ (cdr _b19267_)))
                                        (_scan-b19271_
                                         _b19267_
                                         _x19297_
                                         _a19265_
                                         (car _next-b19300_)
                                         _next-b19300_))))
                          (values _a19265_
                                  (if (eq? _a19265_ _enda19266_)
                                      (begin
                                        (_maybe-set-cdr!19272_
                                         _a19265_
                                         _b19267_)
                                        _endb19268_)
                                      (let ((_next-a19302_ (cdr _a19265_)))
                                        (_scan-a19270_
                                         _a19265_
                                         (car _next-a19302_)
                                         _next-a19302_
                                         _y19298_
                                         _b19267_)))))))))
               (_grow19225_
                (lambda (_s19238_
                         _ends19239_
                         _ls19240_
                         _ls219241_
                         _u19242_
                         _lw19243_)
                  (if (and (pair? _u19242_) (< _ls19240_ _lw19243_))
                      (let* ((_ls219251_
                              (let _lp19245_ ((_ls219247_ _ls219241_))
                                (let ((_ls2*219249_ (+ _ls219247_ _ls219247_)))
                                  (if (<= _ls2*219249_ _ls19240_)
                                      (_lp19245_ _ls2*219249_)
                                      _ls219247_))))
                             (_g271120_ (_getrun19223_ _u19242_)))
                        (begin
                          (let ((_g271121_
                                 (if (##values? _g271120_)
                                     (##vector-length _g271120_)
                                     1)))
                            (if (not (##fx= _g271121_ 3))
                                (error "Context expects 3 values" _g271121_)))
                          (let ((_lr19253_ (##vector-ref _g271120_ 0))
                                (_endr19254_ (##vector-ref _g271120_ 1))
                                (_u219255_ (##vector-ref _g271120_ 2)))
                            (let ((_g271122_
                                   (_grow19225_
                                    _u19242_
                                    _endr19254_
                                    _lr19253_
                                    '1
                                    _u219255_
                                    _ls219251_)))
                              (begin
                                (let ((_g271123_
                                       (if (##values? _g271122_)
                                           (##vector-length _g271122_)
                                           1)))
                                  (if (not (##fx= _g271123_ 4))
                                      (error "Context expects 4 values"
                                             _g271123_)))
                                (let ((_t19257_ (##vector-ref _g271122_ 0))
                                      (_endt19258_ (##vector-ref _g271122_ 1))
                                      (_lt19259_ (##vector-ref _g271122_ 2))
                                      (_u319260_ (##vector-ref _g271122_ 3)))
                                  (let ((_g271124_
                                         (_merge!19224_
                                          _s19238_
                                          _ends19239_
                                          _t19257_
                                          _endt19258_)))
                                    (begin
                                      (let ((_g271125_
                                             (if (##values? _g271124_)
                                                 (##vector-length _g271124_)
                                                 1)))
                                        (if (not (##fx= _g271125_ 2))
                                            (error "Context expects 2 values"
                                                   _g271125_)))
                                      (let ((_st19262_
                                             (##vector-ref _g271124_ 0))
                                            (_end-st19263_
                                             (##vector-ref _g271124_ 1)))
                                        (_grow19225_
                                         _st19262_
                                         _end-st19263_
                                         (+ _ls19240_ _lt19259_)
                                         (+ _ls219251_ _ls219251_)
                                         _u319260_
                                         _lw19243_))))))))))
                      (values _s19238_ _ends19239_ _ls19240_ _u19242_)))))
        (if (pair? _lis19220_)
            (let ((_g271126_ (_getrun19223_ _lis19220_)))
              (begin
                (let ((_g271127_
                       (if (##values? _g271126_)
                           (##vector-length _g271126_)
                           1)))
                  (if (not (##fx= _g271127_ 3))
                      (error "Context expects 3 values" _g271127_)))
                (let ((_lr19227_ (##vector-ref _g271126_ 0))
                      (_endr19228_ (##vector-ref _g271126_ 1))
                      (_rest19229_ (##vector-ref _g271126_ 2)))
                  (let* ((_infinity19231_ '16777216)
                         (_g271128_
                          (_grow19225_
                           _lis19220_
                           _endr19228_
                           _lr19227_
                           '1
                           _rest19229_
                           _infinity19231_)))
                    (begin
                      (let ((_g271129_
                             (if (##values? _g271128_)
                                 (##vector-length _g271128_)
                                 1)))
                        (if (not (##fx= _g271129_ 4))
                            (error "Context expects 4 values" _g271129_)))
                      (let ((_a19233_ (##vector-ref _g271128_ 0))
                            (_enda19234_ (##vector-ref _g271128_ 1))
                            (_la19235_ (##vector-ref _g271128_ 2))
                            (_v19236_ (##vector-ref _g271128_ 3)))
                        (begin (set-cdr! _enda19234_ '()) _a19233_)))))))
            '()))))
  (define std/sort#really-heap-sort!
    (lambda (_v19171_ _elt<19172_ _start19173_ _end19174_)
      (letrec ((_restore-heap!19176_
                (lambda (_end19192_ _i19193_)
                  (let* ((_vi19195_ (vector-ref _v19171_ _i19193_))
                         (_first-leaf19197_
                          (quotient (+ _start19173_ _end19192_) '2))
                         (_final-k19217_
                          (let _lp19199_ ((_k19201_ _i19193_))
                            (if (>= _k19201_ _first-leaf19197_)
                                _k19201_
                                (let* ((_k*2-start19203_
                                        (+ _k19201_ (- _k19201_ _start19173_)))
                                       (_child119205_ (+ '1 _k*2-start19203_))
                                       (_child219207_ (+ '2 _k*2-start19203_))
                                       (_child1-val19209_
                                        (vector-ref _v19171_ _child119205_)))
                                  (let ((_g271130_
                                         (if (< _child219207_ _end19192_)
                                             (let ((_child2-val19212_
                                                    (vector-ref
                                                     _v19171_
                                                     _child219207_)))
                                               (if (_elt<19172_
                                                    _child2-val19212_
                                                    _child1-val19209_)
                                                   (values _child119205_
                                                           _child1-val19209_)
                                                   (values _child219207_
                                                           _child2-val19212_)))
                                             (values _child119205_
                                                     _child1-val19209_))))
                                    (begin
                                      #!void
                                      (let ((_max-child19214_
                                             (##vector-ref _g271130_ 0))
                                            (_max-child-val19215_
                                             (##vector-ref _g271130_ 1)))
                                        (if (_elt<19172_
                                             _vi19195_
                                             _max-child-val19215_)
                                            (begin
                                              (vector-set!
                                               _v19171_
                                               _k19201_
                                               _max-child-val19215_)
                                              (_lp19199_ _max-child19214_))
                                            _k19201_)))))))))
                    (vector-set! _v19171_ _final-k19217_ _vi19195_)))))
        (let ((_first-leaf19178_ (quotient (+ _start19173_ _end19174_) '2)))
          (let _$loop19180_ ((_i19183_ (- _first-leaf19178_ '1)))
            (if (< _i19183_ '0)
                '#!void
                (begin
                  (_restore-heap!19176_ _end19174_ _i19183_)
                  (_$loop19180_ (- _i19183_ '1))))))
        (let _$loop19185_ ((_i19188_ (- _end19174_ '1)))
          (if (<= _i19188_ '0)
              '#!void
              (begin
                (let ((_top19190_ (vector-ref _v19171_ _start19173_)))
                  (vector-set!
                   _v19171_
                   _start19173_
                   (vector-ref _v19171_ _i19188_))
                  (vector-set! _v19171_ _i19188_ _top19190_)
                  (_restore-heap!19176_ _i19188_ _start19173_))
                (_$loop19185_ (- _i19188_ '1))))))))
  (define std/sort#heap-sort!
    (lambda (_v19164_ _elt<19165_ . _maybe-start+end19166_)
      (let ((_g271131_
             (std/sort#parse-vector-final-start+end
              std/sort#heap-sort!
              _v19164_
              _maybe-start+end19166_)))
        (begin
          (let ((_g271132_
                 (if (##values? _g271131_) (##vector-length _g271131_) 1)))
            (if (not (##fx= _g271132_ 2))
                (error "Context expects 2 values" _g271132_)))
          (let ((_start19168_ (##vector-ref _g271131_ 0))
                (_end19169_ (##vector-ref _g271131_ 1)))
            (std/sort#really-heap-sort!
             _v19164_
             _elt<19165_
             _start19168_
             _end19169_))))))
  (define std/sort#heap-sort
    (lambda (_v19155_ _elt<19156_ . _maybe-start+end19157_)
      (let ((_g271133_
             (std/sort#parse-vector-final-start+end
              std/sort#heap-sort
              _v19155_
              _maybe-start+end19157_)))
        (begin
          (let ((_g271134_
                 (if (##values? _g271133_) (##vector-length _g271133_) 1)))
            (if (not (##fx= _g271134_ 2))
                (error "Context expects 2 values" _g271134_)))
          (let ((_start19159_ (##vector-ref _g271133_ 0))
                (_end19160_ (##vector-ref _g271133_ 1)))
            (let ((_ans19162_ (subvector _v19155_ _start19159_ _end19160_)))
              (std/sort#really-heap-sort!
               _ans19162_
               _elt<19156_
               '0
               (- _end19160_ _start19159_))
              _ans19162_))))))
  (define std/sort#%vector-merge!
    (lambda (_v19117_
             _v119118_
             _v219119_
             _elt<19120_
             _start019121_
             _start119122_
             _end119123_
             _start219124_
             _end219125_)
      (letrec ((_vblit19127_
                (lambda (_fromv19129_ _j19130_ _i19131_ _end19132_)
                  (let _lp19134_ ((_j19136_ _j19130_) (_i19137_ _i19131_))
                    (vector-set!
                     _v19117_
                     _i19137_
                     (vector-ref _fromv19129_ _j19136_))
                    (let ((_j19139_ (+ _j19136_ '1)))
                      (if (< _j19139_ _end19132_)
                          (_lp19134_ _j19139_ (+ _i19137_ '1))
                          '#!void))))))
        (if (<= _end119123_ _start119122_)
            (if (< _start219124_ _end219125_)
                (_vblit19127_
                 _v219119_
                 _start219124_
                 _start019121_
                 _end219125_)
                '#!void)
            (if (<= _end219125_ _start219124_)
                (_vblit19127_
                 _v119118_
                 _start119122_
                 _start019121_
                 _end119123_)
                (let _lp19141_ ((_i19143_ _start019121_)
                                (_j19144_ _start119122_)
                                (_x19145_ (vector-ref _v119118_ _start119122_))
                                (_k19146_ _start219124_)
                                (_y19147_
                                 (vector-ref _v219119_ _start219124_)))
                  (let ((_i119149_ (+ _i19143_ '1)))
                    (if (_elt<19120_ _y19147_ _x19145_)
                        (let ((_k19151_ (+ _k19146_ '1)))
                          (vector-set! _v19117_ _i19143_ _y19147_)
                          (if (< _k19151_ _end219125_)
                              (_lp19141_
                               _i119149_
                               _j19144_
                               _x19145_
                               _k19151_
                               (vector-ref _v219119_ _k19151_))
                              (_vblit19127_
                               _v119118_
                               _j19144_
                               _i119149_
                               _end119123_)))
                        (let ((_j19153_ (+ _j19144_ '1)))
                          (vector-set! _v19117_ _i19143_ _x19145_)
                          (if (< _j19153_ _end119123_)
                              (_vblit19127_
                               _v219119_
                               _k19146_
                               _i119149_
                               _end219125_)
                              (_lp19141_
                               _i119149_
                               _j19153_
                               (vector-ref _v119118_ _j19153_)
                               _k19146_
                               _y19147_)))))))))))
  (define std/sort#%vector-merge-sort!
    (lambda (_v019071_ _elt<19072_ _l19073_ _r19074_ _temp019075_)
      (letrec ((_xor19077_
                (lambda (_a19114_ _b19115_) (not (eq? _a19114_ _b19115_)))))
        (if (< _l19073_ _r19074_)
            (let ((_g271135_
                   (let _recur19079_ ((_l19081_ _l19073_)
                                      (_want19082_ (- _r19074_ _l19073_)))
                     (let ((_len19084_ (- _r19074_ _l19081_)))
                       (let _lp19086_ ((_pfxlen19088_
                                        (std/sort#getrun
                                         _v019071_
                                         _l19081_
                                         _r19074_
                                         _elt<19072_))
                                       (_pfxlen219089_ '1)
                                       (_v19090_ _v019071_)
                                       (_temp19091_ _temp019075_)
                                       (_v=v0?19092_ '#t))
                         (if (or (>= _pfxlen19088_ _want19082_)
                                 (= _pfxlen19088_ _len19084_))
                             (values _pfxlen19088_ _v19090_ _v=v0?19092_)
                             (let ((_pfxlen219103_
                                    (let _lp19097_ ((_j19099_ _pfxlen219089_))
                                      (let ((_j*219101_ (+ _j19099_ _j19099_)))
                                        (if (<= _j19099_ _pfxlen19088_)
                                            (_lp19097_ _j*219101_)
                                            _j19099_))))
                                   (_tail-len19104_
                                    (- _len19084_ _pfxlen19088_)))
                               (let ((_g271137_
                                      (_recur19079_
                                       (+ _pfxlen19088_ _l19081_)
                                       _pfxlen219103_)))
                                 (begin
                                   (let ((_g271138_
                                          (if (##values? _g271137_)
                                              (##vector-length _g271137_)
                                              1)))
                                     (if (not (##fx= _g271138_ 3))
                                         (error "Context expects 3 values"
                                                _g271138_)))
                                   (let ((_nr-len19106_
                                          (##vector-ref _g271137_ 0))
                                         (_nr-vec19107_
                                          (##vector-ref _g271137_ 1))
                                         (_nrvec=v0?19108_
                                          (##vector-ref _g271137_ 2)))
                                     (begin
                                       (std/sort#%vmerge
                                        _temp19091_
                                        _v19090_
                                        _nr-vec19107_
                                        _l19081_
                                        _pfxlen19088_
                                        _nr-len19106_
                                        (_xor19077_
                                         _nrvec=v0?19108_
                                         _v=v0?19092_)
                                        _elt<19072_)
                                       (_lp19086_
                                        (+ _pfxlen19088_ _nr-len19106_)
                                        (+ _pfxlen219103_ _pfxlen219103_)
                                        _temp19091_
                                        _v19090_
                                        (not _v=v0?19092_)))))))))))))
              (begin
                (let ((_g271136_
                       (if (##values? _g271135_)
                           (##vector-length _g271135_)
                           1)))
                  (if (not (##fx= _g271136_ 3))
                      (error "Context expects 3 values" _g271136_)))
                (let ((_ignored-len19110_ (##vector-ref _g271135_ 0))
                      (_ignored-ansvec19111_ (##vector-ref _g271135_ 1))
                      (_ansvec=v0?19112_ (##vector-ref _g271135_ 2)))
                  (if (not _ansvec=v0?19112_)
                      (std/sort#vector-copy!
                       _v019071_
                       _temp019075_
                       _l19073_
                       _r19074_)
                      '#!void))))
            '#!void))))
  (define std/sort#%vmerge
    (lambda (_target19029_
             _v119030_
             _v219031_
             _l19032_
             _len119033_
             _len219034_
             _v2=target?19035_
             _elt<19036_)
      (letrec ((_vblit19038_
                (lambda (_fromv19040_ _j19041_ _i19042_ _end19043_)
                  (let _lp19045_ ((_j19047_ _j19041_) (_i19048_ _i19042_))
                    (vector-set!
                     _target19029_
                     _i19048_
                     (vector-ref _fromv19040_ _j19047_))
                    (let ((_j19050_ (+ _j19047_ '1)))
                      (if (< _j19050_ _end19043_)
                          (_lp19045_ _j19050_ (+ _i19048_ '1))
                          '#!void))))))
        (let* ((_r119052_ (+ _l19032_ _len119033_))
               (_r219054_ (+ _r119052_ _len219034_)))
          (let _lp19057_ ((_i19059_ _l19032_)
                          (_j19060_ _l19032_)
                          (_x19061_ (vector-ref _v119030_ _l19032_))
                          (_k19062_ _r119052_)
                          (_y19063_ (vector-ref _v219031_ _r119052_)))
            (let ((_i119065_ (+ _i19059_ '1)))
              (if (_elt<19036_ _y19063_ _x19061_)
                  (let ((_k19067_ (+ _k19062_ '1)))
                    (vector-set! _target19029_ _i19059_ _y19063_)
                    (if (< _k19067_ _r219054_)
                        (_lp19057_
                         _i119065_
                         _j19060_
                         _x19061_
                         _k19067_
                         (vector-ref _v219031_ _k19067_))
                        (_vblit19038_ _v119030_ _j19060_ _i119065_ _r119052_)))
                  (let ((_j19069_ (+ _j19060_ '1)))
                    (vector-set! _target19029_ _i19059_ _x19061_)
                    (if (< _j19069_ _r119052_)
                        (_lp19057_
                         _i119065_
                         _j19069_
                         (vector-ref _v119030_ _j19069_)
                         _k19062_
                         _y19063_)
                        (if (not _v2=target?19035_)
                            (_vblit19038_
                             _v219031_
                             _k19062_
                             _i119065_
                             _r219054_)
                            '#!void))))))))))
  (define std/sort#getrun
    (lambda (_v19017_ _l19018_ _r19019_ _elt<19020_)
      (let _lp19022_ ((_i19024_ (+ _l19018_ '1))
                      (_x19025_ (vector-ref _v19017_ _l19018_)))
        (if (>= _i19024_ _r19019_)
            (- _i19024_ _l19018_)
            (let ((_y19027_ (vector-ref _v19017_ _i19024_)))
              (if (_elt<19020_ _y19027_ _x19025_)
                  (- _i19024_ _l19018_)
                  (_lp19022_ (+ _i19024_ '1) _y19027_)))))))
  (define std/sort#list-sorted?
    (lambda (_list19001_ _<19002_)
      (let ((_$e19004_ (not (pair? _list19001_))))
        (if _$e19004_
            _$e19004_
            (let _lp19007_ ((_prev19009_ (car _list19001_))
                            (_tail19010_ (cdr _list19001_)))
              (let ((_$e19012_ (not (pair? _tail19010_))))
                (if _$e19012_
                    _$e19012_
                    (let ((_next19015_ (car _tail19010_)))
                      (if (not (_<19002_ _next19015_ _prev19009_))
                          (_lp19007_ _next19015_ (cdr _tail19010_))
                          '#f)))))))))
  (define std/sort#vector-sorted?
    (lambda (_v18981_ _elt<18982_ . _maybe-start+end18983_)
      (if (vector? _v18981_) '#!void (error '"Expected vector" _v18981_))
      (let ((_g271139_
             (std/sort#parse-vector-final-start+end
              std/sort#vector-sorted?
              _v18981_
              _maybe-start+end18983_)))
        (begin
          (let ((_g271140_
                 (if (##values? _g271139_) (##vector-length _g271139_) 1)))
            (if (not (##fx= _g271140_ 2))
                (error "Context expects 2 values" _g271140_)))
          (let ((_start18985_ (##vector-ref _g271139_ 0))
                (_end18986_ (##vector-ref _g271139_ 1)))
            (let ((_$e18988_ (>= _start18985_ _end18986_)))
              (if _$e18988_
                  _$e18988_
                  (let _lp18991_ ((_i18993_ (+ _start18985_ '1))
                                  (_vi-118994_
                                   (vector-ref _v18981_ _start18985_)))
                    (let ((_$e18996_ (>= _i18993_ _end18986_)))
                      (if _$e18996_
                          _$e18996_
                          (let ((_vi18999_ (vector-ref _v18981_ _i18993_)))
                            (if (not (_elt<18982_ _vi18999_ _vi-118994_))
                                (_lp18991_ (+ _i18993_ '1) _vi18999_)
                                '#f)))))))))))))
