; Problem Set 2

"Problem 1"
"Part a"

(define (square x) (* x x))

(define (sum-n-squares n)
  (if (= n 1) 1
      (+ (square n) (sum-n-squares (- n 1)))))

(sum-n-squares 4)
(sum-n-squares 5)

(define (sum-n-even n)
  (cond ((= n 0) 0)
        (else (+ (* 2 n) (sum-n-even (- n 1))))))

(sum-n-even 4)
(sum-n-even 5)
                            

(newline)
"Problem 2"

(define (product k)
  (if (= k 1) 1
      (* (- 1 (/ 1 k)) (product (- k 1)))))

(product 3)
(product 4)

(newline)
"Problem 3"

(define (divides a b) (= 0 (modulo b a)))

(define (divisors-upto n k)
  (cond ((= k 0) 0)
        ((= n 0) 0)
        ((= k 1) 1)
        ((divides k n) (+ 1 (divisors-upto n (- k 1))))
        (else (divisors-upto n (- k 1)))))

(divisors-upto 4 4)
(divisors-upto 10 4)

(define (divisors n) (divisors-upto n n))

(divisors 4)
(divisors 10)

(newline)
"Problem 4"

(define (series k)
  (if (= k 0) 0
      (+ (* (expt -1 (+ k 1))
            (/ 4.0
               (- (* 2 k) 1)))
         (series (- k 1)))))

(series 2)
(series 3)
"The number is PI!"
(series 100000)

(newline)
"Problem 5"
"Part a"
"300 calls were made to expt. The actual values passed to each call were '-1' and the k'th position in the series"

(newline)
"Part b"


(define (revised-series k)
  (define (curr-val k) (/ 4.0 (- (* 2 k) 1)))
    (cond ((= k 0) 0)
          ((even? k) (+ (* -1 (curr-val k)) (revised-series (- k 1))))
          (else (+ (curr-val k) (revised-series (- k 1))))))

(revised-series 2)
(revised-series 100000)

(newline)
"Problem 6"

(define (new-if predicate then-clause else-clause)
(if predicate then-clause else-clause))

(new-if (= 0 0) 4 5)
(new-if (= 0 1) 4 5)


(define (factorial n)
  (new-if (= n 0) 1 (* n (factorial (- n 1)))))

;(factorial 3)
"Factorial goes into an infinite loop and runs out of memory because unlike 'if', 'new-if' attempts to"
"evaulate all of its arguments before applying the function 'new-if' to those arguments."
"So when 'n' hits zero 'new-if' attempts to evaluate 'factorial(-1) which will never terminate."
"Because the real 'if' is a special form it will evaluate its predicate only, and then choose the then-clause or else-clause"


(newline)
"Problem 7"

(define (factorial n)
      (if (= n 0)
          1
          (* n (factorial (- n 1)))
          )
  )
(define (new-sin x n)
  (let ((twok (+ (* 2 n) 1.0)))
    (if (= n 0) x
        (+ (/ (* (expt -1 n) 
                (expt x twok))
              (factorial twok))
           (new-sin x (- n 1))))))              

(new-sin 1 3)
(new-sin 2 3)
