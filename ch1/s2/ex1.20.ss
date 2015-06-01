;;; We investigate the procedure
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
;;; Note that the applicative-order
;;; evaluation gives the same evaluation
;;; process as the normal-order here.
;;; This is because at every call of
;;; gcd, b must be evaluated to
;;; determine the behaivor of the
;;; if statement.
