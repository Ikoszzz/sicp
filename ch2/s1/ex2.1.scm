(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (sub-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (mult-rat x y)
    (make-rat (* (numer x) (numer y))
              (* (denom x) (denom y))))

(define (div-rat x y)
    (make-rat (* (numer x) (denom y))
              (* (numer y) (denom x))))

(define (make-rat n d) 
    (cond ((and (< n 0) (< d 0)) 
           (cons (- n) (- d)))
          ((and (> n 0) (< d 0))
           (cons (- n) (- d)))
          (else (cons n d))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

