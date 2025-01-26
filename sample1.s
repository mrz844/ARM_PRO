.macro enter size
	stmg	%r6, %r15, 48(%r15)  # ذخیره‌ی r6 در %r15 در استک
	lay	%r15, -(160+\size)(%r15)  # r15 = r15 - (160 + size)
.endm

.macro leave size
	lay	%r15, (160+\size)(%r15)  # r15 = r15 + (160 + size)
	lmg	%r6, %r15, 48(%r15)  # بازیابی r6 از استک
.endm

.macro ret
	br	%r14
.endm

.macro call func
	brasl	%r14, \func
.endm

.data
.align 8
rif:	.asciz	"%ld"  # فرمت خواندن عدد طولانی
.pif:	.asciz	"YES\n"  # پیام خروجی YES
.nof:	.asciz	"NO\n"  # پیام خروجی NO

num:    .skip 8  # محل ذخیره عدد ورودی

.text
.global main

main:
	enter	0  # وارد شدن به تابع، ذخیره وضعیت رجیسترها در استک
	
	# خواندن ورودی
	larl	%r1, num           # بارگذاری آدرس متغیر num
	lghi	%r2, 8             # تعیین اندازه ورودی (8 بایت برای یک عدد 64 بیتی)
	lghi	%r0, 0             # تنظیم شماره فراخوانی برای خواندن ورودی
	svc	0x80               # فراخوانی سیستم برای خواندن از ورودی استاندارد
	
	# بررسی اگر عدد n زوج باشد و بزرگتر از 2 باشد
	lghi	%r3, 2  # بارگذاری مقدار 2 در r3
	cgr	%r2, %r3  # مقایسه n با 2
	je		check_even  # اگر n برابر با 2 بود، به check_even برو
	
	# اگر n فرد باشد، جواب "NO"
	larl	%r2, nof  # بارگذاری آدرس NO در %r2
	call	printf  # چاپ خروجی "NO"
	leave	0  # بازگشت از تابع
	xgr	%r2, %r2  # صفر کردن r2
	ret  # بازگشت
	
check_even:
	# اگر n برابر 2 باشد، جواب "NO"
	larl	%r2, nof  # بارگذاری آدرس NO در %r2
	call	printf  # چاپ خروجی "NO"
	leave	0  # بازگشت از تابع
	xgr	%r2, %r2  # صفر کردن r2
	ret  # بازگشت