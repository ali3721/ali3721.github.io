::​停止并禁用核心服务
net stop wuauserv
sc config wuauserv start=disabled
net stop bits
sc config bits start=disabled
net stop usosvc
sc config usosvc start=disabled
::​禁用恢复服务（Windows Update Medic Service）
REG add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "4" /f
::​关闭服务恢复机制
REG add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "FailureActions" /t REG_BINARY /d "0000" /f
