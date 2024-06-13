segment .data                   ; create a segment
    LN equ 0xA
    SYS_EXC equ 0x80

; for AX registers

    SYS_WRITE equ 0x04
    SYS_READ equ 0x03
    SYS_EXIT equ 0x01

; for BX registers

    STD_OUT equ 0x01
    STD_IN equ 0x00
    SYS_RET equ 0x00

section .bss
    name resb 1 

section .data
    msg db 'Escreva o seu nome', LN   ; message 1 with newline
    tnh equ $ - msg                     ; length of msg1

section .text
    global _start
    _start:

    ; Print msgs
    mov RAX, SYS_WRITE          ; sys_write system call number
    mov RBX, STD_OUT            ; file descriptor for stdout
    mov RCX, msg                ; pointer to msg
    mov RDX, tnh                ; length of msg
    int SYS_EXC                 ; execute sys_write system call

    ; Read message from keyboard
    mov RAX, SYS_READ           ; sys_read system call number
    mov RBX, STD_IN             ; file descriptor for stdin
    mov RCX, name               ; pointer to bame
    mov RDX, 0xA                ; length of get with 10 chars, 10 [0xA]
    int SYS_EXC                 ; execute sys_write system call

    ; Print msg in name
    mov RAX, SYS_WRITE          ; sys_write system call number
    mov RBX, STD_OUT            ; file descriptor for stdout
    mov RCX, name                ; pointer to msg
    mov RDX, 0xA                ; length of message, 10 chars [0xA]
    int SYS_EXC                 ; execute sys_write system call

    ; Exit the program
    mov RAX, SYS_EXIT           ; sys_exit system call number
    xor RBX, RBX                ; exit code
    int SYS_EXC                 ; execute sys_exit system call
