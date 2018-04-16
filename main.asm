%include 'macro.asm'
%include 'constants.asm'
%include 'window.asm'

section .data

	%include 'var.asm'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss
	usr_in resb 1
	buffer resb 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _start

_start:

;	write_ hide_cur, hide_cur_l
write_ erase_disp, erase_l


loop_:
	
	drawWin helpStr
	mov byte [pos+YPOS_F], '0'
	mov byte [pos+YPOS_S], '7'

	write_ pos, pos_l
	write_ b_r_cor, b_r_len

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

