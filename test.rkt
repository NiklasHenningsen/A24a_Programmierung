;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname test) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Ein altmodisches Vorstadtkino besitzt eine einfache Formel für die
;;Berechnung des Profits einer Vorstellung: Jeder Kinobesucher bezahlt 5 EUR
;;für die Eintrittskarte. Jede Vorstellung kostet das Kino 20 EUR plus 50 Cent
;;pro Besucher.

(define profit
  (λ [besucher]
    (-(* besucher 5)(+ 20 (* 0.50 besucher)))))

;;Test
(=(profit 10)25)



