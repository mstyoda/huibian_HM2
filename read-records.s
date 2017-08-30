#read-records.s
.include "linux.s"
.include "read-def.s"
.include "write-record.s"

.section .data
file_name:
	.ascii "test.dat\0"
out_file:
	.ascii "newtest.dat\0"
.section .bss
	.lcomm record_buffer,RECORD_SIZE
.equ ST_INPUT_DESCRIPTOR,-4
.equ ST_OUTPUT_DESCRIPTOR,-8

.section .text
.globl _start
_start:
	movl %esp,%ebp
	subl $8,%esp
	movl $SYS_OPEN,%eax
	movl $file_name,%ebx
	movl $0,%ecx
	movl $0666,%edx
	int $LINUX_SYSCALL

	movl %eax,ST_INPUT_DESCRIPTOR(%ebp)#put input descriptor on stack

	movl $SYS_OPEN,%eax
	movl $out_file,%ebx
	movl $0101,%ecx
	movl $0666,%edx
	int $LINUX_SYSCALL

	movl %eax,ST_OUTPUT_DESCRIPTOR(%ebp)#put out descriptor on stack

record_read_loop:
	pushl ST_INPUT_DESCRIPTOR(%ebp)
	pushl $record_buffer
	call read_record
	addl $8,%esp
	
	cmpl $RECORD_SIZE,%eax

	jne finished_reading
	
	pushl ST_FILE_DESCRIPTOR(%ebp)#write one 
	pushl $record1
	call write_record
	addl $8,%esp

finished_reading:
	movl $0, %ebx
	movl $1, %eax
	int $0x80
