segment .data                               ; create a segment
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

section .data
    x dd 10
    y dd 20
    
    msg1 db 'X e maior que Y', LN           ; message 1 with newline
    size1 equ $ - msg1                      ; length of msg1

    msg2 db 'Y e maior que X', LN 
    size2 equ $ - msg2

section .text
    global _start
    _start:

    mov RAX,[x]                             ; move the values to the pointers
    mov RBX,[y]

    cmp RAX, RBX                            ; set the values to compare
    jg  maior                               ; Execute the comparison and go to maoir if true

    ; works as else statment
    mov RCX, msg2
    mov RDX, size2
    jmp termino                             ; it jumps to the termino

maior:
    mov RCX, msg1
    mov RDX, size1

termino:
    ; Print msgs
    mov RAX, SYS_WRITE                      ; sys_write system call number
    mov RBX, STD_OUT                        ; file descriptor for stdout
    int SYS_EXC                             ; execute sys_write system call

    ; Exit the program
    mov RAX, SYS_EXIT                       ; sys_exit system call number
    mov RBX, SYS_RET                        ; exit code or [mov RBX, SYS_RET]
    int SYS_EXC                             ; execute sys_exit system call
