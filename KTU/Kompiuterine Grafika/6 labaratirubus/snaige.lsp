(defun dtr (a)
    (* PI(/ a 180.0))); kampai laipsniais
; Snaigës braiþymas
(DEFUN c:snaige ()
 (SETQ Centras (GETPOINT "\n Nurodykite snaigës vietà"))
 (SETQ Ilgis (GETREAL "\n Áveskite snaigës spindulá"))
 (COMMAND "osnap" "OFF")
;viena ðaka
  (setq lpt1 (polar Centras (dtr 90.0)(* Ilgis 1)))
  (setq lpt2 (polar Centras (dtr 90.0)(- Ilgis (* Ilgis 0.3))))
  (setq lpt3 (polar lpt2 (dtr 30.0)(* Ilgis 0.3)))
  (setq lpt4 (polar lpt2 (dtr 150.0)(* Ilgis 0.3)))
  (command "LINE" Centras lpt1 "")
  (command "LINE" lpt4 lpt2 lpt3 "")
  ;Array?
  (command "ARRAY" lpt1 lpt3 lpt4 "")
  (command "P" Centras)
  (command "6" "360" "Y"))