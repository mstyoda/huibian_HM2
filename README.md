# huibian_HM2

##学号：2015011340 姓名：骆轩源

##以下命令在64位操作系统可以运行

* 使用方法:
产生record信息到test.dat，第一步需要编译write-records.s 和write-record.s：
`as -gstabs -o write-records.o write-records.s --32`
`as -gstabs -o write-record.o write-record.s --32`

生成可执行文件testwrite：
`ld -m elf_i386 -o testwrite write-records.o write-record.o linux.o`

然后调用`./testwrite`，这时候就会产生一个叫做test.dat的文件，里面存储了两条record，一条的年龄是48，另一条是50。 使用:
`cat test.dat`会看到如下结果：（这是因为'0'的ASCII码是48）


XiaoGouMSTYODA
**** S Prairie Tulsa, OK ****
0
FedrickBartlet
**** S Prairie Tulsa, OK ****
2


之后我们就要执行对年龄加1的操作了，首先编译read-records.s，简单的方法可以直接在当前目录下打开终端运行：
`bash run.sh`

其中run.sh中包含如下命令：
`as -gstabs -o write-record.o write-record.s --32`
`as -gstabs -o read-record.o read-record.s --32`
`as -gstabs -o read-records.o read-records.s --32`

`ld -m elf_i386 -o final read-records.o read-record.o write-record.o`

最后运行：
`./final`

就会生成一个newtest.dat的文件，使用`cat test.dat`，会看到：
 

XiaoGouMSTYODA
**** S Prairie Tulsa, OK ****
1
FedrickBartlet
**** S Prairie Tulsa, OK ****
3

其中年龄确实增加了1。
