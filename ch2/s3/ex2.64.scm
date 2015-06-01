(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
   	  (cons '() elts)
	  (let ((left-size (quotient (- n 1) 2)))
