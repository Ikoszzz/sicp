(define (tree-map proc tree)
    (cond ((null? tree) nil)
          ((not (list? (car tree)))
           (cons (proc (car tree))
                 (tree-map proc (cdr tree))))
          (else
           (cons (tree-map proc (car tree))
                 (tree-map proc (cdr tree))))))
