; Gabriel Peclat dos Reis Costa, Eng. Informática
; 2025140643, ISEC - PT

; um vetor (dw) de IDs de alunos, que termina em 0
; um vetor (db) de notas (0-20)
; guardar na variavel 'total' a quantidade de alunos
; guardar na variavel 'reprovados' a quantidade de alunos reprovados (nota < 10)

.8086
.model  small
.stack  2048

dseg    segment para public 'data'
    ; --- DEFINICAO DE VARIAVEIS ---
    alunos      dw 101, 102, 103, 104, 0
    notas       db 14,  8,   19,  7
    total       db 0
    reprovados  db 0

dseg    ends

cseg    segment para public 'code'
    assume  cs:cseg, ds:dseg

main    proc
    ; Inicializacao do segmento de dados
    mov     ax, dseg
    mov     ds, ax

    ; --- O TEU CODIGO COMECA AQUI ---
    xor DI, DI ; usado para as notas
    xor SI, SI ; usado para os alunos

inicio:
    mov ax, alunos[SI]

    cmp ax, 0
    JE fim

    add total, 1

    ; vamos comparar as notas
    mov bl, notas[DI]

    cmp bl, 10
    jb add_reprovado

    JMP proximo

add_reprovado:
    add reprovados, 1
    jmp proximo

proximo:
    add SI, 2
    inc DI
    jmp inicio

    ; --- O TEU CODIGO TERMINA AQUI ---

fim:
    mov     ah, 4ch    ; Funcao para terminar o programa
    int     21h        ; Interrupcao do DOS
main    endp

cseg    ends
end     main~

