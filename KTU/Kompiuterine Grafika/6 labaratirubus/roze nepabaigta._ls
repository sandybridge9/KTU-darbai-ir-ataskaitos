(defun dtr (a)
    (* PI(/ a 180.0))); kampai laipsniais
; Ro��s brai�ymas
(DEFUN c:roze ()
 (SETQ Pagrindas (GETPOINT "\n Nurodykite ro��s viet�"))
 (SETQ Aukstis (GETREAL "\n �veskite kotelio ilg�"))
 (COMMAND "osnap" "OFF")
;Kotelis
  (command "COLOR" "green")
  (setq lpt1 (polar Pagrindas (dtr 90.0)(* Aukstis 1)))
  (setq lpt2 (polar Pagrindas (dtr 90.0)(/ Aukstis 2)))
  (setq lpt3 (polar lpt2 (dtr 45.0)(/ Aukstis 2)))
  (setq lpt4 (polar lpt2 (dtr 45.0)(/ Aukstis 4)))
  (setq lpt5 (polar ltp4 (dtr 90.0)(/ Aukstis 6)))
  (command "LINE" Pagrindas lpt1 "")
  (command "LINE" lpt2 lpt3 "")
  (command "LINE" lpt4 lpt5 ""))
  ;�iedas
  