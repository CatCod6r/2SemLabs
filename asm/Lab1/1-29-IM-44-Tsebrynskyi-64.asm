optoption casemap:none
include \masm64\include\win64.inc
include \masm64\include\kernel32.inc
include \masm64\include\user32.inc
includelib \masm64\lib\kernel32.lib
includelib \masm64\lib\user32.lib

.data
    Tsebrynskyi_Title_x64 db "Lab 1 MASM64 - Var 29", 0
    Tsebrynskyi_Data_x64 db "Student: Tsebrynskyi Nazar Andriiovych", 13, 10
                         db "Born: 29.05.2007", 13, 10
                         db "Group: IM-44 (64-bit version)", 0
    Nazar_Stack_Align dq 0

.code
Main_Tsebrynskyi_x64 proc
    sub rsp, 28h

    mov rcx, 0
    lea rdx, Tsebrynskyi_Data_x64
    lea r8, Tsebrynskyi_Title_x64
    mov r9, MB_OK or MB_ICONINFORMATION
    call MessageBoxA

    mov rcx, 0
    call ExitProcess
Main_Tsebrynskyi_x64 endp
end
