# Automatex 2.0

Modelo de Trabalho de Conclusão de Curso da Engenharia de Controle e Automação da Universidade Federal do Rio Grande do Sul (UFRGS), versão de 2017/1, baseado no modelo disponível no site da [comgrad-cca](http://www.ufrgs.br/comgrad-cca/formularios/tcc/modelo-tcc-word-1/at_download/file).

### Compilação

O projeto utiliza fontes locais na pasta `./fonts`, o que obriga a utilização do `lualatex` para gerar o arquivo pdf.

Para compilar o arquivo `.tex`, o comando deve ser algo do tipo
```bash
lualatex main.tex
```

### Dependências

A classe `automatex` utiliza alguns pacotes específicos para garantir a sua formatação
* `inputenc`, `babel`, `fontenc`: pacotes de linguagem (padrões do Latex) que permitem a utilização de acentos e definem a nomenclatura em pt-br
* `amsmath`, `amsfonts`, `amssymb`: símbolos matemáticos
* `fontspec`, `unicode-math`: permitem a utilização de fontes locais, obrigam a utilização do `lualatex`
* `geometry`, `microtype`, `fancyhdr`: pacotes especiais para definir o layout do documento
