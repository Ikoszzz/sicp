; Here is the given program:
(define (square-list-1 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons (square (car things))
                        answer))))
    (iter items nil))
; The problem is with the line
;;; (cons (square (car things)) answer)
; Here is fixed code:
(define (fixed-square-list-1 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (append answer
                          (list (square (car things)))))))
    (iter items nil))

(define nil ())

; Scheme uses applicatice order evaluation.
; thus (cdr things) is evaluated down the
; rescursion before (car things) is called.
; This leads to the reversed ordering.

; Here is the attempted fix:
(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons answer
                        (square (car things))))))
    (iter items nil))
; Basically same problem as above
