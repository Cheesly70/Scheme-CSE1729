; Lab 03

(#%require (only racket/base random))

"Problem 1"

(define (square x) (* x x))

; Start at 1 and go up to n

(define (pi-approx n)
  (define (helper start n)
    (if (= start n) (/ (- (* 2 start) 1) 2.0)
        (/ (square (- (* 2 start) 1))
           (+ 2 (helper (+ start 1) n)))))
  (/ 4 (+ 1 (helper 1 n))))

(pi-approx 1000)

(newline)
"Problem 2"

;helper funciton that calculates the terms indivudually then call the function with k-1

(define (kth-term k)
  (if (= k 1) (sqrt 0.5)
      (sqrt (+ 0.5 (* 0.5 (kth-term(- k 1)))))))


(define (nested-radical n)
  (define (nested-help n)
    (if (= n 1) (kth-term 1)
      (* (kth-term n) (nested-help (- n 1)))))
  (/ 2 (nested-help n)))

(nested-radical 100)

(newline)
"Problem 3"

(define (craps n)
  (define (helper count n)
    (let ((x (+ (+ 1 (random 6)) (+ 1 (random 6)))))
    (cond((= count n) count)
         ((= x 7) (helper (+ count 1.0) n))
         ((= x 11) (helper (+ count 1.0) n))
         (else (helper count (- n 1))))))
  (/ (helper 0 n) n))

(craps 100)
(craps 1000)
(craps 9000)

"the limit as n appraches infinity is 0.22"
  