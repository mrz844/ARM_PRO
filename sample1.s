.global main

.section .data
msg:    .asciz "Hello, ARM on Termux!\n"

.section .text
main:
             
    mov x0, #0          
    mov x8, #93         
    svc #0
