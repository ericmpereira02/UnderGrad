#### OS/161 Code Reading, Traps, Interrupts, System Calls, and Debugging Practice

**Questions**:

1. Traps and interrupts are mechanisms used to transfer control between user processes and the operating system. Tell us where we can find the first line of OS/161 code that is executed when a trap occurs. Then tell us where control gets transferred to from that point (i.e., what function services the trap). Be sure to describe the control flow for each type of trap that may occur (e.g., system calls, VM faults, and hardware interrupts).

> Answer: You can find the first line of code that executes when a trap occurs in the kern/arch/mips/locore/exception-mips1.S. This calls the mips_trap function in trap.c of the same directory.
>
> 



2. Where is the first line of code for constructing a trapframe? Describe at a high level what the code is doing here.

> Answer: 
> The first line of code constructing the trapframe is in the trap.c located in the kern/arch/mips/locore directory. It makes sense that it is here as the traps are first occuring in this directory. the trap.c uses the mips/trapframe.h header to construct the trapframe.
> 



3. Each OS/161 exception has its own code. What are the exception codes for the exceptions: **interrupt**, **system call**, and **arithmetic overflow**?

> Answer: interrupt = 0, system call = 8, arithmetic overflow = 12.
>
> 



4. What information is saved in **struct trapframe**?

> Answer: the vaddr register, status register, the cause register, and all other 31 registers.
>
> 



5. What is the name of the function that is the system-call handler in OS/161? In which directory is this function implementation located?

> Answer: A system call happens at /kern/arch/mips/syscall/syscall.c it calls on the syscall.h header file in the library.
>
> 



6. The kernel's main function is to provide support for user-level programs. Most such support is accessed via "system calls”. For example, consider the system call **reboot()**, which is implemented in the function **sys_reboot()** in *src/kern/main/main.c*. Using GDB, put a breakpoint on **sys_reboot** and run the "reboot" program (by typing "p /sbin/reboot" at the OS/161 menu prompt). Use "backtrace" to see how it got there. **Show the output of your debugging session as well as the output printed by the OS/161.**



> Answer: <br>
> Output of GDB
> ![](annotation.png)
><br>
> Output of OS/161
><br>
> ![](other.png)

