section .data
   	text db "Hello, World!",10,0
        text2 db "World?",10,0
	
section .text
    	global _start
	
_start:
    	mov rax, text
    	call _print
    	mov rax, text2
    	call _print
 
	mov rax, 60
    	mov rdi, 0
    	syscall
 
 
; Input  -> rax as pointer to string
; Output -> print string at rax
_print:
    	push rax
    	mov rbx, 0
	while:
  		inc rax
    		inc rbx
    		mov cl, [rax]
    		cmp cl, 0
    		jne while
 
    	mov rax, 1
    	mov rdi, 1
    	pop rsi
    	mov rdx, rbx
    	syscall
 
    	ret
