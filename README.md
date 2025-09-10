# Trabalho Compiladores GA
Este repositório foi criado pelos alunos Vitor Goulart e Melissa Pizzato para o trabalho do grau A da disciplina de compiladores na Universidade do Vale do Rio dos Sinos 2025/2.

## Requistos:
1. Analisador léxico Flex;
2. Compilador de código C (gcc, clang, etc.).

## Forma de uso
Primeiramente deve-se compilar o código lex com o flex, gerando um arquivo lex.yy.c usando o sequinte comando.

```flex lex.l```

Em seguida o código lex.yy.c deve ser compilado com o compilador C.
Por fim é necessário executar o resultado compilado com utilizando o arquivo input.in com entrada

```./[saída_do_compilador] < input.in```
