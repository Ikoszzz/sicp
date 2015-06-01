(define (make-vect x y)
	(cons x y))

(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cdr vect))

(define (add-vect vect1 vect2)
	(make-vect (+ (xcor-vect vect1) (xcor-vect vect2))
	 		   (+ (ycor-vect vect1) (ycor-vect vect2))))
(define (sub-vect vect1 vect2)
	(make-vect (- (xcor-vect vect1) (xcor-vect vect2))
	 		   (- (xcor-vect vect1) (xcor-vect vect2))))
(define (scale-vect vect scalar)
	(make-vect (* (xcor-vect vect) scalar)
	 		   (* (ycor-vect vect) scalar)))

(define (make-segment vect1 vect2)
  (cons vect1 vect2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (sub-vector (car segment) (cdr segment)))
