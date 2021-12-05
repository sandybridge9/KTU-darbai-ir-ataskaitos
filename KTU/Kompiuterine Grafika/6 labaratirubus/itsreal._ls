(defun dtr (a)
    (* PI(/ a 180.0))); kampai laipsniais
; Illuminati braiþymas
(DEFUN c:itsreal ()
 (SETQ Virðus (GETPOINT "\n Nurodykite trikampio virðunæ"))
 (SETQ Ilgis (GETREAL "\n Áveskite kraðtinës ilgá"))
 (SETQ pt1 (polar Virðus (dtr 240.0)Ilgis))
 (COMMAND "POLYGON" "3" "Edge" Virðus pt1)
 (COMMAND "osnap" "OFF")
 (SETQ atstumas1 (sqrt(+(EXPT(-(car Virðus)(car pt1))2)(EXPT(-(cadr Virðus)(cadr pt1))2))))
 (SETQ pt2 (polar pt1 (dtr 0.0)Ilgis))
 (SETQ pt3 (polar pt1 (dtr 60.0)(/ atstumas1 3)))
 (SETQ pt4
  )