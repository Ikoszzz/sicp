;; the basics

(define (attach-tag type-tag contents)
 (if (number? contents)
  	 contents
 	 (cons type-tag contents))

(define (type-tag datum)
 (cond ((number? datum) 'scheme-number)
	   ((pair? datum) (car datum))
	   (else (error "Bad tagged datum -- TYPE-TAG" datum)))
	
(define (contents datum)
 (cond ((number? datum) datum)
  	   ((pair? datum) (cdr datum)
	   (else (error "Bad tagged datum -- CONTENTS" datum)))

(define (put <op> <type> <item>))
(define (get <op> <type>))

(define (apply-generic op . args)
 (let ((type-tags (map type-tag args)))
  (let ((proc (get op type-tags)))
   (if proc
	   (apply proc (map contents args))
	   (error
		"No method for these types -- APPLY-GENERIC"
		(list op type-tags))))))

;; packages of number systems

;; installing rectangular complex numbers
(define (install-rectangular-package)
 ;; internal procedures
 (define (real-part z) (car z))
 (define (imag-part z) (cdr z))
 (define (make-from-real-imag x y) (cons x y))
 (define (magnitude z)
  (sqrt (+ (square (real-part z))
		   (square (imag-part z)))))
 (define (angle z)
  (atan (imag-part z) (real-part z)))
 (define (make-from-mag-ang r a)
  (cons (* r (cos a)) (* r (sin a))))
 ;; interface to ther est of the system
 (define (tag x) (attach-tag 'rectangular x))
 (put 'real-part '(rectangular) real-part)
 (put 'imag-part '(rectangular) imag-part)
 (put 'magnitude '(rectangular) magnitude)
 (put 'angle '(rectangular) angle)
 (put 'make-from-real-imag 'rectangular
  	  (lambda (x y) (tag (make-from-real-imag x y))))
 (put 'make-from-mag-ang 'rectangular
  	  (lambda (x y) (tag (make-from-mag-ang r a))))
 (put 'equ? '(rectangular rectangular)
  	  (lambda (z1 z1) 
	   		  (and (eq? (real-part z1) (real-part z2))
			   	   (eq? (imag-part z1) (imag-part z2)))))
 (put '=zero? '(rectangular)
  	  (lambda (z)
	   		  (and (eq? (real-part z) 0)
			   	   (eq? (imag-part z) 0))))
 'done)

;; installing polar complex numbes
(define (install-polar package)
 ;; internal procedures
 (define (magnitude z) (car z))
 (define (angle z) (cdr z))
 (define (make-from-man-ang r a) (cons r a))
 (define (real-part z)
  (* (magnitude z) (cos (angle z))))
 (define (imag-part z)
  (* (magnitude z) (sin (angle z))))
 (define (make-from-real-imag x y)
  (cons (sqrt (+ (square x) (square y)))
   		(atan y x)))
 ;; interface to the rest of the system
 (define (tag x) (attach-tag 'polar x))
 (put 'real-part '(polar) real-part)
 (put 'imag-part '(polar) imag-part)
 (put 'magnitude '(polar) magnitude)
 (put 'angle '(polar) angle)
 (put 'make-from-real-imag 'polar
  	  (lambda (x y) (tag (make-from-real-imag x y))))
 (put 'make-from-mag-ang 'polar
  	  (lambda (r a) (tag (make-from-mag-ang r a))))
 (put 'equ? '(polar polar)
  	  (lambda (z1 z1) (and (eq? (magnitude z1) (magnitude z2))
		  				  (eq? (angle z1) (angle z2)))))
 (put '=zero? '(polar)
  	  (lambda (z) (eq? (magnitude z1) 0)))
 'done)

;; install general complex number procedures
(define (install-complex-package)
 ;; import procedures from rectangular and polar packages
 (define (make-from-real-imag x y)
  ((get 'make-from-real-imag 'rectangular) x y))
 (define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'poalr) r a))
 ;; internal procedures
 (define (add-complex z1 z2)
  (make-from-real-imag (+ (real-part z1) (real-part z2))
   					   (+ (imag-part z1) (imag-part z2))))
 (define (sub-complex z1 z2)
  (make-from-real-imag (- (real-part z1) (real-part z2))
   					   (- (imag-part z1) (imag-part z2))))
 (define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
   					 (+ (angle z1) (angle z2))))
 (define (div-comlex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
   					 (- (angle z1) (angle z2))))
 ;; interface to the rest of the system
 (define (tag z) (attach-tag 'complex z))
 (put 'real-part '(complex) real-part)
 (put 'imag-part '(complex) imag-part)
 (put 'magnitude '(complex) magnitude)
 (put 'angle '(complex) angle)
 (put 'add '(complex complex)
  	  (lambda (z1 z2) (tag (add-complex z1 z2))))
 (put 'sub '(complex complex)
  	  (lambda (z1 z2) (tag (sub-complex z1 z2))))
 (put 'mul '(complex complex)
  	  (lambda (z1 z2) (tag (mul-complex z1 z2))))
 (put 'div '(complex complex)
  	  (lambda (z1 z2) (tag (div-complex z1 z2))))
 (put 'make-from-real-imag 'complex
  	  (lambda (x y) (tag (make-from-real-imag x y))))
 (put 'make-from-mag-ang 'complex
  	  (lambda (x y) (tag (make-from-mag-ang r a))))
 (put 'equ? '(complex complex)
  	  (lambda (z1 z2) (and (eq? (real-part z1) (real-part z2))
					   	   (eq? (imag-part z1) (imag-part z2)))))
 (put '=zero? '(complex)
  	  (lambda (z1) (eq? (magnitude z1) 0)))
 'done)

;; install rational numbers
(define (install-rational-package)
 ;; internal procedures
 (define (numer q) (car q))
 (define (denom q) (cdr q))
 (define (make-rat n d)
  (let ((g (gcd n d)))
   (cons (/ n g) (/ d g))))
 (define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
			   (* (numer y) (denom x)))
   			(* (denom x) (denom y))))
 (define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
			   (* (numer y) (denom x)))
   			(* (denom x) (denom y))))
 (define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
   			(* (denom x) (denom y))))
 (define (div-rat x y)
  (make-rat (* (numer x) (denom y))
   			(* (denom x) (numer y))))
 ;; interface to rest of the system
 (define (tag x) (attach-tag 'rational x))
 (put 'add '(rational rational)
  	  (lambda (x y) (tag (add-rat x y))))
 (put 'sub '(rational rational)
  	  (lambda (x y) (tag (sub-rat x y))))
 (put 'mul '(rational rational)
  	  (lambda (x y) (tag (mul-rat x y))))
 (put 'div '(rational rational)
  	  (lambda (x y) (tag (div-rat x y))))
 (put 'make 'rational
  	  (lambda (n d) (tag (make-rat n d))))
 (put 'equ? '(rational rational)
  	  (lambda x y) (eq? (div-rat x y) 1))
 (put '=zero? '(rational)
  	  (lambda x) (eq? (numer x) 0))
 'done)

;; installing regular arithmetic
(define (install-scheme-number-package)
 (define (tag x)
  (attach-tag 'scheme-number x))
 (put 'add '(scheme-number scheme-number)
  	  (lambda (x y) (tag (+ x y))))
 (put 'sub '(scheme-number scheme-number)
  	  (lambda (x y) (tag (- x y))))
 (put 'mul '(scheme-number scheme-number)
  	  (lambda (x y) (tag (* x y))))
 (put 'div '(scheme-number scheme-number)
  	  (lambda (x y) (tag (/ x y))))
 (put 'make 'scheme-number
  	  (lambda (x) (tag x)))
 (put 'equ? '(scheme-number scheme-number)
  	  (lambda x y) (eq? x y))
 (put '=zero? '(scheme-number)
  	  (lambda x) (eq? x 0))
 'done)

;; constructors

(define (make-complex-from-real-imag x y)
 ((get 'make-from-real-imag 'complex) x y))

(define (make-complex-from-mag-ang r a)
 ((get 'make-from-mag-ang 'complex) r a))

(define (make-rational n d)
 ((get 'make 'rational) n d))

(define (make-scheme-number n)
 ((get 'make 'scheme-number) n))

;; generic procedures

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (equ? x y) (apply-generic 'equ? x y))
(define (=zero? x) (apply-generic '=zero? x))













