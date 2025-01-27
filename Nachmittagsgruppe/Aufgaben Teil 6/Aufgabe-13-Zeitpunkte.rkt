;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Zeitpunkt seit Mitternacht|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ein Zeitpunkt ist ein Wert
;;     (make-zeitpunkt-seit-mitternacht s m h)
;; wobei s die Sekunden, m die Minuten und h die Stunden seit Mitternacht sind.
(define-struct zeitpunkt-seit-mitternacht [s m h])

;; Schablone
; (define sekunden-seit-mitternacht
;   (lambda (zeitpunkt)
;     (...
;       (... zeitpunkt-seit-mitternacht-s zeitpunkt ...)
;       (... zeitpunkt-seit-mitternacht-m zeitpunkt ...)
;       (... zeitpunkt-seit-mitternacht-h zeitpunkt ...)


;; Eine Funktion zur Berechnung der vergangenen Sekunden seit Mitternacht
(define sekunden-seit-mitternacht
  (λ [zeitpunkt]
    (+ (zeitpunkt-seit-mitternacht-s zeitpunkt)
       (* (zeitpunkt-seit-mitternacht-m zeitpunkt) 60)
       (* (zeitpunkt-seit-mitternacht-h zeitpunkt) 3600))))

;; Tests
(= (sekunden-seit-mitternacht (make-zeitpunkt-seit-mitternacht 15 30 1)) 5415)
(= (sekunden-seit-mitternacht (make-zeitpunkt-seit-mitternacht 0 30 3)) 12600)
(= (sekunden-seit-mitternacht (make-zeitpunkt-seit-mitternacht 0 0 0)) 0)