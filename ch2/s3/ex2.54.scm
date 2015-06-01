(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) true)
   		((not (eq? (car list1) (car list2))) false)
		(else (equal? (cdr list1) (cdr list2)))))
