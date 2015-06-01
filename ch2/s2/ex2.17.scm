(define (last-pair some-list)
    (if (= (length some-list) 1)
        some-list
        (last-pair (cdr some-list))))
