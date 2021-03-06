%include 'macro.asm'

section .data
	msg DB "Ez egy teszt szoveg", 0xA
	len equ $ - msg;

	bye DB "Program vege", 0xA
	l_bye equ $ - bye

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Here is the sequence chars to graphic ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	pos DB 27, "[10;15H"
	pos_l equ $ - pos

	test_pos times 8 DB ' '
	test_pos_l equ $ - test_pos

	pos_y DB "[10;"
	pos_x DB "11H"

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

	;vertical wall
	ver_wall DB `\u2502`
	ver_wall_l equ $ - ver_wall

	;horizontal wall
	hor_wall DB `\u2500`
	hor_wall_l equ $ - hor_wall

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss
	usr_in resb 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _start

_start:

;	write_ hide_cur, hide_cur_l
write_ erase_disp, erase_l


loop_:

	; TODO Valami nem stimmel a kiosztással lesd meg.
	; Csak szólok, hogy eléggé fáradt voltál mikor ezt
	; csináltad, könnyen lehet, hogy egész egyszerű az 
	; egész

	str_con '', 27, test_pos, 0
	str_con '', pos_y, test_pos, 1
	str_con '', pos_x, test_pos, 5

	write_ test_pos, test_pos_l
	write_ hor_wall, hor_wall_l

	read_ usr_in, 1

	cmp [usr_in], byte 'q'

	jz _exit

	jmp loop_

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_exit:

	write_ bye, l_bye

	write_ show_cur, show_cur_l	

	mov eax, 1
	int 0x80

