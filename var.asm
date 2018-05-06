bye DB "Program vege", 0xA
l_bye equ $ - bye

winHorCount DB 0
winVerCount DB 0

xPosFirst DB '0'
xPosSec DB '0'
yPosFirst DB '0'
yPosSec DB '0'


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Here is the sequence chars to graphic ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

escChr DB '27'

buff times 7 DB ' '
buffL equ $ - buff

pos DB 27, "[15;09H"
pos_l equ $ - pos

test_pos times 2 DB ' '
test_pos_l equ $ - test_pos

posCoor times 9 DB ' '
posCoorL equ $ - posCoor

pos_y DB "[10;"
pos_x DB "11H"

helpStr DB ''
hsl equ $ - helpStr

erase_disp DB 27, "[2J"
erase_l equ $ - erase_disp

hide_cur DB 27, "[?25l"
hide_cur_l equ $ - hide_cur

show_cur DB 27, "[?25h"
show_cur_l equ $ - show_cur

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; The box drawing chars to window ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;top left corner
t_l_cor DB `\u250C`
t_l_len equ $ - t_l_cor

;top right corner
t_r_cor DB `\u2510`
t_r_len equ $ - t_r_cor

;bottom left corner
b_l_cor DB `\u2514`
b_l_len equ $ - b_l_cor

;bottom right corner
b_r_cor DB `\u2518`
b_r_len equ $ - b_r_cor

ver_wall DB `\u2502`
ver_wall_len equ $ - ver_wall

;horizontal wall
hor_wall DB `\u2500`
hor_wall_len equ $ - hor_wall

