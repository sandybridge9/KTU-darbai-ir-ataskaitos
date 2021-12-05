(defun c:skeptras()
  ;ivedimas
 (setq 1taskas(getpoint "Pradinis taskas: "))
 (setq dydis(getreal "Iveskite dydi: "))
  ;figura
  (setq 2taskas(polar 1taskas (/ pi 2) (* dydis 2)))
  (setq 3taskas(polar 2taskas 0 dydis))
  (setq 4taskas(polar 3taskas (/ (* pi 3) 2) (* dydis 2)))
  (setq 5taskas(polar 3taskas (/ pi 4) dydis))
  (setq 6taskas(polar 5taskas (/ (* pi 3) 4) (* dydis 1.707)))
  (setq 7taskas(polar 2taskas (/(* pi 3) 4) dydis))
  (setq 8taskas(polar 4taskas pi (/ dydis 2)))


  (command "line" 1taskas 2taskas 3taskas 4taskas 1taskas "")
  (command "line" 3taskas 5taskas 6taskas 7taskas 2taskas "")
  (command "arc" 5taskas 6taskas 7taskas)
  (command "line" 6taskas 2taskas "")
  (command "line" 6taskas 3taskas "")
  (command "line" 6taskas 8taskas "")
)