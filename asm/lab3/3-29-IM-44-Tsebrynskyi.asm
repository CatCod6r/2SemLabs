.386
.model flat, stdcall
option casemap :none

include \masm32\include\masm32rt.inc
include \masm32\include\dialogs.inc

.data
    NazarJunk1 dd 0DEADBEEFh
    NazarStrJunk db "Useless spaghetti string", 0
    NazarPassword db "NAZARAPASSWORD1234", 0
    NazarJunk2 dd 0BAADF00Dh
    
    NazarErrorTitle db "Error", 0
    NazarFakeData db 10, 20, 30, 40, 50
    NazarFillTheField db "Please fill the password field", 0
    
    NazarPasswordIncorrectCase db "Password is incorrect", 0
    NazarJunk3 dq 0FFFFFFFFFFFFFFFFh
    NazarPasswordCorrectCase db "Success. You can have my personal info:", 0
    
    NazarPersonalData db "Tsebrynskyi Nazar", 13,
    "Date of birth: 29.05.2007", 13, 
    "Group: IM-44", 13,
    "Student ID number: 4078", 0

.data?
    NazarInstM dd ?
    NazarJunkBss db 512 dup (?)
    NazarPasswordBuf db 256 dup (?)
    NazarWasteVar dd ?
    
.code
    NazarPassPr PROTO :DWORD,:DWORD,:DWORD,:DWORD
    PasswordWindowNazar PROTO :DWORD,:DWORD

start:
    jmp NazarRealEntry
    
NazarDeadZone1:
    mov eax, 0
    int 3
    
NazarRealEntry:
    pushad
    mov ecx, 42
NazarFakeLoop1:
    xor eax, eax
    add eax, ecx
    dec ecx
    jnz NazarFakeLoop1
    popad

    invoke GetModuleHandle, 0
    mov NazarInstM, eax
    
    push eax
    mov eax, NazarJunk1
    xor eax, 0DEADBEEFh
    pop eax
    
    invoke PasswordWindowNazar, 0, 0
    
    jmp NazarRealExit
    
NazarDeadZone2:
    sub esp, 100h
    add esp, 100h
    
NazarRealExit:
    invoke ExitProcess, eax

PasswordWindowNazar proc NazarResF :DWORD, NazarDaR :DWORD
    LOCAL NazarArr1[4]:DWORD
    LOCAL NazarVK :DWORD
    LOCAL NazarJunkLocal :DWORD

    mov NazarJunkLocal, 0
    
    push ecx
    pop ecx
    xchg eax, eax
    
    jmp NazarSpaghetti1
NazarSpaghetti1_Fake:
    mov ebx, 1
NazarSpaghetti1:

    lea eax, NazarArr1
    mov NazarVK, eax

    push edx
    mov edx, NazarJunk2
    bswap edx
    pop edx

    mov ecx, NazarResF
    mov [eax], ecx
    
    mov ecx, NazarDaR
    mov [eax+4], ecx

    pushfd
    popfd

    Dialog "Lab 3 by Tsebrynskyi Nazar", \
           "Times New Roman Bold", 10, \
            WS_OVERLAPPED or \
            WS_SYSMENU or DS_CENTER, \
            5, \
            55, 55, 300, 90, \
            2048

    DlgGroup  0, 30, 10, 230, 30, 300
    
    push eax
    xor eax, eax
    pop eax
    
    DlgStatic "Enter the password:", SS_CENTER, 94, 8, 100, 10, 400
    DlgEdit   ES_LEFT or WS_TABSTOP, 38, 22, 212, 11, 301
    
    nop
    nop
    
    DlgButton "Submit", WS_TABSTOP, 20, 52, 50, 13, IDOK
    DlgButton "Cancel", WS_TABSTOP, 222, 52, 50, 13, IDCANCEL

    mov eax, NazarJunkLocal
    inc eax
    mov NazarJunkLocal, eax

    CallModalDialog NazarInstM, 0, NazarPassPr, NazarVK

    ret
PasswordWindowNazar endp

NazarPassPr proc NazarWinHandler :DWORD, NazarEntrPass :DWORD, NazarWSI :DWORD, NazarAddWInf :DWORD
    LOCAL NazarPasswordLength :DWORD
    LOCAL NazarTrashVar :DWORD

    mov NazarTrashVar, 1337h
    
    jmp NazarCheckSwitch
NazarFakeSwitch:
    mov eax, NazarTrashVar
    add eax, 1
NazarCheckSwitch:

    switch NazarEntrPass
        
        case WM_INITDIALOG
            push ebx
            mov ebx, NazarJunk1
            cmp ebx, 0
            pop ebx
            xor eax, eax
            ret

        case WM_COMMAND
            
            jmp NazarDeepSpaghetti1
        NazarDeepSpaghetti1_Dead:
            nop
            nop
        NazarDeepSpaghetti1:
        
            switch NazarWSI
                
                case IDOK
                    jmp NazarActualOk
                NazarFakeOk:
                    mov eax, 0
                NazarActualOk:
                
                    mov NazarPasswordLength, rv( GetWindowTextLength, rv(GetDlgItem, NazarWinHandler, 301) )
                    
                    mov edx, NazarTrashVar
                    shl edx, 1
                    shr edx, 1
                    
                    .IF NazarPasswordLength == 0
                        jmp NazarEmptyField
                    NazarEmptyField_Fake:
                        int 3
                    NazarEmptyField:
                        fn MessageBox, 0, addr NazarFillTheField, addr NazarErrorTitle, MB_ICONERROR
                        
                    .ELSE
                        inc NazarPasswordLength
                        
                        push ecx
                        mov ecx, 5
                    NazarWasteLoop:
                        dec ecx
                        jnz NazarWasteLoop
                        pop ecx
                        
                        invoke GetDlgItem, NazarWinHandler, 301
                        invoke GetWindowText, eax, addr NazarPasswordBuf, NazarPasswordLength
                        
                        push eax
                        mov eax, NazarJunk1
                        xor eax, NazarJunk2
                        pop eax
                        
                        invoke lstrcmp, addr NazarPasswordBuf, addr NazarPassword
                        
                        .IF ZERO?
                            jmp NazarCorrectPass
                        NazarCorrectPassFake:
                            nop
                        NazarCorrectPass:
                            fn MessageBox, 0, addr NazarPersonalData, addr NazarPasswordCorrectCase, MB_OK
                        .ELSE
                            jmp NazarIncorrectPass
                        NazarIncorrectPassFake:
                            xor eax, eax
                        NazarIncorrectPass:
                            fn MessageBox, 0, addr NazarPasswordIncorrectCase, addr NazarErrorTitle, MB_ICONERROR
                        .ENDIF
                        
                        mov eax, NazarTrashVar
                        sub eax, 1337h
                        
                        invoke EndDialog, NazarWinHandler, 0
                        
                    .ENDIF
                    
                case IDCANCEL
                    
                    push eax
                    pop eax
                    
                    invoke EndDialog, NazarWinHandler, 0
                    
            endsw
            
        case WM_CLOSE
            
            jmp NazarCloseSpaghetti
        NazarCloseSpaghettiFake:
            mov edx, 1
        NazarCloseSpaghetti:
            
            invoke EndDialog, NazarWinHandler, 0
            
    endsw

    mov eax, NazarTrashVar
    xor eax, 1337h
    xor eax, eax
    ret
    
NazarPassPr endp

end start