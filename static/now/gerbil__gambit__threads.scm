(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define gerbil/gambit/threads#spawn
    (lambda (_f66024_ . _args66025_)
      (gerbil/gambit/threads#spawn-actor _f66024_ _args66025_ '#!void '#f)))
  (define gerbil/gambit/threads#spawn/name
    (lambda (_name66020_ _f66021_ . _args66022_)
      (gerbil/gambit/threads#spawn-actor
       _f66021_
       _args66022_
       _name66020_
       '#f)))
  (define gerbil/gambit/threads#spawn/group
    (lambda (_name66014_ _f66015_ . _args66016_)
      (let ((_tgroup66018_ (make-thread-group _name66014_)))
        (gerbil/gambit/threads#spawn-actor
         _f66015_
         _args66016_
         _name66014_
         _tgroup66018_))))
  (define gerbil/gambit/threads#spawn-actor
    (lambda (_f65992_ _args65993_ _name65994_ _tgroup65995_)
      (letrec ((_thread-main65997_
                (lambda (_thunk66006_)
                  (lambda ()
                    (with-exception-handler
                     (lambda (_exn66009_)
                       (##continuation-capture
                        (lambda (_cont66011_)
                          (if gerbil/gambit/threads#unhandled-actor-exception-hook
                              (with-exception-catcher
                               void
                               (lambda ()
                                 (gerbil/gambit/threads#unhandled-actor-exception-hook
                                  _cont66011_
                                  _exn66009_)))
                              '#!void)
                          (##continuation-graft
                           (##continuation-last _cont66011_)
                           ##primordial-exception-handler
                           _exn66009_))))
                     _thunk66006_)))))
        (if (procedure? _f65992_)
            (let ((_thunk66003_
                   (if (null? _args65993_)
                       _f65992_
                       (lambda () (apply _f65992_ _args65993_))))
                  (_tgroup66004_
                   (let ((_$e66000_ _tgroup65995_))
                     (if _$e66000_
                         _$e66000_
                         (gerbil/gambit/threads#current-thread-group)))))
              (thread-start!
               (thread-init!
                (gerbil/gambit/threads#construct-actor-thread '#f)
                (_thread-main65997_ _thunk66003_)
                _name65994_
                _tgroup66004_)))
            (error '"Bad argument; expected procedure" _f65992_)))))
  (namespace
   ("gerbil/gambit/threads#"
    construct-actor-thread
    actor-thread?
    actor-thread-locals
    actor-thread-locals-set!))
  (define-type-of-thread
   actor-thread
   constructor:
   construct-actor-thread
   id:
   gerbil#actor-thread::t
   locals)
  (define gerbil/gambit/threads#spawn-thread__%
    (lambda (_thunk65970_ _name65971_ _tgroup65972_)
      (thread-start! (make-thread _thunk65970_ _name65971_ _tgroup65972_))))
  (define gerbil/gambit/threads#spawn-thread__0
    (lambda (_thunk65977_)
      (let* ((_name65979_ absent-obj) (_tgroup65981_ absent-obj))
        (gerbil/gambit/threads#spawn-thread__%
         _thunk65977_
         _name65979_
         _tgroup65981_))))
  (define gerbil/gambit/threads#spawn-thread__1
    (lambda (_thunk65983_ _name65984_)
      (let ((_tgroup65986_ absent-obj))
        (gerbil/gambit/threads#spawn-thread__%
         _thunk65983_
         _name65984_
         _tgroup65986_))))
  (define gerbil/gambit/threads#spawn-thread
    (lambda _g66027_
      (let ((_g66026_ (length _g66027_)))
        (cond ((##fx= _g66026_ 1)
               (apply gerbil/gambit/threads#spawn-thread__0 _g66027_))
              ((##fx= _g66026_ 2)
               (apply gerbil/gambit/threads#spawn-thread__1 _g66027_))
              ((##fx= _g66026_ 3)
               (apply gerbil/gambit/threads#spawn-thread__% _g66027_))
              (else
               (##raise-wrong-number-of-arguments-exception
                gerbil/gambit/threads#spawn-thread
                _g66027_))))))
  (define gerbil/gambit/threads#thread-local-ref__%
    (lambda (_key65954_ _default65955_)
      (let ((_tab65957_ (gerbil/gambit/threads#thread-local-table)))
        (table-ref _tab65957_ _key65954_ _default65955_))))
  (define gerbil/gambit/threads#thread-local-ref__0
    (lambda (_key65962_)
      (let ((_default65964_ absent-obj))
        (gerbil/gambit/threads#thread-local-ref__%
         _key65962_
         _default65964_))))
  (define gerbil/gambit/threads#thread-local-ref
    (lambda _g66029_
      (let ((_g66028_ (length _g66029_)))
        (cond ((##fx= _g66028_ 1)
               (apply gerbil/gambit/threads#thread-local-ref__0 _g66029_))
              ((##fx= _g66028_ 2)
               (apply gerbil/gambit/threads#thread-local-ref__% _g66029_))
              (else
               (##raise-wrong-number-of-arguments-exception
                gerbil/gambit/threads#thread-local-ref
                _g66029_))))))
  (define gerbil/gambit/threads#thread-local-get
    (lambda (_key65951_)
      (gerbil/gambit/threads#thread-local-ref__% _key65951_ '#f)))
  (define gerbil/gambit/threads#thread-local-set!
    (lambda (_key65946_ _value65947_)
      (let ((_tab65949_ (gerbil/gambit/threads#thread-local-table)))
        (table-set! _tab65949_ _key65946_ _value65947_))))
  (define gerbil/gambit/threads#thread-local-clear!
    (lambda (_key65942_)
      (let ((_tab65944_ (gerbil/gambit/threads#thread-local-table)))
        (table-set! _tab65944_ _key65942_))))
  (define gerbil/gambit/threads#thread-local-table
    (lambda ()
      (let ((_thr65928_ (current-thread)))
        (if (gerbil/gambit/threads#actor-thread? _thr65928_)
            (let ((_$e65930_
                   (gerbil/gambit/threads#actor-thread-locals _thr65928_)))
              (if _$e65930_
                  (values _$e65930_)
                  (let ((_tab65933_ (make-table 'test: eq?)))
                    (gerbil/gambit/threads#actor-thread-locals-set!
                     _thr65928_
                     _tab65933_)
                    _tab65933_)))
            (if (eq? _thr65928_ ##primordial-thread)
                gerbil/gambit/threads#*primordial-thread-locals*
                (begin
                  (mutex-lock! gerbil/gambit/threads#*thread-locals-mutex*)
                  (let ((_$e65935_
                         (table-ref
                          gerbil/gambit/threads#*thread-locals*
                          _thr65928_
                          '#f)))
                    (if _$e65935_
                        ((lambda (_tab65938_)
                           (mutex-unlock!
                            gerbil/gambit/threads#*thread-locals-mutex*)
                           _tab65938_)
                         _$e65935_)
                        (let ((_tab65940_ (make-table 'test: eq?)))
                          (table-set!
                           gerbil/gambit/threads#*thread-locals*
                           _thr65928_
                           _tab65940_)
                          (mutex-unlock!
                           gerbil/gambit/threads#*thread-locals-mutex*)
                          _tab65940_)))))))))
  (define gerbil/gambit/threads#*primordial-thread-locals*
    (make-table 'test: eq?))
  (define gerbil/gambit/threads#*thread-locals*
    (make-table 'test: eq? 'weak-keys: '#t))
  (define gerbil/gambit/threads#*thread-locals-mutex*
    (make-mutex 'thread-locals))
  (define gerbil/gambit/threads#unhandled-actor-exception-hook '#f)
  (define gerbil/gambit/threads#unhandled-actor-exception-hook-set!
    (lambda (_proc65922_)
      (if (or (not _proc65922_) (procedure? _proc65922_))
          (set! gerbil/gambit/threads#unhandled-actor-exception-hook
                _proc65922_)
          (error '"Bad argument; expected procedure or #f" _proc65922_))))
  (define gerbil/gambit/threads#with-exception-stack-trace__%
    (lambda (_thunk65903_ _error-port65904_)
      (with-exception-handler
       (let ((_E65906_ (current-exception-handler)))
         (lambda (_exn65908_)
           (##continuation-capture
            (lambda (_cont65910_)
              (gerbil/gambit/threads#dump-stack-trace!
               _cont65910_
               _exn65908_
               _error-port65904_)
              (_E65906_ _exn65908_)))))
       _thunk65903_)))
  (define gerbil/gambit/threads#with-exception-stack-trace__0
    (lambda (_thunk65915_)
      (let ((_error-port65917_ (current-error-port)))
        (gerbil/gambit/threads#with-exception-stack-trace__%
         _thunk65915_
         _error-port65917_))))
  (define gerbil/gambit/threads#with-exception-stack-trace
    (lambda _g66031_
      (let ((_g66030_ (length _g66031_)))
        (cond ((##fx= _g66030_ 1)
               (apply gerbil/gambit/threads#with-exception-stack-trace__0
                      _g66031_))
              ((##fx= _g66030_ 2)
               (apply gerbil/gambit/threads#with-exception-stack-trace__%
                      _g66031_))
              (else
               (##raise-wrong-number-of-arguments-exception
                gerbil/gambit/threads#with-exception-stack-trace
                _g66031_))))))
  (namespace ("gerbil/gambit/threads#" dump-stack-trace!))
  (define (dump-stack-trace!
           cont
           exn
           #!optional
           (error-port (current-error-port)))
    (let ((out (open-output-string)))
      (display "*** Unhandled exception in " out)
      (display (current-thread) out)
      (newline out)
      (display-exception exn out)
      (display "Continuation backtrace: " out)
      (newline out)
      (##display-continuation-backtrace
       cont
       out
       #f
       #f
       ##backtrace-default-max-head
       ##backtrace-default-max-tail
       0)
      (##write-string (get-output-string out) error-port)))
  (define gerbil/gambit/threads#current-thread-group
    (lambda () (thread-thread-group (current-thread))))
  (define gerbil/gambit/threads#with-lock
    (lambda (_mx65896_ _proc65897_)
      (dynamic-wind
       (lambda () (mutex-lock! _mx65896_))
       _proc65897_
       (lambda () (mutex-unlock! _mx65896_))))))
