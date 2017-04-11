\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{automatex}[2017/04/10 v0.1 TCC em Eng. de Controle e Automação UFRGS]

% classe base para o novo formato
\LoadClass[12pt,twoside]{article} % twoside permite que páginas pares e ímpares sejam diferentes

% https://en.wikibooks.org/wiki/LaTeX/Document_Structure#Document_classes
%% Pacotes de linguagem pt-br
\RequirePackage{luatextra}
\RequirePackage[brazil]{babel}
\defaultfontfeatures{Ligatures=TeX}

%% Pacotes de simbolos matemáticos
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

%% Personalização da fonte
%  catálogo de fontes em LaTeX em http://www.tug.dk/FontCatalogue/
\usepackage{fontspec}
\usepackage{unicode-math}
\setmainfont[Path=./fonts/,
    BoldItalicFont=font_z.ttf,
    BoldFont      =font_b.ttf,
    ItalicFont    =font_i.ttf]{font.ttf}   % TODO: caracteres acentuados não estão funcionando
\setmathfont[Path=./fonts/]{latinmodern-math.otf} % TODO: configurar fonte matemática para negrito e itálico
                                           % TODO: encontrar uma fonte matemática que pareça com a fonte de texto

%% Pacotes de referências e figuras
\RequirePackage{natbib}       % define referências bibliográficas para usar com bibtex
\RequirePackage{url}          % permite utilização de urls
\RequirePackage{hyperref}     % destaca links, citações e referências cruzadas
\RequirePackage{graphicx}     % inserção de imagens
\RequirePackage{parskip}      % espaço extra entre parágrafos

%% Formatação e layout
\RequirePackage[top=1in, bottom=1.8in, left=1in, right=1in]{geometry}
\RequirePackage[letterspace=100]{microtype}
\RequirePackage{fancyhdr}

%% Cabeçalhos e rodapés
\pagestyle{fancy}                                                           % garante cabeçalho personalizado
\fancyhead[LE,RO]{\thepage\vspace{.4cm}}                                    % número da página
\fancyhead[LO]{\itshape Escola de Engenharia/UFRGS - \@author\vspace{.4cm}}
\fancyhead[RE]{\itshape\@title\vspace{.4cm}}
\fancyfoot[C]{ }
% vspace após cada opção garante o espaçamento entre os textos e a linha divisória do cabeçalho

%% Comandos e variáveis personalizadas
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\@supervisor}{\string\supervisor}

\renewcommand{\maketitle}{ % folha de rosto
  \begin{titlepage}
    \makeatletter
    \begin{minipage}[c]{.2\textwidth}
      \centering
      \includegraphics[height=.13\textheight]{imagens/logo_ufrgs}
    \end{minipage}
    \hspace{.02\textwidth}
    \begin{minipage}[c]{.6\textwidth}
      \centering
      UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL \\[.2cm]
      ESCOLA DE ENGENHARIA \\[.2cm]
      TRABALHO DE CONCLUSAO EM ENGENHARIA DE CONTROLE E AUTOMACAO
    \end{minipage}
    \hfill
    \begin{minipage}[c]{.2\textwidth}
      \centering          % nada aqui porque no modelo não tem nada TODO: botamos o logo da EE aqui?
      \hspace{\textwidth} % \includegraphics[height=.13\textheight]{imagens/logo_eng}
    \end{minipage}
    \par
    \vspace{.25\textheight}
    %% Título do trabalho
    \begin{center}
      \begin{minipage}[c]{.8\textwidth}
        {\centering\Huge\bfseries\lsstyle\@title\unskip\strut\par} % TODO: o tamanho Huge é menor do que o usado no modelo, deixamos assim?
      \end{minipage}
    \end{center}
    \vspace{.3\textheight}
    % Autor e orientador
    \begin{flushright}
      {\large\itshape Autor: \@author\unskip\strut\\[.3cm]}
      {\normalsize\itshape Orientador: \@supervisor\unskip\strut}
    \end{flushright}
    % Cidade e data
    \vfill
    \begin{center}
      \normalsize Porto Alegre, \@date\par
    \end{center}
\end{titlepage}
\makeatother
}
