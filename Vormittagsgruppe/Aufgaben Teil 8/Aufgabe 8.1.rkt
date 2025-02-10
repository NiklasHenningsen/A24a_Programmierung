;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 8.1|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;; returns the highest number from the given list
(check-expect (maximum '(1 2 3 4)) 4)
(check-expect (maximum '(1)) 1)

(define maximum
  (lambda [list]
      (cond
        [(empty? (rest list)) (first list)]
        [else (max (first list) (maximum (rest list)))]
        )
    )
)

;; decrement each element in list

(check-expect (declist '(1 2 3 4)) '(0 1 2 3))
(check-expect (declist '(-1 -2 0 1 2 3 4)) '(-2 -3 -1 0 1 2 3))

(define declist
  (lambda [list]
    (cond
       [(cons? list) (cons (- (first list) 1) (declist (rest list)))]
       [else list]
    ) 
  )
)

