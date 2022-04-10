section .bss
	digit resb 100
	digitPos resb 8	

section .text 
	global _start

_start :
	mov rax, 12344
	call _printDigit
	
	mov rax, 60
	mov rdi, 0
	syscall

_printDigit:
	mov rcx, digit
	mov rbx, 10
	mov [rcx], rbx
	inc rcx
	mov [digitPos], rcx

	; rax -> 123
	; rbx -> 10
	; rdx === rax / rbx
	; rdx === 12 mod 3
	; 3 is the digit to print
	; 3 + 48 -> 3 in ASCII 

	while:
		mov rdx, 0
		mov rbx, 10
		div rbx
		push rax
		add rdx, 48
		
		; digitPos -> dl === mod from rdx
	
		mov rcx, [digitPos]
		mov [rcx], dl
		inc rcx 
		mov [digitPos], rcx
		
		pop rax
		cmp rax, 0
		jne while

	while2:
		mov rcx, [digitPos]
		
		mov rax, 1
		mov rdi, 1
		mov rsi, rcx
		mov rdx, 1
		syscall

		mov rcx, [digitPos]
		dec rcx
		mov [digitPos], rcx

		cmp rcx, digit
		jge while2

	ret
