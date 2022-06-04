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

section .data
  msg: db 'Entre com seu nome:', LF, NULL
  tam: equ $- msg

section .bss
  nome resb 1

section .text

global _start

_start:
  MOV EAX, SYS_WRITE
  MOV EBX, STD_OUT
  MOV ECX, msg
  MOV EDX, tam
  INT SYS_CALL  

  MOV EAX, SYS_READ
  MOV EBX, STD_IN
  MOV ECX, nome
  MOV EDX, 0xA
  INT SYS_CALL 

  MOV EAX, SYS_EXIT
  MOV EBX, RET_EXIT
  INT SYS_CALL