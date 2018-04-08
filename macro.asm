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

