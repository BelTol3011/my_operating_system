taskkill /im qemu-system-x86_64.exe
@echo off
cd ..
copy fertig.img C:\Users\%USERNAME%\Desktop\my Operating system\qemu
cd C:\Users\%USERNAME%\Desktop\my Operating system\qemu
echo qemu Startet!
qemu-system-x86_64 fertig.img

