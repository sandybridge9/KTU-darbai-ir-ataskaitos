(defun dtr (a)
    (* PI(/ a 180.0))); kampai laipsniais
; Natos brai�ymas
(DEFUN c:nata ()
 (SETQ Pagrindas (GETPOINT "\n Nurodykite apatinio natos kampo viet�"))
 (SETQ Auk�tis (GETREAL "\n Natos auk�t�"))
 (SETQ pt1 (polar Pagrindas (dtr 45.0)(* Auk�tis 0.35)))
 (SETQ pt2 (list (car pt1)(+(cadr pt1) Auk�tis)))
 (SETQ pt3 (list (+(car pt2)(* Auk�tis 0.1))(caddr pt2)))
 (SETQ pt4 (polar pt2 (dtr 300.0)(* Auk�tis 0.4)))
 (SETQ pt5 (polar pt4 (dtr 270.0)(* Auk�tis 0.4)))
 (COMMAND "PLINE" Pagrindas "ARC" "Radius" (* Auk�tis 0.35) pt1 "ARC" "Radius" (* Auk�tis 0.35) Pagrindas "")
 (COMMAND "PLINE" pt1 pt2 "WIDTH" (* Auk�tis 0.05) (* Auk�tis 0.05) pt3 "WIDTH" (* Auk�tis 0.05) "0" pt4 "ARC" pt5 ""))
 