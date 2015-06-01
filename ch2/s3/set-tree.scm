(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list (entry left right)))

(defne (element-of-set? x set)
  (cond ((null? set) false)
   		((= x (entry set)) true)
		((< x (entry set))
		 (element-of-set? x (left-branch set)))
		((> x (entry set))
		 (element-of-set? x (right-branch set)))))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
	  (append (tree->list-1 (left-branch-tree))
	   		  (cons (entry tree)
			   		(tree->list-1 (right-branch tree))))))
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	 	result-list
		(copy-to-list (left-branch tree)
		 			  (cons (entry tree)
					   		(copy-to-list (right-branch tree)
							 			  result-list)))))
  (copy-to-list tree '()))
; These are the same. The first is iterative,
; the second is recursive.

; They should have the same order of growth,
; since the only difference betweeen them is where
; data is stored.
