;;; Newton's method for
;;; finding cube roots.

(define (cube-root-iter guess base)
	(if (good-enough? guess base)
		guess
		(cube-root-iter (improve guess base)
						base)))

(define (good-enough? guess base)
	(> 0.001 (abs (- (cube guess) base))))

(define (improve guess base)
	(/ (+ (/ base (square guess)) 
		  (* 2 guess))
	   3))

(define (square x) (* x x))

(define (cube x) (* (square x) x))

(define (abs x)
	(if (< x 0)
		(- x)
		x))

(define (cube-root base)
	(cube-root-iter 1.0 base))
