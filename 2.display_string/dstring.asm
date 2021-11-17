section .data
    text db "Hello, World!", 10, 0
    text2 db "World?", 10, 0

section .text
    global _start

_start:

    mov rax, text
    call _print

    mov rax, text2
    call _print

    mov rax, 60
    mov rdi, 0
    syscall


;Print string subroutine
;input: rax
;output: print string at rax
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