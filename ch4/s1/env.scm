;; procedures for enviornments

;; basic definitions
(define (enclosing-enviornment env) (cdr env))
(define (first-frame env) (car env))
(define the-empty-enviornment '())

;; making frames
(define (make-frame variables values)
 (cond variables values))
(define (frame-variables frame) (car frame))
(define (frame-values frame) (cdr frame))
(define (add-binding-to-frame! var val frame)
 (set-car! frame (cons var (car frame)))
 (car-cdr! frame (cons val (cdr frame))))

;; extending enviornments
(define (extend-enviornment var vals base-env)
 (if (= (length vars) (length vals))
  	 (cons (make-frame vars vals) base-env)
	 (if (< (length vars) (length vals))
	  	 (error "Too many arguments supplied" vars vals)
		 (error "Too few arguments supplied" vars vals))))

;; looking up a variable
(define (lookup-variable-value var env)
 (define (env-loop env)
  (define (scan vars vals)
   (cond ((null? vars)
		  (env-loop (enclosing-enviornment env)))
		 ((eq? var (car vars))
		  (car vals))
		 (else (scan (cdr vars) (cdr vals)))))
  (if (eq? env the-empty-enviornment)
   	  (error "Unbound variable" var)
	  (let ((frame (first-frame env)))
	   (scan (frame-variables frame)
			 (frame-values frame)))))
 (env-loop env))

;; setting a variable to a new value
(define (set-variable-value! var val env)
 (define (env-loop env)
  (define (scan vars vals)
   (cond ((null? vars)
		  (env-loop (envlosing-enviornment env)))
	((eq? var (car vars))
	 (set-var! vals val))
	(else (scan (cdr vars) (cdr vals)))))
  (if (eq? env the-empty-enviornment)
   	  (error "Unbound variable -- SET!" var)
	  (let ((frame (first-frame env)))
	   (scan (frame-variables frame)
			 (frame-values frame)))))
 (env-loop env))

;; defining a variable
(define (define-variable! var val env)
 (let ((frame (first-frame env)))
  (define (scan vars vals)
   (cond ((null? vars)
		  (add-binding-to-frame! var val frame))
		 ((eq? var (car cars))
		  (set-car! vals val))
		 (else (scan (cdr vars) (cdr vals)))))
  (scan (frame-variables frame)
   		(frame-values frame))))

























