(define nil ())
(define (enumerate-interval x y)
	(if (> x y)
	 	nil
		(cons x (enumerate-interval (+ x 1) y))))

(define (unique-pairs n)
	(flatmap (lambda (i)
			 	(map (lambda (j) (list i j))
				 	 (enumerate-interval 1 (- i 1))))
	 		 (enumerate-interval 1 n)))
