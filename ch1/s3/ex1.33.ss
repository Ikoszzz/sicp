;; We have the procedure

(define (accumulate combiner null-value term a next b)
        (if (< b a)
            0
            (combiner (term a)
                      (accumulate combiner null-value term (term a) next b))))

;; which we want to generalize to allow
;; selection of index values. Here we go

(define (filered-accumulate filtr combiner null-value term a next b)
        (if (< b a)
            0
            (if (filtr a)
                (combiner (term a)
                          (filtered-accumulate filtr combiner null-value
                                               term (next a) next b))
                (filtered-accumulate filtr combiner null-value
                                     term (next a) next b))))

;; For instance, we can take the sum of squares of prime
;; numbers in the interval a to b as follows:

(filtered-accumulate prime? + 0 square a inc b)

;; Or the product of all positive integers
;; lest than and coprime to n:

(filtered-accumulate (coprime? n) * 1 identity a inc b)

;; Where coprime? returns a procedure which returns true
;; if its input is coprime to n, and false otherwise.
