section .bss
    digitSpace resb 100
    digitSpacePos resb 8


section .text
    global _start

_start:
    mov rax, 123
    call _printRAX

    mov rax, 60
    mov rdi, 0
    syscall

; 123 / 10 = 12 R 3
; store 3
; 12 / 10 = 1 R 2
; store 2
; 1 / 10 = 0 R 1
; store 1


_printRAX:
    mov rcx, digitSpace
    mov rbx, 10 ;new line
    mov [rcx], rbx
    inc rcx
    mov [digitSpacePos], rcx

    _loop:
        mov rdx, 0 ;don't mess up div
        mov rbx, 10
        div rbx ;rax = rax / rbx
        push rax
        add rdx, 48 ; rdx containts the reminder [+48 for ASCII]

        mov rcx, [digitSpacePos]
        mov [rcx], dl
        inc rcx
        mov [digitSpacePos], rcx

        pop rax
        cmp rax, 0
        jne _loop

    _loop2:
        mov rcx, [digitSpacePos]

        mov rax, 1
        mov rdi, 1
        mov rsi, rcx
        mov rdx, 1
        syscall

        mov rcx, [digitSpacePos]
        dec rcx
        mov [digitSpacePos], rcx
        cmp rcx, digitSpace
        jge _loop2
    
    ret


