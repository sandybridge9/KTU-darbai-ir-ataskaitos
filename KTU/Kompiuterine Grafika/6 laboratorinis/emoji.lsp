(defun dtr (a)
    (* PI(/ a 180.0))); kampai laipsniais
; Veidelio braiþymas
(DEFUN c:emoji ()
 (SETQ Centras (GETPOINT "\n Nurodykite veidelio vietà"))
 (SETQ Spindulys (GETREAL "\n Áveskite veidelio spindulá"))
 (COMMAND "CIRCLE" Centras Spindulys) ; pagal centrà ir spindulá
 (COMMAND "osnap" "OFF")
;Burna
  (setq apt1 (polar Centras (dtr 225.0)(- Spindulys (* Spindulys 0.1))))
  (setq apt2 (polar Centras (dtr 315.0)(- Spindulys (* Spindulys 0.1))))
  (command "ARC" apt1 Centras apt2)
  ;Akys
  (setq ppt1 (polar Centras (dtr 135.0)(/ Spindulys 2)))
  (setq ppt2 (polar Centras (dtr 45.0)(/ Spindulys 2)))
  (command "CIRCLE" ppt1 (* Spindulys 0.1))
  (command "CIRCLE" ppt2 (* Spindulys 0.1)))