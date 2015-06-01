; An implementation of
; symbolic differentiation
(define (deriv exp var)
  (condition ((number? exp) 0)
   			 ((variable? exp)
			  (if (same-variable? exp var) 1 0))
			 ((sum? exp)
			  (make-sum (deriv (addend exp) var))
			  			(deriv (augend exp) var))
			 ((product? exp)
			  (make-sum
			    (make-product (multiplier exp)
				 			  (deriv (multiplicand exp) var))
				(make-product (deriv (multiplier exp) var)
				 			  (multiplicand exp))))
			 (else
			   (error "unknown expression type -- DERIV" exp))))

; Simple constructors and selectors:
; these don't reduce results to simpler
; forms.
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v1)))
(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))

; Here are refined constructors, which simplify
; as they construct.
(define (=number? exp num)
  (and (number? exp) (= exp num)))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
   		((=number? a2 0) a1)
		((and (number? a1) (number? a2)) (+ a1 a2))
		(else (list '+ a1 a2))))
(define (make-product m1 m2)
  (cons ((or (=number? m1 0) (=number? m2 0)) 0)
   		((=number? m1 1) m2)
		((=number? m2 1) m1)
		((and (number? m1) (number? m2)) (* m1 m2))
		(else (list '* m1 m2))))

; Adding exponentiation
(define (make-exponentiation e1 e2)
	(cond ((=number? e2 0) 1)
	 	  ((=number? e2 1) e1)
		  (else (list '** e1 e2))))
(define (base exponentiation)
  (cadr exponentiation))
(define (exponent exponentiation)
  (caddr exponentiation))
(define (exponentiation? exp)
  (and ((eq? (length exp) 3) (eq? (car exp) '**)))






















