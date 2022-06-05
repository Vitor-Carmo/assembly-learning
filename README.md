# 🤖 Assembly
minhas anotações sobre o assunto ou simplesmente uma cola.

## NASM

O **compilador** e **linkeditor** é a sigla para _"The Netwide Assembly"_. NASM foi originalmente escrito por _Simon Tatham_ com a assistência de _Julian Hall_.

Para o **Ubuntu** um simples comando instala o NASM a partir do terminal:

```bash
$ sudo apt install nasm
```

Em um terminal e digitamos o seguinte comando para **compilar** o algum
programa:

```bash
$ nasm -f elf64 nome-do-programa.asm
```

Uma vez executado sem erros, o seguinte comando para **linkeditar** o programa:

```bash
$ ld -s -o nome-do-programa nome-do-programa.o
```

E podemos **executá-lo** com o seguinte comando:

```
$ ./hello
```

## Compilação e Linkedição

Ao invés de ficarmos sofrendo tendo que inserir 2 comandos (até parece que é muita coisa) para compilar
e linkeditar nosso programa, vamos criar um arquivo especial que realiza esse trabalho. Obrigatoriamente
seu nome deve ser **makefile**, então crie um arquivo com esse nome e digite os seguintes comandos:

```makefile
NOME = entrada

all: $(NOME).o
  ld -s -o $(NOME) $(NOME).o
  rm -rf *.o;

%.o: %.asm
  nasm -f elf64 $<
```

## O que são registradores?

São **posições de memória** dentro do processador com nomes específicos, é como se fossem **variáveis**.

## Como é o funcionamento básico de um Registrador?

São endereços que armazenam dados por um curto período para que o processador possa manipular esse dado ou usá-lo para manipular algum outro. Inclusive alguns servem para controle fundamental do funcionamento do processador ou da execução do seu código, em geral coisas que você nem sabe se existe.


## O mínimo que você precisa para rodar um programa em assembly:


```nasm
section .data

section .text

global _start

_start:
  mov eax, 0x1
  mov ebx, 0x0
  int 0x80
```

## Tipos de dados

| Sigla  | Tipo               | Significado                        | Bytes  |
|--------|--------------------|------------------------------------|--------|
| db     |Define Byte         |alocação de 8 bits                  |1 byte  |
| dw     |Define Word         |alocação de 16 bits                 |2 bytes |
| dd     |Define Doubleword   |alocação de 32 bits                 |4 byte  |
| dq     |Define Quadword     |alocação de 64 bits                 |8 byte  |
| ddq    |Define Double Quad  |alocação de 128 bits - para inteiros|10 bytes|
| dt     |Define Ten Bytes    |alocação de 128 bits - para decimais|10 bytes|


## comparação de valores assemby

| Mnemônico| Significado            | Contrário  | Significado                |
|----------|------------------------|------------|----------------------------|
| JE       | Salta se igual         |JNE         | Salta se não igual         |
| JG       | Salta se maior         |JG          | Salta se não maior         |
| JL       | Salta se menor         |JNL         | Salta se não menor         |
| JGE      | Salta se maior ou igual|JNGE        | Salta se não maior ou igual|
| JLE      | Salta se menor ou igual|JNLE        | Salta se não menor ou igual|
