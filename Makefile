ASM_NAME = sample1
OBJS = $(ASM_NAME).o main.o
OUTPUT_NAME = exec

# تنظیمات مخصوص معماری ARM64
CC = clang
AS = clang  # استفاده از clang برای کامپایل اسمبلی
CFLAGS = -target aarch64-linux-gnu -c
LDFLAGS = -target aarch64-linux-gnu

# ساخت پروژه
build: $(OUTPUT_NAME)

# پاکسازی فایل‌های موقت
clean:
	rm -f $(OUTPUT_NAME) *.o

# اجرای برنامه
run: $(OUTPUT_NAME)
	./$(OUTPUT_NAME)

# لینک فایل‌های شیء و ساخت فایل اجرایی
$(OUTPUT_NAME): $(OBJS)
	$(CC) -o $(OUTPUT_NAME) $(OBJS) $(LDFLAGS)

# کامپایل اسمبلی به فایل شیء
%.o: %.s
	$(CC) -target aarch64-linux-gnu -c $< -o $@

# کامپایل C به فایل شیء
%.o: %.c
	$(CC) $(CFLAGS) -o $@ $<

# افزودن و پوش کردن تغییرات به Git
push:
	@git add .
	@git commit -m "Auto-commit from Makefile"
	@git push

pull:
	@git pull