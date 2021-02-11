#løkke som kjører gjennom 3 ganger, og lager 3 maskiner
1..3 | % {

    # Variabler for VM navn, switch og ISO med OS
    $VMName = "Virtuell maskin-0$_"
    $Switch = 'InternalNAT'
    $InstallMedia = 'C:\Hyper-V-Storage\ISO\en_windows_10_consumer_editions_version_20h2_x64_dvd_ab0e3e0a.iso'
    
    # Lager VM
    New-VM -Name $VMName -MemoryStartupBytes 2147483648 -Generation 2 -NewVHDPath "C:\Hyper-V-Storage\Virtuelle Maskiner\$VMName\$VMName.vhdx" -NewVHDSizeBytes 53687091200 -Path "C:\Hyper-V-Storage\Virtuelle Maskiner\$VMName" -SwitchName $Switch
    
    
    # Legger til DVD med ISO
    Add-VMScsiController -VMName $VMName
    Add-VMDvdDrive -VMName $VMName -ControllerNumber 1 -ControllerLocation 0 -Path $InstallMedia
    
    
    # Mounter media
    $DVDDrive = Get-VMDvdDrive -VMName $VMName
    
    
    # Booter VM fra DVD Media
    Set-VMFirmware -VMName $VMName -FirstBootDevice $DVDDrive
    
    #Starter VM
    Start-VM -Name $VMName
}
    