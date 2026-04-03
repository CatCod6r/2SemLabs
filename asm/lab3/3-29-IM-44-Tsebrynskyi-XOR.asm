.386
.model flat, stdcall
option casemap :none

include \masm32\include\masm32rt.inc
include \masm32\include\dialogs.inc

.data
    TsEbRInSkYi_KuLIoK_4078     dd 0DEADBEEFh
    vA1_POdElil_Na_NoL_4078     db 11, 22, 33, 44
    NazarEncryptedPassword       db 1Ah, 32h, 3Fh, 23h, 20h, 38h, 3Eh, 32h, 38h, 2Ah, 3Eh, 7Bh, 62h, 73h, 09h, 66h, 40h, 51h, 0

    TsEbRInSkYi_V_mAsKe_4078    dq 0FFFFFFFFFFFFFFFFh
    NazarKey                    db "Tsebrynskyi4078", 0

    sHlYaPa_v_TuMaNi_IM44       dd 1337h

    NazarErrorTitle             db "Error", 0
    NazarFillTheField           db "Please fill the password field", 0
    vK5_pRiZrAk_v_KeDe_4078     dd 0BAADF00Dh
    NazarPasswordIncorrectCase  db "Password is incorrect", 0
    NazarPasswordCorrectCase    db "Success. You can have my personal info:", 0

    NazarPersonalData           db "Tsebrynskyi Nazar", 13,
                                   "Date of birth: 29.05.2007", 13,
                                   "Group: IM-44", 13,
                                   "Student ID number: 4078", 0

.data?
    NazarInstM                  dd ?
    vM3_DuSt_BuF                db 128 dup (?)
    NazarPasswordBuf            db 256 dup (?)
    DecryptedNazarPasswordBuf   db 256 dup (?)

.code
    NazarPassPr PROTO :DWORD, :DWORD, :DWORD, :DWORD
    PasswordWindowNazar PROTO :DWORD, :DWORD

start:
    jmp vSt_1

vSt_2:
    invoke GetModuleHandle, 0
    mov ebx, eax
    push ebx
    pop ecx
    mov edx, ecx
    mov NazarInstM, edx

    invoke PasswordWindowNazar, 0, 0
    invoke ExitProcess, eax

vSt_1:
    push ebx
    mov ebx, TsEbRInSkYi_KuLIoK_4078
    not ebx
    xor ebx, ebx
    pop ebx
    jmp vSt_2

PasswordWindowNazar proc vResF:DWORD, vDaR:DWORD
    LOCAL vArr1[4]:DWORD
    LOCAL vVK:DWORD

    lea eax, vArr1
    push eax
    pop ecx
    mov vVK, ecx

    mov edx, vResF
    mov ebx, vVK
    mov [ebx], edx

    mov eax, vDaR
    mov ecx, vVK
    mov [ecx+4], eax

    Dialog "Lab 3 by Tsebrynskyi Nazar", \
           "Times New Roman Bold", 10, \
           WS_OVERLAPPED or WS_SYSMENU or DS_CENTER, \
           5, 55, 55, 300, 90, 2048

    DlgGroup  0, 30, 10, 230, 30, 300
    DlgStatic "Enter the password:", SS_CENTER, 94, 8, 100, 10, 400
    DlgEdit   ES_LEFT or WS_TABSTOP, 38, 22, 212, 11, 301
    DlgButton "Submit", WS_TABSTOP, 20, 52, 50, 13, IDOK
    DlgButton "Cancel", WS_TABSTOP, 222, 52, 50, 13, IDCANCEL

    mov eax, NazarInstM
    push eax
    pop edx
    CallModalDialog edx, 0, NazarPassPr, vVK
    ret
PasswordWindowNazar endp

NazarPassPr PROC vHnd:DWORD, vMsg:DWORD, vWp:DWORD, vLp:DWORD
    LOCAL vLen:DWORD

    mov eax, vMsg
    cmp eax, WM_COMMAND
    jne vExit_Pr

    mov eax, vWp
    cmp eax, IDOK
    jne vCheck_Can

    invoke GetDlgItemText, vHnd, 301, addr NazarPasswordBuf, sizeof NazarPasswordBuf
    invoke lstrlen, addr NazarPasswordBuf
    mov vLen, eax

    test eax, eax
    jnz vDo_Dec

    invoke MessageBox, 0, addr NazarFillTheField, addr NazarErrorTitle, MB_ICONERROR
    jmp vExit_Pr

vDo_Dec:
    lea esi, NazarEncryptedPassword
    lea edi, DecryptedNazarPasswordBuf
    lea ebx, NazarKey

vDec_L:
    mov al, [esi]
    test al, al
    jz vDec_E

    push ebx
    pop ecx
    xor al, [ecx]
    stosb

    inc esi
    inc ebx

    cmp byte ptr [ebx], 0
    jnz vDec_L

    lea ebx, NazarKey
    jmp vDec_L

vDec_E:
    mov byte ptr [edi], 0

    invoke lstrcmp, addr NazarPasswordBuf, addr DecryptedNazarPasswordBuf
    test eax, eax
    jnz vBad

    invoke MessageBox, 0, addr NazarPersonalData, addr NazarPasswordCorrectCase, MB_OK
    jmp vClose_D

vBad:
    invoke MessageBox, 0, addr NazarPasswordIncorrectCase, addr NazarErrorTitle, MB_ICONERROR

vClose_D:
    invoke EndDialog, vHnd, 0
    jmp vExit_Pr

vCheck_Can:
    cmp eax, IDCANCEL
    jne vExit_Pr
    invoke EndDialog, vHnd, 0

vExit_Pr:
    xor eax, eax
    ret
NazarPassPr ENDP

end start