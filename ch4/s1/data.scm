;;; evaluation of data structures

(define (true? x)
 (not (eq? x false)))
(define (false? x)
 (eq? x false))

;;; we assume we have the following:
;; (apply-primitive-procedure <proc> <args>)
;; (primitive-procedure? <proc>)

;; evaluation of compound procedures
(define (make-procedure parameters body env)
	(list 'procedure parameters body env))
(define (compound-procedure? p)
 (tagged-list? p 'procedure))
(define (procedure-parameters p) (cadr p))
(define (procedure-body p) (caddr p))
(define (procedure-environment p) (cadddr p))

























