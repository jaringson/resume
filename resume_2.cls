% File:	resume.cls
% By:		Daniel Koch
% Date:	21 Nov 2011
% This file provides a simple document class for creating resumes.
% It is not meant to be very flexible; it is just meant to make
% very simple resumes look nice.

% identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{resume}[2011/11/20 Simple resume class]

% initial settings
\renewcommand{\normalsize}{\fontencoding{T1}\fontfamily{ptm}\fontseries{m}\fontshape{n}\fontsize{10.95pt}{13pt}\selectfont}

% load packages
%\RequirePackageWithOptions{ifthen}[1994/06/01]
%\RequirePackage[margin=1in]{geometry}
\RequirePackage{pifont}

% declare options
\DeclareOption{letterpaper}{%
	\setlength{\paperwidth}{8.5in}%
	\setlength{\paperheight}{11in}%
	\setlength{\topmargin}{-0.25in}%
	\setlength{\oddsidemargin}{0.0in}%
	\setlength{\textwidth}{6.5in}%
	\setlength{\textheight}{10.0in}%
}

\DeclareOption{a4paper}{%
	\setlength{\paperwidth}{210mm}%
	\setlength{\paperheight}{297mm}%
	\setlength{\topmargin}{-0.25in}%
	\setlength{\oddsidemargin}{0.0in}%
	\setlength{\textwidth}{6.5in}%
	\setlength{\textheight}{9.5in}%
}

\ExecuteOptions{letterpaper}
\ProcessOptions\relax

% pagelayout
\newlength{\normalindent}
\setlength{\normalindent}{0.5in}
\setlength{\leftskip}{\normalindent}
\setlength{\parindent}{0in}

% horizontal rules
\newcommand{\headerrule}{\hspace*{-\normalindent}\rule[0.5ex]{\textwidth}{2pt}\\[-10.5pt]\hspace*{-\normalindent}\rule[0.5ex]{\textwidth}{1pt}}
\newcommand{\sectionrule}{\hspace*{-\normalindent}\rule[0.5ex]{\textwidth}{1pt}}

% font profiles
\newcommand{\namefont}{\fontseries{m}\fontshape{n}\fontsize{30pt}{35pt}\selectfont}
\newcommand{\sectionfont}{\fontseries{b}\fontshape{sc}\fontsize{14pt}{16pt}\selectfont}
\newcommand{\entrytitlefont}{\fontseries{b}\fontshape{n}\selectfont}
\newcommand{\entrycompanyfont}{\fontseries{m}\fontshape{it}\selectfont}
\newcommand{\entrylocationfont}{\fontseries{m}\fontshape{n}\selectfont}
\newcommand{\entrydatesfont}{\fontseries{m}\fontshape{n}\selectfont}
\newcommand{\referencenamefont}{\fontseries{b}\fontshape{n}\selectfont}
\newcommand{\referencetitlefont}{\fontseries{m}\fontshape{it}\selectfont}
\newcommand{\referencecompanyfont}{\fontseries{m}\fontshape{it}\selectfont}

% declare commands for author information
\def\@name{\relax}
\newcommand{\name}[1]{\gdef\@name{#1}}

\def\@address{\relax}
\newcommand{\address}[1]{\gdef\@address{#1}}

\def\@email{\relax}
\newcommand{\email}[1]{\gdef\@email{#1}}

\def\@phone{\relax}
\newcommand{\phone}[1]{\gdef\@phone{#1}}

% maketitle command
\newcommand{\maketitle}{%
	\hspace*{-\normalindent}{\namefont\@name}\newline%
	\headerrule\newline%
	\hspace*{-\normalindent}\@address\hspace*{\fill}\@phone\hspace*{\fill}\@email\rule[0pt]{0pt}{1em}\par%
}

% section command
\newcommand{\section}[1]{
	\vspace*{\fill}%
	\hspace*{-\normalindent}{\sectionfont #1}\\[-0.4em]%
	\sectionrule\par%
}

% entry environment
\newenvironment{entry}[4]%{job title}{company}{location}{dates}
	{\vspace{0.5em}%
		{\entrytitlefont #1}\newline%
		{\entrycompanyfont #2,}\hspace{1em plus0.1em minus0.5em}{\entrylocationfont #3,}\hspace{\fill}{\entrydatesfont #4}\par%
	}%
	{\par}%


% define itemize environment
\newcommand{\bulletsymbol}{{\fontsize{8pt}{9pt}\selectfont\ding{169}}}

\setlength{\leftmargin}{\normalindent}
\addtolength{\leftmargin}{\dimexpr0.5in}
\setlength{\itemindent}{0in}
\setlength{\labelsep}{0.15in}
\setlength{\labelwidth}{\labelsep}%\dimexpr0.25in-0.5em\relax}

\renewenvironment{itemize}%
	{\begin{list}{\bulletsymbol}{}}%
	{\end{list}}

% references environment
\newenvironment{references}
	{\vspace*{\fill}% fill remainder of resume page for spacing
	\newpage%
	\maketitle%
	\begin{center}%
	\vspace{1.5em}%
	\hspace*{-\normalindent}{\sectionfont References}\\%
	\sectionrule\par%
	}%
	{\end{center}}%

\newcommand{\reference}[6]% {name}{title}{company}{address}{phone}{email}
	{\vspace*{\fill}%
	\hspace*{-\normalindent}{\referencenamefont#1}\\%
	\hspace*{-\normalindent}{\referencetitlefont#2}\\%
	\hspace*{-\normalindent}{\referencecompanyfont#3}\\%
	\vspace{0.2em}%
	\hspace*{-\normalindent}#4\\%
	\vspace{0.2em}
	\hspace*{-\normalindent}#5\\%
	\hspace*{-\normalindent}#6\\%
	}%

% beginning of document
\AtBeginDocument{%
	\normalsize
}

% end of document
\AtEndDocument{%
	\vspace*{\fill}
}
