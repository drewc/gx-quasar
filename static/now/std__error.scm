(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/error#<error>::display-exception
    (lambda (_self36965_ _port36966_)
      (call-with-parameters
       (lambda ()
         (let ((_$e36969_ (error-trace _self36965_)))
           (if _$e36969_
               ((lambda (_where36972_) (display* _where36972_ '": "))
                _$e36969_)
               '#!void))
         (display*
          '"["
          (let ((__tmp272540 (object-type _self36965_)))
            (declare (not safe))
            (##type-name __tmp272540))
          '"] ")
         (displayln (error-message _self36965_))
         (let ((_irritants36974_ (error-irritants _self36965_)))
           (if (null? _irritants36974_)
               '#!void
               (begin
                 (display '"--- irritants: ")
                 (for-each
                  (lambda (_obj36976_) (display* _obj36976_ '" "))
                  _irritants36974_)
                 (newline)))))
       current-output-port
       _port36966_)))
  (bind-method!
   error::t
   'display-exception
   std/error#<error>::display-exception
   '#t)
  (define std/error#io-error::t
    (make-struct-type
     'std/error#io-error::t
     error::t
     '0
     'io-error
     '()
     '#f
     '()))
  (define std/error#io-error? (make-struct-predicate std/error#io-error::t))
  (define std/error#make-io-error
    (lambda _$args36839_
      (apply make-struct-instance std/error#io-error::t _$args36839_)))
  (define std/error#timeout-error::t
    (make-struct-type
     'std/error#timeout-error::t
     error::t
     '0
     'timeout-error
     '()
     '#f
     '()))
  (define std/error#timeout-error?
    (make-struct-predicate std/error#timeout-error::t))
  (define std/error#make-timeout-error
    (lambda _$args36836_
      (apply make-struct-instance std/error#timeout-error::t _$args36836_)))
  (define std/error#raise-io-error
    (lambda (_where36832_ _what36833_ . _irritants36834_)
      (raise (make-struct-instance
              std/error#io-error::t
              _what36833_
              _irritants36834_
              _where36832_))))
  (define std/error#raise-timeout
    (lambda (_where36828_ _what36829_ . _irritants36830_)
      (raise (make-struct-instance
              std/error#timeout-error::t
              _what36829_
              _irritants36830_
              _where36828_)))))
