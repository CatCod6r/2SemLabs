.386
.model flat, stdcall
option casemap :none

include \masm32\include\masm32rt.inc
include \masm32\include\dialogs.inc

.data
    NazarPassword db "NAZARAPASSWORD1234", 0
	
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

NazarPassPr proc NazarWinHandler :DWORD, NazarEntrPass :DWORD, NazarWSI :DWORD, NazarAddWInf :DWORD
    LOCAL NazarPasswordLength :DWORD

    switch NazarEntrPass
	
        case WM_INITDIALOG
            xor eax, eax
            ret

        case WM_COMMAND
            switch NazarWSI
			
                case IDOK
                    mov NazarPasswordLength, rv( GetWindowTextLength, rv(GetDlgItem, NazarWinHandler, 301) )
					
                    .IF NazarPasswordLength == 0
                        fn MessageBox, 0, addr NazarFillTheField, addr NazarErrorTitle, MB_ICONERROR
						
                    .ELSE
                        inc NazarPasswordLength
						
                        invoke GetDlgItem, NazarWinHandler, 301
                        invoke GetWindowText, eax, addr NazarPasswordBuf, NazarPasswordLength
                        invoke lstrcmp, addr NazarPasswordBuf, addr NazarPassword
						
                        .IF ZERO?
                            fn MessageBox, 0, addr NazarPersonalData, addr NazarPasswordCorrectCase, MB_OK
                        .ELSE
                            fn MessageBox, 0, addr NazarPasswordIncorrectCase, addr NazarErrorTitle, MB_ICONERROR
                        .ENDIF
						
                        invoke EndDialog, NazarWinHandler, 0
						
                    .ENDIF
					
                case IDCANCEL
                    invoke EndDialog, NazarWinHandler, 0
					
            endsw
			
        case WM_CLOSE
            invoke EndDialog, NazarWinHandler, 0
			
    endsw

    xor eax, eax
    ret
	
NazarPassPr endp

end start