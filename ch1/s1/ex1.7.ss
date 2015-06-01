;;; We want a square-root procedure
;;; which detects the change in the
;;; guess and uses that as a criteria
;;; for when the guess is good enough.
;;; Let's try it:

;; guess is the guessed square root.
;; base is the base number to be rooted.
;; frac is the fraction of the guess
;; which is the maximum difference
;; we want between our eventual output
;; and our guess.
(define (sqrt-iter guess base frac)
	(if (good-enough? guess base frac)
		guess
		(sqrt-iter (improve guess base)
				   base frac)))

(define (good-enough? guess base frac)
	(< (abs (- guess (improve guess base)))
	   (/ guess frac)))

(define (improve guess base)
	(average guess (/ base guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (sqrt x)
	(define oldguess guess)
	(sqrt-iter 1.0 x 1000))

(define (abs x)
	(if (< x 0)
		(- x)
		x))
