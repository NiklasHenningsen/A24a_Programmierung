;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 8.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;; flatten nested list into one
;; flatten (list) -> list 

(check-expect (flatten '(1 2 (3 4) 5)) '(1 2 3 4 5))
(check-expect (flatten '(1 2 (3 4) (5))) '(1 2 3 4 5))
(check-expect (flatten '((((1)))) ) '(1))
(check-expect (flatten '() ) '())

(define flatten
  (lambda [list]
    (cond
      [(empty? list) list]
      [(not (list? (first list))) (cons (first list) (flatten (rest list)))]
      [else (append (flatten (first list)) (flatten (rest list)))]
    )
  )
)

;; counts the frequencies of element in a list
;; frequencies (list) -> list of pairs

;(check-expect (frequencies '(A B A B A C A)) '((A 4) (B 2) (C 1)))

(define frequencies
  (lambda [list]
    (cond
      [(#true) 1]
    )
  )
)


              
  