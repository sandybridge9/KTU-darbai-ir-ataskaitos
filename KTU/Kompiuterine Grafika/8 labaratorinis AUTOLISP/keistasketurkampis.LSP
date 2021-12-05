(defun c:voriukas()
	(setq ilgis(getreal "\nIveskite staciakampio ilgi: "))
	(setq plotis(getreal "\nIveskite staciakampio ploti: "))
  	(setq plaukilgis(getreal "\nIveskite plaukelio ilgi: "))
  	(setq spindilgis(getreal "\nIveskite pusapskritimio spindulio ilgi: "))

  ;staciakampio kampai
  
  	;apatinis kairys
	(setq taskas1(getpoint "\nIveskite apatinio kairiojo kampo taska: "))
  	;virsutinis kairys
	(setq taskas2(polar taskas1 (/ pi 2) plotis))
  	;virsutinis desinys
	(setq taskas3(polar taskas2 0 ilgis))
  	;apatinis desinys
	(setq taskas4(polar taskas3 (/ (* pi 3) 2) plotis))
	;tarpai tarp kiekvieno plaukelio
	(setq pltarpas (/ ilgis 8))
  
  ;virsutine krastine
  
  	(setq v1(polar taskas2 0 pltarpas))
  	(setq p1(polar v1 (/ pi 2) plaukilgis))
  	(setq v2(polar v1 0 pltarpas))
  	(setq p2(polar v2 (/ pi 2) plaukilgis))
  	(setq v3(polar v2 0 pltarpas))
  	(setq p3(polar v3 (/ pi 2) plaukilgis))
  	(setq v4(polar v3 0 pltarpas))
  	(setq p4(polar v4 (/ pi 2) plaukilgis))
  	(setq v5(polar v4 0 pltarpas))
  	(setq p5(polar v5 (/ pi 2) plaukilgis))
  	(setq v6(polar v5 0 pltarpas))
  	(setq p6(polar v6 (/ pi 2) plaukilgis))
  	(setq v7(polar v6 0 pltarpas))
  	(setq p7(polar v7 (/ pi 2) plaukilgis))
  	(setq v8(polar v7 0 pltarpas))

 ;apatine krastine

  	(setq a1(polar taskas4 pi pltarpas))
  	(setq l1(polar a1 (/ (* pi 3) 2) plaukilgis))
  	(setq a2(polar a1 pi pltarpas))
  	(setq l2(polar a2 (/ (* pi 3) 2) plaukilgis))
  	(setq a3(polar a2 pi pltarpas))
  	(setq l3(polar a3 (/ (* pi 3) 2) plaukilgis))
  	(setq a4(polar a3 pi pltarpas))
  	(setq l4(polar a4 (/ (* pi 3) 2) plaukilgis))
  	(setq a5(polar a4 pi pltarpas))
  	(setq l5(polar a5 (/ (* pi 3) 2) plaukilgis))
  	(setq a6(polar a5 pi pltarpas))
  	(setq l6(polar a6 (/ (* pi 3) 2) plaukilgis))
  	(setq a7(polar a6 pi pltarpas))
  	(setq l7(polar a7 (/ (* pi 3) 2) plaukilgis))
  	(setq a8(polar a7 pi pltarpas))
 ;arka
  
	(setq pratas(polar taskas1 (/ pi 2) (-(/ plotis 2) spindilgis)))
  	(setq vidtas(polar pratas (/ pi 2) spindilgis))
  	(setq pabtas(polar vidtas (/ pi 2) spindilgis))
  	(setq arcspin(polar vidtas 0 spindilgis))

  
	(command "line" taskas1 taskas2 v1 p1 v1 v2 p2 v2
		 v3 p3 v3 v4 p4 v4 v5 p5 v5 v6 p6 v6 v7 p7 v7 v8
		 taskas3 taskas4 a1 l1 a1 a2 l2 a2
		 a3 l3 a3 a4 l4 a4 a5 l5 a5 a6 l6 a6 a7 l7 a7 a8 taskas1 "")
  	;(command "line" pratas vidtas arcspin vidtas pabtas "")
  	(command "arc" pratas arcspin pabtas)
)