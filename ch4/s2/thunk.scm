;;; thunks are an expression together
;;; with an enviornment, to be evaluated
;;; at a required time

;; force removes the thunkyness
(define (force-it obj)
 (if (thunk? obj)
  	 (actual-value (thunk-exp obj) (thunk-env obj))
	 obj))

;; creating a thunk
(define (delay-it exp env)
 (list 'thunk exp env))

(define (thunk? obj)
 (tagged-list? obj 'thunk))
	
(define (thunk-exp thunk) (cadr thunk))

(define (thunk-env thunk) (caddr thunk))

(define (evaluated-thunk? obj)
 (tagged-list obj 'evaluated-thunk))

(define (thunk-value evaluated-thunk) (cadr evaluated-thunk))
(define (force-it obj)
 (cond ((thunk? obj)
		(let ((result (actual-value
					   (thunk-exp obj)
					   (thunk-env obj))))
		 (set-car! obj 'evluated-thunk)
		 (set-car! (cdr obj) result)	; replace exp with its vlaue
		 (set-cdr! (cdr obj) '())		; forget unneeded env
		 result))
  	   ((evaluated-thunk? obj)
		(thunk-value obj))
	   (else obj)))























