segment .data                   ; create a segment
    LN equ 0xA
    SYS_EXC equ 0x80

; for AX registers

    SYS_WRITE equ 0x04
    SYS_EXIT equ 0x01

; for BX registers

    STD_OUT equ 0x01
    SYS_RET equ 0x00

section .data
    msg1 db 'Hello World', LN   ; message 1 with newline
    msg2 db 'Primeira aula'     ; message 2 without newline
    tnh equ $ - msg1            ; length of msg1

section .text
    global _start
    _start:

    ; Print msgs
    mov RAX, SYS_WRITE          ; sys_write system call number
    mov RBX, STD_OUT            ; file descriptor for stdout
    mov RCX, msg1               ; pointer to msg1
    mov RDX, tnh                ; length of msg1
    int SYS_EXC                 ; execute sys_write system call

    ; Exit the program
    mov RAX, SYS_EXIT           ; sys_exit system call number
    xor RBX, RBX                ; exit code
    int SYS_EXC                 ; execute sys_exit system call
