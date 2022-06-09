%include 'bibliotecaE.inc'



section .data
  v1 dw '105', LF, NULL



section .text


global _start

_start:

  call coverter_valor
  call mostrar_valor

  mov eax, SYS_EXIT
  mov ebx, RET_EXIT
  int SYS_CALL


  coverter_valor:
    lea esi, [v1]
    mov ecx, 0x3
    call string_to_int
    add eax, 0x2
    ret

  mostrar_valor:
    call int_to_string
    call saidaResultado
    ret


  ;----------------------------
  ; string para inteiro
  ;----------------------------
  ; Entrada: ESI (valor conv)  ECX (tam)
  ; Saida..: EAX
  ;----------------------------
  string_to_int:
    xor ebx, ebx; zera
  .prox_digito:
    movzx eax, byte [esi]; pega o byte
    inc esi; passa para o proximo byte
    sub al, '0'; subtrai '0'
    imul ebx, 0xA; multiplica por 10
    add ebx, eax; soma o byte
    loop .prox_digito; loop ate o fim
    mov eax, ebx; retorna o valor
    ret



  ;----------------------------
  ; inteiro para string  
  ;----------------------------
  ; Entrada: inteiro em EAX
  ; Saida..: BUFFER (valor ECX) TAM_BUFFER (EDX)
  ;----------------------------
  int_to_string:
    lea esi, [BUFFER]
    add esi, 0x9; para o espaco
    mov byte[esi], 0xA; insere o LF
    mov ebx, 0xA; zera
    .prox_digito:
      xor edx, edx; zera
      div ebx; divide por 10
      add dl, '0'; soma '0'
      dec esi; decrementa o ponteiro
      mov [esi], dl; insere o byte
      test eax, eax; testa se eax eh zero
      jnz .prox_digito; loop ate o fim
      ret


    

