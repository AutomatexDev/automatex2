# Automatex 2.0

Modelo de Trabalho de Conclusão de Curso da Engenharia de Controle e Automação da Universidade Federal do Rio Grande do Sul (UFRGS), versão de 2017/1, baseado no modelo disponível no site da [comgrad-cca](http://www.ufrgs.br/comgrad-cca/formularios/tcc/modelo-tcc-word-1/at_download/file).

### Formatação e comandos

Para informações sobre os comandos, opções de formatação e mais dicas, pode-se consultar o [arquivo exemplo](main.pdf).

### Compilação

O projeto atualmente não segue exatamente o mesmo estilo de fonte definido no [modelo](modelo_2017_1.pdf), no entanto, a fonte personalizada se encontra mesmo assim na pasta `./fonts`. Para utilizar esta fonte, é obrigatório a utilização do `lualatex` para gerar o arquivo pdf.

Deixando tudo isso de lado, para compilar o arquivo `main.tex`, por exemplo, os comandos devem seguir algo do tipo
```bash
pdflatex main
makeglossaries main
bibtex main
pdflatex main
pdflatex main
```
o que permite gerar todos arquivos auxiliares, de glossário e de bibliografia.

### Dependências

A classe `automatex` utiliza alguns pacotes específicos para garantir a sua formatação. No Linux, se sugere instalar o pacote `texlive-full`, que garante que todas essas dependências sejam satisfeitas, com algum comando do tipo
```bash
sudo apt-get install texlive-full
```

#### Lista dos pacotes utilizados pela classe automatex

* `amsmath`
* `amsfonts`
* `amssymb`
* `inputenc`: entrada de acentos, caracteres especiais
* `fontenc`: fonte
* `times`: fonte serifada
* `txfonts`: fonte matemática
* `url`: permite utilização de urls
* `hyperref`: destaca links, citações e referências cruzadas,
* `graphicx`: inserção de imagens
* `parskip`: espaço extra entre parágrafos
* `caption`: personaliza o espaço entre a legenda e a figura/fonte
* `microtype`: faz com que o título tenha um espaço maior entre as letras
* `fancyhdr`: cabeçalhos e rodapés
* `titlesec`: personalização dos títulos
* `setspace`: permite aumentar o espaço entre os títulos das seções
* `natbib`: bibliografia
* `geometry`: margens
