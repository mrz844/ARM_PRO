ASM_NAME= sample1
OBJS= $(ASM_NAME).o main.o
OUTPUT_NAME= exec

# ساخت پروژه
build: $(OUTPUT_NAME).exe

# پاکسازی فایل‌های موقت
clean:
	@del /f $(OUTPUT_NAME).exe *.o 2>nul || true

# اجرای برنامه
run: $(OUTPUT_NAME).exe
	@.\$(OUTPUT_NAME).exe

# لینک فایل‌های شیء و ساخت فایل اجرایی
$(OUTPUT_NAME).exe: $(OBJS)
	@gcc -o $(OUTPUT_NAME).exe $(OBJS)

# کامپایل اسمبلی به فایل شیء
%.o: %.s
	@nasm -f win64 $< -o $@

# کامپایل C به فایل شیء
%.o: %.c
	@gcc -c $< -o $@