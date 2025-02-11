;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 18c Merge|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Merge verschmelzt zwei Listen zu einer, indem sie zwei Listen sortiert zu einer zusammenführt
;; merge: 2x(Listen von Nummern)->Liste von Nummern

(check-expect (merge '(1 3) '(2 4)) '(1 2 3 4))
(check-expect (merge '(1 2) '(2 3)) '(1 2 2 3))
(check-expect (merge '(-1 2 5) '(-1 2 3)) '(-1 -1 2 2 3 5))

(define merge
  (λ [lst1 lst2]
    (cond
      [(empty? lst2) lst1]
      [(empty? lst1) lst2]
      [(<= (first lst1) (first lst2)) (cons (first lst1) (merge (rest lst1) lst2))]
      [else (cons (first lst2) (merge (rest lst2) lst1))])))