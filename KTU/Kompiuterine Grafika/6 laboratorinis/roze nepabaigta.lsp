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
  (setq lpt5 (list (car lpt4) (+ (cadr lpt4) (/ Aukstis 8))))
  (command "LINE" Pagrindas lpt1 "")
  (command "LINE" lpt2 lpt3 "")
  (command "LINE" lpt4 lpt5 "")
  (setq SAK1 (entlast))
  ;Lapeliai
  (command "CIRCLE" lpt5 (/ Aukstis 24))
  (setq APSK1 (entlast))
  (command "CIRCLE" lpt3 (/ Aukstis 12))
  (setq APSK2 (entlast))
  (setq clpt1 (polar lpt5 (dtr 270.0)(/ Aukstis 24)))
  (command "POLYGON" "3" lpt5 "C" clpt1)
  (setq TRIK1 (entlast))
  (command "TRIM" APSK1 "" (list(+ (car clpt1) 0.1) (cadr clpt1)) (list(- (car clpt1) 0.1) (cadr clpt1)) "")
  (command "HATCH" "SOLID" 2 0 TRIK1 APSK1 "")
  )
  