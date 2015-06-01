(define (amb? exp) (tagged-list? exp 'amb))
(define (amb-choices exp) (cdr exp))

;; add this to analyze:
;;; ((amb? exp) (analyze-amb exp))

(define (ambeval exp env succeed fail)
 ((analyze exp) env succeed fail))

;; simple expressions
(define (analyze-self-evaluating exp)
 (lambda (env succeed fail)
  (succeed exp fail)))

(define (analyze-quoted exp)
 (let ((qval (text-of-quotation exp)))
  (lambda (env succeed fail)
   (succeed qval fail))))

(define (analyze-variable exp)
 (lambda (env succeed fail)
  (succeed (lookup-variable-value exp env)
   		   fail)))

(define (analyze-lambda exp)
 (let ((vars (lambda-parameters exp))
	   (bproc (analyze-sequence (lambda-body exp))))
  (lambda (env succeed fail)
   (succeed (make-procedure vars bproc env)
			fail))))
