# Step-by-Step Testing Guide

## Prerequisites
- **Mac**: You're on a Mac, so we'll focus on testing the macOS scripts first
- **Windows machine later**: The PowerShell scripts are for Windows testing with SCCM

---

## Step 1: Test the macOS Simulation Script

1. Open Terminal on your Mac
2. Navigate to your SCCM folder:
   ```bash
   cd "/Users/macbookpro/Desktop/SCCM_Script /SCCM"
   ```
3. Run the simulation script:
   ```bash
   ./Test-SplunkDeploymentLogic.sh
   ```
4. You should see output like this:
   ```
   === SCCM Splunk Deployment Rule Simulator (macOS) ===
   
   [1/3] Running detection logic (SCCM collection query simulation)
   Result: Splunk NOT FOUND on this machine (simulated - set to false for testing)
   Action: INCLUDE in deployment collection
   
   [2/3] Simulated deployment action
   Would run: msiexec /i SplunkUniversalForwarder.msi /qn
   Status: Ready for deployment
   
   [3/3] For SharePoint documentation - copy this:
   ----------------------------------------
   Collection Query WQL:
   select SMS_R_System.Name from SMS_R_System where ResourceId not in (select ResourceId from SMS_G_System_ADD_REMOVE_PROGRAMS where DisplayName like '%Splunk%')
   ----------------------------------------
   ```

---

## Step 2: Test macOS Splunk Detection

1. Run the macOS-specific detection script:
   ```bash
   ./Detect-Splunk-Mac.sh
   ```
2. This checks:
   - Homebrew Cask installation
   - /Applications/SplunkUniversalForwarder.app
   - /Applications/SplunkForwarder.app
   - /opt/splunkforwarder directory
   - LaunchDaemons for Splunk
3. It will tell you if Splunk is installed on your Mac

---

## Step 3: Test on Windows (when you're ready)

If you have a Windows machine or VM:

1. Copy these files to Windows:
   - `Test-SplunkDeploymentLogic.ps1`
   - `SCCM_WQL_Query.txt`

2. Open PowerShell ISE or VS Code as Administrator

3. Navigate to the folder with the script:
   ```powershell
   cd C:\path\to\your\SCCM\folder
   ```

4. Run the PowerShell script:
   ```powershell
   .\Test-SplunkDeploymentLogic.ps1
   ```

5. It will check if Splunk Universal Forwarder is installed on Windows using WMI

---

## Step 4: Understand the WQL Query

1. Open `SCCM_WQL_Query.txt`
2. Copy the query text
3. When you're in SCCM, create a new collection and paste this query
4. The query:
   - Finds all computers that **do NOT** have Splunk Universal Forwarder installed
   - These are the computers you want to deploy Splunk to

---

## What to do next

1. Ask your team for:
   - Splunk indexer address (e.g., `splunk-indexer.company.com:9997`)
   - Deployment server address (e.g., `splunk-ds.company.com:8089`)
   - Any specific Splunk configuration requirements

2. Test on an actual Windows machine to confirm the PowerShell scripts work correctly

3. Once tested, implement the WQL query in SCCM
