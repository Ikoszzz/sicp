; First definition, no higher-order
; procedures
(define (square-tree tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (square tree))
          (else (cons (square-tree (car tree))
                       (square-tree (cdr tree))))))
(define nil ())
(define (square x) (* x x))

; Now with higher-order prodedures
(define (square-tree tree)
    (cond ((null? tree) nil)
          ((not (list? (car tree)))
           (cons (square (car tree))
                 (square-tree (cdr tree))))
          (else
           (cons (square-tree (car tree))
                 (square-tree (cdr tree))))))
