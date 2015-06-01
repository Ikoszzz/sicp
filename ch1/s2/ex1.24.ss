(define PRIME 1)

(define NOT-PRIME 0)

(define (timed-prime-test n)
    (display "\n")
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n)
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
              ((fast-prime? a) 
              (timed-prime-test a) 
              (search-for-primes-iter (+ a 2) (+ counter 1)))
              (else (search-for-primes-iter (+ a 2) counter))))
    (search-for-primes-iter a 0))

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                     m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))

(define (square x) (* x x))
    
        
