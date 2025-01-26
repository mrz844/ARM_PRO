#include <stdio.h>

extern int add_value(int value); // اعلان تابع اسمبلی

int main() {
    int input = 10;
    int result = add_value(input); // فراخوانی تابع اسمبلی
    printf("Input: %d, Result: %d\n", input, result);
    return 0;
}