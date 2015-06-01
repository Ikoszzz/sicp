(define (cons a b)
    (* (power 2 a) (power 3 b)))

(define (power base exponent)
     (if (= exponent 0)
         1
         (* base (power base (- exponent 1)))))

(define (car n)
    (if (not (= (remainder n 2) 0))
        0
        (+ 1 (car (/ n 2)))))

(define (cdr n)
    (if (not (= (remainder n 3) 0))
        0
        (+ 1 (car (/ n 3)))))
