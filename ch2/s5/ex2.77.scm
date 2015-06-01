;; First we add to the table:
(put 'magnitude '(complex) magnitude)
;; Then we evaluate
(magnitude z)
;; Where z is ('complex ('rectangular '(3 4))). This becomes
(apply-generic 'magnitude z)
;; This looks up magnitude under complex, stripping the complex
;; tag from z. Then z is ('rectangular ('3 4)), which becomes
(apply-generic 'magnitude z)
;; This exists in the table, so it is returned.
