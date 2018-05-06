%include 'macro.asm'
%include 'constants.asm'
%include 'window.asm'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;SECTION .DATA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .data

	%include 'var.asm'
	testCor DB 0

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
	
;	drawWin [ver_wall], [ver_wall_len], [winVerCount], [winHorCount], [t_l_cor], [t_r_cor], [hor_wall]

	inc byte [testCor]
	mov eax, [testCor]
	sub eax, '0'
	mov ecx, eax

	mov eax, 4
	mov ebx, 1
	mov edx, 2
	int 0x80

	;mov byte [pos+YPOS_F], al
	;mov byte [pos+YPOS_S], '7'

	;write_ pos, pos_l
	;write_ b_r_cor, b_r_len

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

