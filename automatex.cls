\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{automatex}[2017/04/10 v0.1 TCC em Eng. de Controle e Automação UFRGS]

% classe base para o novo formato
\LoadClass[12pt,twoside]{article} % twoside permite que páginas pares e ímpares sejam diferentes

%% Pacotes de simbolos matemáticos
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

%% Personalização da fonte
%  catálogo de fontes em LaTeX em http://www.tug.dk/FontCatalogue/
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[brazil]{babel}
\usepackage{cmbright}           % Font: Computer Modern Bright

%% Pacotes de referências e figuras
\RequirePackage{natbib}       % define referências bibliográficas para usar com bibtex
\RequirePackage{url}          % permite utilização de urls
\RequirePackage{graphicx}     % inserção de imagens
\RequirePackage{parskip}      % espaço extra entre parágrafos
% \RequirePackage{flafter}      % figura depois da citação
% \RequirePackage{hyperref}     % destaca links, citações e referências cruzadas
% \usepackage{calc}             % TESTE: é necessário para o comando fbox

%% Formatação e layout
\RequirePackage[top=1in, bottom=1.8in, left=1in, right=1in]{geometry}
\RequirePackage[letterspace=100]{microtype}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{natbib}                         % bibliografia
\RequirePackage[acronym]{glossaries}            % lista de abreviações e símbolos

%% Comandos e variáveis personalizadas
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\@supervisor}{\string\supervisor}
\newcommand*{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\newcommand*{\@shorttitle}{\string\shorttitle}

%% Cabeçalhos e rodapés
\pagestyle{fancy}                                                           % garante cabeçalho personalizado
\fancyhead[LE,RO]{\thepage\vspace{.4cm}}                                    % número da página
\fancyhead[LO]{\itshape Escola de Engenharia/UFRGS - \@author\vspace{.4cm}}
\fancyhead[RE]{\itshape\@shorttitle\vspace{.4cm}}
\fancyfoot[C]{ }
% vspace após cada opção garante o espaçamento entre os textos e a linha divisória do cabeçalho

\renewcommand{\maketitle}{ % folha de rosto
  \begin{titlepage}
    \makeatletter
    \begin{minipage}[c]{.2\textwidth}
      \centering
      \includegraphics[height=.13\textheight]{imagens/logo_ufrgs}
    \end{minipage}
    \begin{minipage}[c]{.65\textwidth}
      \centering
      UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL \\[.2cm]
      ESCOLA DE ENGENHARIA \\[.2cm]
      TRABALHO DE CONCLUSÃO EM ENGENHARIA DE CONTROLE E AUTOMAÇÃO
    \end{minipage}
    \hfill
    \begin{minipage}[c]{.2\textwidth}
      \centering          % nada aqui porque no modelo não tem nada TODO: botamos o logo da EE aqui?
      \includegraphics[height=.13\textheight]{imagens/logo_eng}
    \end{minipage}
    \par
    \vspace{.1\textheight}
    %% Título do trabalho
    \begin{center}
    % \fbox{ %% HINT: o comando fbox evidencia qual a área reservada pro título
     \begin{minipage}[c][.4\textheight][c]{.9\textwidth}
        {\centering\Huge\bfseries\lsstyle\@title\unskip\strut\par} % TODO: o tamanho Huge é menor do que o usado no modelo, deixamos assim?
      \end{minipage}
      % }
    \end{center}
    \vspace{.05\textheight}
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

%% Formatação de seção, subseção...
\titleformat*{\section}{\Large\bfseries}
\titleformat*{\subsection}{\large\bfseries}
\titleformat*{\subsubsection}{\large\itshape}
\titleformat*{\paragraph}{\normalsize\bfseries}
\titleformat*{\subparagraph}{\normalsize\itshape}
\newcommand{\sectionbreak}{\clearpage}

%% Bibliografia
%  https://gking.harvard.edu/files/natnotes2.pdf
\bibliographystyle{humanbio} % TODO: dá pra escolher um estilo melhor que esse
\setcitestyle{authoryear,open={(},close={)},aysep={,}}
\renewcommand\bibsection{\section{\refname}}
%% TODO: o estilo da bibliografia não está mudando, independente do escolhido

%% Abreviações e símbolos
\makeglossaries

%% Configuração das seções do preâmbulo
