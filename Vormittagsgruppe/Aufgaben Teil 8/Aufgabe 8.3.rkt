;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 8.3|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;; append one list to another
;; concatenate (list list) -> list

(check-expect (concatenate '(A B C) '(D E F)) '(A B C D E F))
(check-expect (concatenate '() '()) '())

(define concatenate
  (lambda [list1 list2]
    (cond
      [(empty? list1) list2]
      [else (cons (first list1) (concatenate (rest list1) list2))]
    )
  )
)

;; multiply values of two lists
;; mult-2-num-list (list of numbers, list of numbers) -> list

(check-expect (mult-2-num-list '(2 3 4) '(7 8 9)) '(14 24 36))
(check-expect (mult-2-num-list '() '()) '())

(define mult-2-num-list
  (lambda [list1 list2]
    (cond
      [(empty? list1) '()]
      [(list? (rest list1)) (cons (* (first list1) (first list2)) (mult-2-num-list (rest list1) (rest list2)))]
      [else (* (first list1) (first list2))]
    )
  )
)