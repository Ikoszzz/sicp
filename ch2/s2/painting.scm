(define (frame-coord-map frame) frame
  (lambda (v)
    (add-vect
	  (origin-frame frame)
	  (add-vect (scale-vect (xcor-vect v)
				 			(edge1-frame frame))
	   			(scale-vect (ycor-vect v)
				 			(edge2-frame frame))))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each 
	  (lambda(segment)
	    (draw-line
		  ((frame-coord-map frame) (start-segment segment))
		  ((frame-coord-map frame) (end-segment segment))))
	  segment-list)))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
	  (let ((new-origin (m origin)))
	    (painter
		  (make-frame new-origin
		   			  (sub-vect (m corner1) new-origin)
					  (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter)
  (transform-painter painter
   					 (make-vect 0.0 1.0)	; new origin
					 (make-vect 1.0 1.0)	; new end of edge1
					 (make-vect 0.0 0.0))) 	; new end of edge2
