"Problem Set 1"

(newline)
"Question 1"

"(a) (22 + 42) × (54 × 99)."
(* (+ 22 42) (* 54 99))
; Result = 342144

"(b) ((22 + 42) × 54) × 99."
(* (* (+ 22 42) 54) 99)
; Result = 342144

"(c) 64 × 102 + 16 × (44/22)."
(+ (* 64 102) (* 16 (/ 44 22)))
; Result = 6560

"(d) They are the same, but different in the sense that the multiplication of 54 and 99 is no longer grouped together"
"but rather broken up and multiplied individually with the addition part (i.e. (54 * addtion) * 99)."
"This is reflected in scheme by use of separating-parenthesis "

"(e) Don't need to rely on general rules of precedence because we have parenthesis to surround all mathematical statements"

(newline)
"Question 2"

; (a) Give the sequence of operations to compute the expression (22 + 42) × (54 × 99)."
"(a) [22][42]+[54][99]**"

; (b) Give the sequence of operations to compute the expression ((22 + 42) × 54) × 99."
"(b) [22][42]+[54]*[99]*"

; (c) Give the sequence of operations to compute the expression 64 × 102 + 16 × (44/22).
"(c) [64][102]*[16][44][22]/*+"

(newline)
"Question 3"

"Part a"
(define (inc x) (+ x 1))
"Test cases for inc"
"inc 1:" (inc 1)
"inc 2:" (inc 2)

(define (inc2 x) (inc (inc x)))
"Test cases for inc2"
"inc2 2:" (inc2 2)
"inc2 4:" (inc2 4)

(newline)
"Part b"
(define (square x) (* x x))
"Test cases for square"
"square 2:" (square 2)
"square 3:" (square 3)

(define (fourth x) (square (square x)))
"Test cases for fourth"
"fourth 2:" (fourth 2)
"fourth 3:" (fourth 3)

(newline)
"Part c"
;p
(define (p x)
  (* (fourth (+ (square x) 1)) (square (+ (* 16 (fourth x)) 22))))

"Test cases for p(x)"
"p(0):" (p 0)
"p(1)" (p 1)

(newline)
"Part d"
(define (sixteenth x) (fourth (fourth x)))
"Test cases for sixteenth"
"sixteenth 1:" (sixteenth 1)
"sixteenth 2:" (sixteenth 2)

(define (sixty-fourth x) (sixteenth (fourth x)))
"Test cases for sixty-fourth"
"sixty-fourth 1:" (sixty-fourth 1)
"sixty-fourth 1.1:" (sixty-fourth 1.1)

"Part e"
"It would have been hard to just use '*' for sixty-four, because then you'd have to write 'x' 64 times"

(newline)
"Question 4"
"Part a"
(define (normal x sig)
  (/ (exp (/ (* (expt x 2) -1)
             (* 2 (expt sig 2))))
     (sqrt (* 2 (expt sig 2) 3.142))))

"Test cases for normal"
"normal 1:" (normal 0 2)
"normal 1.1:" (normal 0 3)

"Part b"
(define (fspiral theta)
  (expt 1.618 (* theta (/ 2 3.142))))

"Test cases for fspiral"
"fspiral 1:" (fspiral 2)
"fspiral 1.1:" (fspiral 3)

"Part c"
(define (malth t p a)
  (* p (expt 2 (* a t))))

"Test cases for malth"
"malth 1 2 2:" (malth 1 2 2)
"malth 2 2 1:" (malth 2 2 1)

"Part d"
(define (singlespecies Pi Ps alpha t)
  (/ (* Ps Pi)
     (+ Pi (* (- Ps Pi) (exp (* (- 0 alpha) t))))))

(singlespecies 1 1 1 1)
(singlespecies 2 2 2 2)