;;; we assume a new special form called amb.
;;; the expressions (amb <e1> <e2> ... <en>) returns
;;; the value of one of the n expressions ambiguously.

;;; note that (amb) is an expressions with no acceptable
;;; values, so it indicated a ``failure''. for instance,
(define (require p)
 (if (not p) (amb)))

;;; now we can implement an-element-of:
(define (an-element-of items)
 (require (not (null? items)))
 (amb (car items) (and-element-of (cdr items))))

;;; we can express infiite ranges of choices
(define (an-integer-starting-from n)
 (amb n (an-integer-starting-from (+ n 1))))

;;; working with amb
(define (amb? exp) (tagged-list? exp 'amb))
(define (amb-choices exp) (cdr exp))
	
(devine (ambeval exp env succeed fail)
 ((analyze exp) env succeed fail))
