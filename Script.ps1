Get-ServerHealth
CPUSAGE=$(top -b -n 1 -d1 | grep "Cpu" | awl '{print $2}' | awk -F. '{print $1}')
MEMUSAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISKUSAGE=$(df -P | column -t | awk '{print $5}' | tail -n 1 | sed 's/%//g')
PROCLIST=$(Get-Process | Where-Object {$_.CPU -gt 1}) 
APPSTATUS=$(Get-Service |
Where-Object {
    ($_.DisplayName -EQ "java") -or ($_.DisplayName -EQ "docker")
})
IISSITEST=$(Get-IISSite)
echo 'server health'>>usagereport
echo "$SERHEALTH">>usagereport
echo 'DATE&TIME, CPUI(%), MEM(%), DISK(%)' >>usagereport
echo "$DATE, $CPUSAGE, $MEMUSAGE, $DISKUSAGE" >>usagereport
echo 'PROCLIST'>>processlistecho 
echo "$PROCLIST">>processlist
echo 'APPSTATUS'>>usagereport
echo "$APPSTATUS">>usagereport
echo 'IISSITEST'>>usagereport
echo "$IISSITEST">>usagereport