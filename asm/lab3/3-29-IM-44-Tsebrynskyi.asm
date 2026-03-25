.386
.model flat,stdcall
option casemap:none
include \masm32\include\masm32rt.inc
include \masm32\include\dialogs.inc
.data
vR1xT9 dd 0DEADBEEFh
NazarPassword db "NAZARAPASSWORD1234",0
vF4kL2 db 10,20,30,40
NazarErrorTitle db "Error",0
vB7nP5 dd 1337h
NazarFillTheField db "Please fill the password field",0
vM2cQ8 dq 0BAADF00Dh
NazarPasswordIncorrectCase db "Password is incorrect",0
vY5wH3 dd 0
NazarPasswordCorrectCase db "Success. You can have my personal info:",0
vJ6dG1 db 0AAh,0BBh
NazarPersonalData db "Tsebrynskyi Nazar",13,"Date of birth: 29.05.2007",13,"Group: IM-44",13,"Student ID number: 4078",0
.data?
NazarInstM dd ?
vK9sA4 db 128 dup(?)
NazarPasswordBuf db 256 dup(?)
vL3pU7 dd ?
.code
NazarPassPr PROTO :DWORD,:DWORD,:DWORD,:DWORD
PasswordWindowNazar PROTO :DWORD,:DWORD
start:
jmp vRealStart
vDeadZone:
mov eax,1
int 3
vRealStart:
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push ebx
mov ebx,vR1xT9
mov vY5wH3,ebx
pop ebx
invoke GetModuleHandle,0
push eax
mov ebx,eax
mov ecx,ebx
mov eax,ecx
pop eax
mov NazarInstM,eax
push ecx
mov ecx,vB7nP5
inc ecx
dec ecx
pop ecx
invoke PasswordWindowNazar,0,0
push eax
mov eax,vR1xT9
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
jmp vSpag1
vSpag2:
lea eax,NazarArr1
push eax
pop ebx
mov ecx,ebx
mov eax,ecx
mov NazarVK,eax
jmp vSpag3
vSpag1:
pushfd
popfd
jmp vSpag2
vSpag3:
mov ecx,NazarResF
push ecx
pop edx
mov ebx,edx
mov ecx,ebx
mov [eax],ecx
push eax
mov eax,vY5wH3
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
vLoopJunk1:
dec ecx
jnz vLoopJunk1
pop ecx
Dialog "Lab 3 by Tsebrynskyi Nazar","Times New Roman Bold",10,WS_OVERLAPPED or WS_SYSMENU or DS_CENTER,5,55,55,300,90,2048
push eax
mov eax,vR1xT9
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
mov ecx,vB7nP5
add ecx,0
pop ecx
DlgEdit ES_LEFT or WS_TABSTOP,38,22,212,11,301
push edx
mov edx,1
and edx,edx
pop edx
DlgButton "Submit",WS_TABSTOP,20,52,50,13,IDOK
push eax
mov eax,1
or eax,0
pop eax
DlgButton "Cancel",WS_TABSTOP,222,52,50,13,IDCANCEL
CallModalDialog NazarInstM,0,NazarPassPr,NazarVK
ret
PasswordWindowNazar endp
NazarPassPr PROC NazarWinHandler:DWORD,NazarEntrPass:DWORD,NazarWSI:DWORD,NazarAddWInf:DWORD
LOCAL NazarPasswordLength:DWORD
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
push eax
pop eax
push ebx
mov ebx,eax
xor ebx,ebx
pop ebx
xchg ecx,ecx
nop
push edx
pop edx
inc eax
dec eax
mov edi,edi
pushfd
popfd
mov eax,NazarEntrPass
push eax
pop ebx
mov ecx,ebx
mov eax,ecx
cmp eax,WM_INITDIALOG
jne vSkipInitDlg
xor eax,eax
ret
vSkipInitDlg:
cmp eax,WM_COMMAND
jne vSkipCmd
mov eax,NazarWSI
push eax
pop edx
mov ecx,edx
mov eax,ecx
cmp eax,IDOK
jne vSkipIdOk
invoke GetDlgItemText,NazarWinHandler,301,addr NazarPasswordBuf,sizeof NazarPasswordBuf
invoke lstrlen,addr NazarPasswordBuf
push eax
pop edx
mov ecx,edx
mov eax,ecx
mov NazarPasswordLength,eax
mov eax,NazarPasswordLength
cmp eax,0
jne vPassNotEmpty
fn MessageBox,0,addr NazarFillTheField,addr NazarErrorTitle,MB_ICONERROR
jmp vEndIdOk
vPassNotEmpty:
push ecx
mov ecx,vY5wH3
add ecx,1
pop ecx
invoke lstrcmp,addr NazarPasswordBuf,addr NazarPassword
push eax
pop edx
mov ecx,edx
mov eax,ecx
cmp eax,0
jne vPassWrong
fn MessageBox,0,addr NazarPersonalData,addr NazarPasswordCorrectCase,MB_OK
jmp vEndPassCheck
vPassWrong:
fn MessageBox,0,addr NazarPasswordIncorrectCase,addr NazarErrorTitle,MB_ICONERROR
vEndPassCheck:
invoke EndDialog,NazarWinHandler,0
vEndIdOk:
jmp vSkipCmd
vSkipIdOk:
cmp eax,IDCANCEL
jne vSkipCmd
invoke EndDialog,NazarWinHandler,0
vSkipCmd:
cmp NazarEntrPass,WM_CLOSE
jne vSkipClose
invoke EndDialog,NazarWinHandler,0
vSkipClose:
push ecx
mov ecx,vB7nP5
nop
pop ecx
xor eax,eax
ret
NazarPassPr ENDP
end start