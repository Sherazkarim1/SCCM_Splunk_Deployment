#!/bin/bash
# macOS-specific Splunk Universal Forwarder detection script
# Checks various common Splunk installation locations on macOS

echo -e "\033[36m=== macOS Splunk Detection ===\033[0m"
echo ""

splunkFound=false

# Check 1: Homebrew installation
if brew list --cask splunk-universal-forwarder &>/dev/null 2>&1; then
    echo -e "\033[32m✓ Found: Splunk Universal Forwarder installed via Homebrew Cask\033[0m"
    splunkFound=true
fi

# Check 2: Application bundles in /Applications
if [ -d "/Applications/SplunkUniversalForwarder.app" ]; then
    echo -e "\033[32m✓ Found: SplunkUniversalForwarder.app in /Applications\033[0m"
    splunkFound=true
fi

if [ -d "/Applications/SplunkForwarder.app" ]; then
    echo -e "\033[32m✓ Found: SplunkForwarder.app in /Applications\033[0m"
    splunkFound=true
fi

# Check 3: /opt/splunkforwarder (common Linux/macOS install location
if [ -d "/opt/splunkforwarder" ]; then
    echo -e "\033[32m✓ Found: /opt/splunkforwarder directory\033[0m"
    splunkFound=true
fi

# Check 4: LaunchDaemons/Agents
if [ -f "/Library/LaunchDaemons/com.splunk.plist" ] || [ -f "/Library/LaunchDaemons/com.splunk.universalforwarder.plist" ]; then
    echo -e "\033[32m✓ Found: Splunk LaunchDaemon installed\033[0m"
    splunkFound=true
fi

echo ""

if [ "$splunkFound" = true ]; then
    echo -e "\033[32m=== Result: Splunk IS installed on this macOS machine\033[0m"
    echo -e "\033[36mAction: Would be EXCLUDED from SCCM deployment\033[0m"
else
    echo -e "\033[31m=== Result: Splunk is NOT installed on this macOS machine\033[0m"
    echo -e "\033[33mAction: Would be INCLUDED in macOS deployment (if applicable)\033[0m"
fi
