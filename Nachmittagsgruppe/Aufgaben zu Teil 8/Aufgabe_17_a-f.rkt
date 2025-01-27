;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname A200-Aufgaben-Zu-Teil-8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;                                                  
;                                                  
;                                                  
;                                                  
;                                                  
;                                                  
;             ;;               ;;;;;;;;;;;;;;;     
;          ;;;;;               ;;;;;;;;;;;;;;;     
;       ;;;;  ;;               ;;           ;;     
;       ;;    ;;               ;;           ;;     
;             ;;                           ;;      
;             ;;                           ;;      
;             ;;                           ;;      
;             ;;                           ;;      
;             ;;                          ;;       
;             ;;                          ;;       
;             ;;                          ;;       
;             ;;                         ;;        
;             ;;                         ;;        
;             ;;                         ;;        
;             ;;                        ;;         
;             ;;                        ;;         
;             ;;                        ;;         
;             ;;                        ;;         
;             ;;                       ;;          
;             ;;                       ;;          
;             ;;                       ;;          
;             ;;                      ;;           
;             ;;                      ;;           
;      ;;;;;;;;;;;;;;;;               ;;           
;      ;;;;;;;;;;;;;;;;               ;            
;                                                  
;                                                  
;                                                  
;                                                  
;                                                  
;                                                  
;                                                  
;                                                  
;                                                  
;                                                  
;                                                  

;          
;          
;          
;          
;          
;          
;    ;;;;  
;   ;    ; 
;    ;;;;; 
;   ;    ; 
;   ;   ;; 
;    ;;; ;;
;          
;          
;          
;          

;; Die Funktion sum liefere, angewendet auf eine Liste von Zahlen x, die Summe der Elemente
(check-expect (sum '(1 2 3)) 6)
(check-expect (sum '()) 0)
(check-expect (sum '(-1 -2)) -3)

(define sum
  (λ [l]
    (cond
      [(empty? l) 0]
      [(cons? l) (+(first l) (sum (rest l)))])))

;          
;          
;          
;          
;  ;;      
;   ;      
;   ; ;;;  
;   ;;   ; 
;   ;    ; 
;   ;    ; 
;   ;;   ; 
;  ;; ;;;  
;          
;          
;          
;          

;; Die Funktion prod liefere, angewendet auf eine Liste von Zahlen x, das Produkt der Elemente
(check-expect (prod '(1 2 3)) 6)
(check-expect (prod '()) 1)
(check-expect (prod '(-1 -2)) 2)

(define prod
  (λ [l]
    (cond
      [(empty? l) 1]
      [(cons? l) (* (first l) (prod (rest l)))])))


;          
;          
;          
;          
;          
;          
;    ;;; ; 
;   ;   ;; 
;   ;      
;   ;      
;   ;    ; 
;    ;;;;  
;          
;          
;          
;          

;; Die Funktion maximum liefere, angewendet auf eine Liste von Zahlen x, das Maximum der Elemente

(check-expect (maximum '(1 2 3)) 3)
(check-expect (maximum '()) 0)

(define maximum
  (λ [l]
    (cond
      [(empty? l) 0]
      [(empty? (rest l)) (first l)]
      [(> (first l) (maximum (rest l))) (first l)]
      [else (maximum (rest l))])))


;          
;          
;          
;          
;       ;; 
;        ; 
;    ;;; ; 
;   ;   ;; 
;   ;    ; 
;   ;    ; 
;   ;   ;; 
;    ;;; ;;
;          
;          
;          
;          

;; Die Funktion enthaelt? beantworte, angewendet auf ein Symbol und eine Liste von Symblen, die Frage, ob das Symbol n der Liste entahlten ist oder nicht

(check-expect (enthaelt? '(1 2 3 4) 4) #true)
(check-expect (enthaelt? '(1 2 3 4) 5) #false)
(check-expect (enthaelt? '() '()) #false)


(define enthaelt?
  (λ [l s]
    (cond
      [(empty? l) #false]
      [(equal? (first l) s) #true]
      [else (enthaelt? (rest l) s)])))


;          
;          
;          
;          
;          
;          
;    ;;;;  
;   ;    ; 
;   ;;;;;; 
;   ;      
;   ;      
;    ;;;;; 
;          
;          
;          
;          

(check-expect(declist '(1 2 3)) '(0 1 2))

(define declist
  (λ [l]
    (cond
      [(empty? l) l]
      [else (cons (- (first l) 1) (declist (rest l)))])))

;          
;          
;          
;          
;      ;;; 
;     ;    
;   ;;;;;; 
;     ;    
;     ;    
;     ;    
;     ;    
;   ;;;;;; 
;          
;          
;          
;          

;; Entschachtelt Listen mit (flatten x)
(check-expect (flatten '((1 2) 3 4)) '(1 2 3 4))
(check-expect (flatten '(1 (2 3) 4)) '(1 2 3 4))
(check-expect (flatten '((1 2) (3 4))) '(1 2 3 4))
(check-expect (flatten '(((A B) C) (D E))) '(A B C D E))
(check-expect (flatten '(((A)))) '(A))


(define flatten
  (λ [l]
    (cond
      [(empty? l) '()]
      [(list? (first l)) (append (flatten (first l)) (flatten(rest l)))]
      [else (cons (first l) (flatten (rest l)))])))