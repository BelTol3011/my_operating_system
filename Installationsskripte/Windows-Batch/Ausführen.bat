@echo off

color d

echo Beende qemu-system-x86_64.exe-Instanz, falls ausgeführt... 
taskkill /im qemu-system-x86_64.exe
echo Fertig.

echo Die Boot.bin wird mit qemu ausgefuehrt.
echo Startet...
"C:\Program Files\qemu\qemu-system-x86_64" ..\..\Output\Boot.bin

echo Pausieren, um Ausgaben anzusehen...
pause

