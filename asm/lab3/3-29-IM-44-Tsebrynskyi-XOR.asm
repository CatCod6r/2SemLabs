.386
.model flat, stdcall
option casemap :none

include \masm32\include\masm32rt.inc
include \masm32\include\dialogs.inc

.data
    NazarEncryptedPassword db 1Ah, 32h, 3Fh, 23h, 20h, 38h, 3Eh, 32h, 38h, 2Ah, 3Eh, 7Bh, 62h, 73h, 09h, 66h, 40h, 51h, 0
    NazarKey db "Tsebrynskyi4078", 0
    NazarErrorTitle db "Error", 0
    NazarFillTheField db "Please fill the password field", 0
    NazarPasswordIncorrectCase db "Password is incorrect", 0
    NazarPasswordCorrectCase db "Success. You can have my personal info:", 0
    NazarPersonalData db "Tsebrynskyi Nazar", 13, "Date of birth: 29.05.2007", 13, "Group: IM-44", 13, "Student ID number: 4078", 0
    
    NazarTrash1 dd 0DEADBEEFh
    NazarTrash2 db "Spaghetti String", 0
    NazarTrash3 dd 0FFFFFFFFh

.data?
    NazarInstM dd ?
    NazarPasswordBuf db 256 dup (?)
    DecryptedNazarPasswordBuf db 256 dup (?)
    NazarJunkBuf db 128 dup (?)

.code
    NazarPassPr PROTO :DWORD,:DWORD,:DWORD,:DWORD
    PasswordWindowNazar PROTO :DWORD,:DWORD

start:
    push eax
    pop eax
    jmp skip_junk1
junk1_deadzone:
    mov eax, 0
    int 3
skip_junk1:
    mov ecx, NazarTrash1
    bswap ecx
    xor ecx, ecx

    invoke GetModuleHandle, NULL
    mov NazarInstM, eax
    
    push ebx
    mov ebx, NazarTrash3
    not ebx
    pop ebx
    
    invoke PasswordWindowNazar, 0, 0
    
    xor edi, edi
    add edi, 1
    dec edi
    
    invoke ExitProcess, eax

PasswordWindowNazar proc NazarResF :DWORD, NazarDaR :DWORD
    LOCAL NazarArr1[4]:DWORD
    LOCAL NazarVK :DWORD

    push ecx
    pop ecx
    nop
    xchg eax, eax

    lea eax, NazarArr1
    mov NazarVK, eax

    mov ecx, NazarResF
    mov [eax], ecx
    
    jmp spag_jump1
spag_jump1_deadzone:
    sub esp, 100h
    add esp, 100h
spag_jump1:

    mov edx, NazarTrash1
    xor edx, edx
    
    mov ecx, NazarDaR
    mov [eax+4], ecx

    pushfd
    popfd

    Dialog "Lab 3 by Tsebrynskyi Nazar XOR", "Times New Roman Bold", 10, WS_OVERLAPPED or WS_SYSMENU or DS_CENTER, 5, 55, 55, 300, 90, 2048

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

    pushad
    popad
    jmp check_cmd
junk_cmd:
    mov eax, 1
    jmp check_cmd
check_cmd:

    .IF NazarEntrPass == WM_COMMAND
        
        mov eax, NazarTrash1
        cmp eax, 0
        je junk_cmd2
        jmp real_check
    junk_cmd2:
        nop
    real_check:

        .IF NazarWSI == IDOK
            invoke GetDlgItemText, NazarWinHandler, 301, addr NazarPasswordBuf, sizeof NazarPasswordBuf
            
            mov edx, edx
            
            invoke lstrlen, addr NazarPasswordBuf
            mov NazarPasswordLength, eax

            .IF NazarPasswordLength == 0
                invoke MessageBox, NULL, addr NazarFillTheField, addr NazarErrorTitle, MB_ICONERROR
            .ELSE

                lea esi, NazarEncryptedPassword
                lea edi, DecryptedNazarPasswordBuf
                
                jmp jump_around1
            jump_around1_fake:
                xor eax, eax
            jump_around1:
                
                lea ebx, NazarKey
                mov ecx, NazarPasswordLength 

                .REPEAT
                    mov al, [esi]
                    
                    push eax
                    pop eax
                    
                    test al, al
                    jz NazarDecrEnd

                    xor al, [ebx]
                    stosb

                    inc esi
                    
                    nop
                    xchg ecx, ecx
                    
                    inc ebx

                    cmp byte ptr [ebx], 0
                    jnz NazarKeyContinue
                    
                    push ebx
                    pop ebx
                    
                    lea ebx, NazarKey

                NazarKeyContinue:
                    dec ecx 
                .UNTIL ebx == 1
                
            NazarDecrEnd:
                mov byte ptr [edi], 0
                
                mov eax, NazarTrash1
                xor eax, 0DEADBEEFh

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