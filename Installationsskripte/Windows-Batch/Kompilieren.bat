@echo off

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

echo Pausieren, um Ausgaben anzusehen...
pause

