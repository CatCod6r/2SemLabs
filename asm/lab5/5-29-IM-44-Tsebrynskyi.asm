.386
.model flat, stdcall
option casemap :none

; Підключення бібліотек без жорсткої прив'язки до логічного диску (вимоги базового переліку)
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.data
    ; Масиви вхідних даних (5 наборів). Включено додатні, від'ємні та нульові значення
    ; Набір 1: Звичайні додатні числа (знаменник = 6, чисельник = 20, рез = 3 -> непарне)
    ; Набір 2: Від'ємні числа (знаменник = 1, чисельник = -10, рез = -10 -> парне)
    ; Набір 3: Штучна помилка (d = 0)
    ; Набір 4: Штучна помилка знаменника (2*(-1) - 4/4 + 3 = 0)
    ; Набір 5: Звичайні числа (парний первісний результат)
    arr_a dd 2, -2, 1, -1, 5
    arr_b dd 4, -8, 4,  4, 20
    arr_c dd 10, -10, 5, 10, 40
    arr_d dd 2,  2, 0,  2, 4

    ; Формат виводу при успішному розрахунку (Формула, змінні, первісний та кінцевий результати)
    fmt_ok db "Formula: (5+3*c/d)/(2*a-b/4+3)", 13, 10
           db "Variables: a=%d, b=%d, c=%d, d=%d", 13, 10
           db "Initial result: %d", 13, 10
           db "Final result: %d", 0

    ; Формат виводу при порушенні ОДЗ / діленні на 0
    fmt_err db "Formula: (5+3*c/d)/(2*a-b/4+3)", 13, 10
            db "Variables: a=%d, b=%d, c=%d, d=%d", 13, 10
            db "Error: Calculation is impossible (Division by zero!)", 0

    capt db "Lab 5 - Var 29", 0
    
.data?
    buf db 256 dup(?)
    init_res dd ?

.code
start:
    xor esi, esi       ; esi = зсув байтів для масиву (0, 4, 8, 12, 16)
    mov edi, 5         ; edi = лічильник циклу (5 ітерацій)

main_loop:
    ; Перевірка на ділення на 0 (якщо d == 0)
    cmp arr_d[esi], 0
    je error_div_zero

    ; 1. Обчислення знаменника: 2*a - b/4 + 3
    mov eax, arr_b[esi]
    cdq
    mov ecx, 4
    idiv ecx           ; eax = b / 4
    mov ebx, eax       ; ebx = b / 4

    mov eax, arr_a[esi]
    imul eax, 2        ; eax = 2 * a
    sub eax, ebx       ; eax = 2*a - b/4
    add eax, 3         ; eax = 2*a - b/4 + 3
    mov ebx, eax       ; ebx = знаменник

    ; Перевірка знаменника на 0 (ОДЗ)
    cmp ebx, 0
    je error_div_zero

    ; 2. Обчислення чисельника: 5 + 3*c / d
    mov eax, arr_c[esi]
    imul eax, 3        ; eax = 3 * c
    cdq
    mov ecx, arr_d[esi]
    idiv ecx           ; eax = 3*c / d
    add eax, 5         ; eax = чисельник

    ; 3. Фінальне ділення виразу: чисельник / знаменник
    cdq
    idiv ebx           ; eax = первісний результат
    mov init_res, eax  ; зберігаємо первісний результат до корегування

    ; 4. Перевірка на парність/непарність
    mov ecx, eax
    test ecx, 1
    jnz odd_value

    ; Якщо парне: ділимо на 2
    cdq
    mov ebx, 2
    idiv ebx
    jmp show_ok

odd_value:
    ; Якщо непарне: множимо на 5
    imul eax, 5

show_ok:
    ; Формування вікна при успішному результаті
    invoke wsprintf, addr buf, addr fmt_ok, arr_a[esi], arr_b[esi], arr_c[esi], arr_d[esi], init_res, eax
    invoke MessageBox, 0, addr buf, addr capt, MB_OK
    jmp next_iter

error_div_zero:
    ; Формування вікна з поясненням помилки ОДЗ
    invoke wsprintf, addr buf, addr fmt_err, arr_a[esi], arr_b[esi], arr_c[esi], arr_d[esi]
    invoke MessageBox, 0, addr buf, addr capt, MB_ICONWARNING

next_iter:
    ; Перехід до наступного елемента масивів
    add esi, 4
    dec edi            ; зменшення лічильника
    jnz main_loop      ; якщо не 0, повторюємо цикл

    invoke ExitProcess, 0
end start