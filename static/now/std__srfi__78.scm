(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/78#check:write write)
  (define std/srfi/78#check:mode '#f)
  (define std/srfi/78#check-set-mode!
    (lambda (_mode88869_)
      (set! std/srfi/78#check:mode
            (let ((_$e88871_ _mode88869_))
              (if (eq? 'off _$e88871_)
                  '0
                  (if (eq? 'summary _$e88871_)
                      '1
                      (if (eq? 'report-failed _$e88871_)
                          '10
                          (if (eq? 'report _$e88871_)
                              '100
                              (error '"unrecognized mode" _mode88869_)))))))))
  (std/srfi/78#check-set-mode! 'report)
  (define std/srfi/78#check:correct '#f)
  (define std/srfi/78#check:failed '#f)
  (define std/srfi/78#check-reset!
    (lambda ()
      (set! std/srfi/78#check:correct '0)
      (set! std/srfi/78#check:failed '())))
  (define std/srfi/78#check:add-correct!
    (lambda ()
      (set! std/srfi/78#check:correct (+ std/srfi/78#check:correct '1))))
  (define std/srfi/78#check:add-failed!
    (lambda (_expression88863_ _actual-result88864_ _expected-result88865_)
      (set! std/srfi/78#check:failed
            (cons (list _expression88863_
                        _actual-result88864_
                        _expected-result88865_)
                  std/srfi/78#check:failed))))
  (std/srfi/78#check-reset!)
  (define std/srfi/78#check:report-expression
    (lambda (_expression88861_)
      (newline)
      (std/srfi/78#check:write _expression88861_)
      (display '" => ")))
  (define std/srfi/78#check:report-actual-result
    (lambda (_actual-result88859_)
      (std/srfi/78#check:write _actual-result88859_)
      (display '" ; ")))
  (define std/srfi/78#check:report-correct
    (lambda (_cases88857_)
      (display '"correct")
      (if (not (= _cases88857_ '1))
          (begin
            (display '" (")
            (display _cases88857_)
            (display '" cases checked)"))
          '#!void)
      (newline)))
  (define std/srfi/78#check:report-failed
    (lambda (_expected-result88855_)
      (display '"*** failed ***")
      (newline)
      (display '" ; expected result: ")
      (std/srfi/78#check:write _expected-result88855_)
      (newline)))
  (define std/srfi/78#check-report
    (lambda ()
      (if (>= std/srfi/78#check:mode '1)
          (begin
            (newline)
            (display '"; *** checks *** : ")
            (display std/srfi/78#check:correct)
            (display '" correct, ")
            (display (length std/srfi/78#check:failed))
            (display '" failed.")
            (if (or (null? std/srfi/78#check:failed)
                    (<= std/srfi/78#check:mode '1))
                (newline)
                (let* ((_w88846_ (car (reverse std/srfi/78#check:failed)))
                       (_expression88848_ (car _w88846_))
                       (_actual-result88850_ (cadr _w88846_))
                       (_expected-result88852_ (caddr _w88846_)))
                  (display '" First failed example:")
                  (newline)
                  (std/srfi/78#check:report-expression _expression88848_)
                  (std/srfi/78#check:report-actual-result _actual-result88850_)
                  (std/srfi/78#check:report-failed _expected-result88852_))))
          '#!void)))
  (define std/srfi/78#check-passed?
    (lambda (_expected-total-count88840_)
      (if (= (length std/srfi/78#check:failed) '0)
          (= std/srfi/78#check:correct _expected-total-count88840_)
          '#f)))
  (define std/srfi/78#check:proc
    (lambda (_expression88826_
             _thunk88827_
             _equal88828_
             _expected-result88829_)
      (let ((_$e88831_ std/srfi/78#check:mode))
        (if (eq? '0 _$e88831_)
            '#f
            (if (eq? '1 _$e88831_)
                (let ((_actual-result88834_ (_thunk88827_)))
                  (if (_equal88828_
                       _actual-result88834_
                       _expected-result88829_)
                      (std/srfi/78#check:add-correct!)
                      (std/srfi/78#check:add-failed!
                       _expression88826_
                       _actual-result88834_
                       _expected-result88829_)))
                (if (eq? '10 _$e88831_)
                    (let ((_actual-result88836_ (_thunk88827_)))
                      (if (_equal88828_
                           _actual-result88836_
                           _expected-result88829_)
                          (std/srfi/78#check:add-correct!)
                          (begin
                            (std/srfi/78#check:report-expression
                             _expression88826_)
                            (std/srfi/78#check:report-actual-result
                             _actual-result88836_)
                            (std/srfi/78#check:report-failed
                             _expected-result88829_)
                            (std/srfi/78#check:add-failed!
                             _expression88826_
                             _actual-result88836_
                             _expected-result88829_))))
                    (if (eq? '100 _$e88831_)
                        (begin
                          (std/srfi/78#check:report-expression
                           _expression88826_)
                          (let ((_actual-result88838_ (_thunk88827_)))
                            (std/srfi/78#check:report-actual-result
                             _actual-result88838_)
                            (if (_equal88828_
                                 _actual-result88838_
                                 _expected-result88829_)
                                (begin
                                  (std/srfi/78#check:report-correct '1)
                                  (std/srfi/78#check:add-correct!))
                                (begin
                                  (std/srfi/78#check:report-failed
                                   _expected-result88829_)
                                  (std/srfi/78#check:add-failed!
                                   _expression88826_
                                   _actual-result88838_
                                   _expected-result88829_)))))
                        (error '"unrecognized check:mode"
                               std/srfi/78#check:mode))))))
      (if '#f '#f '#!void)))
  (define std/srfi/78#check:proc-ec
    (lambda (_w88818_)
      (let ((_correct?88820_ (car _w88818_))
            (_expression88821_ (cadr _w88818_))
            (_actual-result88822_ (caddr _w88818_))
            (_expected-result88823_ (cadddr _w88818_))
            (_cases88824_ (car (cddddr _w88818_))))
        (if _correct?88820_
            (begin
              (if (>= std/srfi/78#check:mode '100)
                  (begin
                    (std/srfi/78#check:report-expression _expression88821_)
                    (std/srfi/78#check:report-actual-result
                     _actual-result88822_)
                    (std/srfi/78#check:report-correct _cases88824_))
                  '#!void)
              (std/srfi/78#check:add-correct!))
            (begin
              (if (>= std/srfi/78#check:mode '10)
                  (begin
                    (std/srfi/78#check:report-expression _expression88821_)
                    (std/srfi/78#check:report-actual-result
                     _actual-result88822_)
                    (std/srfi/78#check:report-failed _expected-result88823_))
                  '#!void)
              (std/srfi/78#check:add-failed!
               _expression88821_
               _actual-result88822_
               _expected-result88823_)))))))
