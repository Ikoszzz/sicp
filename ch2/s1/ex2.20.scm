(define (same-parity n . args)
    (define (same-parity-iter n args return-list)
        (if (null? args)
            return-list
            (if (= (remainder n 2) (remainder (car args) 2))
                (same-parity-iter n
                                  (cdr args)
                                  (cons (car args) return-list))
                (same-parity-iter n (cdr args) return-list))))
    (same-parity-iter n args ()))
