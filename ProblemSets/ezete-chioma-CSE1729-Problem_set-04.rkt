#lang racket
(require plot)

; Problem Set 4

"Problem 1"

(define (sum f n)
      (if (= n 0)
          (f 0)
          (+ (f n) (sum f (- n 1)))))

(define (harmonic n)
  (define (funct n)
    (if (= n 0) 0
        (/ 1.0 n)))
  (sum funct n))

(harmonic 1)
(harmonic 2)

(newline)
"Problem 2"

"Part a"
(define (square x) (* x x))

(define (der f h)
  (lambda (x) (/ (- (f (+ x h))
                    (f x))
                 h)))
((der square 0.1) 5)

"Part b"
(define (nth-der f n h)
  (if (= n 0) f
      (nth-der (der f h) (- n 1) h)))

((nth-der square 2 0.1) 5)

"Part c"
;(plot (list (axes)
 ;           (function cos (- pi) pi #:label "cos(x)" #:color 3 #:style 'dot)
  ;          (function (der sin 0.5) (- pi) pi #:label "(sin(x))'"))
   ;   #:x-min -5 #:x-max 5 #:y-min -5 #:y-max 5)

"Part d"
;(plot (function (nth-der sin 16 0.5) (- pi) pi #:label "((sin(x))')^16;" #:color 3 #:style 'dot)
 ;     #:x-min -5 #:x-max 5 #:y-min -5 #:y-max 5)

(newline)
"Problem 3"

"Part a"
(define (newton f guess n)
  (if (= n 0) guess
      (- (newton f guess (- n 1)) (/ (f (newton f guess (- n 1))) ((der f 0.5) (newton f guess (- n 1)))))))

(newton (lambda (x) (+ (* 2 x) 1)) 2 5)



(newline)
"Problem 5"

(define (sum term a b)
  (if (= a b) (term b)
      (+ (term a) (sum term (+ a 1) b))))





