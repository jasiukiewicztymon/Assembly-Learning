section .text
	global _start 

	_start:
		mov dword [var], 0 ; "dword" is used for 32 bits operations
	loop:
		inc dword [var]
		jmp loop
section .bss
	var resb 4
