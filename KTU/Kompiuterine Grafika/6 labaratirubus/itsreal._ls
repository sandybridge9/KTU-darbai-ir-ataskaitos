(defun dtr (a)
    (* PI(/ a 180.0))); kampai laipsniais
; Illuminati brai�ymas
(DEFUN c:itsreal ()
 (SETQ Vir�us (GETPOINT "\n Nurodykite trikampio vir�un�"))
 (SETQ Ilgis (GETREAL "\n �veskite kra�tin�s ilg�"))
 (SETQ pt1 (polar Vir�us (dtr 240.0)Ilgis))
 (COMMAND "POLYGON" "3" "Edge" Vir�us pt1)
 (COMMAND "osnap" "OFF")
 (SETQ atstumas1 (sqrt(+(EXPT(-(car Vir�us)(car pt1))2)(EXPT(-(cadr Vir�us)(cadr pt1))2))))
 (SETQ pt2 (polar pt1 (dtr 0.0)Ilgis))
 (SETQ pt3 (polar pt1 (dtr 60.0)(/ atstumas1 3)))
 (SETQ pt4
  )