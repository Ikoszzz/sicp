;;; eval needs to be modified to have
;; ((application? exp)
;;  (apply (actual-value (operator exp) env)
;;	(operands exp)
;;	env))

;; when we need the actual value of
;; an expression we use
(define (actual-value exp env)
 (force-it (eval exp env)))

;; the new version of apply has been passed
;; unevaluated operand expressions. For primitive
;; procedures, we use strict evaluation and evaluate
;; all arguments before applying the primitive.
;; For compound arguments, we use non-strict evaluation
;; and delay the arguments before applying the procedure
(define (apply procedure arguments env)
 (cond ((primitive-procedure? procedure)
		(apply-primitive-procedure
		 procedure
		 (list-of-arg-values arguments env))) ; changed
  	   ((compound-procedure? procedure)
		(eval-sequence
		 (procedure-body procedure)
		 (extend-environment
		  (procedure-parameters procedure)
		  (list-of-delayed-args arguments env) ; changed
		  (procedure-environment procedure))))
	   (else
		(error
		 "Unknown procedure type -- APPLY" procedure))))

;; actually getting the values if wanted
(define (list-of-arg-values exps env)
 (if (no-operands? exps)
  	 '()
	 (cons (actual-value (first-operand exps) env)
	  	   (list-of-arg-values (rest-operands exps)
							   env))))

;; delaying the list of args instead of evaluating
(define (list-of-delayed-args exps env)
 (if (no-operands? exps)
  	 '()
	 (cons (delay-it (first-operand exps) env)
	  	   (list-of-delayed-args (rest-operands exps)
								 env))))

;; because of all this, we need to change how we eval `if:
(define (eval-if exp env)
 (if (true? (actual-value (if-predicate exp) env))
  	 (eval (if-consequent exp) env)
	 (eval (if-alternative exp) env)))

;; we also need to change driver-loop:
(define input-prompt ";;; L-Eval input:")
(define output-prompt ";;; L-Eval value:")
(define (driver-loop)
 (prompt-for-input input-prompt)
 (let ((input (read)))
  (let ((output
		 (actual-value input the-global-environment)))
   (announce-output output-prompt)
   (user-print output)))
 (driver-loop))

























