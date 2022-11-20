% Class Metadata ===================================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{summary}[Research Summary: Alex Jackson]

% Load Article Class as Base
\LoadClass[11pt]{article}


% Package Configuration ============================================================================
% Page Layout
\RequirePackage[a4paper, margin=1.25in, headheight=14pt]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{fontspec}

\setmainfont{Times New Roman}

% Referencing
\usepackage[
    style=ieee, 
    doi=false, 
    isbn=false, 
    url=false, 
    sorting=nty, 
    date=year, 
    dashed=false, 
    citestyle=numeric-comp,
    maxcitenames=2,
    mincitenames=2,
]{biblatex}

% General Utilities
\RequirePackage{amsmath}     % Mathematical Typesetting
\RequirePackage{amssymb}     % Mathematical Symbols
\RequirePackage{amsthm}      % Mathematical Theorems
\RequirePackage{graphicx}    % Images and Graphics
\RequirePackage{glossaries}  % Acronyms and Glossaries
\RequirePackage{xcolor}      % Colour Utilities

% Document Settings ================================================================================
% Hide language in references
\AtEveryBibitem{\clearlist{language}}

% Line Spacing
\renewcommand{\baselinestretch}{1.25}

% Header
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\nouppercase{\rightmark}}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}

\fancypagestyle{plain}{
    \fancyhf{} 
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}


% Document Variables ===============================================================================
\newcommand{\@abstract}{}
\renewcommand{\abstract}[1]{\renewcommand{\@abstract}{#1}}

\newcommand{\loadcommands}[1]{\input{#1}}

\definecolor{secondary}{HTML}{3b3b3b}

% Front Matter =====================================================================================
\renewcommand{\maketitle}{
    {
        {\noindent\huge\textbf{\@title}\vspace{6pt}}\\
        {\color{secondary}\Large\@author\hspace{6pt}$\bullet$\hspace{6pt}\@date}
    }
}


% Theorems & Environments ==========================================================================
% Custom Theorems
\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]
\newtheorem{example}{Example}[section]
\newtheorem{assumption}{Assumption}[section]

\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}{Lemma}[section]
\renewenvironment{proof}{\noindent\textbf{Proof:}}{\qed}

% Comment Box Environment
\RequirePackage{mdframed}    % Box Environment
\RequirePackage{xcolor}      % Colour Extension
\mdfdefinestyle{comment-style}
{
    backgroundcolor=black!10, 
    font=\small\itshape,
    userdefinedwidth=.9\linewidth,
    align=center
}
\newenvironment{commentbox}
{
    \vspace{10pt}
    \begin{mdframed}[style=comment-style]
        \centering
}
{
    \end{mdframed}
    \vspace{10pt}
}
