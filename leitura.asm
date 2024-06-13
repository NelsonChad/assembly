section .data                  ; Declaração da seção de dados
    msg db 100                 ; Reserva espaço para armazenar a mensagem (100 bytes)
    len equ $ - msg            ; Calcula o comprimento da mensagem

section .text                  ; Declaração da seção de código
    global _start             ; Define o ponto de entrada do programa

_start:                       ; Define o rótulo _start

    ; Lê a mensagem do usuário
    mov rax, 0                 ; Número da chamada do sistema para sys_read (leitura)
    mov rbx, 0                 ; Descritor de arquivo padrão para entrada padrão (stdin)
    mov rcx, msg               ; Ponteiro para o buffer de destino (onde a mensagem será armazenada)
    mov rdx, 100               ; Tamanho máximo da mensagem a ser lida
    syscall                    ; Chama o sistema para realizar a leitura

                                
    ; Termina o programa
    mov rax, 60                ; Número da chamada do sistema para sys_exit (saída do programa)
    xor rdi, rdi               ; Código de saída zero
    syscall                    ; Chama o sistema para sair do programa
