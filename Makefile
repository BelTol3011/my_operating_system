all: build

build:
	nasm -f bin kernel.asm -o boot.bin

clean:
	if [ -f "boot.bin" ]; then rm boot.bin; fi

run: build
	qemu-system-x86_64 -drive file=boot.bin
	