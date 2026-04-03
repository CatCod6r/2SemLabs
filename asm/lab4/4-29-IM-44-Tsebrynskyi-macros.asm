include \masm32\include\masm32rt.inc
include \masm32\include\dialogs.inc

;; INCLUDE EXTERNAL MACROS (Requirement of point 8)
include 4-29-IM-44-Tsebrynskyi-macros.inc

.data
    ; Data for decryption
    NazarEncryptedPassword       db 1Ah, 32h, 3Fh, 23h, 20h, 38h, 3Eh, 32h, 38h, 2Ah, 3Eh, 7Bh, 62h, 73h, 09h, 66h, 40h, 51h, 0
    NazarKey                     db "Tsebrynskyi4078", 0

    ; Titles and error messages
    NazarErrorTitle              db "Error", 0
    NazarFillTheField            db "Please fill the password field", 0
    NazarPasswordIncorrectCase   db "Password is incorrect", 0
    NazarSuccessTitle            db "Personal Info", 0

    ; Personal info strings
    NazarName                    db "Name: Tsebrynskyi Nazar", 0
    NazarBirth                   db "Date of birth: 29.05.2007", 0
    NazarGroup                   db "Group: IM-44", 0
    NazarID                      db "Student ID: 4078", 0

.data?
    NazarInstM                   dd ?
    NazarPasswordBuf             db 256 dup (?)
    DecryptedNazarPasswordBuf    db 256 dup (?)

.code
    NazarPassPr PROTO :DWORD, :DWORD, :DWORD, :DWORD
    PasswordWindowNazar PROTO :DWORD, :DWORD

start:
    invoke GetModuleHandle, 0
    mov NazarInstM, eax
    invoke PasswordWindowNazar, 0, 0
    invoke ExitProcess, eax

; --- Dialog UI Procedure ---
PasswordWindowNazar proc vResF:DWORD, vDaR:DWORD
    Dialog "Lab 4 by Tsebrynskyi Nazar", "Times New Roman Bold", 10, \
           WS_OVERLAPPED or WS_SYSMENU or DS_CENTER, 5, 55, 55, 300, 90, 2048
    DlgGroup  0, 30, 10, 230, 30, 300
    DlgStatic "Enter the password:", SS_CENTER, 94, 8, 100, 10, 400
    DlgEdit   ES_LEFT or WS_TABSTOP, 38, 22, 212, 11, 301
    DlgButton "Submit", WS_TABSTOP, 20, 52, 50, 13, IDOK
    DlgButton "Cancel", WS_TABSTOP, 222, 52, 50, 13, IDCANCEL
    CallModalDialog NazarInstM, 0, NazarPassPr, 0
    ret
PasswordWindowNazar endp

; --- Event Handler ---
NazarPassPr PROC vHnd:DWORD, vMsg:DWORD, vWp:DWORD, vLp:DWORD
    mov eax, vMsg
    cmp eax, WM_COMMAND
    jne vExit_Pr
    cmp vWp, IDOK
    jne vCheck_Can

    invoke GetDlgItemText, vHnd, 301, addr NazarPasswordBuf, sizeof NazarPasswordBuf
    invoke lstrlen, addr NazarPasswordBuf
    .if eax == 0
        invoke MessageBox, 0, addr NazarFillTheField, addr NazarErrorTitle, MB_ICONERROR
        jmp vExit_Pr
    .endif

    ;; Macro calls
    mXorProcess NazarEncryptedPassword, NazarKey, DecryptedNazarPasswordBuf
    mValidatePassword NazarPasswordBuf, DecryptedNazarPasswordBuf

    invoke EndDialog, vHnd, 0
    jmp vExit_Pr

vCheck_Can:
    cmp vWp, IDCANCEL
    jne vExit_Pr
    invoke EndDialog, vHnd, 0

vExit_Pr:
    xor eax, eax
    ret
NazarPassPr ENDP
end start
