# BitLocker Recovery Key reading and saving

This PowerShell script reads the BitLocker recovery key of the C: partition and saves it in a text file. It assumes that the PC is unlocked and decrypted and that you have administrator rights.

## Function

The script performs the following steps:

- **Checking administrator rights:** The script checks whether it is being executed with elevated rights.
- Retrieving the BitLocker status:** The BitLocker status of the C: drive is queried.
- **Determining the Recovery Password Key Protector:** The script searches for the Recovery Password, which is configured as a key protector.
- **Output and storage:** The recovery key is output in the PowerShell window and stored in a text file (by default `C:\BitLockerRecoveryKey.txt`).

## Prerequisites

- Operating system:** Windows 10, Windows Server 2012 or higher.
- BitLocker:** BitLocker must be enabled on the target drive (C: by default).
- Administrator rights:** The script must be executed with administrator rights.
- Key Protector:** A recovery password must be configured as a key protector.

## Application

1. **Open PowerShell as administrator:**
   Search for "PowerShell", right-click on it and select "Run as administrator".

2. **Save script:**
   Save the script code in a file, e.g. `Get-BitLockerRecoveryKey.ps1`.

3. **Execute script:**
   Navigate to the location of the file in the PowerShell window and execute the script:
   ```powershell
   .\Get-BitLockerRecoveryKey.ps1

    Result:
        The recovery key is displayed in the PowerShell window.
        The key is also saved in the file C:\BitLockerRecoveryKey.txt.

Safety warning

Important:
The BitLocker Recovery Key is highly sensitive information. Handle this key very carefully:

    Secure handling: Only store the recovery key in trustworthy and secure locations.
    Access rights: Ensure that unauthorised persons do not gain access to the file.
    Storage: Delete or secure the file as soon as the recovery key is no longer required.

Disclaimer

This script is provided without warranty of any kind. The author accepts no liability for damage, loss of data or other disadvantages that may arise from the use of this script. Use is at your own risk.
Licence

This project is subject to the GNU General Public Licence (GPL). For further details, please refer to the enclosed licence file.