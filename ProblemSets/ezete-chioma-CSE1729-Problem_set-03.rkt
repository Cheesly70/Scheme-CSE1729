; Problem Set 03

(#%require (only racket/base random))


"Problem 1"
(define (h-sub-n n)
  (if (= n 0) 0
      (+ (/ 1.0 n) (h-sub-n (- n 1)))))

(h-sub-n 10)

"Euler's Constant with n=50"
(abs (- (h-sub-n 50) (log 50)))

"Euler's Constant with n=500"
(abs (- (h-sub-n 5000) (log 5000)))

(newline)
"Problem 2"

(define (prime? n)
  (define (divisor? k) (= 0 (modulo n k)))
  (define (divisors-upto k)
    (and (> k 1)
         (or (divisor? k) (divisors-upto (- k 1)))))
  (not (divisors-upto (- n 1))))


(define (count-primes t)
  (cond((= t 1) 0)
       ((prime? t) (+ 1 (count-primes (- t 1))))
       (else (count-primes (- t 1)))))


(count-primes 5)
(count-primes 10)
(count-primes 15)

(newline)
"Problem 3"

"Part a"
(define (Lucas n)
  (cond((= n 0) 2.0)
       ((= n 1) 1.0)
       (else (+ (Lucas (- n 1)) (Lucas (- n 2))))))

(Lucas 2)
(Lucas 3)

(newline)
"Part b"

(define (Lucas-ratio n)
  (/ (Lucas n) (Lucas (- n 1))))

"Lucas-ratio"
(Lucas-ratio 20)
(Lucas-ratio 21)
(Lucas-ratio 22)

(define (Fibonacci-ratio n)
  (define (Fib n)
    (cond((= n 0) 0.0)
         ((= n 1) 1.0)
         (else (+ (Fib (- n 1)) (Fib (- n 2))))))
  (/ (Fib n) (Fib (- n 1))))

(newline)
"Fibo-ratio"
(Fibonacci-ratio 20)
(Fibonacci-ratio 21)
(Fibonacci-ratio 22)


(newline)
"Part c"

"If we try to compute (Lucas 50) the interpreter will run for a realllly long time"

(define (fast-Lucas-help n k luc-a luc-b)
   (if (= n k)
        luc-a
        (fast-Lucas-help n (+ k 1) (+ luc-a luc-b) luc-a)))

(define (fast-Lucas n) (fast-Lucas-help n 1 1 2))


"Lucas: # of recusrive caslls for regular Lucas is 2^k - 1"
"Fast-Lucas: # of recursive calls for fast lucas for each k is (k - 1)"

(newline)
"Problem 4"

"Part a"

(define (golden n)
  (define (gold-help n)
    (if (= n 1) 2
        (/ 1.0 (+ 1 (gold-help (- n 1))))))
  (+ 1 (gold-help n)))

(golden 10)
(golden 100)

(newline)
"Part b"

(define (nth-conv n)
  (if (= n 1) (sqrt 1)
      (sqrt (+ 1 (nth-conv (- n 1))))))

(nth-conv 10)
(nth-conv 100)

(newline)
"Problem 5"

(define (square x) (* x x))

(define (one-sample)
  (let ((x (- (* 2 (random)) 1))
        (y (- (* 2 (random)) 1)))
    (if (<= (+ (square x) (square y)) 1)
        1
        0)))

(one-sample)
(one-sample)
(one-sample)
(one-sample)

(newline)
(define (pi-samples k)
  (cond((= k 0) 0)
       ((= (one-sample) 1) (+ 1 (pi-samples (- k 1))))
       (else (pi-samples (- k 1)))))

(pi-samples 10)

(newline)
(define (rho n) (/ (pi-samples n) n))
(* 4.0 (rho 100))


(newline)
"Problem 6"

"What is going on: This approach will only work if the number of values in the interval is odd"
"If the number of values between the endpoints is even, then it won't work"