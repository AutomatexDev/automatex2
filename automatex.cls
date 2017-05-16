\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{automatex}[2017/04/10 v0.1 TCC em Eng. de Controle e Automação UFRGS]

% classe base para o novo formato
\LoadClass[11pt,twoside]{article} % twoside permite que páginas pares e ímpares sejam diferentes

\RequirePackage[brazil, english]{babel}
%% Personalização da língua
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
  \newcommand{\orientadorname}{Adviser}
  \newcommand{\coorientadorname}{Co-adviser}
  \newcommand{\folhadeaprovacaoname}{Folha de Aprova\c{c}\~ao}
  \newcommand{\resumoname}{Abstract}
  \newcommand{\listadesiglasname}{List of Abbreviations}
  \newcommand{\listadesimbolosname}{List of Symbols}
  \newcommand{\fontename}{Font}
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
  \newcommand{\listadesiglasname}{Lista de Abreviaturas e Siglas}
  \newcommand{\listadesimbolosname}{Lista de S\'imbolos}
  \newcommand{\fontename}{Fonte}
  \newcommand{\notaname}{Nota}
}
\ProcessOptions\relax
\newcommand{\automatex}{{\scshape Automa}\TeX}

%% Pacotes de simbolos matemáticos
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

% catálogo de fontes em LaTeX em http://www.tug.dk/FontCatalogue/
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{cmbright}
%%%%% MODIFICAÇÕES TEMPORÁRIAS : descomentar as linhas abaixo para utilizar a fonte original
% \RequirePackage{fontspec}
% \RequirePackage{unicode-math}
% \RequirePackage{luatextra}
% \defaultfontfeatures{Ligatures=TeX}
% \setmainfont[Path=./fonts/,
%     BoldItalicFont=font_z.ttf,
%     BoldFont      =font_b.ttf,
%     ItalicFont    =font_i.ttf]{font.ttf}   % TODO: caracteres acentuados não estão funcionando
% \setmathfont[
%    range=\mathbfsfit/{greek,Greek,latin,Latin},
%    Path=./fonts/,
%    Extension=.otf]{./fonts/euler.otf} % TODO: configurar fonte matemática para negrito e itálico
%                                       % TODO: encontrar uma fonte matemática que pareça com a fonte de texto
%%% FIM DAS MODIFICAÇÕES TEMPORÁRIAS

%% Pacotes de referências e figuras
\RequirePackage{natbib}       % define referências bibliográficas para usar com bibtex
\RequirePackage{url}          % permite utilização de urls
\RequirePackage{graphicx}     % inserção de imagens
\RequirePackage{parskip}      % espaço extra entre parágrafos
% \RequirePackage{float}      % figura depois da citação. BUG: causa uma formatação estranha, REVISAR
% \RequirePackage{hyperref}   % destaca links, citações e referências cruzadas,
                              % BUG: causa alguns bugs principalmente na quebra de linha dos links
\RequirePackage{etoolbox}     % operações lógicas


%% Formatação e layout
\RequirePackage[top=1in, bottom=1.8in, left=1in, right=1in]{geometry} % margens
\RequirePackage[letterspace=100]{microtype}     %
\RequirePackage{fancyhdr}                       % cabeçalhos e rodapés
\RequirePackage{titlesec}                       % personalização dos títulos
\RequirePackage{natbib}                         % bibliografia
\RequirePackage[acronym]{glossaries}            % lista de abreviações e símbolos
\RequirePackage{titlesec}

%% Comandos e variáveis personalizadas
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\@supervisor}{\string\supervisor}
\newcommand*{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\newcommand*{\@shorttitle}{\string\shorttitle}

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
\titlespacing*{\subsection}{0pt}{2ex}{1ex}
\titlespacing*{\subsubsection}{0pt}{1ex}{1ex}
\titlespacing*{\paragraph}{0pt}{1ex}{1ex}
\setlength{\parskip}{1ex}

%% Bibliografia
%  https://gking.harvard.edu/files/natnotes2.pdf
\bibliographystyle{apecon} % TODO: dá pra escolher um estilo melhor que esse
\setcitestyle{authoryear,open={(},close={)},aysep={,}}

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

%% Ambientes personalizados
% Agradecimentos
\newenvironment{secaoagradecimentos}[1][\agradecimentosname]
{  \section*{\agradecimentosname}
   \addcontentsline{toc}{section}{\numberline{}\agradecimentosname}
}{ \newpage }
% Resumo
\newenvironment{secaoresumo}[1][\resumoname]
{  \section*{\resumoname}
   \addcontentsline{toc}{section}{\numberline{}\resumoname}
}{ \newpage }
% Figura
\newenvironment{figura}
{  \begin{figure}[!htbp]
   \centering
}{ \end{figure} }
% Figura
\newenvironment{tabela}
{  \begin{table}[!htbp]
   \centering
}{ \end{table} }

%% Itens que devem aparecer no Sumário
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
\newcommand{\simboloseabreviacoes}{
  \addcontentsline{toc}{section}{\numberline{}\listadesiglasname}
  \printglossary[type=\acronymtype,title=\listadesiglasname]
  \newpage
  \addcontentsline{toc}{section}{\numberline{}\listadesimbolosname}
  \printglossary[title=\listadesimbolosname]
  \newpage
}

% apêndices e anexos
% depois dos comandos \apendices e \anexos, apenas subseções e níveis inferiores são utilizados
\newcommand{\apendices}{
  \titlespacing*{\section}{0pt}{16ex}{0ex}
  \section*{\apendicesname}
  \addcontentsline{toc}{section}{\numberline{}\apendicesname}
  \renewcommand{\thesubsection}{\Alph{subsection}}
}

\newcommand{\anexos}{
  \titlespacing*{\section}{0pt}{16ex}{0ex}
  \section*{\anexosname}
  \addcontentsline{toc}{section}{\numberline{}\anexosname}
  \renewcommand{\thesubsection}{\Alph{subsection}}
}

% reduz o espaçamento antes e depois das equações equações
\makeatletter
\g@addto@macro\normalsize{%
  \setlength\abovedisplayskip{0.5ex}
  \setlength\belowdisplayskip{0.5ex}
  \setlength\abovedisplayshortskip{0.2ex}
  \setlength\belowdisplayshortskip{0.2ex}
}

%%% --- Folha de rosto e páginas iniciais
\renewcommand{\maketitle}{
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
      {\large\itshape \autorname: \@author\unskip\strut\\[.3cm]}
      {\normalsize\itshape \orientadorname: \@supervisor\unskip\strut}
    \end{flushright}
    % Cidade e data
    \vfill
    \begin{center}
      \normalsize Porto Alegre, \@date\par
    \end{center}
  \end{titlepage}
  %% fim da folha de capa
  \makeatother
  %% Páginas iniciais obrigatórias
  % numeração i, ii, iii... comançando na página i
  \pagenumbering{roman}
  \setcounter{page}{1}
  \tableofcontents
  %% TODO: fazer com que as duas páginas a seguir só sejam impressas se algum comando no main.tex seja executado

  \ifbool{agradecimentodefinido}{
  \begin{secaoagradecimentos}
    \textodeagradecimento
  \end{secaoagradecimentos}}{ % nada
  }

  \ifbool{resumodefinido}{
  \begin{secaoresumo}
    \textoderesumo
  \end{secaoresumo}}{ % nada
  }

  \listoffigures
  \listoftables
  \simboloseabreviacoes
  \makeatother
  % numeração 1, 2, 3... voltando à pagina número 1
  \pagenumbering{arabic}
  \setcounter{page}{1}
}
