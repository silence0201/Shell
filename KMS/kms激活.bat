@echo off  
  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
  
if '%errorlevel%' NEQ '0' (  
  
echo 请求管理员权限...  
  
goto UACPrompt  
  
) else ( goto gotAdmin )  
  
:UACPrompt  
  
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
  
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"  
  
"%temp%\getadmin.vbs"  
  
exit /B  
  
:gotAdmin  
set KmsServer=kms.94ish.net
cscript /nologo "%windir%\system32\slmgr.vbs" /skms %KmsServer%
cscript  /nologo  "%windir%\system32\slmgr.vbs"  /ato
cscript  /nologo  "%windir%\system32\slmgr.vbs"  /xpr
pause