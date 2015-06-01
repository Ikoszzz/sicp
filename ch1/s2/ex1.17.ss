(define (mult a b)
    (cond ((= b 0) 0)
          ((even? b) (double (mult a (halve b))))
          (else (+ a (mult a (- b 1))))))

(define (double n)
    (* 2 n))

(define (halve n)
    (/ n 2))

(define (even? n)
    (= (remainder n 2) 0))
