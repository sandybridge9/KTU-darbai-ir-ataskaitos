; JESS aplinkoje komentarus pasalinkite
;
;(clear)

(deftemplate pele (slot spalva) (slot kiekis) )
(deftemplate katino (slot busena) (slot suvalgyta_peliu) (slot nevalge_dienu) )

(deffacts faktu-inicializavimas
  (pele (spalva pilka) (kiekis 5))
  (pele (spalva balta) (kiekis 3))
  (katino (busena "alkanas") (suvalgyta_peliu 0) (nevalge_dienu 0))
)

(defrule r1 "Kai katinas alkanas, jis nori valgyti"
  ?fact-id <- (katino (busena ?busena))  
  (test (eq ?busena "alkanas"))
  =>
  (modify ?fact-id (busena "nori valgyti"))
)
(defrule r2 "Kai katinas nori valgyti ir yra peliu, jis valgo peles"
  ?fact-id1 <- (katino (busena "nori valgyti") (suvalgyta_peliu ?suvalgyta))
  ?fact-id2 <- (pele (spalva ?spalva) (kiekis ?kiekis))
  (test (> ?kiekis 0))
  =>
  
  (if (eq ?spalva balta) then (printout t "py-py!" crlf)
                         else (printout t "pyyyyy" crlf))
  (modify ?fact-id2 (kiekis (- ?kiekis 1))  )
  
  (modify ?fact-id1 (suvalgyta_peliu (+ ?suvalgyta 1)) ) 
  (printout t "miau" crlf)
)

(defrule r3 "kai katinas suvalgo 5 peles, jis tampa storu katinu"
  (declare (salience 10))
  ?fact-id1 <- (katino (busena "nori valgyti") (suvalgyta_peliu ?suvalgyta))
  (test (= ?suvalgyta 5)) 
  
=>
  (modify ?fact-id1 (busena "storas"))
)

(defrule r4 "Kai katinas storas, jis miega"
  ?fact-id1 <- (katino (busena ?busena))  
  (test (eq ?busena "storas"))
  =>
  (modify ?fact-id1 (busena "miega"))
)
(defrule r5 "Kai storas katinas pamiega, jis tampa alkanas"
  ?fact-id1 <- (katino (busena ?busena))
  ?fact-id2 <- (katino (suvalgyta_peliu ?suvalgyta_peliu))   
  (test (eq ?busena "miega"))
  =>
  (modify ?fact-id1 (busena "nori valgyti") (suvalgyta_peliu 0))
)
(defrule r6 "Katinas siandien nevalge"
  ?fact-id1 <- (katino (busena "nori valgyti") (nevalge_dienu ?nevalge_dienu))
  (pele (spalva pilka) (kiekis 0))
  (pele (spalva balta) (kiekis 0))
  =>
  (modify ?fact-id1 (nevalge_dienu (+ ?nevalge_dienu 1)))
)
(defrule r7 "Kai katinas nevalge 7 dienas, jis pabega"
  (declare (salience 5))
  ?fact-id1 <- (katino (busena "nori valgyti")  (nevalge_dienu 7))   

  =>
  (modify ?fact-id1 (busena "pabego"))
)

; JESS aplinkoje komentarus pasalinkite
;
; (reset)
; (facts)
; (watch all)
; (run)
