; Lab 02

"Problem 1"
"Part a"

(define (a n)
  (if(= n 1) 2
     (* 2 (a (- n 1)))))

(a 1)
(a 2)
(a 3)
(a 4)

(newline)
"Part b"

(define (num-ancestors n)
  (if (= n 1) 2
      (+ (a n) (num-ancestors (- n 1)))))

(num-ancestors 1)
(num-ancestors 2)
(num-ancestors 3)

(newline)
"Problem 2"
"Part a"

(define (pi-approx k)
   ;Recall the definition of factorial from the lecture slides
   (define (factorial k)
      (if (= k 0)
           1
           (* k (factorial (- k 1)))))
  ;Define a helper function to compute the summation of the terms in the series
  (define (pi-aux k)
     ;Take care with the base case , k=0 is a term in the series
    (if (< k 0) 0
        (+ ( pi-aux (- k 1))
           (/ (* ( factorial (* 4 k ))
                 (+ 1103 (* 26093 k )))
              (* ( expt ( factorial k ) 4)
                 ( expt 396 (* 4 k )))))))
  ;Body of the pi-approx function
  (/ 1 (* (/ (* 2 (sqrt 2))
             9801)
          (pi-aux (- k 1)))))

(pi-approx 6)

(newline)
"Part b"

(define (pell n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((> n 1) (+ (* 2 (pell (- n 1)))
                 (pell (- n 2))))))


(newline)
"Part c"

(define (comp-pell n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((> n 1) (+ (* 2 (comp-pell (- n 1)))
                 (comp-pell (- n 2))))))

(newline)
"Part d"

(define (sqrt-2-approx n)
  (/ (/ (comp-pell n) 2) (pell n)))

(sqrt-2-approx 6)

(newline)
"Problem 3"
; I use a helper function here in order to add the 1 at the end
(define (new-sqrt x n)
  ; k = n in this helper function
  (define (helper k)
    (if (= k 0) 0
      (/ (- x 1) (+ 2.0 (helper (- k 1))))))
  (+ 1 (helper n)))

"Approx."
(new-sqrt 2 500)
"Real Sqrt"
(sqrt 2)