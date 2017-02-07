; Lab 02

"Problem 1"
"Part a"

(define (num-nth n)
  (expt 2 n))

(num-nth 1)
(num-nth 2)
(num-nth 3)
(num-nth 4)

(newline)
"Part b"

(define (num-ancestors n)
  (if (= n 0) 0
      (+ (num-nth n) (num-ancestors (- n 1)))))

(num-ancestors 1)
(num-ancestors 2)
(num-ancestors 3)

(newline)
"Problem 2"
"Part a"

