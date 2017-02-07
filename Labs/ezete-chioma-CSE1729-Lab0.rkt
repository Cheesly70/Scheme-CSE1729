; Problem 1 - Currency Conversion
; Part a
(define (convert-dollars-to-euros dollars)
  (* dollars 0.93))

"Dollars to Euros Conversion Test 1"
(convert-dollars-to-euros 50)
"Dollars to Euros Conversion Test 2"
(convert-dollars-to-euros 1)

; Part b
(define (convert-euros-to-yen euros)
  (* 1.0 (* euros (/ 121 73))))

"Euros to Yen Conversion Test 1"
(convert-euros-to-yen 50)
"Euros to Yen Conversion Test 2"
(convert-euros-to-yen 1)

; Part c
(define (convert-dollars-to-yen dollars)
  (convert-euros-to-yen (convert-dollars-to-euros dollars)))

"Convert Dollars to Yen Test 1"
(convert-dollars-to-yen 50)
"Convert Dollars to Yen Test 2"
(convert-dollars-to-yen 1)

; Problem 2 - Matrix and determinants
; Part a
(define (det2x2 a b c d)
  (- (* a d) (* b c)))

"2x2 Determinant of N"
(det2x2 -3 1 2 7)

; Part b
(define (is-invertible a b c d)
  (if (= (det2x2 a b c d) 0) #f #t))

"is-invertible for M"
(is-invertible 2 -4 -6 12)

 "is-invertible for N"
 (is-invertible -3 1 2 7)

; Part c
(define (det3x3 a b c
                d e f
                g h i)
  (+ (- (* a (det2x2 e f h i)) (* b (det2x2 d f g i))) (* c (det2x2 d e g h))))

; Test case for following matrix
;0 5 −6
;8 −11 4
;5 1 1

"3x3 Matrix test case 1"
(det3x3 0 5 -6 8 -11 4 5 1 1)
"3x3 Matrix test case 2"
(det3x3 1 1 8 1 7 1 6 5 3)
  