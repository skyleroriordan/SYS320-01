clear

if (Get-Process chrome -ErrorAction SilentlyContinue) {
Stop-Process -Name chrome
}

else {
Start-Process "chrome.exe" "https://champlain.edu"
}