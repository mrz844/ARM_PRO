ASM_NAME = sample1
OBJS = $(ASM_NAME).o main.o
OUTPUT_NAME = exec

# ساخت پروژه
build: $(OUTPUT_NAME)

clean:
    rm -f $(OUTPUT_NAME) *.o

run: $(OUTPUT_NAME)
    ./$(OUTPUT_NAME)

$(OUTPUT_NAME): $(OBJS)
    clang -o $(OUTPUT_NAME) $(OBJS)

%.o: %.s
    clang -target aarch64-linux-gnu -c $< -o $@

%.o: %.c
    clang -c -target aarch64-linux-gnu $< -o $@

# افزودن و پوش کردن تغییرات به Git
push:
	@git add .
	@git commit -m "Auto-commit from Makefile"
	@git push

pull:
	@git pull