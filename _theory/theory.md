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

# Macros (for NASM)
- A macro is a single instructions that expands into a predefined set of instructions to perform a particular task
- Syntax:
    ```
    %macro <name> <argc>
        ...
        <macro body>
        ...
    %endmacro
    ```
- `argc` is the number of arguments
## Local labels in macros
- To make a local label, you use `%%`
    ```
    %macro freeze 0
    %%local
        jmp %%local
    %endmacro
    ```
# Defining values with EQU
- `equ` is used for deifing constants for future use
    ```
    STDIN equ 0
    STDOUT equ 1
    STDERR equ 2
    ```
# Including External Files
- `%include` will load an external file's code and insert it into the position in which it is included upon compilation
- Macros and EQU definitions are often defined inside of included files
    ```
    %include "filename.asm"
    ```