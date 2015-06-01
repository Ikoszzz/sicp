(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (make-segment a b)
    (cons a b))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (cdr segment))

(define (midpoint-segment segment)
    (make-point (avg-x-coord segment)
                (avg-y-coord segment)))

(define (avg-x-coord segment)
    (average (x-point (start-segment segment))
             (x-point (end-segment segment))))

(define (avg-y-coord segment)
    (average (y-point (start-segment segment))
             (y-point (end-segment segment))))

(define (average a b)
    (/ (+ a b) 2))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
    0)

; first way of making a rectangle
(define (make-rect-1 seg1 seg2)
    (cons seg1 seg2)

(define (get-seg1 rect)
    (car rect))

(define (get-seg2 rect)
    (cdr rect))

; second way of making a rectangle
(define (make-rect-2 point1 point2 point3)
    (cons (cons point1 point2) (cons point2 point3)))

(define (get-point-1 rect)
    (car (car rect)))

(define (get-point-2 rect)
    (car (cdr rect)))

(define (get-point-3 rect)
    (cdr (cdr rect)))

; both implementations have a
; common procedure for finding
; the length and width 
(define (seg-norm segment)
    (let ((y_2 (y-point (start-segment segment)))
          (y_1 (y-point (end-segment segment)))
          (x_2 (x-point (start-segment segment)))
          (x_1 (x-point (end-segment segment)))
          ((square x) (* x x)))
         (sqrt (+ (square (- y_2 y_1))
                  (square (- x_2 x_1))))))

(define (mylength rect)
    (if (> (seg-norm (car rect))
           (seg-norm (cdr rect)))
        (seg-norm (car rect))
        (seg-norm (cdr rect))))

(define (width rect)
    (if (< (seg-norm (car rect))
           (seg-norm (cdr rect)))
        (seg-norm (car rect))
        (seg-norm (cdr rect))))

; now we can easily define the area and perimeter
; of a rectangle

(define (area rect)
    (* (mylength rect) (width rect)))

(define (perimeter rect)
    (+ (* 2 (mylength rect))
       (* 2 (width rect)))) 

; I'm not sure if this is cheating, but I don't
; easily see a better way to abstract. (How about
; including selectors to get the four corners of
; each rectangle, then going from there?)
