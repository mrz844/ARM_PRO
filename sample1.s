.global main

.section .data
msg:    .asciz "Hello, ARM on Termux!\n"  

.section .text
main:
    
    adrp x1, msg            
    add x1, x1, :lo12:msg   

    mov x0, #1              
    ldr x2, =21             
    mov x8, #64             
    svc #0                  

    mov x0, #0              
    mov x8, #93             
    svc #0                  