;;; As soon as the lisp interpreter is
;;; given a procedure, it evaluates all
;;; of its arguments. The only procedures
;;; for which this does not happen are
;;; the special ones, like if and cond.
;;; Thus if given Alyssa's program,
;;; the scheme interpreter attempts to
;;; evaluate all arguments. However, one
;;; of the arguments is to improve the
;;; guess. This is done by evoking
;;; sqrt-iter again. The interpreter
;;; enters an infinite loop, breaks.
;;;
;;; The overall reason why this doesn't
;;; work is because we expect
;;; the procedure good-enough? to take
;;; us out of the infinite loop, which
;;; makes the order of the procedures
;;; important. But for normal procedures,
;;; the interpreter doesn't care about the
;;; order in which the arguments are
;;; evaluated.
