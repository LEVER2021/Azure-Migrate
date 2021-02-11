
#Legge maskiner inn i domenet 
#Først endre dns til domenekontroller, så legge til i domenet
foreach ($c in Get-NetAdapter) {
    Set-DnsClientServerAddress -InterfaceIndex $c.interfaceindex -ServerAddresses ('192.168.0.11')
}
Add-Computer -DomainName "LEVER.no" -restart
