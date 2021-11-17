SYS_READ equ 0
SYS_OPEN equ 2
SYS_CLOSE equ 3

O_RDONLY equ 0


section .data
    filename db "testfile.txt", 0

section .bss
    text resb 27

section .text
global _start
_start:

    ;Open
    mov rax, SYS_OPEN
    mov rdi, filename
    mov rsi, O_RDONLY
    mov rdx, 0
    syscall

    ;Read
    push rax
    mov rdi, rax
    mov rax, SYS_READ
    mov rsi, text
    mov rdx, 26
    syscall

    ;Close
    mov rax, SYS_CLOSE
    pop rdi
    syscall

    mov rax, text
    call _print

    mov rax, 60
    mov rdi, 0
    syscall

_print:
    push rax

    mov rbx, 0
    _loop:
        inc rax
        inc rbx
        mov cl, [rax]
        cmp cl, 0
        jne _loop

    mov rax, 1
    mov rdi, 1
    pop rsi ;the input from rax
    mov rdx, rbx
    syscall
    ret