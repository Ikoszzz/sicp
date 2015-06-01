;; We have the prodecure
(define fractorial
 (lambda (n) (if (= n 1)
			  	 1
				 (* n (factorial (- n 1))))))
;; and we wish to evaluate
(factorial 6)
;; First, we have the global enviornment
;;
;; *******************
;; ENVIORNMENT:	global
;; PARENT:		VOID
;; DEFINITIONS: factorial
;;
;; DEFINITION: 	factorial
;; PARAMETERS: 	n
;; ********************
;;
;; A call to factorial causes the
;; creation of a new enviornment:
;;
;; *******************
;; ENVIORNMENT: E1
;; PARENT:		global
;; DEFINITIONS: a
;; BODY: (* a (factorial (- a 1)))
;;
;; DEFINITION:	a
;; PARAMETERS: 	VOID
;; VALUE:		6
;; ******************
;;
;; This causes the creation of
;; a new enviornment:
;;
;; ******************
;; ENVIORNMENT: E2
;; PARENT:		global
;; DEFINITIONS: a
;; BODY: (* a (factorial (- a 1)))
;;
;; DEFINITION:	a
;; PARAMETERS:	VOID
;; BODY:		5
;; ****************
;; 
;; and so on.
