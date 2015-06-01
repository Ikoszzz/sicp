(define balance 100)

(define (withdraw amount)
 (if (>= balance amount)
  	 (begin (set! balance (- balance amount))
	  		balance)
	 "Insufficient funds"))

;; The abover version works, but the problem
;; is that balance is a global variable, and
;; any other procedure can modify it. We want
;; balance to be internal to withdraw. The below
;; procedure fixes this.

(define new-withdraw
 (let ((balance 100))
  (lambda (amount)
   (if (>= balance amount)
	   (begin (set! balance (- balance amount))
			  balance)
	   "Insufficient funds"))))

(define (make-withdraw balance)
 (lambda (amount)
  (if (>= balance amount)
   	  (begin (set! balance (- balance amount))
	   		 balance)
	  "Insufficient funds")))

(define (make-account balance password)
 (define count 0)
 (define (withdraw amount)
  (if (>= balance amount)
   	  (begin (set! balance (- balance amount))
	   		 balance)
	  "Insufficient funds"))
 (define (deopsit amount)
  (set! balance (+ balance amount))
  balance)
 (define (dispatch some-string m)
  (if (eq? some-string password)
	  (begin (set! count 0)
			 (cond ((eq? m 'withdraw) withdraw)
				   ((eq? m 'deposit) deposit)
				   (else (error "Unknown request -- MAKE-ACCOUNT"
								m))))
	  (begin (set! count (+ count 1))
	   		 (if (>= count 7)
			  	 (call-the-cops)
				 (error "Incorrect password" some-string)))))
 dispatch)
