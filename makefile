SRC_FILES = $(wildcard src/*)
TARGET_FILES = $(subst .nasm,.o, $(subst .c,.o, $(subst src, build, $(SRC_FILES))))
TARGET = ./bin/os.img

.PHONY: clean run

$(TARGET): $(TARGET_FILES)
	ld $^ -T ./scripts/link.ld -o $@
build/%.o: src/%.nasm
	nasm -f elf $^ -o $@
build/%.o: src/%.c
	gcc -m32 -nostdlib -c $^ -o $@

clean:
	rm -rf bin/* build/*
run:
	qemu-system-x86_64 $(TARGET)