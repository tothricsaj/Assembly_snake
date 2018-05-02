%macro drawWin 0

;TODO The posChg is not in this code. Before I will use that
;I have to test the concat method with numbers.
;This loop is not tested, it may be works wrong. 
; COMMENTS HIGHTLY RECOMENDED NEEEEEEEEEEEEEEEEEEEEEEEEEEEEDDDD
; THE MAIN PROBLEM THE ARGUMENTS. YOU SHOULD ADD AS PARAMETERS.

	win_loop_:
		cmp winVerCount, 0
		jz drwVerWall_

		cmp winVerCount, 15
		jz drwVerWall_

		jnz innerLoop_

		drwVerWall_:
			write_ ver_wall, ver_wall_len
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		innerLoop_:
			
			cmp winHorCount, 1
			jz drwLeftCor_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			cmp winHorCount, 20
			jz drwRightCor_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			jmp drwHorWall_

			backToTheInnerLoop_:
			
			inc winHorCount ;winHorCount++

			cmp winHorCount, 20
			jz endInnerLoop_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		jnz innerLoop_

		endInnerLoop_:

		inc winVerCount ;winVerCount++

		cmp winVerCount, 15
		jz endWin_
	jmp win_loop_

drwLeftCor_:

jmp backToTheInnerLoop_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drwRightCor_:

jmp backToTheInnerLoop_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drwHorWall_:

jmp backToTheInnerLoop_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
endWin_:		
%endmacro
	
