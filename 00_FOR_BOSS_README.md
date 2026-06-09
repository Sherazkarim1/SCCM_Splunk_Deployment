# For Your Boss - Quick Instructions

Hi! Here's what you need to know to test these files on Windows:

1. Extract the zip file to a folder on Windows
2. Open PowerShell ISE or VS Code as ADMINISTRATOR
3. Navigate to the folder with the files
4. Run the test script:
   ```powershell
   .\Test-SplunkDeploymentLogic.ps1
   ```

## What's included:
- `Test-SplunkDeploymentLogic.ps1` - Tests the detection logic (like SCCM will use)
- `SCCM_WQL_Query.txt` - Copy-paste ready query for SCCM collection
- `Splunk_Install_Command.txt` - The exact MSI install command for SCCM
- `Splunk_Server_Info.txt` - Server info (10.150.10.10 = Deployment Server, 10.150.10.11 = Indexer)
- `TESTING_GUIDE.md` - Complete step-by-step guide
- `QUICK_START.md` - Quick overview
