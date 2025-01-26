.global _start

.section .data
msg:    .asciz "Hello, ARM on Termux!\n"

.section .text
_start:
    # نوشتن پیام به خروجی (stdout)
    mov r0, #1          
    ldr r1, =msg        
    ldr r2, =21         
    mov r7, #4          
    svc #0              

    # پایان دادن به برنامه
    mov r0, #0          
    mov r7, #1          
    svc #0              