;;; defining a prodecure f that takes
;;; three numbers as arguments and
;;; returns the sum of the equares
;;; of the two larger numbers

;; takes input x and returns its square
(define (square x) (* x x))

;; takes inputs x and y and returns 
;; the sum of their squares
(define (sumsquare x y)
		(+ (square x) (square y)))

;; here is f
(define (f a b c)
	(if (and (< a b) (< a c))
		(sumsquare b c)
	(if (and (< b c) (< b a))
		(sumsquare a c)
		(sumsquare a b))))
		
