# Check whether the script is executed with administrator rights
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole] "Administrator"))
{
    Write-Error "This script must be executed with administrator rights."
    exit
}

# Retrieve BitLocker status for the C: drive
$bitlockerVolume = Get-BitLockerVolume -MountPoint "C:"
if ($bitlockerVolume -eq $null) {
    Write-Error "BitLocker volume on drive C: was not found."
    exit
}

# Search for the Recovery Password Key Protector
$recoveryProtector = $bitlockerVolume.KeyProtector | Where-Object { $_.KeyProtectorType -eq "RecoveryPassword" }

if ($recoveryProtector -eq $null) {
    Write-Output "No Recovery Password Key Protector found."
} else {
    # Recovery Key auslesen
    $recoveryKey = $recoveryProtector.RecoveryPassword
    Write-Output "The BitLocker recovery key is: $recoveryKey"

    # Speicherort für die Ausgabe definieren
    $outputFile = "C:\BitLockerRecoveryKey.txt"
    
    try {
        # Recovery Key in eine Datei schreiben
        $recoveryKey | Out-File -FilePath $outputFile -Encoding ASCII
        Write-Output "The recovery key was saved in the file $outputFile."
    }
    catch {
        Write-Error "Error when saving the file: $_"
    }
}
