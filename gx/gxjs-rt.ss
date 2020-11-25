namespace: "#"
(declare (not inline))

;; (define (apply proc arg1 . rest)
;;   (if (##pair? rest)

;;       (let loop ((prev arg1) (lst rest))
;;         (let ((temp (##car lst)))
;;           (##set-car! lst prev)
;;           (let ((tail (##cdr lst)))
;;             (if (##pair? tail)
;;                 (loop temp tail)
;;                 (begin
;;                   (##set-cdr! lst temp)
;;                   (##apply proc rest))))))

;;       (##apply proc arg1)))

(def (error thing)
  (if (##string? thing)
    (set! thing (##inline-host-expression "g_scm2host(@1@)" thing)))
  (##inline-host-statement "_e = (@1@);
   if (_e instanceof Error) { throw _e } else { throw new Error(_e) };" thing))

(def (length lst)
  (if (null? lst) 0 (+ 1 (length (##cdr lst)))))

(def (list->vector lst)
  (def n (##length lst))
  (def vec (##make-vector n))

  (let loop ((i 0) (l lst))
    (if (not (null? l))
      (begin
        (##vector-set! vec i (##car l))
        (loop (+ i 1) (##cdr l)))))
  vec)

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
