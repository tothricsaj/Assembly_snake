%include 'macro.asm'

section .data
	msg DB "Ez egy teszt szoveg", 0xA
	len equ $ - msg;

	bye DB "Program vege", 0xA
	l_bye equ $ - bye

	pos DB 27, "[10;15H"
	pos_l equ $ - pos

	erase_disp DB 27, "[2J"
	erase_l equ $ - erase_disp

	hide_cur DB 27, "[?25l"
	hide_cur_l equ $ - hide_cur

	show_cur DB 27, "[?25h"
	show_cur_l equ $ - show_cur

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

	write_ pos, pos_l
	write_ msg, len

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

