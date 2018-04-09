%macro write_ 2
	push eax
  push ebx
  push ecx
  push edx
  
  mov ecx, %1
  mov edx, %2
  mov ebx, 1
  mov eax, 4
  int 0x80
  
  pop edx
  pop ecx
  pop ebx
  pop eax
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%macro read_ 2
	push eax
  push ebx
  push ecx
  push edx
  
  mov ecx, %1
  mov edx, %2
  mov ebx, 2
  mov eax, 3
  int 0x80
  
  pop edx
  pop ecx
  pop ebx
  pop eax
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%macro str_con 4
	push eax

	mov eax, [%1]
	mov [%3], eax
	mov eax, [%2]
	mov [%3+%4], eax

	pop eax
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


