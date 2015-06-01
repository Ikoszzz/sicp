; First, we set
(define x (list 1 2 3))
(define y (list 4 5 6))

; Then we take
(append x y)
; This takes a two lists and
; adds the contents of the second
; list to the end of the first list.
; thus this returns
>> (1 2 3 4 5 6)

; Now take
(cons x y)
; The idea is to create a list
; such that (car (cons x y)) is
; x, and such that
; (cds (cons x y)) is y. Thus
; (cons x y) returns as
>> ((1 2 3) 4 5 6)

; Finally we have
(list x y)
; This returns a pair whose
; first element is x, and whose
; second element is y. So we have
>> ((1 2 3) (4 5 6))
