(set-logic NIA)

(set-option :produce-models true)
(set-option :incremental true)

; Deklarace promennych pro vstupy
; ===============================

; Parametry
(declare-fun A () Int)
(declare-fun B () Int)
(declare-fun C () Int)
(declare-fun D () Int)
(declare-fun E () Int)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; START OF SOLUTION ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(declare-fun x () Int)
(declare-fun y () Int)
(declare-fun z () Int)



(assert 
    (forall ((D_n Int) (E_n Int) (x_n Int) (y_n Int) (z_n Int))
        (and
            (= x (* A B 2))
            (> D 0) 
            (> E 0)
            (=> (< x E) (= y (+ x (* B 5))))
            (=> (>= x E) (= y (- x C))) 
            (=> (< (+ y 2) D) (= z (- (* x A) (* y B)))) 
            (=> (>= (+ y 2) D) (= z (+ (* x B) (* y A)))) 
            (< z (+ E D))
            (=>  
                (and
                    (= x_n (* A B 2))
                    (> D_n 0) 
                    (> E_n 0)
                    (=> (< x_n E_n) (= y_n (+ x_n (* B 5))))
                    (=> (>= x_n E_n) (= y_n (- x_n C))) 
                    (=> (< (+ y_n 2) D_n) (= z_n (- (* x_n A) (* y_n B)))) 
                    (=> (>= (+ y_n 2) D_n) (= z_n (+ (* x_n B) (* y_n A)))) 
                    (< z_n (+ E_n D_n)) 
                )
                (>= (+ D_n E_n) (+ D E))
            )
        )
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; END OF SOLUTION ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Testovaci vstupy
; ================

(echo "Test 1 - vstup A=1, B=1, C=3")
(echo "a) Ocekavany vystup je sat a D+E se rovna 2")
(check-sat-assuming (
  (= A 1) (= B 1) (= C 3)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 2, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 1) (= B 1) (= C 3) (distinct (+ D E) 2)
))


(echo "Test 2 - vstup A=5, B=2, C=5")
(echo "a) Ocekavany vystup je sat a D+E se rovna 54")
(check-sat-assuming (
  (= A 5) (= B 2) (= C 5)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 54, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 5) (= B 2) (= C 5) (distinct (+ D E) 54)
))

(echo "Test 3 - vstup A=100, B=15, C=1")
(echo "a) Ocekavany vystup je sat a D+E se rovna 253876")
(check-sat-assuming (
  (= A 100) (= B 15) (= C 1)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 253876, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 100) (= B 15) (= C 1) (distinct (+ D E) 253876)
))

(echo "Test 4 - vstup A=5, B=5, C=3")
(echo "a) Ocekavany vystup je sat a D+E se rovna 51")
(check-sat-assuming (
  (= A 5) (= B 5) (= C 3)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 51, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 5) (= B 5) (= C 3) (distinct (+ D E) 51)
))

(echo "Test 5 - vstup A=2, B=1, C=2")
(echo "a) Ocekavany vystup je sat a D+E se rovna 7")
(check-sat-assuming (
  (= A 2) (= B 1) (= C 2)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 7, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 2) (= B 1) (= C 2) (distinct (+ D E) 7)
))