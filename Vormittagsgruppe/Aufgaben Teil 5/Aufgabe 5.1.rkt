;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 5.1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Globals
(define LOW_TAX_RATE 0)
(define MIDDLE_TAX_RATE 15)
(define HIGH_TAX_RATE 20)


;; heper function that returns a percentage cut of a value
;; value: number
;; percentage: number
(define subtract_percentage
  (lambda [value percentage]
    (- value (* value (/ percentage 100)))
   )
)
;; Test
(= (subtract_percentage 100 10) 90)
(= (subtract_percentage 100 25) 75)
(= (subtract_percentage 100 0) 100)


(define netto
  (lambda [brutto]
    (cond
      [(<= brutto 5000) (subtract_percentage brutto LOW_TAX_RATE)]
      [(and (> brutto 5000) (<= brutto 10000)) (+ (subtract_percentage (- brutto 5000) MIDDLE_TAX_RATE) (netto 5000))]
      [(> brutto 10000) (+ (subtract_percentage (- brutto 10000) HIGH_TAX_RATE) (netto 10000))]
     )
  )
)
;; Tests
(= (netto 1001) 1001)
(= (netto 5001) 5000.85)
(= (netto 10000) 9250)
(= (netto 10001) 9250.8)
(= (netto 15000) 13250)
