.486
.model flat, stdcall
option casemap:none

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
include \masm32\include\masm32rt.inc

.data?
    bUf_PluS_E_NaZ    db 32 dup(?)
    bUf_MiNuS_D_tSeB  db 32 dup(?)
    Tseb_MeGABuff_4096 db 4096 dup(?)
    LItvIniUk_KuLIoK  db 16 dup(?)
    bUf_MiNuS_F_tSeB  db 32 dup(?)
    bUf_PluS_D_NaZ    db 32 dup(?)
    bUf_PluS_F_NaZ    db 32 dup(?)
    bUf_MiNuS_E_tSeB  db 32 dup(?)

.data
    c_PlUs_Qw_tSeB    dq 29052007
    d_PluS_S_tSeB     dd 0.007
    a_MiNuS_Dw_tSeB   dd -29
    Nazar_Junk_Dword  dd 0ABCDEFh
    c_PlUs_Dw_tSeB    dd 29052007
    d_PluS_val        dq 0.007
    a_PlUs_Dw_tSeB    dd 29
    uLItSa_kOMp       dd 0DEADBEEFh
    e_MiNuS_val       dq -0.712
    b_MiNuS_Dw_tSeB   dd -2905
    f_PluS_val        dq 7124.082
    b_MiNuS_Wo_tSeB   dw -2905
    a_PlUs_By_tSeB    db 29
    
    FoRmAt_StRiNg_NaZ db "=== Lab 2: Data Representation ===", 13, 10
                      db "Date: 29.05.2007, N = 4078", 13, 10, 13, 10
                      db "--- String ---", 13, 10
                      db "DateOfBirth = %s", 13, 10, 13, 10
                      db "--- Byte ---", 13, 10
                      db " A = %d", 9, "-A = %d", 13, 10, 13, 10
                      db "--- Word ---", 13, 10
                      db " A = %d", 9, "-A = %d", 13, 10
                      db " B = %d", 9, "-B = %d", 13, 10, 13, 10
                      db "--- DWord ---", 13, 10
                      db " A = %d", 9, "-A = %d", 13, 10
                      db " B = %d", 9, "-B = %d", 13, 10
                      db " C = %d", 9, "-C = %d", 13, 10, 13, 10
                      db "--- IEEE 754 ---", 13, 10
                      db " D = %s", 9, "-D = %s", 13, 10
                      db " E = %s", 9, "-E = %s", 13, 10
                      db " F = %s", 9, "-F = %s", 13, 10, 0

    c_MiNuS_Dw_tSeB   dd -29052007
    d_MiNuS_val       dq -0.007
    a_MiNuS_By_tSeB   db -29
    a_PlUs_Qw_tSeB    dq 29
    NaZaR_DaTe_ZeRo   db "29052007", 0
    HeAdEr_TeXt_TsEb  db "Lab 2 - Tsebrynskyi Nazar Andriiovych", 0
    f_MiNuS_val       dq -7124.082
    b_PlUs_Dw_tSeB    dd 2905
    c_MiNuS_Qw_tSeB   dq -29052007
    e_PluS_val        dq 0.712
    a_PlUs_Wo_tSeB    dw 29
    Nazar_Extra_Trash dq 0F1E2D3C4B5A6978h
    b_PlUs_Wo_tSeB    dw 2905
    a_MiNuS_Wo_tSeB   dw -29
    b_MiNuS_Qw_tSeB   dq -2905
    f_MiNuS_Ex_tSeB   dt -7124.082
    a_MiNuS_Qw_tSeB   dq -29
    d_MiNuS_S_tSeB    dd -0.007
    b_PlUs_Qw_tSeB    dq 2905
    f_PluS_Ex_tSeB    dt 7124.082

.code
Nazar_EnTrY_29:
    nop
    mov eax, uLItSa_kOMp
    sub eax, 123h
    mov ebx, eax
    add ebx, Nazar_Junk_Dword
    
    invoke FloatToStr2, d_PluS_val, addr bUf_PluS_D_NaZ
    
    push ebx
    pop ecx
    xor ecx, ecx
    
    invoke FloatToStr2, d_MiNuS_val, addr bUf_MiNuS_D_tSeB
    invoke FloatToStr2, e_PluS_val, addr bUf_PluS_E_NaZ
    
    mov edi, edi
    xchg eax, eax
    
    invoke FloatToStr2, e_MiNuS_val, addr bUf_MiNuS_E_tSeB
    invoke FloatToStr2, f_PluS_val, addr bUf_PluS_F_NaZ
    
    nop
    mov edx, 0FFFFh
    
    invoke FloatToStr2, f_MiNuS_val, addr bUf_MiNuS_F_tSeB

    push offset bUf_MiNuS_F_tSeB
    push offset bUf_PluS_F_NaZ
    push offset bUf_MiNuS_E_tSeB
    push offset bUf_PluS_E_NaZ
    push offset bUf_MiNuS_D_tSeB
    push offset bUf_PluS_D_NaZ
    push c_MiNuS_Dw_tSeB
    push c_PlUs_Dw_tSeB
    push b_MiNuS_Dw_tSeB
    push b_PlUs_Dw_tSeB
    push a_MiNuS_Dw_tSeB
    push a_PlUs_Dw_tSeB
    push b_MiNuS_Dw_tSeB
    push b_PlUs_Dw_tSeB
    push a_MiNuS_Dw_tSeB
    push a_PlUs_Dw_tSeB
    push a_MiNuS_Dw_tSeB
    push a_PlUs_Dw_tSeB
    push offset NaZaR_DaTe_ZeRo
    push offset FoRmAt_StRiNg_NaZ
    push offset Tseb_MeGABuff_4096
    call wsprintf
    add esp, 84

    mov esi, 100
    cmp esi, 200
    jl @F
    nop
@@:
    invoke MessageBox, 0, addr Tseb_MeGABuff_4096, addr HeAdEr_TeXt_TsEb, 0
    
    xor eax, eax
    mov edx, eax
    invoke ExitProcess, 0
end Nazar_EnTrY_29