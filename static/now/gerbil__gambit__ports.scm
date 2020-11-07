(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define gerbil/gambit/ports#write-string__%
    (lambda (_str65780_ _port65781_)
      (write-substring _str65780_ '0 (string-length _str65780_) _port65781_)))
  (define gerbil/gambit/ports#write-string__0
    (lambda (_str65786_)
      (let ((_port65788_ (current-output-port)))
        (gerbil/gambit/ports#write-string__% _str65786_ _port65788_))))
  (define gerbil/gambit/ports#write-string
    (lambda _g65793_
      (let ((_g65792_ (length _g65793_)))
        (cond ((##fx= _g65792_ 1)
               (apply gerbil/gambit/ports#write-string__0 _g65793_))
              ((##fx= _g65792_ 2)
               (apply gerbil/gambit/ports#write-string__% _g65793_))
              (else
               (##raise-wrong-number-of-arguments-exception
                gerbil/gambit/ports#write-string
                _g65793_))))))
  (define gerbil/gambit/ports#read-string__%
    (lambda (_obj65761_ _port65762_)
      (if (fixnum? _obj65761_)
          (begin
            (if (##fx>= _obj65761_ '0)
                '#!void
                (error '"Bad argument; expected non-negative fixnum"
                       _obj65761_))
            (let* ((_str65764_ (make-string _obj65761_))
                   (_rd65766_
                    (read-substring _str65764_ '0 _obj65761_ _port65762_)))
              (if (##fxzero? _obj65761_)
                  _str65764_
                  (if (##fxzero? _rd65766_)
                      (eof-object)
                      (if (##fx< _rd65766_ _obj65761_)
                          (begin
                            (string-shrink! _str65764_ _rd65766_)
                            _str65764_)
                          _str65764_)))))
          (if (string? _obj65761_)
              (read-substring
               _obj65761_
               '0
               (##string-length _obj65761_)
               _port65762_)
              (error '"Bad argument; expected string or non-negative fixnum"
                     _obj65761_)))))
  (define gerbil/gambit/ports#read-string__0
    (lambda (_obj65772_)
      (let ((_port65774_ (current-input-port)))
        (gerbil/gambit/ports#read-string__% _obj65772_ _port65774_))))
  (define gerbil/gambit/ports#read-string
    (lambda _g65795_
      (let ((_g65794_ (length _g65795_)))
        (cond ((##fx= _g65794_ 1)
               (apply gerbil/gambit/ports#read-string__0 _g65795_))
              ((##fx= _g65794_ 2)
               (apply gerbil/gambit/ports#read-string__% _g65795_))
              (else
               (##raise-wrong-number-of-arguments-exception
                gerbil/gambit/ports#read-string
                _g65795_))))))
  (define gerbil/gambit/ports#write-u8vector__%
    (lambda (_bytes65747_ _port65748_)
      (write-subu8vector
       _bytes65747_
       '0
       (u8vector-length _bytes65747_)
       _port65748_)))
  (define gerbil/gambit/ports#write-u8vector__0
    (lambda (_bytes65753_)
      (let ((_port65755_ (current-output-port)))
        (gerbil/gambit/ports#write-u8vector__% _bytes65753_ _port65755_))))
  (define gerbil/gambit/ports#write-u8vector
    (lambda _g65797_
      (let ((_g65796_ (length _g65797_)))
        (cond ((##fx= _g65796_ 1)
               (apply gerbil/gambit/ports#write-u8vector__0 _g65797_))
              ((##fx= _g65796_ 2)
               (apply gerbil/gambit/ports#write-u8vector__% _g65797_))
              (else
               (##raise-wrong-number-of-arguments-exception
                gerbil/gambit/ports#write-u8vector
                _g65797_))))))
  (define gerbil/gambit/ports#read-u8vector__%
    (lambda (_obj65728_ _port65729_)
      (if (fixnum? _obj65728_)
          (begin
            (if (##fx>= _obj65728_ '0)
                '#!void
                (error '"Bad argument; expected non-negative fixnum"
                       _obj65728_))
            (let* ((_bytes65731_ (make-u8vector _obj65728_))
                   (_rd65733_
                    (read-subu8vector _bytes65731_ '0 _obj65728_ _port65729_)))
              (if (##fxzero? _obj65728_)
                  _bytes65731_
                  (if (##fxzero? _rd65733_)
                      (eof-object)
                      (if (##fx< _rd65733_ _obj65728_)
                          (begin
                            (u8vector-shrink! _bytes65731_ _rd65733_)
                            _bytes65731_)
                          _bytes65731_)))))
          (if (u8vector? _obj65728_)
              (read-subu8vector
               _obj65728_
               '0
               (##u8vector-length _obj65728_)
               _port65729_)
              (error '"Bad argument; expected u8vector or non-negative fixnum"
                     _obj65728_)))))
  (define gerbil/gambit/ports#read-u8vector__0
    (lambda (_obj65739_)
      (let ((_port65741_ (current-input-port)))
        (gerbil/gambit/ports#read-u8vector__% _obj65739_ _port65741_))))
  (define gerbil/gambit/ports#read-u8vector
    (lambda _g65799_
      (let ((_g65798_ (length _g65799_)))
        (cond ((##fx= _g65798_ 1)
               (apply gerbil/gambit/ports#read-u8vector__0 _g65799_))
              ((##fx= _g65798_ 2)
               (apply gerbil/gambit/ports#read-u8vector__% _g65799_))
              (else
               (##raise-wrong-number-of-arguments-exception
                gerbil/gambit/ports#read-u8vector
                _g65799_)))))))
