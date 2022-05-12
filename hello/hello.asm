; Compilação -> nasm -f elf64 hello.asm -> compilando seu código fonte para algo próximo de 01
; Linkedição -> ld -s -o hello hello.o  -> tranformar em executavel 

section .data ; constantes
  msg: db 'Hello World!', 0xA
  tam: equ $- msg

section .text

global _start ; ponteiro chamado _start (obrigatório)

_start:
  mov eax, 0x4
  mov ebx, 0x1
  mov ecx, msg
  mov edx, tam
  int 0x80

exit:
  ; sintaxe mov:  destino, origem EAX = 1
  ; hex 0x1 = 1
  mov eax, 0x1 ; mandando para OS que o programa está sendo terminado
  mov ebx, 0x0 ; mandando pro OS o return é 0
  int 0x80 ; seria um cambio, mandando para o OS pegar a informação e processar ela