(define (my-reverse items)
    (define (my-reverse-iter inputs answer)
        (if (null? inputs)
            answer
            (my-reverse-iter (cdr inputs)
                             (cons (car inputs)
                                   answer))))
    (my-reverse-iter items ()))        
    
