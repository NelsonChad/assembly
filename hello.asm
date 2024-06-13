section .data                       ; sessao para declarar constantes
    msg1 db 'Hello World' ,0xA      ; set the message to const msg1 with beakline [,0xA]
    msg2 db 'Primeira aula'         ; set the message to const msg2 with beakline [0xA]
    tnh equ $- msg1                 ; get the string lenght and set to the var [tnh]

section .text
    global _start                   ; entry point of the program
        _start:

        mov RAX, 0x04               ; moves the value 0x04 into the RAX register [0x04 is sys_write system call]
        mov RBX, 0x01               ; 0x01 typically represents the file descriptor for standard output (stdout).

        mov RCX, msg1
        mov RDX, tnh                ; mov the var with the lenght to the register RDX
        int 0x80                    ; run the instruction [making system calls]

        mov RAX, 0x1                ; 0x01 represents the system call number for the sys_exit system call. [1 = sys_exit]
        mov RBX, 0x0                ; 0x0 typically represents successful program termination. [0 = exit code]    
        int 0x80                    ; run the instruction [sys_exit system call, which terminates the program.]

; nasm -f elf64 hello.asm  [command to run]
; ld -s -o hello hello.o
; ./hello