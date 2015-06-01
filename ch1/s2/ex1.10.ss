;;; This procedure computes
;;; Ackermann's function:
(define (A x y)
	(cond ((= y 0) 0)
		  ((= x 0) (* 2 y))
		  ((= y 1) 2)
		  (else (A (- x 1)
				   (A x (- y 1))))))
;;; We compute the value of (A 1 10):
(A 1 10)
(A (- 1 1) (A 1 (- 10 1))
(A 0 (A 1 9))
(A 0 (A (- 1 1) (A 1 8)))
(A 0 (A 0 (A 1 8)))
;;; Clearly this eventually becomes:
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
(* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 2)))))))))
1024
;;; Now for the value of (A 2 4):
(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 (A 1 (A 0 2)))
(A 1 (A 1 (* 2 2)))
(A 1 (A 1 4))
(A 1 (A 0 (A 1 3)))
(A 1 (A 0 (A 0 (A 1 2))))
(A 1 (A 0 (A 0 (A 0 (A 1 1)))))
(A 1 (A 0 (A 0 (A 0 2))))
(A 1 16)
(A 0 (A 1 15))
(A 0 (A 0 (A 1 14)))
;;; I give up, the answer is:
65536
;;; As for (A 3 3), the result is:
65536
;;; as well.

;;; Now we consider the following procedures,
;;; and give them concise mathematical definitions
;;; for positive integer values of n:

;;; By the above definition of A,
;;; f multiplies n by 2:
(define (f n) (A 0 n))

;;; As we saw in the caculations above,
;;; g returns 2^n:
(define (g n) (A 1 n))

;;; Can't get this last one:
(define (h n) (A 2 n))

;;; This one is obviously K(n) = 5n^2
(define (k n) (* 5 n n))
