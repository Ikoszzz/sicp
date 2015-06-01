;;; We consider the two procedures:
(define (p) (p))

(define (test x y)
	(if (= x 0)
	0
	y))

;;; and then the evaltuation
(test 0 (p))

;;; With the applicative-order evaluation,
;;; the value of (p) will first be determined.
;;; This will then be fed into the test statement
;;; for the if statement, which will output either
;;; 0 or y. However, with the normal-order
;;; evaluation, (p) will be some expression,
;;; not the value 0, so we will return y.
