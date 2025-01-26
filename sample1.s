.global _start

.section .data
msg:    .asciz "Hello, ARM on Termux!\n"

.section .text
_start:
    # نوشتن پیام به خروجی (stdout)
    mov x0, #1          @ File descriptor 1 (stdout)
    ldr x1, =msg        @ بارگذاری آدرس پیام به x1
    ldr x2, =21         @ طول پیام "Hello, ARM on Termux!\n" (21 بایت)
    mov x8, #64         @ شماره syscall برای sys_write (64 در AArch64)
    svc #0              @ فراخوانی syscall برای نوشتن پیام

    # پایان دادن به برنامه
    mov x0, #0          @ وضعیت خروجی 0
    mov x8, #93         @ شماره syscall برای sys_exit (93 در AArch64)
    svc #0              @ فراخوانی syscall برای خروج          