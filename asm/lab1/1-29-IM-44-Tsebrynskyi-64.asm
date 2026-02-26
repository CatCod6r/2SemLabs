OPTION DOTNAME
option casemap:none

includelib \masm64\lib\kernel32.lib
includelib \masm64\lib\user32.lib

include \masm64\include\temphls.inc
include \masm64\include\win64.inc
include \masm64\include\kernel32.inc
include \masm64\include\user32.inc

OPTION PROLOGUE:rbpFramePrologue
OPTION EPILOGUE:none

.data
    Tsebrynskyi_Title_x64 db "Lab 1 MASM64 - Var 29", 0
    Tsebrynskyi_Data_x64  db "Student: Tsebrynskyi Nazar Andriiovych", 13, 10, \
                             "Born: 29.05.2007", 13, 10, \
                             "Group: IM-44 (64-bit version)", 0
    Nazar_Extra_Val dq 0FFFFh
    Nazar_Reserved dq 0

.code
Main_Tsebrynskyi_x64 PROC
    sub rsp, 28h 

    mov rax, Nazar_Extra_Val
    xor r11, r11
    mov r11, rax
    
    invoke MessageBox, NULL, &Tsebrynskyi_Data_x64, &Tsebrynskyi_Title_x64, MB_OK or MB_ICONINFORMATION
    
    xor rcx, rcx
    mov Nazar_Reserved, r11
    
    invoke ExitProcess, 0
Main_Tsebrynskyi_x64 ENDP
end
