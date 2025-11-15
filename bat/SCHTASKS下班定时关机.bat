 
schtasks /create /sc daily /tn "shutdown20" /tr "shutdown -s -t 600" /st 20:00
schtasks /create /sc daily /tn "shutdown21" /tr "shutdown -s -t 600" /st 21:00
schtasks /create /sc daily /tn "shutdown22" /tr "shutdown -s -t 600" /st 22:00
schtasks /create /sc daily /tn "shutdown23" /tr "shutdown -s -t 600" /st 23:00
schtasks /create /sc daily /tn "shutdown1" /tr "shutdown -s -t 600" /st 01:00
schtasks /create /sc daily /tn "shutdown2" /tr "shutdown -s -t 600" /st 02:00
schtasks /create /sc daily /tn "shutdown3" /tr "shutdown -s -t 600" /st 03:00
schtasks /create /sc daily /tn "shutdown4" /tr "shutdown -s -t 600" /st 04:00
 
pause
