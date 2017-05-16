# Automatex 2.0

Modelo de Trabalho de Conclusão de Curso da Engenharia de Controle e Automação da Universidade Federal do Rio Grande do Sul (UFRGS), versão de 2017/1, baseado no modelo disponível no site da [comgrad-cca](http://www.ufrgs.br/comgrad-cca/formularios/tcc/modelo-tcc-word-1/at_download/file).

### Idioma

A classe aceita dois idiomas: português e inglês. Assim, é necessário definir no início do documento qual dos idiomas vai ser utilizado por
```tex
\documentclass[portugues]{automatex}
```
ou
```tex
\documentclass[ingles]{automatex}
```

### Compilação

O projeto utiliza fontes locais na pasta `./fonts`, o que obriga a utilização do `lualatex` para gerar o arquivo pdf.

Para compilar o arquivo `.tex`, o comando deve ser algo do tipo
```bash
lualatex main.tex
```

### Dependências

A classe `automatex` utiliza alguns pacotes específicos para garantir a sua formatação. No Linux, se sugere instalar o pacote `texlive-full`, que garante que todas essas dependências sejam satisfeitas, com algum comando do tipo
```bash
sudo apt-get install texlive-full
```
