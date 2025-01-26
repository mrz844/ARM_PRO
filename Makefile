ASM_NAME= sample1
OBJS= $(ASM_NAME).o main.o
OUTPUT_NAME= exec

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
	clang -o $(OUTPUT_NAME) $(OBJS)

# کامپایل اسمبلی به فایل شیء
%.o: %.s
	as -o $@ $<

# کامپایل C به فایل شیء
%.o: %.c
	clang -c $< -o $@

# افزودن و پوش کردن تغییرات به Git
push:
	@git add .
	@git commit -m "Auto-commit from Makefile"
	@git push

pull:
	@git pull