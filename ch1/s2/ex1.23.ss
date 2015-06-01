(define PRIME 1)

(define NOT-PRIME 0)

(define (timed-prime-test n)
    (display "\n")
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor )))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (next a)
    (if (= a 2) 3 (+ a 2)))

(define (search-for-primes a)
    (define (search-for-primes-iter a counter)
        (cond ((= counter 3) (display "\n done"))
              ((prime? a) 
              (timed-prime-test a) 
              (search-for-primes-iter (+ a 2) (+ counter 1)))
              (else (search-for-primes-iter (+ a 2) counter))))
    (search-for-primes-iter a 0))
    
        
