#system call numbers
.equ SYS_OPEN,5
.equ SYS_WRITE,4
.equ SYS_READ,3
.equ SYS_CLOSE,6
.equ SYS_EXIT,1

#options for open
.equ O_RDONLY,0
.equ O_CREAT_WRONLY_TRUNC,03101
.equ O_PERMISSION,0666

#standard file descriptors
.equ STDIN,0
.equ STDOUT,1
.equ STDERR,2

#system call interrupt
.equ LINUX_SYSCALL,0x80
.equ END_OF_FILE,0 #this is the #return value# of read which means we hit the end.
