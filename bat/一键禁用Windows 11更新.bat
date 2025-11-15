:: 停止并禁用核心服务
net stop wuauserv >nul 2>&1 & sc config wuauserv start=disabled >nul
net stop bits >nul 2>&1 & sc config bits start=disabled >nul
net stop UsoSvc >nul 2>&1 & sc config UsoSvc start=disabled >nul
net stop cryptSvc >nul 2>&1 & sc config cryptSvc start=disabled >nul
net stop msiserver >nul 2>&1 & sc config msiserver start=disabled >nul

:: 禁用Windows Update Medic服务
REG add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d 4 /f >nul

:: 禁用服务恢复机制
REG add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "FailureActions" /t REG_BINARY /d 0000 /f >nul

:: 重命名更新缓存文件夹
if exist C:\Windows\SoftwareDistribution ren C:\Windows\SoftwareDistribution SoftwareDistribution.old >nul
if exist C:\Windows\System32\catroot2 ren C:\Windows\System32\catroot2 catroot2.old >nul

:: 禁用计划任务
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable >nul 2>&1

:: 注册表彻底关闭更新访问
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d 1 /f >nul

:: 刷新组策略（专业版/企业版生效）
gpupdate /force >nul 2>&1

:: 重启系统生效
shutdown /r /t 300 /c "Windows更新已禁用，系统将在300秒后重启"