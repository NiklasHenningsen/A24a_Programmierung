;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 7.1|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;; globals
(define SOLL_ARBEITS_ZEIT 40)

;; enthält generische Daten und eine Rolle
;; arbeitsstunden: positive Zahlen
(define-struct mitarbeiter [namen arbeitsstunden rolle])
;; enthält die für einen Angestellten spezifischen Daten
;; arbeitsstunden: positive Zahlen
(define-struct festangestellter [grundgehalt])
;; enthält die für einen Werksstudenten spezifischen Daten
;; arbeitsstunden: positive Zahlen
(define-struct werksstudent [stundenlohn])

;; errechnet den Bruttolohn für einen Mitarbeiter
(check-expect (bruttolohn (make-mitarbeiter "Jan" 60 (make-werksstudent 10))) 600)
(check-expect (bruttolohn (make-mitarbeiter "Sauer" 50 (make-festangestellter 2000))) 2625)

(define bruttolohn
  (lambda [person]
     (cond
       [(festangestellter? (mitarbeiter-rolle person)) (angestellter-brutto (mitarbeiter-arbeitsstunden person) (festangestellter-grundgehalt (mitarbeiter-rolle person)))]
       [else (werksstudent-brutto (mitarbeiter-arbeitsstunden person) (werksstudent-stundenlohn (mitarbeiter-rolle person)))]
     )
  )
)

;; berechnet den Bruttolohn für einen Angestellten
;; arbeitsstunden: positive Zahl
;; grundgehalt positive Zahl

(check-expect (angestellter-brutto SOLL_ARBEITS_ZEIT 2000) 2000)
(check-expect (angestellter-brutto (+ SOLL_ARBEITS_ZEIT 40) 2000) 4500)
(check-expect (angestellter-brutto (- SOLL_ARBEITS_ZEIT 10) 2000) 2000)

(define angestellter-brutto
  (lambda [arbeitsstunden grundgehalt]
    (cond
      [(> arbeitsstunden SOLL_ARBEITS_ZEIT)(+ grundgehalt (* (- arbeitsstunden SOLL_ARBEITS_ZEIT) 1.25 (/ grundgehalt SOLL_ARBEITS_ZEIT)))]
      [else grundgehalt]
    )
  )
)

;; berechnet den Bruttolohn für einen Werksstudenten
;; arbeitsstunden: positive Zahl
;; stundenlohn positive Zahl

(check-expect (werksstudent-brutto 20 10) 200)
(check-expect (werksstudent-brutto 100 0) 0)

(define werksstudent-brutto
  (lambda [arbeitsstunden studenlohn]
    (* arbeitsstunden studenlohn)
  )
)