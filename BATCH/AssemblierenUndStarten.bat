cd C:\Users\%USERNAME%\Desktop\nasm
color a
cls
@echo off
taskkill /im qemu-system-x86_64.exe
echo Nasm Kompiliert ab Jetzt...
echo -------------------------------------------------
nasm kernal2.asm -o boot.bin -f bin
echo -------------------------------------------------
echo Fertig mit compilieren!!!
echo Lösche vorherige Datei
cd C:\Users\%USERNAME%\Desktop\nasm\qemu
del boot.bin
cd C:\Users\Bela\Desktop\nasm
echo Datei wird kopiert...
copy boot.bin C:\Users\%USERNAME%\Desktop\nasm\qemu
echo Fertig!!
cd C:\Users\%USERNAME%\Desktop\nasm\qemu
set /p a="Enter dücken wenn zufrieden:"
echo qemu Startet!
qemu-system-x86_64 boot.bin

