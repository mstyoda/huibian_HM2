as -gstabs -o write-record.o write-record.s --32
as -gstabs -o read-record.o read-record.s --32
as -gstabs -o read-records.o read-records.s --32

ld -m elf_i386 -o final read-records.o read-record.o write-record.o
