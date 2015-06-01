;; a stream of ones
(define ones (cons-stream 1 ones))

;; adding streams
(define (add-streams s1 s2)
 (stream-map + s1 s2))

;; implicitly defining the integers
(define integers (cons-stream 1 (add-streams ones integers)))

;; implicit Fibonacci numbers
(define fibs
 (cons-stream 0
  			  (cons-stream 1
			   			   (add-streams (stream-cdr fibs)
										fibs))))

;; scaling a stream
(define (scale-stream stream factor)
 (stream-map (lambda (x) (* x factor)) stream))

;; a stream of powers of 2:
(define double (cons-stream 1 (scale-stream double 2)))

;; an alternate definition of the stream of primes:
(define primes
 (cons-stream
  2
  (stream-filter prime? (integers-starting-from 3))))
(define (prime? n)
 (define (iter ps)
  (cons ((> (square (stream-car ps)) n) true)
   		((divisible? n (stream-car ps)) false)
		(else (iter (stream-cdr ps)))))
 (iter primes))

























