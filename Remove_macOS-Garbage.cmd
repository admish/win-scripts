@echo off
echo This script will remove all macOS artifacts from the entire specified drive.
echo (Should 'probably' be run as admin.)
set /p setDrv=Which drive (letter) do you wish to clean?:

%setDrv%:
cd %setDrv%:\
echo  ---  Cleaning artifacts from %setDrv%:\ including subfolders.

:: Remove some folders first
rmdir /S /Q .fseventsd
echo  ---  '.fseventsd' folder removed.
rmdir /S /Q .Spotlight-V100
echo  ---  '.Spotlight-V100' folder removed.
rmdir /S /Q .Trashes
echo  ---  '.Trashes' folder removed.

:: Scan all subfolders on %setDrv% for .DS_Store and other cache files left behind by macOS.
del /s /a:h .DS_Store
echo  ---  '.DS_Store' files removed.
del /s /a:h *.IconCache
echo  ---  '.IconCache' files removed.
del /s /a:h ._*
echo  ---  Remaining '._' macOS garbage files have been removed.

echo  ---  All macOS artifacts have been cleaned from drive.
@pause