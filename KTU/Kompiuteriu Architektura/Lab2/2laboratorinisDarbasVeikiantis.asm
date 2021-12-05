;
; suskaiciuoti     /   a + c^2          , kai c = 2x
;              y = |   |b-2x|           , kai c < 2x
;                  \   ](3c+x)/(c-2x)[  , kai c > 2x
; skaiciai be zenklo
; Duomenys a - w, b - w, c - b, x - w, y - b

stekas  SEGMENT STACK
DB 256 DUP(0)
stekas  ENDS

;------------Duomenys-----------------------
duom    SEGMENT
a    DW 10  ;10000 ; perpildymo situacijai
b    DW 150
c    DB 10
x    DW 1,2,3,8,7,13,19
kiek    = ($-x)/2
y    DB kiek dup(0AAh)
isvb    DB 'x=',6 dup (?), ' y=',6 dup (?), 0Dh, 0Ah, '$'
perp    DB 'Perpildymas', 0Dh, 0Ah, '$'
daln    DB 'Dalyba is nulio', 0Dh, 0Ah, '$'
netb    DB 'Netelpa i baita', 0Dh, 0Ah, '$'
;=====================================================
minus   DB 'Skaicius yra mazesnis uz 0', 0Dh, 0Ah, '$'
;=====================================================
spausk  DB 'Skaiciavimas baigtas, spausk bet kuri klavisa,', 0Dh, 0Ah, '$'
duom    ENDS

;----------Procesai------------------------
prog    SEGMENT
assume ss:stekas, ds:duom, cs:prog

pr:    
MOV ax, duom
MOV ds, ax
XOR si, si      ; (suma mod 2) si = 0
XOR di, di      ; di = 0

c_pr:   
MOV cx, kiek
JCXZ pab

cikl:
MOV ax, 2
MOV bl, c
XOR bh, bh
MUL x[si]
CMP bx, ax
JB f2  ; c < 2x
JA f3  ; c > 2x

;==== a + c^2, kai c = 2x ====
f1:    
MOV al, c
XOR ah, ah
MUL c    ; dx:ax=c^2
JC kl1  ; sandauga netilpo i ax
XCHG ax, dx
MOV ax, a
;XOR ah, ah
ADD dx, ax    ; c^2+a
JC kl1  ; suma netilpo i ax
MOV ax, dx
XOR dx, dx
;DIV bx    ; ax=rez
JMP re

;==== b - 2x, kai c < 2x ====
f2:    
MOV ax, x[si]
MOV dx, 2
MUL dx 
JC kl1 ; perpildymas
XCHG ax, bx
XOR ax, ax
MOV ax, b
;====
CMP ax, bx
JB kl4 ; atsakymas yra maziau uz 0
;====
SUB ax, bx
XOR bx, bx
JMP re

;==== ](3c + x)/(c - 2x)[, kai c > 2x ====
f3:    
MOV ax, 3
MUL c           ; 3 * c
JC kl1 ;ar ne perpildytas
MOV dx, x[si]
ADD ax, dx      ;3c + x
JC kl1 ;ar ne perpildytas
XOR bx, bx
XCHG  ax, bx
MOV ax, 2
MUL dx       ; 2 * x  <------- automatiskai nuresetina dx kazkodel :/
XOR dx, dx   
XCHG ax, dx
MOV al, c
XOR ah, ah
SUB ax, dx   ;c - 2x
CMP ax, 0
JZ kl2
XOR dx, dx
XCHG ax, bx
DIV bx
JMP re

re:
CMP ah, 0     ;ar telpa rezultatasi baita
JE ger
JMP kl3

ger:    MOV y[di], al
INC si
INC si
INC di
LOOP cikl

pab:
;rezultatu isvedimas i ekrana
;============================
XOR si, si
XOR di, di
MOV cx, kiek
JCXZ is_pab

is_cikl:
MOV ax, x[si]  ; isvedamas skaicius x yra ax reg.
PUSH ax
MOV bx, offset isvb+2
PUSH bx
CALL binasc
MOV al, y[di]
XOR ah, ah        ; isvedamas skaicius y yra ax reg.
PUSH ax
MOV bx, offset isvb+11
PUSH bx
CALL binasc

MOV dx, offset isvb
MOV ah, 9h
INT 21h
;============================
INC si
INC si
INC di
LOOP is_cikl

is_pab:
;===== PAUZE ===================
;===== paspausti bet kuri klavisa ===
LEA dx, spausk
MOV ah, 9
INT 21h
MOV ah, 0
INT 16h
;============================
MOV ah, 4Ch   ; programos pabaiga, grizti i OS
INT 21h
;============================

kl1:    LEA dx, perp
MOV ah, 9
INT 21h
XOR al, al
JMP ger

kl2:    LEA dx, daln
MOV ah, 9
INT 21h
XOR al, al
JMP ger

kl3:    LEA dx, netb
MOV ah, 9
INT 21h
XOR al, al
JMP ger
;==== MAZIAU UZ 0 ====
kl4:    LEA dx, minus
MOV ah, 9
INT 21h
XOR al, al
JMP ger 
;=====================
; skaiciu vercia i desimtaine sist. ir issaugo
; ASCII kode. Parametrai perduodami per steka
; Pirmasis parametras ([bp+6])- verciamas skaicius
; Antrasis parametras ([bp+4])- vieta rezultatui

binasc    PROC NEAR
PUSH bp
MOV bp, sp
; naudojamu registru issaugojimas
PUSHA
; rezultato eilute uzpildome tarpais
MOV cx, 6
MOV bx, [bp+4]

tarp:    MOV byte ptr[bx], ' '
INC bx
LOOP tarp
; skaicius paruosiamas dalybai is 10
MOV ax, [bp+6]
MOV si, 10

val:    XOR dx, dx
DIV si
;  gauta liekana verciame i ASCII koda
ADD dx, '0'   ; galima--> ADD dx, 30h
;  irasome skaitmeni i eilutes pabaiga
DEC bx
MOV [bx], dl
; skaiciuojame pervestu simboliu kieki
INC cx
; ar dar reikia kartoti dalyba?
CMP ax, 0
JNZ val

POPA
POP bp
RET
binasc    ENDP
prog    ENDS
END pr
