.386
.model flat,stdcall
option casemap:none
include \masm32\include\masm32rt.inc
include \masm32\include\dialogs.inc
.data
vB9mX2z dd 0DEADBEEFh
vK4jL1p db 11,22,33,44
NazarEncryptedPassword db 1Ah,32h,3Fh,23h,20h,38h,3Eh,32h,38h,2Ah,3Eh,7Bh,62h,73h,09h,66h,40h,51h,0
vQ7wE3r dq 0FFFFFFFFFFFFFFFFh
NazarKey db "Tsebrynskyi4078",0
vN5tY8u dd 1337h
NazarErrorTitle db "Error",0
vH2fD9s db 55h,0AAh
NazarFillTheField db "Please fill the password field",0
vC6vG4a dd 0BAADF00Dh
NazarPasswordIncorrectCase db "Password is incorrect",0
vM1xZ7c dd 0
NazarPasswordCorrectCase db "Success. You can have my personal info:",0
vP8L0oK dd 0C0FFEEh
NazarPersonalData db "Tsebrynskyi Nazar",13,"Date of birth: 29.05.2007",13,"Group: IM-44",13,"Student ID number: 4078",0
.data?
NazarInstM dd ?
vR3dU6i db 128 dup(?)
NazarPasswordBuf db 256 dup(?)
DecryptedNazarPasswordBuf db 256 dup(?)
vW9sA5q dd ?
.code
NazarPassPr PROTO :DWORD,:DWORD,:DWORD,:DWORD
PasswordWindowNazar PROTO :DWORD,:DWORD
start:
jmp vXor_A1
vXor_B1:
nop
xchg eax,eax
jmp vXor_C1
vXor_A1:
push eax
pop eax
jmp vXor_B1
vXor_C1:
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push ebx
mov ebx,vB9mX2z
mov vM1xZ7c,ebx
pop ebx
invoke GetModuleHandle,0
push eax
mov ebx,eax
mov ecx,ebx
mov eax,ecx
pop eax
mov NazarInstM,eax
push ecx
mov ecx,vN5tY8u
inc ecx
dec ecx
pop ecx
invoke PasswordWindowNazar,0,0
push eax
mov eax,vC6vG4a
xor eax,0BAADF00Dh
pop eax
invoke ExitProcess,eax
PasswordWindowNazar proc NazarResF:DWORD,NazarDaR:DWORD
LOCAL NazarArr1[4]:DWORD
LOCAL NazarVK:DWORD
push edx
mov edx,0
add edx,1
sub edx,1
pop edx
jmp vXor_Spag1
vXor_Spag2:
lea eax,NazarArr1
push eax
pop ebx
mov ecx,ebx
mov eax,ecx
mov NazarVK,eax
jmp vXor_Spag3
vXor_Spag1:
pushfd
popfd
jmp vXor_Spag2
vXor_Spag3:
mov ecx,NazarResF
push ecx
pop edx
mov ebx,edx
mov ecx,ebx
mov [eax],ecx
push eax
mov eax,vM1xZ7c
xor eax,eax
pop eax
mov ecx,NazarDaR
push ecx
pop ebx
mov edx,ebx
mov ecx,edx
mov [eax+4],ecx
push ecx
mov ecx,5
vXorLoopJunk1:
dec ecx
jnz vXorLoopJunk1
pop ecx
Dialog "Lab 3 by Tsebrynskyi Nazar XOR","Times New Roman Bold",10,WS_OVERLAPPED or WS_SYSMENU or DS_CENTER,5,55,55,300,90,2048
push eax
mov eax,vB9mX2z
cmp eax,0
pop eax
DlgGroup 0,30,10,230,30,300
push ebx
mov ebx,1
shl ebx,1
shr ebx,1
pop ebx
DlgStatic "Enter the password:",SS_CENTER,94,8,100,10,400
push ecx
mov ecx,vN5tY8u
add ecx,0
pop ecx
DlgEdit ES_LEFT or WS_TABSTOP,38,22,212,11,301
push edx
mov edx,vC6vG4a
and edx,edx
pop edx
DlgButton "Submit",WS_TABSTOP,20,52,50,13,IDOK
DlgButton "Cancel",WS_TABSTOP,222,52,50,13,IDCANCEL
CallModalDialog NazarInstM,0,NazarPassPr,NazarVK
ret
PasswordWindowNazar endp
NazarPassPr PROC NazarWinHandler:DWORD,NazarEntrPass:DWORD,NazarWSI:DWORD,NazarAddWInf:DWORD
LOCAL NazarPasswordLength:DWORD
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx, eax
xor ebx, ebx
pop ebx
xchg ecx, ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi, edi
pushfd
popfd
mov eax,NazarEntrPass
push eax
pop ebx
mov ecx,ebx
mov eax,ecx
cmp eax,WM_COMMAND
jne vXorSkipCmd
push ebx
mov ebx,vC6vG4a
test ebx,ebx
pop ebx
mov eax,NazarWSI
push eax
pop edx
mov ecx,edx
mov eax,ecx
cmp eax,IDOK
jne vXorSkipIdOk
invoke GetDlgItemText,NazarWinHandler,301,addr NazarPasswordBuf,sizeof NazarPasswordBuf
invoke lstrlen,addr NazarPasswordBuf
push eax
pop edx
mov ecx,edx
mov eax,ecx
mov NazarPasswordLength,eax
mov eax,NazarPasswordLength
cmp eax,0
jne vXorPassNotEmpty
fn MessageBox,0,addr NazarFillTheField,addr NazarErrorTitle,MB_ICONERROR
jmp vXorEndIdOk
vXorPassNotEmpty:
lea esi,NazarEncryptedPassword
lea edi,DecryptedNazarPasswordBuf
lea ebx,NazarKey
vXorDecryptLoop:
push eax
mov eax,vB9mX2z
nop
pop eax
mov al,[esi]
test al,al
jz vXorDecrEnd
xor al,[ebx]
stosb
inc esi
inc ebx
cmp byte ptr [ebx],0
jnz vXorSkipReset
lea ebx,NazarKey
vXorSkipReset:
jmp vXorDecryptLoop
vXorDecrEnd:
mov byte ptr [edi],0
push ecx
mov ecx,vM1xZ7c
add ecx,1
pop ecx
invoke lstrcmp,addr NazarPasswordBuf,addr DecryptedNazarPasswordBuf
push eax
pop edx
mov ecx,edx
mov eax,ecx
cmp eax,0
jne vXorPassWrong
fn MessageBox,0,addr NazarPersonalData,addr NazarPasswordCorrectCase,MB_OK
jmp vXorEndPassCheck
vXorPassWrong:
fn MessageBox,0,addr NazarPasswordIncorrectCase,addr NazarErrorTitle,MB_ICONERROR
vXorEndPassCheck:
invoke EndDialog,NazarWinHandler,0
vXorEndIdOk:
jmp vXorSkipCmd
vXorSkipIdOk:
cmp eax,IDCANCEL
jne vXorSkipCmd
invoke EndDialog,NazarWinHandler,0
vXorSkipCmd:
push ecx
mov ecx,vN5tY8u
nop
pop ecx
xor eax,eax
ret
NazarPassPr ENDP
end start