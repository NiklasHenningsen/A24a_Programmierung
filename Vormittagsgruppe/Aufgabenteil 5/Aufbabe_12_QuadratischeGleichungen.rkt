;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname QuadratischeGleichungen) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Berechnet die Anzahl an Nullstellen der Funkition ax^2+bx+c
(define diskriminante
  (λ [a b c]
    (cond
      [(= a 0) (cond
                 [(= b 0) (cond
                            [(= c 0) +inf.0]
                            [else 0])]
                 [else 1])]
      [else (cond
              [(> (- (sqr b) (* 4 a c)) 0) 2]
              [(= (- (sqr b) (* 4 a c)) 0) 1]
              [(< (- (sqr b) (* 4 a c)) 0) 0])])))

;;Beispielanwendungen
(= (diskriminante 1 0 0) 1)
(= (diskriminante 1 0 3) 0)
(= (diskriminante -1 5 2) 2)
(= (diskriminante 0 0 0) +inf.0)