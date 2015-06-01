(define (square-list items)
    (if (null? items)
        nil
        (cons (square (car list))
              (square-list (cdr items)))))

(define (square-list items)
    (map square items))
