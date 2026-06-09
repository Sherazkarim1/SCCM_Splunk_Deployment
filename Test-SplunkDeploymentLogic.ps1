# Full simulation of SCCM Splunk deployment rules
# Purpose: Test locally before implementing in SCCM console

Write-Host "=== SCCM Splunk Deployment Rule Simulator ===" -ForegroundColor Magenta
Write-Host ""

# Step 1: Detection (what SCCM collection query does)
Write-Host "[1/3] Running detection logic (SCCM collection query simulation)" -ForegroundColor Cyan

$splunkInstalled = Get-WmiObject -Class Win32_Product -ErrorAction SilentlyContinue |
                   Where-Object Name -like "*Splunk Universal Forwarder*"

if ($splunkInstalled) {
    Write-Host "Result: Splunk FOUND on this machine" -ForegroundColor Green
    Write-Host "Action: EXCLUDE from deployment collection" -ForegroundColor Green
} else {
    Write-Host "Result: Splunk NOT FOUND on this machine" -ForegroundColor Red
    Write-Host "Action: INCLUDE in deployment collection" -ForegroundColor Yellow
}

Write-Host ""

# Step 2: What the deployment would do
Write-Host "[2/3] Simulated deployment action" -ForegroundColor Cyan
if (-not $splunkInstalled) {
    Write-Host "Would run:" -ForegroundColor Yellow
    Write-Host 'msiexec /i "SplunkUniversalForwarder.msi" /qn `' -ForegroundColor Yellow
    Write-Host '    AGREETOLICENSE=YES `' -ForegroundColor Yellow
    Write-Host '    RECEIVED_INDEXER="10.150.10.11:9997" `' -ForegroundColor Yellow
    Write-Host '    DEPLOYMENT_SERVER="10.150.10.10:8089" `' -ForegroundColor Yellow
    Write-Host '    WINEVENTLOG_APP_ENABLE=1 `' -ForegroundColor Yellow
    Write-Host '    WINEVENTLOG_SEC_ENABLE=1 `' -ForegroundColor Yellow
    Write-Host '    WINEVENTLOG_SYS_ENABLE=1' -ForegroundColor Yellow
    Write-Host "Status: Ready for deployment" -ForegroundColor Green
} else {
    Write-Host "Status: No action needed" -ForegroundColor Green
}

Write-Host ""

# Step 3: Documentation snippet
Write-Host "[3/3] For SharePoint documentation - copy this:" -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Gray
Write-Host "Collection Query WQL:" -ForegroundColor White
Write-Host "select SMS_R_System.Name from SMS_R_System where ResourceId not in (select ResourceId from SMS_G_System_ADD_REMOVE_PROGRAMS where DisplayName like '%Splunk%')" -ForegroundColor Gray
Write-Host "----------------------------------------" -ForegroundColor Gray
