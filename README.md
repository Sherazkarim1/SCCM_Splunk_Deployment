# SCCM Splunk Deployment

This repository contains all necessary files for deploying Splunk Universal Forwarder via SCCM.

## Files Included

### Detection & Testing
- `Test-SplunkDeploymentLogic.ps1` - Windows PowerShell test script
- `Test-SplunkDeploymentLogic.sh` - macOS shell test script
- `Detect-Splunk-Mac.sh` - macOS-specific Splunk detector

### SCCM Implementation
- `SCCM_WQL_Query.txt` - WQL query to create SCCM collection
- `Splunk_Install_Command.txt` - Exact MSI installation command
- `SCCM_Splunk_Deployment_Files.zip` - All files zipped together

### Documentation
- `Splunk_Server_Info.txt` - Company Splunk server info
- `TESTING_GUIDE.md` - Complete step-by-step guide
- `QUICK_START.md` - Quick overview
- `00_FOR_BOSS_README.md` - Instructions for boss
- `WINDOWS_TESTING_STEPS.md` - Detailed Windows testing steps
- `WHAT_WE_DID.md` - Summary of progress

## Server Information
- Deployment Server: 10.150.10.10:8089 (ECE-MTB-SPLKDEP-01)
- Indexer: 10.150.10.11:9997 (ECE-MTB-SPLKUF-01)
