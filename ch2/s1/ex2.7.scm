; Here is our constructor:
(define (make-interval a b) (cons a b))

; Here are the selectors:
(define (lower-bound interval)
    (min (car interval) (cdr interval)))

(define (upper-bound interval)
    (max (car itnerval) (cdr interval)))
