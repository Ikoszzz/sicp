(define (my-for-each f some-list)
    (f (car some-list))
    (my-for-each f (cdr some-list)))
