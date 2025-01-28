;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aufgabe13) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Die Uhrzeit beschreibt einen Zeitpunkt nach Mitternacht in Stunden, Minuten und Sekunden
(define-struct uhrzeit [stunde minute sekunde])

;;berechnet eine Uhrzeit aus Stunden, Minuten und Sekunden in Sekunden nach Mitternacht um. 
(define zeit-in-sekunden
  (lambda [uhrzeit]
    (+ (uhrzeit-sekunde uhrzeit) (* (uhrzeit-minute uhrzeit) 60) (* (uhrzeit-stunde uhrzeit) 60 60))))

;;Beispielanwendungen
    (= (zeit-in-sekunden (make-uhrzeit 1 0 0)) 3600)
    (= (zeit-in-sekunden (make-uhrzeit 1 1 0)) 3660)
    (= (zeit-in-sekunden (make-uhrzeit 1 1 1)) 3661)
    (= (zeit-in-sekunden (make-uhrzeit 0 1 0)) 60)
    (= (zeit-in-sekunden (make-uhrzeit 0 0 1)) 1)
    (= (zeit-in-sekunden (make-uhrzeit 0 0 0)) 0)
    
   
    
    
