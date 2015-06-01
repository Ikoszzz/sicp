; We have
(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
    (z (lambda (p q) p))

; To show that this works, we use
; the substitution model:
;;; (car (cons x y))
;;; (car (lambda (m) (m x y)))
;;; ((lambda (m) (m x y)) (lambda (p q) p))
;;; ((lambda (p q) p) x y)
;;; x

; From this, we can see the
; correspoding definition of cdr:
(define (cdr z)
    (z (lambda (p q) q)))

; For practice, I prove this works as well
;;; (cdr (cons x y))
;;; (cdr (lambda (m) (m x y)))
;;; ((lambda (m) (m x y)) (lambda (p q) q))
;;; ((lambda (p q) q) x y)
;;; y
