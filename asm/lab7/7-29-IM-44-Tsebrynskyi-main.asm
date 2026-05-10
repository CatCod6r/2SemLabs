.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

; Оголошення зовнішньої процедури
EXTRN CalcVariant29:PROC

.data
    ; Масиви даних (DD - одинарна точність, 4 байти)
    A_array DD 1.25, 5.45, 1.15, 5.25, 1.25, 1.25
    B_array DD 1.15, -3.15, -4.12, 2.45, -2.50, 1.15
    C_array DD 2.15, -2.12, 3.35, -1.35, 2.15, 2.15
    D_array DD 1.33, -1.45, 2.15, 1.12, 1.33, 4.33

    fmt_ok db "Formula: R = (sqrt(7 - 2d) + 3c - a) / (2b + 5)", 13, 10
           db "Variables: a=%.2f, b=%.2f, c=%.2f, d=%.2f", 13, 10
           db "Final Result: %.10f", 0

    fmt_err1 db "Error: ODZ! Division by zero.", 0
    fmt_err2 db "Error: ODZ! Sqrt of negative number.", 0
    title_msg db "Lab 7 - 29 - IM-44 - Tsebrynskyi", 0

.data?
    buffer db 512 dup(?)
    final_res DD ?
    err_code DD ?

.code
start:
    finit
    xor esi, esi
    mov edi, 6 ; 6 ітерацій циклу

main_loop:
    ; Передача параметрів через стек (4 байти кожен)
    mov eax, [D_array + esi]
    push eax
    mov eax, [C_array + esi]
    push eax
    mov eax, [B_array + esi]
    push eax
    mov eax, [A_array + esi]
    push eax

    ; Виклик процедури
    call CalcVariant29
    
    ; Процедура повертає:
    ; EAX = код помилки (0 - ОК, 1 - Ділення на 0, 2 - Корінь з від'ємного)
    ; Результат зберігається в ST(0) (якщо EAX == 0)
    
    cmp eax, 1
    je print_err1
    cmp eax, 2
    je print_err2

    ; Якщо все ОК, зберігаємо результат зі стеку FPU
    fstp final_res

    ; Вивід результату (CRT sprintf)
    fld final_res
    sub esp, 8
    fstp qword ptr [esp]
    
    fld [D_array + esi]
    sub esp, 8
    fstp qword ptr [esp]
    
    fld [C_array + esi]
    sub esp, 8
    fstp qword ptr [esp]
    
    fld [B_array + esi]
    sub esp, 8
    fstp qword ptr [esp]
    
    fld [A_array + esi]
    sub esp, 8
    fstp qword ptr [esp]

    push offset fmt_ok
    push offset buffer
    call crt_sprintf
    add esp, 48

    invoke MessageBox, 0, addr buffer, addr title_msg, MB_OK
    jmp next_iter

print_err1:
    invoke MessageBox, 0, addr fmt_err1, addr title_msg, MB_ICONERROR
    jmp next_iter

print_err2:
    invoke MessageBox, 0, addr fmt_err2, addr title_msg, MB_ICONERROR

next_iter:
    add esi, 4 ; Крок масиву для DD (4 байти)
    dec edi
    jnz main_loop

    invoke ExitProcess, 0
end start
