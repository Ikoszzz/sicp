(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))

(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (cdr mobile))

(define (branch-length branch)
    (car branch))

(define (branch-structure branch)
    (cdr branch))

(define (weight branch)
    (if (not (list? (branch-structure branch)))
        branch
        (+ (weight (left-branch (branch-structure branch)))
           (weight (right-branch (branch-structure branch))))))

(define (total-weight mobile)
    (+ (weight (left-branch mobile)))
       (weight (right-branch mobile)))

(define (torque branch)
    (* (weight branch) (branch-length (branch))))

(define (balanced mobile)
    (= (torque (left-branch mobile)) (torque (right-branch mobile))))

; The change shouldn't affect things at all
