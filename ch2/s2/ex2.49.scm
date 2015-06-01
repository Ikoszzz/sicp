(define outline-painter
  (let ((border-list (list
					   (make-segment (make-vect 0 0)
									 (make-vect 0 1))
					   (make-segment (make-vect 0 0)
									 (make-vect 1 0))
					   (make-segment (make-vect 0 1)
									 (make-vect 1 1))
					   (make-segment (make-vect 1 0)
									 (make-vect 1 1)))))
    (segments->painter border-list)))

(define X-painter
  (let ((x-list (list
				  (make-segment (make-vect 0 0)
				   				(make-vect 1 1))
				  (make-segment (make-vect 1 0)
				   				(make-vect 0 1)))))
    (segments->painter x-list)))

(define diamond-painter
  (let ((diamond-list (list
					    (make-segment (make-vect 0.5 0)
						 			  (make-vect 1 0.5))
						(make-segment (make-vect 1 0.5)
						 			  (make-vect 0.5 1))
						(make-segment (make-vect 0.5 1)
						 			  (make-vect 0 0.5))
						(make-segment (make-vect 0 0.5)
						 			  (make-vect 0.5 0)))))
    (segments->painter diamond-list)))

