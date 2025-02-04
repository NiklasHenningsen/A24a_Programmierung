;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 6.2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; struct for holding x y coordinates
(define-struct coords [x y])
; struct for holding position and radius of a circle
(define-struct circle [coords radius])


;; tests if point is in cicle
(define ⭕👈?
  (lambda [point circle]
    (<
      (sqrt 
        (+
         (expt (- (coords-x point) (coords-x (circle-coords circle))) 2) ;; (x2 - x1)²
         (expt (- (coords-y point) (coords-y (circle-coords circle))) 2) ;; (y2 - y1)²
        )
      )
      (circle-radius circle)
    )
  )
)

;; Tests
(equal? (⭕👈? (make-coords 2 2) (make-circle (make-coords 0 0 ) 1)) #false)
(equal? (⭕👈? (make-coords 0 0) (make-circle (make-coords 0 0 ) 1)) #true)


;; Ja, "⭕👈?" ist hier valider Code!