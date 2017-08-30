# huibian_HM2

as -gstabs -o helloworld.o helloworld.s --32

ld -m elf_i386 -o helloworld helloworld.o
可以有多个.o文件。

sudo apt-get install g++-multilib

as -gstabs -o write-records.o write-records.s --32
as -gstabs -o write-record.o write-record.s --32
as -gstabs -o linux.o linux.s --32

ld -m elf_i386 -o testwrite write-records.o write-record.o linux.o


as -gstabs -o write-record.o write-record.s --32
as -gstabs -o read-record.o read-record.s --32
as -gstabs -o linux.o linux.s --32
ld -m elf_i386 -o testwrite read-records.o read-record.o write-record.o linux.o
