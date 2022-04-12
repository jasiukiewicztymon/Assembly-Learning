section .bss
	len resb 8
	pos resb 8

section .data
	lenText db "Argument(s): ",0
	lenLenText equ $-lenText

	argText db "Argument #",0
	lenArgText equ $-argText

	pntText db ": ",0
	lenPntText equ $-pntText

	nlnText db 10,0
	lenNlnText equ $-nlnText

%macro printText 1
	; Getting the size
	mov rax, %1
	push rax
	mov rbx, 0

	%%countLoop:
		inc rax
		inc rbx
		mov cl, [rax]
		cmp cl, 0
		jne %%countLoop

	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx 
	syscall
%endmacro

%macro newLine 0
	mov rax, 1
	mov rdi, 1
	mov rsi, nlnText
	mov rdx, lenNlnText
	syscall
%endmacro

section .text
	global _start

_start:
	mov rax, 0
	mov [pos], rax

	; Print number of arguments
	printText lenText

	pop rax
	add rax, 48
	mov [len], rax

	printText len

	mov rax, [len]
	sub rax, 48
	mov [len], rax

	newLine
	
	; Printing the arguments
	argsList:		
		printText argText
			
		mov rax, [pos]
		add rax, 49
		mov [pos], rax
			
		printText pos

		mov rax, [pos]
		sub rax, 49
		mov [pos], rax

		printText pntText

		; Print content

		pop rax
		printText rax

		newLine

		mov rax, [pos]
		inc rax
		mov [pos], rax

		; Moving the length and position to registers
		mov rax, [len]
		mov rbx, [pos]

		; Comparing the length and the position in argument stack	
		cmp rax, rbx
		jne argsList  

	; End code
	mov rax, 60
	mov rdi, 0
	syscall	
