## NOLF-noHIDCD

Disables HID-Compliant Device in Device Manager while `NOLF.exe` is running.

### **Reason**
Created mostly for personal use, but it may help others. NOLF for Windows 10 and 11 ([NOLF Revival](http://nolfrevival.tk/)) often crashes on startup if the "HID-compliant device" is not disabled. Many users manually disable the driver before running the game and re-enable it afterward. For maximum system stability, this script ensures the driver is only disabled when necessary.

### **Warning**
This script is not intended to harm your system. However, users should always be cautious when running scripts found online. Review and modify the script as needed to understand its functionality and impact on your system.

---

## elevate_noHIDCD.ps1

`elevate_noHIDCD.ps1` is a script that requests admin permissions to run `noHIDCD.ps1`, as admin rights are required to modify Device Manager. Alternatively, users can right-click `noHIDCD.ps1` and select "Run as Administrator" or execute it directly from PowerShell.

---

## noHIDCD.ps1

This script can be customized for specific use cases.

---

## Installation

### File Placement
For best results, place `noHIDCD.ps1` in the same directory as `NOLF.exe` (or the program you want to run with it). Do the same with `elevate_noHIDCD.ps1` if you plan to use it.

### Configuration

#### **Line 2: `$targetAppPath`**
This variable specifies the executable to run after disabling the "HID-compliant device." The script will monitor this executable and re-enable the driver when it exits.

**Example:**
```powershell
$targetAppPath = ".\NOLF.exe"
```
This tells the script to look in the current directory (`.\`) for `NOLF.exe` and run it.

#### **Line 12: `$deviceInstanceID`**
This variable identifies the driver to disable and re-enable. Follow these steps to find the Device Instance ID:

1. Right-click the Windows logo on the taskbar and select **Device Manager**.
2. Expand **Human Interface Devices** to view its drivers.
3. Locate **HID-compliant device**, right-click it, and select **Properties**.
4. In the **Properties** window, go to the **Details** tab.
5. From the **Property** dropdown, select **Device Instance Path**.
6. Copy the value displayed (e.g., `HID\VID_26CE&PID_01A2\6&253D5AB4&0&0000`).

Paste this value into the script on line 12 after the equal sign.

**Example:**
```powershell
$deviceInstanceID = "HID\VID_26CE&PID_01A2\6&253D5AB4&0&0000"
```

---

### Final Steps
After customizing `noHIDCD.ps1`, run it using PowerShell **as an administrator**. The script will disable the driver, launch the program, and re-enable the driver when the program exits.
