;;; The first procedure is:
(define (+ a b)
	(if (= a 0)
		b
		(inc (+ (dec a) b))))
;;; Let's see what happens to (+ 4 5)
;;; using the substitution model of
;;; evaluation:
(+ 4 5)
(inc (+ (dec 4) 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc (7)))
(inc 8)
9
;;; From it's ``shape'', this process is
;;; clearly recursive, not iterative.

;;; Now to look at the second procedure:
(define (+ a b)
	(if (= a 0)
	b
	(+ (dec a) (inc b))))
;;; Let's evaluate (+ 4 5), again using
;;; the substitution model of evaluation:
(+ 4 5)
(+ (dec 4) (inc 5))
(+ (dec 3) (inc 6))
(+ (dec 2) (inc 7))
(+ (dec 1) (inc 8))
(inc 8)
9
;;; Fron it's ``shape'', we conclude that
;;; this process is iterative (maybe even
;;; linear iterative).
