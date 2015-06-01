;; Scheme uses applicative-order evalutaion.
;; If we attempt to evaluate (f f), we attempt
;; to evaluate (f 2), which then tries to
;; evaluate (2 2), which is not defined.
