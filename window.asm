%macro drawWin 7

	win_loop_:
		cmp word %3, 0 ;winVerCount, 0
		jz drwVerWall_

		cmp word %3, 15 ;winVerCount, 15
		jz drwVerWall_

		jnz innerLoop_

		drwVerWall_:
			write_ %1, %2;%1 ver_wall, %2 ver_wall_len
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		innerLoop_:
			
			cmp word %4, 1 ;winHorCount
			jz drwLeftCor_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			cmp word %4, 20 ;winHorCount
			jz drwRightCor_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			jmp drwHorWall_

			backToTheInnerLoop_:
			
			inc word %4 ;winHorCount++

			cmp word %4, 20 ;winHorCount
			jz endInnerLoop_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		jnz innerLoop_

		endInnerLoop_:

		inc word %3 ;winVerCount++

		cmp word %3, 15 ;winVerCount
		jz endWin_
	jmp win_loop_

drwLeftCor_:
	write_ %5, 1
jmp backToTheInnerLoop_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drwRightCor_:
	write_ %6, 1
jmp backToTheInnerLoop_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drwHorWall_:
	write_ %7, 1
jmp backToTheInnerLoop_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
endWin_:		
%endmacro
	
