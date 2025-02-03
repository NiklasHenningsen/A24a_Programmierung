;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 15|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Sollarbeitszeit: 160 Stunden

;; Festangestellter:
;; Name, Grundgehalt, Arbeitsstunden

;; Werkstudent:
;; Name, Stundenlohn, Arbeitsstunden

;; Strukturen
(define-struct Festangestellter [name grundgehalt arbeitsstunden])
(define fa1 (make-Festangestellter "Peter" 300 180))

(define-struct Werkstudent [name stundenlohn arbeitsstunden])
(define w1 (make-Werkstudent "Otto" 150 40))

(define-struct Zivilist [name alter])
(define z1 (make-Zivilist "Uwe" 20))

;; Konstanten
(define sollarbeitszeit 160)

;; Methoden
(define (bruttomonatslohn mitarbeiter)
  (cond
    [(Festangestellter? mitarbeiter) (ueberstundenlohn mitarbeiter)]
    [(Werkstudent? mitarbeiter) (* (Werkstudent-arbeitsstunden mitarbeiter) (Werkstudent-stundenlohn mitarbeiter))]
    [else (error "Kein Mitarbeiter")]))

(define (ueberstundenlohn mitarbeiter)
  (+ (Festangestellter-grundgehalt mitarbeiter) (* (- (Festangestellter-arbeitsstunden mitarbeiter) sollarbeitszeit) (* (/ (Festangestellter-grundgehalt mitarbeiter) sollarbeitszeit) 1.25))))

;; Tests
(check-expect (bruttomonatslohn fa1) 346.875)
(check-expect (bruttomonatslohn w1) 6000)
(check-error (bruttomonatslohn z1) "Kein Mitarbeiter")