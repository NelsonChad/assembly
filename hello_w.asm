section .data
    msg1 db 'Hello World', 0xA  ; message 1 with newline
    msg2 db 'Primeira aula'     ; message 2 without newline
    tnh equ $ - msg1            ; length of msg1

section .text
    global _start
    _start:

    ; Print msg1
    mov RAX, 0x04               ; sys_write system call number
    mov RBX, 0x01               ; file descriptor for stdout
    mov RCX, msg1               ; pointer to msg1
    mov RDX, tnh                ; length of msg1
    int 0x80                    ; execute sys_write system call

    ; Exit the program
    mov RAX, 0x01               ; sys_exit system call number
    xor RBX, RBX                ; exit code
    int 0x80                    ; execute sys_exit system call
