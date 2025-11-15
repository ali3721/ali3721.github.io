@echo off
setlocal
net user printer  /delete
:: 创建账户
net user printer "printer" /add /comment:"打印机共享专用账户" /fullname:"Printer Share Account" >nul 2>&1

:: 配置账户属性
wmic useraccount where "name='printer'" set PasswordExpires=False >nul 2>&1
net user printer /times:all >nul

:: 禁止登录界面显示
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v printer /t REG_DWORD /d 0 /f >nul

echo 账户 printer 已创建并配置为仅打印机共享使用
echo 请将此账户用于打印机共享权限设置
pause