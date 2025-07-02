\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rrling}[2025/05/08 Document class for submissions to Registered Reports in Linguistics]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check XeLaTeX is used
\RequirePackage{iftex}
\ifXeTeX
    % OK: XeLaTeX is in use
\else
    \errmessage{This document must be compiled with XeLaTeX}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper,11pt]{article}

\usepackage[hidelinks]{hyperref}
\RequirePackage[margin=1in]{geometry}

\RequirePackage{lipsum}
\RequirePackage{etoolbox}
\RequirePackage{orcidlink}
\RequirePackage{xparse}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define colours
\RequirePackage{xcolor}
\definecolor{red}{RGB}{110,13,17}
\definecolor{blue}{RGB}{0,75,108}
\definecolor{orange}{RGB}{182,110,24}
\definecolor{yellow}{RGB}{250,182,08}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set headers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\setlength{\headheight}{15pt}
\fancyhf{}
\fancyhead[L]{\textit{Registered Reports in Linguistics}}
\fancyhead[R]{\@shortauthors}
\fancyfoot[R]{\thepage}
\fancypagestyle{empty}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[R]{\thepage}
}
\thispagestyle{empty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set fonts
\RequirePackage{fontspec}
% \setmainfont{Source Sans Pro}
% \setsansfont{Source Sans Pro}
\RequirePackage{academicons}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set preamble commands
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\rescompendium}[1]{\def\@rescompendium{#1}}
\renewcommand{\abstract}[1]{\def\@abstract{#1}}

\newcommand{\@authors}{}
\newcommand{\@affiliations}{}

\NewDocumentCommand{\addauthor}{mmm}{
    \ifstrempty{#2}
    {\gappto\@authors{{\sffamily #1\textsuperscript{#3}}\\}}
    {\gappto\@authors{{\sffamily #1\textsuperscript{#3}~\orcidlink{#2}}\\}}
}

\NewDocumentCommand{\addaffiliation}{mm}{
    \gappto\@affiliations{\textsuperscript{#1}#2\\}
}

\newcommand{\shortauthors}[1]{\def\@shortauthors{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine \maketitle
\RequirePackage{lastpage}

\renewcommand{\maketitle}{
    \vspace*{-7em}
    \noindent
    \begin{minipage}[b]{0.7\textwidth}
        \textbf{Registered Reports in Linguistics}, \the\year, 1--\pageref{LastPage}
        \vspace{0.25em}\\
        \textcolor{yellow}{\aiDoi} .../... \\
        Research article \textcolor{red}{\aiPreregistered} \textcolor{blue}{\aiOpenData} \textcolor{orange}{\aiOpenMaterials}
    \end{minipage}%
    \hfill
    \begin{minipage}[b]{0.28\textwidth}
        \raggedleft
        \includegraphics[width=3cm]{rrling-logo-bg.png}
    \end{minipage}
    \noindent\rule{\textwidth}{2pt}\par
    \begin{flushleft}
        {\sffamily\LARGE\bfseries \@title \par}
        \vskip 1em
        {\sffamily\large \@authors \par}
        \vskip 0.5em
        {\footnotesize\sffamily \@affiliations}
    \end{flushleft}
    \vskip 1em
    \ifx\@abstract\@empty\else
        {\sffamily\noindent{\bfseries Abstract} \vspace{1em} \par \noindent\@abstract \par}
    \fi
    \vskip 1em
    \ifx\@keywords\@empty\else
        {\sffamily\noindent\bfseries Keywords}: \@keywords \par
    \fi
    {\sffamily\noindent\bfseries Research Compendium}: \textcolor{yellow}{\aiDoi} \url{\@rescompendium} \par
    \vspace{1em}\noindent\rule{\textwidth}{2pt}\par
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set defaults
\def\@abstract{\lipsum[1]}
\def\@keywords{keyword1, keyword2}
\def\@rescompendium{https://www.doi.org/10.1000/182}
