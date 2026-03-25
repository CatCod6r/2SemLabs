.386
.model flat, stdcall
option casemap :none

include \masm32\include\masm32rt.inc
include \masm32\include\dialogs.inc

.data
    ; Encrypted with key "Tsebrynskyi4078"
    NazarEncryptedPassword db 1Ah, 32h, 3Fh, 23h, 20h, 38h, 3Eh, 32h, 38h, 2Ah, 3Eh, 7Bh, 62h, 73h, 09h, 66h, 40h, 51h, 0
    NazarKey db "Tsebrynskyi4078", 0

    NazarErrorTitle db "Error", 0
    NazarFillTheField db "Please fill the password field", 0

    NazarPasswordIncorrectCase db "Password is incorrect", 0
    NazarPasswordCorrectCase db "Success. You can have my personal info:", 0

    NazarPersonalData db "Tsebrynskyi Nazar", 13,
    "Date of birth: 29.05.2007", 13,
    "Group: IM-44", 13,
    "Student ID number: 4078", 0

.data?
    NazarInstM dd ?
    NazarPasswordBuf db 256 dup (?)
    DecryptedNazarPasswordBuf db 256 dup (?)

.code
    NazarPassPr PROTO :DWORD,:DWORD,:DWORD,:DWORD
    PasswordWindowNazar PROTO :DWORD,:DWORD

start:

PasswordWindowNazar proc NazarResF :DWORD, NazarDaR :DWORD
    LOCAL NazarArr1[4]:DWORD
    LOCAL NazarVK :DWORD

    lea eax, NazarArr1
    mov NazarVK, eax

    mov ecx, NazarResF
    mov [eax], ecx
    
    mov ecx, NazarDaR
    mov [eax+4], ecx

    Dialog "Lab 3 by Tsebrynskyi Nazar", \
           "Times New Roman Bold", 10, \
            WS_OVERLAPPED or \
            WS_SYSMENU or DS_CENTER, \
            5, \
            55, 55, 300, 90, \
            2048

    DlgGroup  0, 30, 10, 230, 30, 300
    
    DlgStatic "Enter the password:", SS_CENTER, 94, 8, 100, 10, 400
    DlgEdit   ES_LEFT or WS_TABSTOP, 38, 22, 212, 11, 301
    
    DlgButton "Submit", WS_TABSTOP, 20, 52, 50, 13, IDOK
    DlgButton "Cancel", WS_TABSTOP, 222, 52, 50, 13, IDCANCEL

    CallModalDialog NazarInstM, 0, NazarPassPr, NazarVK

    ret
PasswordWindowNazar endp

NazarPassPr PROC NazarWinHandler :DWORD, NazarEntrPass :DWORD, NazarWSI :DWORD, NazarAddWInf :DWORD
    LOCAL NazarPasswordLength :DWORD

    .IF NazarEntrPass == WM_COMMAND
    
        .IF NazarWSI == IDOK
            invoke GetDlgItemText, NazarWinHandler, 301, addr NazarPasswordBuf, sizeof NazarPasswordBuf
            invoke lstrlen, addr NazarPasswordBuf
            mov NazarPasswordLength, eax

            .IF NazarPasswordLength == 0
                invoke MessageBox, NULL, addr NazarFillTheField, addr NazarErrorTitle, MB_ICONERROR
            .ELSE

                lea esi, NazarEncryptedPassword
                lea edi, DecryptedNazarPasswordBuf
                lea ebx, NazarKey

            NazarDecryptLoop:
                mov al, [esi]
                test al, al
                jz NazarDecrEnd        ; ???? ?????? ?? ????? ??????????? ?????? - ????????

                xor al, [ebx]
                stosb

                inc esi
                inc ebx

                cmp byte ptr [ebx], 0
                jnz NazarSkipReset     ; ???? ???? ?? ?? ?????????? - ????? ????
                lea ebx, NazarKey      ; ?????? ???????? ????????? ????? ?? ???????

            NazarSkipReset:
                jmp NazarDecryptLoop   ; ????? ?? ???????? ???????? ?????

            NazarDecrEnd:
                mov byte ptr [edi], 0  ; ??????? ????-?????????? ? ????? ?????????????? ?????

                invoke lstrcmp, addr NazarPasswordBuf, addr DecryptedNazarPasswordBuf
                .IF ZERO?
                    invoke MessageBox, NULL, addr NazarPersonalData, addr NazarPasswordCorrectCase, MB_OK
                .ELSE
                    invoke MessageBox, NULL, addr NazarPasswordIncorrectCase, addr NazarErrorTitle, MB_ICONERROR
                .ENDIF

                invoke EndDialog, NazarWinHandler, 0
            .ENDIF
            
        .ENDIF
        
        .IF NazarWSI == IDCANCEL
            invoke EndDialog, NazarWinHandler, 0
        .ENDIF
        
    .ENDIF

    xor eax, eax
    ret

NazarPassPr ENDP

end start