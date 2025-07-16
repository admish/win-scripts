## Downloads and runs script that will fully clean any & all traces of installed versions of Office
## https://github.com/abbodi1406/BatUtil/tree/master/OfficeScrubber
## https://github.com/abbodi1406/WHD/raw/refs/heads/master/scripts/OfficeScrubber_13.zip

Invoke-WebRequest -Uri "https://git.xga.io/scripts/windows/-/raw/main/Install/OfficeScrubber/OfficeScrubber_13.zip" -OutFile "C:\Windows\Temp\OfficeScrubber_13.zip"

Expand-Archive -Path "C:\Windows\Temp\OfficeScrubber_13.zip" -DestinationPath "C:\Windows\Temp\OfficeScrubber" -Force

cmd /c "C:\Windows\Temp\OfficeScrubber\OfficeScrubber.cmd /A"