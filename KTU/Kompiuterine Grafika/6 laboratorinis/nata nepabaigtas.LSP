(defun dtr (a)
    (* PI(/ a 180.0))); kampai laipsniais
; Natos braiþymas
(DEFUN c:nata ()
 (SETQ Pagrindas (GETPOINT "\n Nurodykite apatinio natos kampo vietà"))
 (SETQ Aukðtis (GETREAL "\n Natos aukðtá"))
 (SETQ pt1 (polar Pagrindas (dtr 45.0)(* Aukðtis 0.35)))
 (SETQ pt2 (list (car pt1)(+(cadr pt1) Aukðtis)))
 (SETQ pt3 (list (+(car pt2)(* Aukðtis 0.1))(caddr pt2)))
 (SETQ pt4 (polar pt2 (dtr 300.0)(* Aukðtis 0.4)))
 (SETQ pt5 (polar pt4 (dtr 270.0)(* Aukðtis 0.4)))
 (COMMAND "PLINE" Pagrindas "ARC" "Radius" (* Aukðtis 0.35) pt1 "ARC" "Radius" (* Aukðtis 0.35) Pagrindas "")
 (COMMAND "PLINE" pt1 pt2 "WIDTH" (* Aukðtis 0.05) (* Aukðtis 0.05) pt3 "WIDTH" (* Aukðtis 0.05) "0" pt4 "ARC" pt5 ""))
 