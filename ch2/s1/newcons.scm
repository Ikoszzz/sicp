; cons, car and cdr
; as procedures!
(define (cons x y)
    (define (dispatch m)
        (cond ((= m 0) x)
              ((= m 1) y)
              (else (error "Argument now 0 or 1 -- CONS" m))))
    dispatch)

(define (car z) (z 0))

(define (cdr z) (z 1))
