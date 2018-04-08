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

	erase_disp DB 27, "[2J"
	erase_l equ $ - erase_disp

	hide_cur DB 27, "[?25l"
	hide_cur_l equ $ - hide_cur

	show_cur DB 27, "[?25h"
	show_cur_l equ $ - show_cur

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; The box drawing chars to window ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	t_l_cor DB `\u250C`
	t_l_len equ $ - t_l_cor

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
	write_ t_l_cor, t_l_len

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

