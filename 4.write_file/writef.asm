SYS_WRITE equ 1
SYS_OPEN equ 2
SYS_CLOSE equ 3

O_WRONLY equ 1
O_CREAT equ 64


section .data
    filename db "testfile.txt", 0
    text db "Hello, World in file!", 0

section .text
global _start 
_start:
    ;Open
    mov rax, SYS_OPEN
    mov rdi, filename
    mov rsi, O_CREAT + O_WRONLY
    mov rdx, 0644o
    syscall

    ;Write
    push rax
    mov rdi, rax
    mov rax, SYS_WRITE
    mov rsi, text
    mov rdx, 21
    syscall

    ;Close
    mov rax, SYS_CLOSE
    pop rdi
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

