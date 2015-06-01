(define (accumulate-n op init seqs)
	(if (null? (car seqs))
	 	nil
		(cons (accumulate op init (map car sequence)
			  (accumulate-n op init (map cdr sequence))))))
