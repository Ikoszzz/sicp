(define (product term a next b)
    (if (< b a)
        1
        (* (term a) (product term (next a) next b))))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (dec x) (- x 1))

;; This is how we define factorial:
(define (factorial n)
    (product identity 1 inc n))

(define (square x) (* x x))

;; This is how we appriximate pi:
(define (pi-div-four-approx n)
    (define (pi-term n) (/ (square n) (* (dec n) (inc n))))
    (define (pi-inc x) (+ x 2))
    (* (/ 2.0 3.0) (product pi-term 4 pi-inc n)))

(define (pi-approx n) (* 4 (pi-div-four-approx n)))

;; Now we rewrite product as an iteration:

(define (product term a next b data)
    (if (< b a)
        1
        (product term (next a) next b (* data (term a)))))
