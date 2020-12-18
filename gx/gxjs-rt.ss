namespace: "#"

(define (apply proc arg1 . rest)
  (declare (not inline))
  (if (##pair? rest)
    (let loop ((prev arg1) (lst rest))
      (let ((temp (##car lst)))
        (##set-car! lst prev)
        (let ((tail (##cdr lst)))
          (if (##pair? tail)
            (loop temp tail)
            (begin
              (##set-cdr! lst temp)
              (##apply proc rest))))))
    (##apply proc arg1)))

(def (raise-wrong-number-of-arguments-exception proc args)
  (##inline-host-statement
   "((proc, args) => {
     var name = (proc._name === undefined) ? proc : proc._name.name;
     console.error('too many args for', name);
      throw { name: 'wrong-number-of-arguments',
              message: name + ' called with foo!',
              name: name,
              proc: proc, args: args }
   })((@1@), (@2@));"
   proc args))

(def (raise-type-exception n expected got fn  . args)
  (##inline-host-statement
   "console.error('type exception',
                   (() => { fn = (@2@);
                      if (fn !== undefined) { return fn._name.name };
                    return fn; })(), 'expected', (@1@).name, 'got',  (@3@), (@4@))"
    expected (car fn) got (cdr fn)))

(def (fail-check-procedure proc . args)
  (##inline-host-statement
   "console.error('fail check procedure', (@1@), (@2@))"
   proc args))

(def (list->vector lst)
  (def n (##length lst))
  (def vec (##make-vector n))
  (let loop ((i 0) (l lst))
    (if (not (null? l))
      (begin
        (##vector-set! vec i (##car l))
        (loop (+ i 1) (##cdr l)))))
  vec)
(def (reverse lst)
  (let loop ((x lst) (result '()))
    (if (pair? x)
        (loop (cdr x) (cons (car x) result))
        result)))

(def (length lst)
  (if (null? lst) 0 (+ 1 (length (##cdr lst)))))



(def (vector->list vect)
  (let loop ((lst '()) (i (- (##vector-length vect) 1)))
    (if (< i 0)
      lst
      (loop (##cons (##vector-ref vect i) lst) (- i 1)))))

(def (vector-append v . vs)
  (def vvs (list->vector vs))
  (##inline-host-expression "((v, vs) => { return v.concat.apply(v, vs); })((@1@), (@2@));" v vvs))

(def (number? n?)
  (##inline-host-expression
   "(() => {
      n = g_scm2host(@1@);
      is_n = typeof n === 'number';
      return g_host2scm(is_n);
    })();" n?))

(def (number->string n)
  (##inline-host-expression "(() => { n = g_scm2host(@1@) ; return g_host2scm(n.toString()); })();" n))

(def (error thing)
  (if (##string? thing)
    (set! thing (##inline-host-expression "g_scm2host(@1@)" thing)))
  (##inline-host-statement "_e = (@1@);
   if (_e instanceof Error) { throw _e } else { throw new Error(_e) };" thing))

(def (string-append . strs)
  (def (strapp s1 s2)
    (let* ((l1 (##string-length s1))
           (l2 (##string-length s2))
           (l3 (+ l1 l2))
           (s3 (##make-string l3)))
      (let lp ((n 0))
        (if (< n l1)
          (##string-set! s3 n (##string-ref s1 n))
          (if (>= n l1)
            (##string-set! s3 n (##string-ref s2 (- n l1)))))
      (if (< n l3) (lp (+ 1 n))))
                                        ;(##apply string-append s3 rst)
      s3))

  (def str (car strs))

  (let applp ((lst (cdr strs)))
    (if (null? lst) str
        (begin (set! str (strapp str (car lst)))
               (applp (cdr lst))))))
