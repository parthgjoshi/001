	section .data                              ; this section is for initialised data
	msg db 'Addition of 4 & 3 is ' , 10        ; msg which we have to print and 10 is to print on next line 
	len equ $-msg                              ; declaring len , equ means == in HLL 

	section .bss                                ; this section is for reserving of byte , uninitialised data
	sum resb 1

	section .text                            ; this is main function of ASM where we write logic and instruction of code
	global _start  
	_start:

	mov eax , '4'                             ; if we use '' then it means ASCII value so 4 in ascii is 34
	sub eax , '0'        ; then here 0 in ascii is 30 so here 34 - 30 = 4 , it means we convert ascii to integer so eax have 4
	
	mov ebx , '3'        ; same as above , we convert ascii to integer i.e, 33 - 30 = 3 , here ebx have 3
	sub ebx , '0'
	
	add eax , ebx        ; adding eax + ebx  = 4 + 3 = 7
	add eax , '0'        ; then to print on screen again we will change integer value to ascii i.e, eax = (7 + 30 = 37)
	
	mov [sum] , eax      ; copy eax number in sum which have reserve above


	mov eax , 4         ; sys call statements , to print message 
	mov ebx , 1          
	mov ecx , msg	
	mov edx , len 
	int 80h

	mov eax , 4        ; this is for to print the sum
	mov ebx , 1 
	mov ecx , sum
	mov edx , 1
	int 80h

	mov eax , 1       ; exit from terminal
	mov ebx , 0
	int 80h
