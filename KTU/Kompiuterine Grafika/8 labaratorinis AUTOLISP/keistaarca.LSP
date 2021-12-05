(defun c:keistaarka()
  ;ivedimas
  (setq pratas(getpoint "\nIveskite pradini taska kuriame bus nubrezta figura: "))
  (setq spind(getreal "\nIveskite pusapskritimio spinduli: "))
  ;didzioji arka
  (setq vidtas(polar pratas 1.5708 spind))
  (setq pabtas(polar vidtas 1.5708 spind))
  (setq arcvid(polar vidtas 3.14159 spind))

  (command "line" pratas vidtas pabtas "")
  (command "arc" pratas arcvid pabtas)
  ;kreivi keturkampiai
  (setq spindulys(* spind 0.97))
  (setq mazasspindulys(* spind 0.2))

  ;1mas kreivas keturkampis
  (setq ad1(polar vidtas 1.67552 mazasspindulys))
  (setq vd1(polar vidtas 1.58825 spindulys ))
  (setq av1(polar vidtas 1.8326 mazasspindulys))
  (setq vv1(polar vidtas 1.8326 spindulys))
  (setq ak1(polar vidtas 2.07694 mazasspindulys))
  (setq vk1(polar vidtas 2.07694 spindulys))

  (command "line" ad1 vd1 "")
  (command "line" ak1 vk1 "")
  (command "arc" ak1 av1 ad1)
  (command "arc" vk1 vv1 vd1)

  ;2as kreivas keturkampis
  (setq ad2(polar vidtas 2.16421 mazasspindulys))
  (setq vd2(polar vidtas 2.11185 spindulys ))
  (setq av2(polar vidtas 2.35619 mazasspindulys))
  (setq vv2(polar vidtas 2.35619 spindulys))
  (setq ak2(polar vidtas 2.56563 mazasspindulys))
  (setq vk2(polar vidtas 2.60054 spindulys))

  (command "line" ad2 vd2 "")
  (command "line" ak2 vk2 "")
  (command "arc" ak2 av2 ad2)
  (command "arc" vk2 vv2 vd2)

  ;3cias kreivas keturkampis
  (setq ad3(polar vidtas 2.6529 mazasspindulys))
  (setq vd3(polar vidtas 2.63545 spindulys ))
  (setq av3(polar vidtas 2.87979 mazasspindulys))
  (setq vv3(polar vidtas 2.87979 spindulys))
  (setq ak3(polar vidtas 3.05433 mazasspindulys))
  (setq vk3(polar vidtas 3.12414 spindulys))

  (command "line" ad3 vd3 "")
  (command "line" ak3 vk3 "")
  (command "arc" ak3 av3 ad3)
  (command "arc" vk3 vv3 vd3)

  ;4tas kreivas keturkampis
  (setq ad4(polar vidtas 3.22886 mazasspindulys))
  (setq vd4(polar vidtas 3.15905 spindulys ))
  (setq av4(polar vidtas 3.40339 mazasspindulys))
  (setq vv4(polar vidtas 3.40339 spindulys))
  (setq ak4(polar vidtas 3.63028 mazasspindulys))
  (setq vk4(polar vidtas 3.64774 spindulys))

  (command "line" ad4 vd4 "")
  (command "line" ak4 vk4 "")
  (command "arc" ak4 av4 ad4)
  (command "arc" vk4 vv4 vd4)

  ;5tas kreivas keturkampis
  (setq ad5(polar vidtas 3.71755 mazasspindulys))
  (setq vd5(polar vidtas 3.68264 spindulys ))
  (setq av5(polar vidtas 3.94444 mazasspindulys))
  (setq vv5(polar vidtas 3.94444 spindulys))
  (setq ak5(polar vidtas 4.11898 mazasspindulys))
  (setq vk5(polar vidtas 4.17134 spindulys))

  (command "line" ad5 vd5 "")
  (command "line" ak5 vk5 "")
  (command "arc" ak5 av5 ad5)
  (command "arc" vk5 vv5 vd5)

  ;6tas kreivas keturkampis
  (setq ad6(polar vidtas 4.20624 mazasspindulys))
  (setq vd6(polar vidtas 4.20624 spindulys ))
  (setq av6(polar vidtas 4.41568 mazasspindulys))
  (setq vv6(polar vidtas 4.41568 spindulys))
  (setq ak6(polar vidtas 4.60767 mazasspindulys))
  (setq vk6(polar vidtas 4.69494 spindulys))

  (command "line" ad6 vd6 "")
  (command "line" ak6 vk6 "")
  (command "arc" ak6 av6 ad6)
  (command "arc" vk6 vv6 vd6)
)