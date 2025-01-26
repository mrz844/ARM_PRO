.global add_value
.type add_value, %function

add_value:
    ADD R0, R0, #5    // مقدار ورودی را ۵ واحد افزایش می‌دهد
    BX LR             // بازگشت به تابع فراخوان