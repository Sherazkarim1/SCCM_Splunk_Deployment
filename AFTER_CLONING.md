# What to Do After Cloning on Windows

---

## Step 1: Open the Folder in File Explorer
1. Navigate to where you cloned the repo (probably `Documents` or `Desktop`)
2. Open the `SCCM_Splunk_Deployment` folder

---

## Step 2: Open PowerShell as Administrator
1. Click Windows Start
2. Type "PowerShell"
3. **Right-click** "Windows PowerShell" → select **Run as administrator**
4. Click "Yes" to UAC prompt if it appears

---

## Step 3: Navigate to the Repo Folder
In PowerShell, type:
```powershell
cd Desktop
cd SCCM_Splunk_Deployment
```
(Replace `Desktop` with wherever you cloned it!)

---

## Step 4: Verify You're in the Right Place
Type:
```powershell
dir
```
You should see all the files!

---

## Step 5: Run the Test Script
Type:
```powershell
.\Test-SplunkDeploymentLogic.ps1
```
Press Enter!

---

## Step 6: See the Results
The script will run and show you:
1. If Splunk is already installed
2. Whether the machine would be included/excluded
3. The exact installation command

---

## Step 7: Next Steps After Testing
- Open `SCCM_WQL_Query.txt` to get the WQL query for SCCM
- Open `Splunk_Install_Command.txt` to get the MSI command
