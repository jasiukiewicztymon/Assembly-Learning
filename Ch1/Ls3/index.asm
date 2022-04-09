section .data 
	inputText db "What's your name? "
	inputTextLen equ $-inputText
	outputText db "Hello, "
	outputTextLen equ $-outputText

	nameLen equ 16

section .bss
	; Reserve memory for the name
	name resb 16

section .text
	global _start
_start:
	; Call function one by one 

	call _printQuestion
	call _getInput
	call _printOutput
	call _printName
	
	; End the code by return

	mov rax, 60
	mov rdi, 0
	syscall

_getInput:
	; Getting the name from the user
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, nameLen
	syscall
	ret

_printQuestion:
	; Printing the question to the console
	mov rax, 1
	mov rdi, 1
  	mov rsi, inputText
	mov rdx, inputTextLen
	syscall
	ret
	
_printOutput:
	; Printing the output sentence to the console
	mov rax, 1
	mov rdi, 1
	mov rsi, outputText
	mov rdx, outputTextLen
	syscall
	ret

_printName:
	; Printing the output name that we get from the user
	mov rax, 1
 	mov rdi, 1
	mov rsi, name
	mov rdx, nameLen
	syscall
	ret
