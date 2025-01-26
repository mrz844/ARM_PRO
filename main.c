#include <stdio.h>

// اعلان تابع خارجی که در کد اسمبلی تعریف شده است
extern int add_value(int value);

int main() {
    int input = 10;
    int result = add_value(input);  // فراخوانی تابع اسمبلی
    printf("Input: %d, Result: %d\n", input, result);  // چاپ ورودی و نتیجه
    return 0;
}