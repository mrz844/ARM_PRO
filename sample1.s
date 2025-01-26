.global main

.section .data
msg:    .asciz "Hello, ARM on Termux!\n"  # تعریف پیام

.section .text
main:
    # بارگذاری آدرس پیام
    adrp x1, msg            # بارگذاری آدرس 4K از بخش داده‌ای
    add x1, x1, :lo12:msg   # تکمیل آدرس برای بارگذاری دقیق

    mov x0, #1              # شماره file descriptor برای stdout
    ldr x2, =21             # طول پیام
    mov x8, #64             # شماره syscall برای sys_write
    svc #0                  # فراخوانی syscall

    mov x0, #0              # کد خروجی 0
    mov x8, #93             # شماره syscall برای sys_exit
    svc #0                  # فراخوانی syscall