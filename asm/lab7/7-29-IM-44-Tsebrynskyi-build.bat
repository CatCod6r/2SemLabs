@echo off
\masm32\bin\ml /c /coff 7-29-IM-44-Tsebrynskyi-main.asm
\masm32\bin\ml /c /coff 7-29-IM-44-Tsebrynskyi-proc.asm
\masm32\bin\link /SUBSYSTEM:WINDOWS 7-29-IM-44-Tsebrynskyi-main.obj 7-29-IM-44-Tsebrynskyi-proc.obj
pause
