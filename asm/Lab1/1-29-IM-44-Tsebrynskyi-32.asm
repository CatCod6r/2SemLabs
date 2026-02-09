.486
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data
    Tsebrynskyi_Main_Title db "Lab 1, Var 29, IM-44", 0
    Tsebrynskyi_Info_Message db "Student: Tsebrynskyi Nazar Andriiovych", 13, 10
                             db "Date of birth: 29.05.2007", 13, 10
                             db "Group: IM-44", 0
    Nazar_Empty_Value dd 0
    Nazar_System_Trash dd 0FFFFh

.code
Nazar_Start_Proc:
    nop
    push Nazar_Empty_Value
    pop eax
    
    invoke MessageBox, 0, addr Tsebrynskyi_Info_Message, addr Tsebrynskyi_Main_Title, MB_OK or MB_ICONINFORMATION
    
    mov ecx, Nazar_System_Trash
    xor edx, edx
    
    invoke ExitProcess, 0
end Nazar_Start_Proc