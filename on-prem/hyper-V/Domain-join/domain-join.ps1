
#Legge maskiner inn i domenet
foreach($c in Get-NetAdapter) {
    Set-DnsClientServerAddress -InterfaceIndex $c.interfaceindex -ServerAddresses ('192.168.0.11')
}
Add-Computer -DomainName "LEVER.no" -restart
