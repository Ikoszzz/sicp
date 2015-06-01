(define (split painter orig-placer split-placer)
	(lambda (painter n)
		(if (= n 0)
		 	painter
			(let ((smaller (split painter (- n 1))))
				(orig-placer painter (split-placer smaller smaller))))))
