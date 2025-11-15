::禁用服务包括：wuauserv（更新主服务）、cryptSvc（加密服务）、bits（后台传输）、msiserver（安装服务）、UsoSvc（更新协调服务）
net stop wuauserv        && sc config wuauserv start=disabled
net stop cryptSvc        && sc config cryptSvc start=disabled
net stop bits            && sc config bits start=disabled
net stop msiserver       && sc config msiserver start=disabled
net stop UsoSvc          && sc config UsoSvc start=disabled
::禁用 Windows Update Medic 服务（防自动恢复）
REG add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "4" /f
::重命名更新缓存文件夹（防后台下载）
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old
::​禁用关联计划任务
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable
::注册表彻底禁用（家庭版需手动操作）
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d "1" /f
