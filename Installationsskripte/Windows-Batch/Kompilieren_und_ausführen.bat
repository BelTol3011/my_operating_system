:: Generelle Version (mit relativen Pfadangaben) von gregthwuen

@echo off

color c

:: Hinweise

echo Hinweis/Achtung!
echo.
echo Diese Batch setzt voraus, dass NASM und qemu in der 64bit-Version in ihrem Standardordner "C:\Program Files\" installiert wurden.
echo Ist dies nicht der Fall, muss in den Pfadangaben in der Batch jeweils das "C:\Program Files\" durch "C:\Program Files (x86)\" ersetzt werden,
echo beziehungsweise der Installationspfad angegeben werden.

timeout 10

cls

:: Das Kompilieren

color b

echo Loesche alte Boot.bin Datei, falls vorhanden...
del ..\..\Output\Boot.bin
echo Fertig.

echo Erstelle Verzeichnis ..\..\Output\, falls noch nicht vorhanden...
mkdir ..\..\Output\
echo Fertig.

echo Kompiliere mit NASM...
"C:\Program Files\NASM\nasm.exe" ..\..\kernel.asm -o ..\..\Output\Boot.bin -f bin
echo Fertig.



timeout 2
:: Das Starten

echo Soll die Boot.bin mit qemu ausgefuehrt werden?




cls

color d

echo Beende qemu-system-x86_64.exe-Instanz, falls ausgeführt... 
taskkill /im qemu-system-x86_64.exe
echo Fertig.

echo Die Boot.bin wird mit qemu ausgefuehrt.

"C:\Program Files\qemu\qemu-system-x86_64" ..\..\Output\Boot.bin

echo Pausieren, um Ausgaben anzusehen...
pause

