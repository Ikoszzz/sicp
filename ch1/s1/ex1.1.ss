10 				; returns 10
(+ 5 3 4) 		; returns 12
(- 9 1)			; returns 8
(/ 6 2)			; returns 3
(+ (* 2 4) 
   (- 4 6))		; returns 6
(define a 3)	; returns a
(define b
	(+ a 1))	; returns b
(+ a b (* a b))	; returns 19
(= a b)			; returns #f (false)
(if (and (> a b)
		 (< b (* a b)))
	b
	a)			; returns 4
(cond ((= a 4) 6)
	  ((= b 4) (+ 6 7 a))
	  (else 25)); returns 16
(+ 2 (if (> b a)
		 b
		 a))	; returns 6
(* (cond ((> a b) a)
		 ((< a b) b)
		 (else -1))
   (+ a 1))		; returns 16
		
