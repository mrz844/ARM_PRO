ASM_NAME = sample1
OBJS = $(ASM_NAME).o main.o
OUTPUT_NAME = exec

# تنظیمات مخصوص معماری ARM64
CC = clang
AS = as
CFLAGS = -target aarch64-linux-gnu -c
LDFLAGS = -target aarch64-linux-gnu

# ساخت پروژه
build: $(OUTPUT_NAME)

clean:
		rm -f $(OUTPUT_NAME) *.o

run: $(OUTPUT_NAME)
		./$(OUTPUT_NAME)

$(OUTPUT_NAME): $(OBJS)
		$(CC) -o $(OUTPUT_NAME) $(OBJS) $(LDFLAGS)

%.o: %.s
		$(AS) -o $@ $<

%.o: %.c
		$(CC) $(CFLAGS) -o $@ $<

# افزودن و پوش کردن تغییرات به Git
push:
		@git add .
		@git commit -m "Auto-commit from Makefile"
		@git push

pull:
		@git pull