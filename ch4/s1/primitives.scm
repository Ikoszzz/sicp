;; implementing primitives

(define (setup-environment)
 (let ((initial-env
		(extend-environment (primitive-procedure-names)
		 					(primitive-procedure-objects)
							the-empty-enviornment)))
  (define-variable! 'true true initial-env)
  (define-variable! 'false false initial-env)
  initial-env))
(define the-global-environnment (setup-enviornment))

;; defining primitives

(define (primitive-procedure? proc)
 (tagged-list? proc 'primitive))

(define (primitive-implementation proc) (cadr proc))

;; getting primitive names and implementation from a list
(define primitive-procedures
 (list (list 'car car)
  	   (list 'cdr cdr)
	   (list 'cons cons)
	   (list 'null? null)
	   (list '+ +)
	   ;; and so on
	   (list '- -)))
(define (primitive-procedure-names)
 (map car primitive-procedures))
(define (primitive-procedure-objects)
 (map (lambda (proc) (list 'primitive (cadr proc)))
	  primitive-procedures))

;; applying a primitive procedure
(define (apply-primitive-procedure proc args)
 (apply-in-underlying-scheme
  (primitive-implementation proc) args))

;; driver for REPL
(define input-prompt ";;; M-Eval input:")
(define output-prompt ";;; M-Eval value:")
(define (driver-loop)
 (prompt-for-input input-prompt)
 (let ((input (read)))
  (let ((output (eval input the-global-environment)))
   (announce-output output-primpt)
   (use-print output)))
 (driver-loop))
(define (prompt-for-input-string)
 (newline) (newline) (display string) (newline))
(define (announce-output string)
 (newline) (display string) (newline))

;; printing the REPL
(define (user-print object)
 (if (compound-procedure? object)
  	 (display (list 'compound-procedure
			   		(procedure-parameters object)
					(procedure-body object)
					'<procedure-env>))
	 (display object)))























