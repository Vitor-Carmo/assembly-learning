segment .data
  LF          equ 0xA   ; Line Feed
  NULL        equ 0xD   ; Final da String
  SYS_CALL    equ 0x80  ; Envia informação para OS
  ; EAX
  SYS_EXIT    equ 0x1   ; Codigo de chamada para finalizar o programa
  SYS_READ    equ 0x3   ; Operação de leitura
  SYS_WRITE   equ 0x4   ; Operação de escrita
  ;EBX 
  RET_EXIT    equ 0x0   ; Operação realizada com sucesso ->  return 0; não importa o retorno
  STD_IN      equ 0x0   ; Valor de entrada padrão
  STD_OUT     equ 0x1   ; Valor de saída padrão

  TAM_BUFFER equ 0xA
   
segment .bss
  BUFFER      resb 0x1  ; buffer de leitura

segment .text
  saidaResultado:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, BUFFER
    mov edx, TAM_BUFFER
    int SYS_CALL

    ret