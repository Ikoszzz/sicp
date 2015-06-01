; We have
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))

; We use normal-order substitution to
; evaluate (add-1 zero)
;;; (add-1 zero)
;;; (add-1 (lambda (f) (lambda (x) x)))
;;; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))) 
;;; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;;; (lambda (f) (lambda (x) (f x)))
; So we can write
(define one (lambda (f) (lambda (x) (f x))))

; Similarly, we would have
(define two (lambda (f) (lambda (x) (f (f x)))))

; Notice that (f n) = (+ n 1). Thus we can
; define addition as follows:
(define (inc number)
    (+ number 1))

(define (value church-num)
    ((church-num inc) 0))

; Above, we pass inc and 0 to a church numeral.
; For instance, one as defined above becomes
;;; (inc 0)
; Finally, we have
(define (sum a b)
    (+ (value a) (value b)))
