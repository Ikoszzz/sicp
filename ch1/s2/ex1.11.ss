;;; We want a function f such that
;;; f(n)=n if n<3 and f(n)=f(n-1)+2f(n-2)
;;; +3f(n-3) if n>=3.

;; First we write f as a recursive process:
(define (f n)
	(if (< n 3) 
		n
		(+ (f (- n 1))
		   (* 2 (f (- n 2)))
		   (* 3 (f (- n 3))))))

;; Now as an iterative process:


(define (g-iter n sum)
	(if (< a 3) 
		n
		(g-iter (n - 1)
				(+ f

	
