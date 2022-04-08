global _start
section .text
	_start:
		; Printing "Hello world" on the screen
		mov rax, 1 ; print mode
		mov rdi, 1 ; print to console 
		mov rsi, message ; placing the message content to the ecx variable
		mov rdx, len ; here will be placed the message length
		syscall
	
		; exiting
		mov rax, 60 ; system exit
	 	xor rdi, rdi ; exit code 0
		syscall

section .data
	message db "Hello world!", 10 ; message to print 
	len equ $-message ; setting the message length
