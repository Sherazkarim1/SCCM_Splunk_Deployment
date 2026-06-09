#!/bin/bash
# Full simulation of SCCM Splunk deployment rules - macOS version
# Purpose: Test logic locally on Mac before implementing in SCCM for Windows

echo -e "\033[35m=== SCCM Splunk Deployment Rule Simulator (macOS) ===\033[0m"
echo ""

# Step 1: Detection (what SCCM collection query does)
echo -e "\033[36m[1/3] Running detection logic (SCCM collection query simulation)\033[0m"

# Since we're on macOS, we'll simulate the Windows detection logic
# In a real Windows environment, this would check Win32_Product
# For this Mac test, we can optionally check for Splunk via Homebrew or /Applications

# Default to NOT installed for simulation
splunkInstalled=false
mockMessage="(simulated - set to false for testing)"

# Optional: Check if Splunk is actually installed on Mac (comment out if not needed)
if [ -d "/Applications/SplunkForwarder.app" ] || [ -d "/Applications/SplunkUniversalForwarder.app" ] || brew list --cask splunk-universal-forwarder &>/dev/null 2>&1; then
    splunkInstalled=true
    mockMessage="(actually installed on this Mac)"
fi

if [ "$splunkInstalled" = true ]; then
    echo -e "\033[32mResult: Splunk FOUND on this machine $mockMessage\033[0m"
    echo -e "\033[32mAction: EXCLUDE from deployment collection\033[0m"
else
    echo -e "\033[31mResult: Splunk NOT FOUND on this machine $mockMessage\033[0m"
    echo -e "\033[33mAction: INCLUDE in deployment collection\033[0m"
fi

echo ""

# Step 2: What the deployment would do
echo -e "\033[36m[2/3] Simulated deployment action\033[0m"
if [ "$splunkInstalled" = false ]; then
    echo -e "\033[33mWould run:\033[0m"
    echo -e "\033[33mmsiexec /i \"SplunkUniversalForwarder.msi\" /qn \`\033[0m"
    echo -e "\033[33m    AGREETOLICENSE=YES \`\033[0m"
    echo -e "\033[33m    RECEIVED_INDEXER=\"10.150.10.11:9997\" \`\033[0m"
    echo -e "\033[33m    DEPLOYMENT_SERVER=\"10.150.10.10:8089\" \`\033[0m"
    echo -e "\033[33m    WINEVENTLOG_APP_ENABLE=1 \`\033[0m"
    echo -e "\033[33m    WINEVENTLOG_SEC_ENABLE=1 \`\033[0m"
    echo -e "\033[33m    WINEVENTLOG_SYS_ENABLE=1\033[0m"
    echo -e "\033[32mStatus: Ready for deployment\033[0m"
else
    echo -e "\033[32mStatus: No action needed\033[0m"
fi

echo ""

# Step 3: Documentation snippet
echo -e "\033[36m[3/3] For SharePoint documentation - copy this:\033[0m"
echo -e "\033[90m----------------------------------------\033[0m"
echo -e "\033[37mCollection Query WQL:\033[0m"
echo -e "\033[90mselect SMS_R_System.Name from SMS_R_System where ResourceId not in (select ResourceId from SMS_G_System_ADD_REMOVE_PROGRAMS where DisplayName like '%Splunk%')\033[0m"
echo -e "\033[90m----------------------------------------\033[0m"
