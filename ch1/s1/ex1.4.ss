;;; Consider the following procedure:
(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))
;;; Note that this procedure has an
;;; operator which is a compound
;;; expression. In this case, if
;;; b > 0, then this function returns
;;; a + b, otherwise returning a - b.
;;; This is equivalent to a + |b|,
;;; which is the name of the function.
