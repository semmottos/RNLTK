#lang racket

(provide hash-entries
         vector-for-each)

;; R6RS hashtable-entries renamed as hash-entries
(define (hash-entries ht)
  (values (list->vector (hash-keys ht))
          (list->vector (hash-values ht))))

;(let ((h (make-hash)))
;  (hash-set! h 1 'one)
;
;  (hash-set! h 2 'two)
;
;  (hash-set! h 3 'three)
;
;  (hash-entries h))

;; (vector-for-each proc vec ...)
(define vector-for-each
  (case-lambda
    [(proc vec) (for ([x (in-vector vec)]) (proc x))]
    [(proc vec1 vec2) (for ([(x y) (in-parallel vec1 vec2)]) (proc x y))]))

; (vector-for-each (λ (x y) (display (list x y))) #(1 2 3) #(4 5 6))
; (vector-for-each (λ (x) (display x)) #(1 2 3))
