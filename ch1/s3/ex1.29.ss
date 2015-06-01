(define (sum term x next y)
    (if (> x y)
    0
    (+ (term x)
       (sum term (next x) next y))))

(define (inc x) (+ x 1))

(define (simp-rule f a b n) 
    (define h (/ (- b a) n))
    (define (coeff i)
        (cond ((= i 0) 1)
              ((= i n) 1)
              ((= (remainder i 2) 1) 4)
              (else 2)))
    (define (y i)
        (f (+ a (* i h))))
    (define (simp-term i)
        (* (/ h 3) (coeff i) (y i)))
    (sum simp-term 0 inc n))

(define (cube x) (* x x x))
