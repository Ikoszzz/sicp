; We want a program to generate a
; set of subsets of a set.
(define (subset s)
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
            (append rest (map (my-append (car s)) 
                              rest)))))
(define (my-append x)
    (lambda (y) (append x y)))

; Here's why this works. After the let
; statement, the list rest consists of
; all subsets of the set not containing
; (car s). Thus we need to append to
; rest the set of all subsets containing
; (car s). This is merely the list
; rest with (car s) added to every element.
; So my-append appends (car s) to an input
; list x.
