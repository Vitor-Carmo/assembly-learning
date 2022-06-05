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
  x dd 50     ; define doubleword x com valor 50 
  y dd 10     ; define doubleword y com valor 10
  msg1 db 'X maior que Y', LF, NULL
  tam1 equ $ - msg1 
  msg2 db 'Y maior que X', LF, NULL
  tam2 equ $ - msg2 

section .bss
  nome resb 1

section .text

global _start

_start:
  MOV EAX, DWORD[x] ; move x para EAX (EAX = 50)
  MOV EBX, DWORD[y] ; move y para EBX (EBX = 10)

  ;if - Comparação de valores

  cmp EAX, EBX ; compara EAX com EBX
  ; je = ,  jg > , jge >=, jl < , jle <=, jne !=

  jge maior ; se EAX for maior ou igual a EBX, entra na condição
  
  ; caso contrário, sai da condição
  MOV ECX, msg2 ; move msg2 para ECX
  MOV EDX, tam2 ; move tam2 para EDX

  jmp final 


maior: 
  MOV ECX, msg1 ; move msg1 para ECX
  MOV EDX, tam1 ; move tam1 para EDX

final: 
  MOV EAX, SYS_WRITE
  mov EBX, STD_OUT
  int SYS_CALL

  MOV EAX, SYS_EXIT
  XOR EBX, EBX ;MOV EBX, RET_EXIT ; AND OR XOR
  INT SYS_CALL


  