(defun c:mano1()
  ;ivedimas
 (setq pradtas(getpoint "Pradinis taskas: "))
 (setq dydis(getreal "Iveskite dydi: "))

  ;figura
  (setq 1apskrvidurys(polar pradtas (/ pi 2) dydis))
  (setq 1apskrkrastas(polar 1apskrvidurys (/ pi 2) dydis))
  (setq 2apskrvidurys(polar 1apskrvidurys (/ pi 2) (* dydis 2)))
  (setq 2apskrkrastas(polar 2apskrvidurys 0 dydis))
  (setq 3apskrvidurys(polar 2apskrvidurys 0 (* dydis 2)))
  (setq 3apskrkrastas(polar 3apskrvidurys (/ (* pi 3) 2) dydis))
  (setq 4apskrvidurys(polar 3apskrvidurys (/(* pi 3)2) (* dydis 2)))
  (setq 4apskrkrastas(polar 4apskrvidurys pi dydis))

  (command "circle" 1apskrvidurys dydis)
  (command "circle" 2apskrvidurys dydis)
  (command "circle" 3apskrvidurys dydis)
  (command "circle" 4apskrvidurys dydis)
  (command "circle" 1apskrkrastas dydis)
  (command "circle" 2apskrkrastas dydis)
  (command "circle" 3apskrkrastas dydis)
  (command "circle" 4apskrkrastas dydis)
  (command "line" 1apskrvidurys 2apskrvidurys 3apskrvidurys 4apskrvidurys
	   1apskrvidurys 3apskrvidurys 4apskrvidurys 2apskrvidurys "")
)