.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data
    v_a_r1 real8 1.25, 5.45, 1.15, 5.25, 1.25, 1.25
    v_b_r2 real8 1.15, -3.15, -4.12, 2.45, -2.50, 1.15
    v_c_r3 real8 2.15, -2.12, 3.35, -1.35, 2.15, 2.15
    v_d_r4 real8 1.33, -1.45, 2.15, 1.12, 1.33, 4.33

    c_z real8 0.0
    c_2 real8 2.0
    c_3 real8 3.0
    c_5 real8 5.0
    c_7 real8 7.0

    f_p_ok db "Formula: R = (sqrt(7 - 2*d) + 3*c - a) / (2*b + 5)", 13, 10
           db "Variables: a=%.2f, b=%.2f, c=%.2f, d=%.2f", 13, 10
           db "Numerator: %.5f", 13, 10
           db "Denominator: %.5f", 13, 10
           db "Final Result: %.10f", 0

    f_e_1 db "Formula: R = (sqrt(7 - 2*d) + 3*c - a) / (2*b + 5)", 13, 10
          db "Variables: a=%.2f, b=%.2f, c=%.2f, d=%.2f", 13, 10
          db "Error: ODZ Violation! Denominator is equal to zero.", 0

    f_e_2 db "Formula: R = (sqrt(7 - 2*d) + 3*c - a) / (2*b + 5)", 13, 10
          db "Variables: a=%.2f, b=%.2f, c=%.2f, d=%.2f", 13, 10
          db "Error: ODZ Violation! Square root of negative number (7 - 2*d < 0).", 0

    t_w db "Lab 6 - Tsebrynskyi Nazar - Var 29", 0

.data?
    b_f_b db 512 dup(?)
    m_1 real8 ?
    m_2 real8 ?
    m_3 real8 ?

.code
start:
    jmp lb_0x1A

lb_0x9C:
    fld m_1
    fdiv m_2
    fstp m_3
    jmp lb_0x2B

lb_0x5F:
    push dword ptr v_d_r4[esi+4]
    push dword ptr v_d_r4[esi]
    push dword ptr v_c_r3[esi+4]
    push dword ptr v_c_r3[esi]
    push dword ptr v_b_r2[esi+4]
    push dword ptr v_b_r2[esi]
    push dword ptr v_a_r1[esi+4]
    push dword ptr v_a_r1[esi]
    push offset f_e_1
    push offset b_f_b
    call crt_sprintf
    add esp, 40
    invoke MessageBox, 0, addr b_f_b, addr t_w, 30h
    jmp lb_0x3E

lb_0x4D:
    fstp st(0)
    push dword ptr v_d_r4[esi+4]
    push dword ptr v_d_r4[esi]
    push dword ptr v_c_r3[esi+4]
    push dword ptr v_c_r3[esi]
    push dword ptr v_b_r2[esi+4]
    push dword ptr v_b_r2[esi]
    push dword ptr v_a_r1[esi+4]
    push dword ptr v_a_r1[esi]
    push offset f_e_2
    push offset b_f_b
    call crt_sprintf
    add esp, 40
    invoke MessageBox, 0, addr b_f_b, addr t_w, 30h
    jmp lb_0x3E

lb_0x1A:
    finit
    xor esi, esi
    mov edi, 6
    jmp lb_0x8B

lb_0x2B:
    push dword ptr m_3[4]
    push dword ptr m_3[0]
    push dword ptr m_2[4]
    push dword ptr m_2[0]
    push dword ptr m_1[4]
    push dword ptr m_1[0]
    push dword ptr v_d_r4[esi+4]
    push dword ptr v_d_r4[esi]
    push dword ptr v_c_r3[esi+4]
    push dword ptr v_c_r3[esi]
    push dword ptr v_b_r2[esi+4]
    push dword ptr v_b_r2[esi]
    push dword ptr v_a_r1[esi+4]
    push dword ptr v_a_r1[esi]
    push offset f_p_ok
    push offset b_f_b
    call crt_sprintf
    add esp, 64
    invoke MessageBox, 0, addr b_f_b, addr t_w, 0
    jmp lb_0x3E

lb_0x7A:
    fld c_7
    fld c_2
    fmul v_d_r4[esi]
    fsubp st(1), st(0)
    fld st(0)
    fcomp c_z
    fstsw ax
    sahf
    jb lb_0x4D
    fsqrt
    fld c_3
    fmul v_c_r3[esi]
    faddp st(1), st(0)
    fsub v_a_r1[esi]
    fstp m_1
    jmp lb_0x9C

lb_0x8B:
    fld v_b_r2[esi]
    fmul c_2
    fadd c_5
    fst m_2
    fcomp c_z
    fstsw ax
    sahf
    je lb_0x5F
    jmp lb_0x7A

lb_0x3E:
    add esi, 8
    dec edi
    jnz lb_0x8B
    invoke ExitProcess, 0

end start
