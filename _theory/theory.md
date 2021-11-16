# Registers
- In the x86_64 architecture, registers hold 64 bits.
- Each registers can hold the values:
    - Unsigned: 0                          - 18_446_744_073_709_551_616
    - Signed  : -9_223_372_036_854_775_808 - 9_223_372_036_854_775_807

# System Call (syscall)
- A **system call**, or a **syscall**, is when a program requests a service from the **kernel**.
- All syscalls have an ID associated.
- Syscall can take arguments

# Sections
- All x86_64 assembly files have 3 sections:
    - The **.data** section: where data is defined here before compilation
    - The **.bss** section: where data is allocated for future use
    - The **.text** section: where the actual code that will be execute goes

# Jumps, Calls & Comparisons