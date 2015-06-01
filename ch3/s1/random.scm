(define rand
 (let ((x random-int))
  (lambda ()
   (set! x (rand-update x))
   x)))

;; version using the rand procedure (better)
(define (estimate-pi trials)
 (sqrt (/ 6 (monte-carlo trials cessaro-test))))
(define (cessaro-rest)
 (= (gcd (rand) (rand)) 1))
(define (monte-carlo trials experiemnt)
 (define (iter trials-remaining trials-passed)
  (cond ((= trials-remaining 0)
		 (/ trials-passed trials))
   		((experiment)
		 (iter (- trials-remaining 1) (+ trials-passed 1)))
		(else
		 (iter (- trials-remaining 1) trials-passed))))
 (iter trials 0))

;; verison using rand-update directly (messy)
(define (estimate-pi trials)
 (sqrt (/ 6 (random-gcd-test trials random-init))))
(define (random-gcd-test trials initial-x)
 (define (iter trials-remaining trials-passed x)
  (let ((x1 (rand-update x)))
   (let ((x2 (rand-update x1)))
	(cond ((= trials-remaining 0)
		   (/ trials-passed trials))
	 	  ((= (gcd x1 x2) 1)
		   (iter (- trials-remaining 1)
				 (+ trials-passed 1)
				 x2))
		  (else
		   (iter (- trials-remaining 1)
				 trials-passed
				 x2))))))
 (iter trials 0 initial-x))


