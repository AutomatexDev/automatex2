\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{automatex}[2017/04/10 v0.1 TCC em Eng. de Controle e Automação UFRGS]

%% Classe base para o novo formato: article
\LoadClass[12pt,twoside]{article}           % twoside permite que páginas pares e ímpares sejam diferentes
\RequirePackage[brazil, english]{babel}
%% Configuração da língua
\DeclareOption{ingles}{
  \AtEndOfClass{\main@language{english}}
  % Titulos em ingles TODO: verificar se isso tá certo
  \newcommand{\folhaderostoname}{Cover Sheet}
  \newcommand{\epigraphname}{Epigraph}
  \newcommand{\dedicatorianame}{Acknowledgments}
  \newcommand{\errataname}{Erratum}
  \newcommand{\agradecimentosname}{Acknowledgments}
  \newcommand{\anexoname}{ANNEX}
  \newcommand{\anexosname}{Annexes}
  \newcommand{\apendicename}{APPENDIX}
  \newcommand{\apendicesname}{Appendixes}
  \newcommand{\autorname}{Author}
  \newcommand{\orientadorname}{Advisor}
  \newcommand{\coorientadorname}{Co-adviser}
  \newcommand{\folhadeaprovacaoname}{Folha de Aprova\c{c}\~ao}
  \newcommand{\resumoname}{Abstract}
  \newcommand{\myabstractname}{Resumo}
  \newcommand{\listadesiglasname}{List of Abbreviations}
  \newcommand{\listadesimbolosname}{List of Symbols}
  \newcommand{\fontename}{Source}
  \newcommand{\notaname}{Note}
}
\DeclareOption{portugues}{
  \AtEndOfClass{\main@language{brazil}}
  % Títulos em português
  \newcommand{\folhaderostoname}{Folha de Rosto}
  \newcommand{\epigraphname}{Ep\'igrafe}
  \newcommand{\dedicatorianame}{Dedicat\'oria}
  \newcommand{\errataname}{Errata}
  \newcommand{\agradecimentosname}{Agradecimentos}
  \newcommand{\anexoname}{ANEXO}
  \newcommand{\anexosname}{Anexos}
  \newcommand{\apendicename}{AP\^ENDICE}
  \newcommand{\apendicesname}{Ap\^endices}
  \newcommand{\autorname}{Autor}
  \newcommand{\orientadorname}{Orientador}
  \newcommand{\coorientadorname}{Coorientador}
  \newcommand{\folhadeaprovacaoname}{Folha de Aprova\c{c}\~ao}
  \newcommand{\resumoname}{Resumo}
  \newcommand{\myabstractname}{Abstract}
  \newcommand{\listadesiglasname}{Lista de Abreviaturas e Siglas}
  \newcommand{\listadesimbolosname}{Lista de S\'imbolos}
  \newcommand{\fontename}{Fonte}
  \newcommand{\notaname}{Nota}
}
\ProcessOptions\relax

%% Comando especial para o logo do AutomaTEX
\newcommand{\automatex}{{\scshape Automa}\TeX}

%% Pacotes de simbolos matemáticos
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

%% Personalização da fonte: Times, 12pt
% catálogo de fontes em LaTeX em http://www.tug.dk/FontCatalogue/
\RequirePackage[utf8]{inputenc} % entrada de acentos, caracteres especiais
\RequirePackage[T1]{fontenc}    % fonte
\RequirePackage{times}          % fonte serifada
\RequirePackage{txfonts}        % fonte matemática

%% Pacotes para formatação do documento
\RequirePackage[hyphens]{url}               % permite utilização de urls
\RequirePackage{hyperref}                   % destaca links, citações e referências cruzadas,
\RequirePackage{graphicx}                   % inserção de imagens
\RequirePackage{parskip}                    % espaço extra entre parágrafos
\RequirePackage[skip=1ex]{caption}          % personaliza o espaço entre a legenda e a figura/fonte
\RequirePackage[letterspace=100]{microtype} % faz com que o título tenha um espaço maior entre as letras
\RequirePackage{fancyhdr}                   % cabeçalhos e rodapés
\RequirePackage{titlesec}                   % personalização dos títulos
\RequirePackage{setspace}                   % permite aumentar o espaço entre os títulos das seções
\RequirePackage{natbib}                     % bibliografia
\RequirePackage[top=1in, bottom=1.8in, left=1in, right=1in]{geometry} % margens
\RequirePackage[acronyms, nogroupskip, style=super]{glossaries}       % lista de abreviações e símbolos

%% Comandos e variáveis personalizadas
%  \makeatletter define o início da utilização dos macros "\@"
\makeatletter
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\@supervisor}{\string\supervisor}
\newcommand*{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\newcommand*{\@shorttitle}{\string\shorttitle}

%% Adiciona folhas de rosto
%% Seção começando em página ímpar
%\let\oldsection\section
%\def\section{\clearevenpage\oldsection}
%\def\clearevenpage{\clearpage\if@twoside \ifodd\c@page {}
%  \else\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%% Cabeçalhos e rodapés
\pagestyle{fancy}                                    % garante cabeçalho personalizado
\newcommand{\espacocabecalho}{1ex}                  % vspace após cada opção garante o espaçamento entre os textos e a linha divisória do cabeçalho
\fancyhead[LE,RO]{\thepage\vspace{\espacocabecalho}} % número da página
\fancyhead[LO]{\itshape Escola de Engenharia/UFRGS\;{--}\;\@author\vspace{\espacocabecalho}}
\fancyhead[RE]{\itshape\@shorttitle\vspace{\espacocabecalho}}
\fancyfoot[C]{ }

%% Formatação de seção, subseção...
\titleformat*{\section}{\Large\bfseries}
\titleformat*{\subsection}{\large\bfseries}
\titleformat*{\subsubsection}{\large\itshape}
\titleformat*{\paragraph}{\normalsize\bfseries}
\titleformat*{\subparagraph}{\normalsize\itshape}
\newcommand{\sectionbreak}{\clearpage}
\titlespacing*{\section}{0ex}{0ex}{2.5ex}
\titlespacing*{\subsection}{0ex}{2.5ex}{1.5ex}
\titlespacing*{\subsubsection}{0ex}{1.5ex}{1ex}
\titlespacing*{\paragraph}{0ex}{1ex}{1ex}
\setlength{\parskip}{1ex}

%% Bibliografia
%  https://gking.harvard.edu/files/natnotes2.pdf
\bibliographystyle{elsarticle-harv} % TODO: dá pra escolher um estilo melhor que esse
\setcitestyle{authoryear,open={(},close={)},aysep={,}}

%% Personalização/formatação das figuras e tabelas
\def\fps@figure{!h}
\def\fps@table{!h}
\g@addto@macro\@floatboxreset\centering
\newcommand{\source}[1]{\caption*{\fontename: {#1}}}

%% Operações logicas
\newbool{agradecimentodefinido}
\newcommand{\textodeagradecimento}{Obrigado.}
\newcommand{\agradecimentos}[1]{%
  \booltrue{agradecimentodefinido}
  \renewcommand{\textodeagradecimento}{#1}
}

\newbool{resumodefinido}
\newcommand{\textoderesumo}{Tudo resumido.}
\newcommand{\resumo}[1]{%
  \booltrue{resumodefinido}
  \renewcommand{\textoderesumo}{#1}
}

\newbool{abstractdefinido}
\newcommand{\textodeabstract}{Abstract.}
\newcommand{\myabstract}[1]{ % abstract already exists
  \booltrue{abstractdefinido}
  \renewcommand{\textodeabstract}{#1}
}

%% Ambientes personalizados
%  Agradecimentos
\newenvironment{secaoagradecimentos}[1][\agradecimentosname]
{  \section*{\agradecimentosname}
   \addcontentsline{toc}{section}{\numberline{}\agradecimentosname}
}{ \newpage }
%  Resumo
\newenvironment{secaoresumo}[1][\resumoname]
{  \section*{\resumoname}
   \addcontentsline{toc}{section}{\numberline{}\resumoname}
}{ \newpage }
%  Abstract
\newenvironment{secaoabstract}[1][\myabstractname]
{  \section*{\myabstractname}
   \addcontentsline{toc}{section}{\numberline{}\myabstractname}
}{ \newpage }

%% Fazemos com que os itens a seguir apareçam no sumário
\renewcommand\bibsection{\section{\refname}}
\renewcommand\listoffigures{ %
    \section*{\listfigurename}
    \addcontentsline{toc}{section}{\numberline{}\listfigurename}
    \@starttoc{lof}%
    \newpage
}
\renewcommand\listoftables{ %
    \section*{\listtablename}
    \addcontentsline{toc}{section}{\numberline{}\listtablename}
    \@starttoc{lot}%
    \newpage
}

%% Abreviações e símbolos
\makeglossaries
\setlength{\glsdescwidth}{0.7\textwidth}
\newcommand{\simboloseabreviacoes}{
  \addcontentsline{toc}{section}{\numberline{}\listadesiglasname}
  {\setstretch{1.4}
   \printglossary[type=\acronymtype,title=\listadesiglasname]}
  \newpage
  \addcontentsline{toc}{section}{\numberline{}\listadesimbolosname}
  {\setstretch{1.4}
    \printglossary[title=\listadesimbolosname]}
  \newpage
  \clearevenpage
}

%% Apêndices e anexos
%  depois dos comandos \apendices e \anexos, apenas subseções e níveis inferiores são utilizados
\newcommand{\apendices}{
  \titlespacing*{\section}{0pt}{16ex}{0ex}
  \section*{\apendicesname}
  \addcontentsline{toc}{section}{\numberline{}\apendicesname}
  \renewcommand{\thesubsection}{\Alph{subsection}}
  \setcounter{subsection}{0}
}

\newcommand{\anexos}{
  \titlespacing*{\section}{0pt}{16ex}{0ex}
  \section*{\anexosname}
  \addcontentsline{toc}{section}{\numberline{}\anexosname}
  \renewcommand{\thesubsection}{\Alph{subsection}}
  \setcounter{subsection}{0}
}

%% Reduz o espaço antes e depois das equações
\g@addto@macro\normalsize{%
  \setlength\abovedisplayskip{0.5ex}
  \setlength\belowdisplayskip{0.5ex}
  \setlength\abovedisplayshortskip{0.2ex}
  \setlength\belowdisplayshortskip{0.2ex}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- Folha de rosto e páginas iniciais
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
  \begin{titlepage}
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
      {\large\itshape \autorname: \@author\unskip\strut\\[.3cm]}
      {\normalsize\itshape \orientadorname: \@supervisor\unskip\strut}
    \end{flushright}
    % Cidade e data
    \vfill
    \begin{center}
      \normalsize Porto Alegre, \@date\par
    \end{center}
  \end{titlepage}
  %% Fim da folha de capa e da utilização dos macros (\makeatother)
  \makeatother
  %% Folha em branco: verso da capa
  \newpage\null
  \thispagestyle{empty}
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Páginas iniciais obrigatórias
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Numeração i, ii, iii... comançando na página i
  \pagenumbering{roman}
  \setcounter{page}{0}
  \newpage
  % sumário
  \tableofcontents
  % agradecimentos
  \ifbool{agradecimentodefinido}{
  \begin{secaoagradecimentos}
    \textodeagradecimento
  \end{secaoagradecimentos}}{ % nada
  }
  % resumo
  \ifbool{resumodefinido}{
  \begin{secaoresumo}
    \textoderesumo
  \end{secaoresumo}}{ % nada
  }
  % abstract
  \ifbool{abstractdefinido}{
  \begin{secaoabstract}
    \textodeabstract
  \end{secaoabstract}}{ % nada
  }
  % listas
  \listoffigures
  \listoftables
  \simboloseabreviacoes
  \makeatother
  % numeração 1, 2, 3... voltando à pagina número 1
  % cabeçalho à esquerda
  \pagenumbering{arabic}
  \setcounter{page}{1}
}
