;; declarative factorial
(define (factorial n)
 (define (iter product counter)
  (if (> counter n)
   	  product
	  (iter (* counter product)
	   		(+ counter 1))))
 (iter 1 1))

;; imperative factorial
(define (factorial n)
 (let ((product 1)
	   (counter 1))
  (define (iter)
   (if (> counter n)
	   product
	   (begin (set! product (* coutner product))
			  (set! counter (+ counter 1))
			  (iter))))
 (iter)))

;; note that changing the order of the set!
;; assignments would break the program. In
;; imperative programming, we have to worry
;; about the relative orders of the assignments,
;; which does not come up in functional programming.

