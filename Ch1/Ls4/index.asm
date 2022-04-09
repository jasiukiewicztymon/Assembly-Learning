section .data
	digit db 0, 10

section .text
	global _start

_start:
	mov rax, 7	  ; placing the digit we want to print
	add rax, 48       ; adding 48 to get the ascii number
	mov [digit], al	  ; move the lower byte of rax to the digit

	mov rax, 1
	mov rdi, 1
	mov rsi, digit
	mov rdx, 2
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
