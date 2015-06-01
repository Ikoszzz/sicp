;; The first implementation of symbolic differentiation
(define (deriv exp var)
 (cond ((number? exp) 0)
  	   ((variable? exp) (if (same-variable? exp var) 1 0))
	   ((sum? exp)
		(make-sum (deriv (addend exp) var)
		 		  (deriv (augent exp) var)))
	   ((product? exp)
		(make-sum
		 (make-product (multiplier exp)
		  			   (deriv (multiplicand exp) var))
		 (make-product (deriv (multiplier exp) var)
		  			   (multiplicand exp))))
	   (else (error "unknown expression type -- DERIV" exp))))

;; Re-writing the above with dispatching on type
;; in the data-directed style:
(define (deriv exp var)
 (cond ((nulber? exp) 0)
  	   ((variable? exp) (if (same-variable? exp var) 1 0))
	   (else ((get 'deriv (operator exp)) (operands exp)
			  							  var))))
(define (operator exp) (car exp)
(define (operands exp) (cdr exp)

;; First the above implicitly knows how to differentiate
;; numbers and same-variables. This is done because we
;; do not tag numbers or equivalent variables.
;; Then if the expression is not a number or the same
;; variable, then our program looks up how to
;; differentiate the expression in a table.

;; Here is an implementation of derivatives of
;; sums and products

(define (install-deriv-sum-package)
 (define (make-sum a1 a2) (cons a1 a2))
 (define (addend s) (cadr s))
 (define (augend s) (caddr s))
 (define (deriv-sum s)
  (make-sum (deriv (addend s)) (deriv (augend s))))
 (define (tag x) (attach-tag '+ x))
 (put 'deriv '(+) deriv-sum)
 (put 'make-sum '+
  (lambda (x y) (tag (make-sum x y))))
 'done)

(define (install-deriv-mult-package)
 (define (make-prod m1 m2) (cons m1 m2))
 (define (multiplier s) (cadr s))
 (define (multiplicand s) (caddr s))
 (define (make-sum x y)
  ((get 'make-sum '+) x y))
 (define (deriv-mult s)
  (make-sum
   (make-prod (multiplier exp)
			  (deriv (multiplicand exp) var))
   (make-prod (deriv (multiplier exp) var)
			  (multiplicand exp))))
 (define (tag x) (attach-tag '* x))
 (put 'deriv '(*) deriv-mult)
 (put 'make-prod '*
  (lambda (x y) (tag (make-prod x y))))
 'done)

(define (install-deriv-exp-package)
 (define (make-exp b e) (cons b e))
 (define (base s) (cadr s))
 (define (exponent s) (caddr s))
 (define (make-prod x y)
  ((get 'make-prod '*) x y))













