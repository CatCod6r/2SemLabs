.386
.model flat, stdcall
option casemap :none

include \masm32\include\masm32rt.inc
include \masm32\include\dialogs.inc

.data
    TsEbRInSkYi_v_ShKaFu_4078   dd 0DEADBEEFh
    pAdIeZd_v_iNfU_29           dq 0FFFFFFFFFFFFFFFFh
    kOlEsO_Ot_vElIkA_IM44       dd 1337h

    NazarPassword               db "NAZARAPASSWORD1234", 0
    NazarErrorTitle             db "Error", 0
    NazarFillTheField           db "Please fill the password field", 0

    vK5_pRiZrAk_v_KeDe_4078     dd 0BAADF00Dh
    sHlYaPa_v_TuMaNi_IM44       dd 0CAFEBABEh

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

.code
    NazarPassPr PROTO :DWORD, :DWORD, :DWORD, :DWORD
    PasswordWindowNazar PROTO :DWORD, :DWORD

start:
    jmp vL_MeGa_InIt_29

vL_ReAl_StArT:
    invoke GetModuleHandle, 0
    mov ebx, eax
    push ebx
    pop ecx
    mov edx, ecx
    mov NazarInstM, edx

    invoke PasswordWindowNazar, 0, 0
    invoke ExitProcess, eax

vL_MeGa_InIt_29:
    push ebx
    mov ebx, kOlEsO_Ot_vElIkA_IM44
    not ebx
    add ebx, 123h
    xor ebx, ebx
    pop ebx
    jmp vL_ReAl_StArT

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
    jne vF_ExIt_4078

    mov eax, vWp
    cmp eax, IDOK
    jne vL_CaNcEl_ChEk

    invoke GetDlgItemText, vHnd, 301, addr NazarPasswordBuf, sizeof NazarPasswordBuf
    invoke lstrlen, addr NazarPasswordBuf
    mov vLen, eax

    test eax, eax
    jnz vL_CoMpArE_29

    invoke MessageBox, 0, addr NazarFillTheField, addr NazarErrorTitle, MB_ICONERROR
    jmp vF_ExIt_4078

vL_CoMpArE_29:
    invoke lstrcmp, addr NazarPasswordBuf, addr NazarPassword
    test eax, eax
    jnz vL_ErRoR_ShOw

    invoke MessageBox, 0, addr NazarPersonalData, addr NazarPasswordCorrectCase, MB_OK
    jmp vL_ClOsE_Me

vL_ErRoR_ShOw:
    invoke MessageBox, 0, addr NazarPasswordIncorrectCase, addr NazarErrorTitle, MB_ICONERROR

vL_ClOsE_Me:
    invoke EndDialog, vHnd, 0
    jmp vF_ExIt_4078

vL_CaNcEl_ChEk:
    cmp eax, IDCANCEL
    jne vF_ExIt_4078
    invoke EndDialog, vHnd, 0

vF_ExIt_4078:
    xor eax, eax
    ret
NazarPassPr ENDP

end start
