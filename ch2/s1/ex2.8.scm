; We can implement subtraction of two intervals
; as a new interval whose upper bound is the
; max of the upper bounds minus the min of
; the lower bounds, and whose lower bound is
; the max of the lower bounds minus the
; min of the lower bounds.

(define (sub-interval x y)
    (make-interval (- (max (upper-bound x) (upper-bound y))
                      (min (upper-bound x) (upper-bound y)))
                   (- (max (lower-bound x) (lower-bound y))
                      (min (lower-bound x) (lower-bound y)))))
