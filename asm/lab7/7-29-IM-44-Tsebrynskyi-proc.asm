.386
.model flat, stdcall
option casemap :none

PUBLIC CalcVariant29

.data
    const_0 DD 0.0
    const_2 DD 2.0
    const_3 DD 3.0
    const_5 DD 5.0
    const_7 DD 7.0

.code
CalcVariant29 PROC
    push ebp
    mov ebp, esp
    
    ; Структура стеку:
    ; [ebp+8]  = A
    ; [ebp+12] = B
    ; [ebp+16] = C
    ; [ebp+20] = D

    ; Перевірка ОДЗ 1: Знаменник (2*b + 5)
    fld dword ptr [ebp+12] ; b
    fmul const_2
    fadd const_5           ; ST(0) = 2b + 5
    
    fcom const_0
    fstsw ax
    sahf
    je err_div_zero        ; Якщо знаменник == 0

    ; Перевірка ОДЗ 2: Підкореневий (7 - 2*d)
    fld const_7
    fld const_2
    fmul dword ptr [ebp+20] ; 2d
    fsubp st(1), st(0)      ; ST(0) = 7 - 2d
    
    fcom const_0
    fstsw ax
    sahf
    jb err_sqrt_neg         ; Якщо (7 - 2d) < 0

    ; Розрахунок чисельника
    fsqrt                   ; sqrt(7 - 2d)
    fld const_3
    fmul dword ptr [ebp+16] ; 3c
    faddp st(1), st(0)      ; sqrt(7-2d) + 3c
    fsub dword ptr [ebp+8]  ; sqrt(7-2d) + 3c - a (Чисельник в ST(0))

    ; Фінальне ділення (в ST(1) лежить знаменник)
    fdivrp st(1), st(0)     ; ST(0) = Чисельник / Знаменник
    
    mov eax, 0              ; Код 0 - Успіх
    jmp proc_exit

err_div_zero:
    fstp st(0)              ; Очищення FPU стеку
    mov eax, 1              ; Код 1 - Ділення на 0
    jmp proc_exit

err_sqrt_neg:
    fstp st(0)              ; Очищення (7-2d)
    fstp st(0)              ; Очищення знаменника
    mov eax, 2              ; Код 2 - Корінь з від'ємного

proc_exit:
    pop ebp
    ret 16                  ; Очищення 16 байт аргументів (4 змінні * 4 байти)
CalcVariant29 ENDP
end
