(define (fast-mult m n)
    (mult-iter m n 0))

(define (double n) 
    (* 2 n))

(define (halve n) 
    (/ n 2))

(define (even? n) 
    (= (remainder n 2) 0))

(define (mult-iter m n a)
    (cond ((= n 0) a)
          ((even? n) (mult-iter (double m)
                                (halve n)
                                a))
          (else (mult-iter m (- n 1) (+ a m)))))
