; JESS aplinkoje komentarus pasalinkite
;
;(clear)

(deftemplate fragment (slot from)(slot to) (slot from_street_name) (slot to_street_name)) 
(deftemplate car (slot location)) 
(deftemplate obstacles (slot location) (slot t_lights) (slot cars) (slot pedestrians) (slot spec_service))

(deffacts faktu-inicializavimas
  (car (location A))
  (fragment (from A) (to B) (from_street_name Rasos) (to_street_name Alytaus))
  (fragment (from B) (to C) (from_street_name Alytaus) (to_street_name Luksos))
  (fragment (from C) (to D) (from_street_name Luksos) (to_street_name Vytauto))
  (fragment (from D) (to E) (from_street_name Vytauto) (to_street_name Geliu))
  (obstacles (location A) (t_lights 1) (cars 2) (pedestrians 2) (spec_service 0))
  (obstacles (location B) (t_lights 1) (cars 2) (pedestrians 2) (spec_service 1))
  (obstacles (location C) (t_lights 1) (cars 2) (pedestrians 2) (spec_service 2))
  (obstacles (location D) (t_lights 1) (cars 2) (pedestrians 2) (spec_service 3))
  ;(obstacles (location E) (t_lights 0) (cars 0) (pedestrians 0) (spec_service 0))
)

(defrule r1 "Kai esamoje sankryzoje yra sviesoforu, laukiam"
  ?fact-id1 <- (car (location ?location))
  ?fact-id2 <- (obstacles (location ?location) (t_lights ?t_lights))
  =>
  (if (> ?t_lights 0) then (modify ?fact-id2 (t_lights (- ?t_lights 1)))
  )
)
(defrule r2 "Kai esamoje sankryzoje yra masinu, laukiam"
  ?fact-id1 <- (car (location ?location))
  ?fact-id2 <- (obstacles (location ?location) (cars ?cars))
  =>
  (if (> ?cars 0) then (modify ?fact-id2 (cars (- ?cars 1)))
  )
)
(defrule r3 "Kai esamoje sankryzoje yra pesciuju, laukiam"
  ?fact-id1 <- (car (location ?location))
  ?fact-id2 <- (obstacles (location ?location) (pedestrians ?pedestrians))
  =>
  (if (> ?pedestrians 0) then (modify ?fact-id2 (pedestrians (- ?pedestrians 1)))
  )
)
(defrule r4 "Kai esamoje sankryzoje yra specialiu tarnybu, laukiam"
  ?fact-id1 <- (car (location ?location))
  ?fact-id2 <- (obstacles (location ?location) (spec_service ?spec_service))
  =>
  (if (> ?spec_service 0) then (modify ?fact-id2 (spec_service (- ?spec_service 1)))
  )
)
(defrule r5 "Kai nebeliko kliuciu, judam toliau"
  ?fact-id1 <- (car (location ?location))
  ?fact-id2 <- (fragment (from ?location) (to ?to))
  ?fact-id3 <- (obstacles (location ?location) (t_lights 0) (cars 0) (pedestrians 0) (spec_service 0))
  =>
  (modify ?fact-id1 (location ?to))
)

; JESS aplinkoje komentarus pasalinkite
;
; (reset)
; (facts)
; (watch all)
; (run)
