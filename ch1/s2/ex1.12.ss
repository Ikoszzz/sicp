(define (dec x) (- x 1))

(define (pascal i j)
    (cond ((or (= i 0) (= j 0)) 0)
          ((or (= i 1) (= j 1)) 1))
    (+ (pascal (dec i) (dec j)) (pascal (dec i) j)))
