(defun dtr (a)
    (* PI(/ a 180.0))); kampai laipsniais
(defun c:david ()
  (setq centras (getpoint "\n Nurodykite centro koordinates"))
  (setq dydis (getreal "\n Áveskite þvaigþdës dydá"))
  (command "Polygon" "3" centras "I" (polar centras (dtr 90.0)dydis))
  (command "Polygon" "3" centras "I" (polar centras (dtr 270.0)dydis)))