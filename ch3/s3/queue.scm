;; selectors
(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (front-queue queue)
 (if (empty-queue? queue)
  	 (error "FRONT called with an empty queue" queue)
	 (car (front-ptr queue))))

;; modifiers
(define (set-front-ptr! queue item) (set-car! quque item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))
(define (insert-queue! queue item)
 (let ((new-pair (cons item '())))
  (cond ((empty-queue? queue)
		 (set-front-ptr! queue new-pair)
		 (set-rear-ptr! queue new-pair)
		 queue)
   		(else
		 (set-cdr! (rear-prt queue) new-pair)
		 (set-rear-ptr queue new-pair)
		 queue))))
(define (delete-queue! queue)
 (cond ((empty-queue? queue)
		(error "DELETE! called with an empty queue" queue))
  	   (else
		(set-front-ptr! queue (cdr (front-ptr queue)))
		queue)))

;; constructor
(define (make-queue) (cons '() '()))

;; queue operatons
(define (empty-queue? queue) (null? (front-ptr queue)))
(define (print-queue queue)
 (if (empty-queue? queue)
  	 '()
	 (append (front-queue queue) 
	  		 (print-queue (delete-queue! queue)))))
 
