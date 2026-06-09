# Step-by-Step Guide to Test on Windows

## After Unzipping the Files on Windows

---

## Step 1: Open PowerShell as Administrator

1. Click the **Windows Start** button (bottom left)
2. Type: `PowerShell`
3. When you see "Windows PowerShell", **RIGHT-CLICK** it and select **"Run as administrator"**
4. Click "Yes" if a User Account Control (UAC) window pops up

---

## Step 2: Navigate to Your Folder

Suppose you extracted the zip to your Desktop in a folder called "SCCM Files". Let's go there:

1. In the PowerShell window, type:
   ```powershell
   cd Desktop
   ```
   Press **Enter**

2. Then type:
   ```powershell
   cd "SCCM Files"
   ```
   (Replace "SCCM Files" with whatever your folder name is!)
   Press **Enter**

---

## Step 3: Check the Files Are There

Type:
```powershell
dir
```
Press **Enter**

You should see all the files listed!

---

## Step 4: Run the Test Script

Type:
```powershell
.\Test-SplunkDeploymentLogic.ps1
```
Press **Enter**

That's it! The script will run!

---

## What You'll See

The script will:
1. Check if Splunk Universal Forwarder is installed
2. Show you whether the machine would be included or excluded
3. Show you exactly what the installation command would be

---

## What to Do Next

After testing:
1. Open `SCCM_WQL_Query.txt` - copy that query for SCCM
2. Open `Splunk_Install_Command.txt` - that's the install command for SCCM
