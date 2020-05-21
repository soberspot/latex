%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Classe de rapport pédagogique
%%
%% Vincent Labatut 2014-2018
%%
%% v3.7.7 - 06/2018 : refonte complète du contenu, correction de bugs mineurs
%% v3.7.6 - 05/2018 : ajout d'une date optionnelle
%% v3.7.5 - 04/2018 : correction bug couleur en-tête/pied-de-page
%% v3.7.4 - 03/2018 : définition des sections par un package plus approprié
%% v3.7.3 - 12/2017 : corrections diverses dans le contenu
%% v3.7.2 - 12/2017 : précision sur les références bibliographiques
%% v3.7.1 - 11/2017 : corrections diverses dans le contenu
%% v3.7   - 11/2017 : paragraphes désormais plus numérotés, insertion optionnelle d'un résumé
%% v3.6   - 10/2017 : passage de la bibliographie en BibLaTeX (au lieu de BibTeX)
%% v3.5   - 09/2017 : ajout du pseudo-code (package algorithm2e) et du groupe en page de titre
%% v3.4   - 10/2016 : un nom d'auteur par ligne, titre possible sur deux lignes
%% v3.3   - 05/2016 : ajout de l'option "full" (page de garde, tables des figures et tableaux)
%% v3.2   - 04/2016 : ajout de l'option "light" (pas de page de garde, compilation plus rapide)
%% v3.1   - 02/2016 : package icomma pour les virgules décimales en français
%% v3     - 01/2016 : définition de la classe LaTeX, correction de quelques erreurs dans le texte
%% v2.4   - 12/2015 : diverses modifications du contenu du document
%% v2.3   - 04/2015 : page de titre complétée (date, adresse postale, long titre)
%% v2.2   - 03/2015 : correction de quelques bugs
%% v2.1   - 03/2015 : définition de la page de titre
%% v2     - 02/2015 : modèle complètement refait
%% v1     - 10/2014 : forme de rapport très différente
%%
%% TODO :
%%   - Problème avec l'insertion d'espace avant ":" dans les listings.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% init class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ceri}[2016/01/08 Report LaTeX class]
\LoadClass[a4paper, 11pt, final]{article}	% based on the existing latex class


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% encoding and stuff

\RequirePackage[english,french,russian]{babel}		% language package
%\frenchsetup{AutoSpacePunctuation=false}	% disable space insertion before colon (doesn't work)
%	\RequirePackage{polyglossia}			% alternative to babel for LuaLaTeX
%	\setmainlanguage{french}
\RequirePackage[utf8]{inputenc}				% use source file containing diacritics
\RequirePackage[T1]{fontenc}				% select font encoding and allow hyphenation
\RequirePackage{soul}						% improves hyphenation


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% font settings
%\RequirePackage[babel=true, kerning=true]
%				{microtype}					% typographical refinements >> conflicts with the compiler
\RequirePackage{lmodern}					% uses better fonts (?)
\renewcommand{\familydefault}{\sfdefault}	% use a sans-serif font as in the official template
\RequirePackage{xspace}						% add missing spaces
\RequirePackage{icomma}						% no space inserted after commas in expressions such as 1,23 (French)
\RequirePackage{eurosym}					% euro symbol (€)
\RequirePackage{textcomp}					% degree character (°)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% needed for UAPV title page formating
\RequirePackage{graphicx}					% improves \includegraphics
\sodef\ugg{}{.4em plus 1fill}{1em plus 2 fill}{2em plus 2fill minus.1em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% space-related settings
\RequirePackage[top=2.5cm, 
	bottom=2.5cm, 
    left=2.5cm, 
    right=2.5cm]{geometry}					% changes document margins
\RequirePackage{setspace}					% controls spacing between lines


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% misc
\RequirePackage[french]{varioref} 			% improves cross-refs
\RequirePackage{lipsum}						% inserts filler text
\RequirePackage{xifthen}					% if/then expressions
\RequirePackage{printlen}					% displays lengths
\RequirePackage{xstring}					% handles strings functions
\RequirePackage{titling}					% better control over the title
\RequirePackage{authoraftertitle}			% accesses title and author names
\RequirePackage{datetime}					% custom date format


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% header/footer settings
\RequirePackage{lastpage}					% computes the number of pages
\RequirePackage{fancyhdr}					% changes headers and setters
\setlength{\headheight}{14pt}				% increases header size
\newcommand{\setHeaders}{					% macro initializing the headers and footers
	\pagestyle{fancy}
	\fancyhf{}
	\chead{\textcolor{black}{\MyTitle}}
	\cfoot{\textcolor{black}{\thepage\ / \pageref*{LastPage}}}
%	\renewcommand{\headrulewidth}{0.4pt}
%	\renewcommand{\footrulewidth}{0.4pt}
	\renewcommand\headrule{					% color and thickness of the header rule
    	{\color{black}\hrule width \hsize}}
	\renewcommand\footrule{					% color and thickness of the header rule
    	{\color{black}\hrule width \hsize} \kern 1mm}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% color settings
\RequirePackage[table]{xcolor}				% defines custom colors
\let\normalcolor\relax						% prevent automatic restoration to black
\definecolor{DarkColor}{gray}{0.75}			% colors used throughout the document
\definecolor{LightColor}{gray}{0.9}
\definecolor{LightGrey}{rgb}{0.96,0.96,0.96}
\definecolor{DarkGrey}{rgb}{0.83,0.83,0.83}
\definecolor{BaseColor}{rgb}{0.64,0.69,0.31}
\definecolor{TextColor}{rgb}{0.44,0.49,0.11}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% watermark settings
\RequirePackage{draftwatermark}				% watermark
\SetWatermarkText{ }
\SetWatermarkScale{1}
\SetWatermarkLightness{0.95}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diagram settings
\RequirePackage{tikz}						% programmatically defines drawings
\usetikzlibrary{arrows}						% configures arrow tips
\usetikzlibrary{arrows.meta}				% necessary to draw graphs
\tikzset{>=latex}							% uses larger default arrow tips
\usetikzlibrary{calc}						% extended coordinate calculation
\usetikzlibrary{decorations.markings}		% improved decorations
\usetikzlibrary{math}						% use mathematical functions
\usetikzlibrary{positioning} 				% ease relative positioning


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hyperlinks settings
\RequirePackage[
	bookmarks=true, bookmarksnumbered=true, bookmarksopen=true,
	unicode=true, colorlinks=true, linktoc=all, %linktoc=page
	linkcolor=TextColor, citecolor=TextColor, filecolor=TextColor, urlcolor=TextColor,
	pdfstartview=FitH
]{hyperref}									% enables hyperlinks
\RequirePackage{url}						% properly displays urls


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% table settings
\RequirePackage{multirow}						% cells spanning several rows
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}	% thicker line for the tables
\RequirePackage{tabularx} 						% for larger tables
\RequirePackage{array}							% extends table and array functions
% Macro by A. Kassi 							% don't remember what this is for...
% http://www.ukonline.be/programmation/latex/tutoriel/chapitre4/page2.php
\makeatletter
	\def\hlinewd#1{
	\noalign{\ifnum0=`}\fi\hrule \@height #1
	\futurelet\reserved@a\@xhline}
\makeatother
% end macro


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mathematical settings
\RequirePackage{amsmath}						% extended mathematical functions
\RequirePackage{amsthm}							% even more advanced math functions
\RequirePackage{amssymb}  						% additional math symbols
\newtheorem{theorem}{Theorem}					% those are not really needed here, but whatever
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{fact}[theorem]{Fact}
\newtheorem{Hypothesis}[theorem]{Hypothesis}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{definition}[theorem]{Definition}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bibliographic settings
%\RequirePackage[numbers]{natbib}		% incompatible with biblatex
\RequirePackage{doi}					% displays DOIs in the bibliography
\RequirePackage[autostyle]{csquotes}	% don't remember why I put this
\RequirePackage[maxcitenames=2,			% two authors max in the text (only for author-year)
	maxbibnames=99,						% list all authors in the reference list
	style=numeric,						% numeric style for reference list
	citestyle=numeric-comp,				% numeric style for citations
%	style=authoryear,					% NOTE: if you want the author-year style instead,
%	citestyle=authoryear-comp,			% uncomment these 2 lines and comment both ones above
%	backref=true,						% includes a page backlink in the reference list
%	dashed=false,						% displays all author names (only for authoryear)
    backend=biber]						% uses biber to compile (instead of bibtex)
{biblatex}								% uses biblatex (instead of bibtex)
%\renewcommand*{\bibfont}				% changes font size for biblio
%		{\footnotesize} 				
\newcommand{\bibName}{Bibliographie}	% define bibliography header
\AtEveryCite{\restorecommand\mkbibnamefamily}	% avoid small caps in citations (French)
\setlength\bibitemsep{0.9\itemsep}		% reduce space between bibliographic items
% command to insert the bibliography
	\newcommand{\MyBibliography}{					% receives the bibtex file
		\newpage
		\phantomsection
		\addcontentsline{toc}{section}{\bibName}	% add the bibliography in the TOC
		{	\setstretch{0.8}
       		\printbibliography
		}
		\thispagestyle{fancy}						% force header/footer
	}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% caption settings
\RequirePackage{caption}					% caption customisation
\captionsetup{
	labelfont={color=TextColor, bf, small},	% font(sf), color, bold, size of the caption label
	textfont={small},						% font(sf) and size of the caption text itself
	labelsep=period,						% separator between label and text
	margin=10mm								% left/right margins
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom floats
\RequirePackage{subfig}						% subfloats (subfigures, subtables...)
\RequirePackage{float}	 					% custom floats environments
%\RequirePackage{tocloft}	 				% list of custom float objects


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom equations
\makeatletter								% change equation numbers
\def\tagform@#1{\maketag@@@{(\color{TextColor}\textbf{#1}\normalcolor)\@@italiccorr}}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom algorithms
\RequirePackage[french,boxed,linesnumbered]	% environment for pseudo code
    	{algorithm2e}
\SetAlCapFnt{\color{TextColor}}				% change caption font (in algorithm floats)


%%%%%%%%%%%%%%%%%%%%%%%%%
% bullet list
%\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\FrenchLabelItem}{\textbullet}	% use bullets even in French
\usepackage{enumitem}							% gives more control over lists
\setlist{nolistsep}								% changes spacing between list items


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% macros used to set the document details
\def\classname#1{\gdef\myclassname{#1}}			% class name (Programming, Operating Systems...)
\def\formation#1{\gdef\myformation{#1}}			% name of the class (Licence or Master in CS)
\def\groupe#1{\gdef\mygroup{#1}}				% group (for a project report)
\def\parcours#1{\gdef\myparcours{#1}}			% specialization (software engineering vs. computer networks)
\def\resume#1{\gdef\myresume{#1}}				% abstract (for a paper)
\def\date#1{\gdef\mydate{#1}}					% date (optional)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom section headers
\RequirePackage{titlesec}
\titleformat{\section}
	{\color{TextColor}\normalfont\Large\bfseries}
    {\thesection}
    {1em}
    {}
\titleformat{\subsection}
	{\color{TextColor}\normalfont\large\bfseries}
    {\thesubsection}
    {1em}
    {}
\titleformat{\subsubsection}
	{\color{TextColor}\normalfont\normalsize\bfseries}
    {\thesubsubsection}
    {1em}
    {}
%\setcounter{secnumdepth}{5}			% number subsubsections
%\setcounter{tocdepth}{5}				% and include them in the TOC
\setcounter{secnumdepth}{3}				% number subsubsections
\setcounter{tocdepth}{3}				% and include them in the TOC
% NOTE: only (?) for the report class
%	\RequirePackage{chngcntr}			% defines specific counters
%	\counterwithout{section}{chapter}	% hide the chapter number in section headings


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom listings
\usepackage{listings}
\definecolor{colKeywords}{RGB}{127,  0, 85}
\definecolor{colComments}{RGB}{107,139,171}
\definecolor{colStrings} {RGB}{ 42,  0,255}

\definecolor{bg}   {rgb}{0.97,0.97,0.97}
\definecolor{gray} {rgb}{0.50,0.50,0.50}
\definecolor{mauve}{rgb}{0.58,0.00,0.82}
\lstset{%frame=tb,
	aboveskip=1mm,
	belowskip=1mm,
	showstringspaces=false,
	columns=flexible,
	basicstyle={\small\ttfamily\NoAutoSpacing},
	keywordstyle=\color{colKeywords},
	commentstyle=\color{colComments},
	stringstyle=\color{colStrings},
    backgroundcolor=\color{bg},
%	numbers=left,
	numbers=none,
	numberstyle=\tiny\color{gray},
	breaklines=true,
	breakatwhitespace=true,
	tabsize=3,
    literate=%
		{à}{{\`a}}1
        {À}{{\`A}}1
		{â}{{\^a}}1
        {Â}{{\^A}}1
		{ç}{{\c{c}}}1
        {Ç}{{\c{C}}}1
		{é}{{\'e}}1
        {É}{{\'E}}1
		{è}{{\`e}}1
        {È}{{\`E}}1
		{ë}{{\"e}}1
        {Ë}{{\"E}}1
		{ê}{{\^e}}1
        {Ê}{{\^E}}1
		{ï}{{\"i}}1
        {Ï}{{\"I}}1
		{î}{{\^i}}1
        {Î}{{\^I}}1
		{ö}{{\"o}}1
        {Ö}{{\"O}}1
		{ô}{{\^o}}1
        {Ö}{{\^O}}1
		{ù}{{\`u}}1
        {Ù}{{\`U}}1
		{ü}{{\"u}}1
        {Ü}{{\"U}}1
		{û}{{\^u}}1
        {Û}{{\^U}}1
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% names of the specialized tables of content
\newcommand{\tocName}{Sommaire}									% define TOC header
\addto\captionsfrench{\renewcommand{\contentsname}{\tocName}}	% change TOC header
\newcommand{\lofName}{Liste des figures}						% define LOF header
%\renewcommand{\listfigurename}{\lofName}						% change LOF header (1)
\addto\captionsfrench{\renewcommand{\listfigurename}{\lofName}}	% change LOF header (2)
\newcommand{\lotName}{Liste des tables}							% define LOT header
%\renewcommand{\listtablename}{\lotName}						% change LOT header (1)
\addto\captionsfrench{\renewcommand{\listtablename}{\lotName}}	% change LOT header (2)
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% specialized tables of content
\newcommand{\MyToc}{
	\phantomsection
	\addcontentsline{toc}{section}{\tocName}	% add the TOC in the TOC (yes! for PDF bookmarks)
	\tableofcontents							% insert TOC
	\thispagestyle{fancy}						% force header/footer
	\newpage
}
\newcommand{\MyLof}{
	\phantomsection
	\addcontentsline{toc}{section}{\lofName}	% add the LOF in the TOC
	\listoffigures								% insert LOF
	\thispagestyle{fancy}						% force header/footer
	\newpage
}
\newcommand{\MyLot}{
	\phantomsection
	\addcontentsline{toc}{section}{\lotName}	% add the LOT in the TOC
	\listoftables								% insert LOT
	\thispagestyle{fancy}						% force header/footer
	\newpage
}		


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% regular title page
\newcommand{\maketitleZ}{
	% setup PDF doc info
	\hypersetup{
    	pdftitle={\ifdefined\MyTitle \MyTitle \else \fi},
	   	pdfauthor={\ifdefined\MyAuthor \MyAuthor \else \fi},
    	pdfsubject={\ifdefined\myclassname \myclassname \else \fi}
	}
	
	% custom headers and footers
	\setHeaders
       
	% draw title page
	\phantomsection 
	\addcontentsline{toc}{section}{Titre}	% add the title page in the TOC (yes! for PDF bookmark)
	\begin{titlepage}
		\begin{tikzpicture}[remember picture,overlay]
			% vertical lines
	    	\node at (current page.south west)
			{	\begin{tikzpicture}[remember picture,overlay]
					\fill[fill=LightGrey]  (0cm,21.2cm) rectangle(21cm,29.7cm);
					\fill[fill=DarkGrey] (0cm,0cm) rectangle(21cm,21.2cm);
					\fill[fill=BaseColor] (1cm,0cm) rectangle(5.2cm,21.2cm);
					\pgftext[x=1cm,y=21.4cm,bottom,left]{\includegraphics[width=4.2cm]{images/UAPV-intitule-CMJN.png}};
					\pgftext[x=1.1cm,y=20.5cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{\ugg{\textbf{CENTRE}}}}}};
					\pgftext[x=1.1cm,y=20cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{\ugg{\textbf{D'ENSEIGNEMENT}}}}}};
					\pgftext[x=1.1cm,y=19.5cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{\ugg{\textbf{ET DE RECHERCHE}}}}}};
					\pgftext[x=1.1cm,y=18.9cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{\ugg{\textbf{EN INFORMATIQUE}}}}}};
					\ifdefined\myformation \pgftext[x=5.5cm,y=18.2cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{\myformation}}}}; \else\fi
					\ifdefined\myparcours \pgftext[x=5.5cm,y=17.7cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{\myparcours}}}}; \else\fi
					\ifdefined\myclassname \pgftext[x=5.5cm,y=17.2cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{UE} \myclassname}}}; \else\fi
%					\pgftext[x=3.5cm,y=16.2cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{30}{30}{\fontfamily{phv}\selectfont{}\textbf{}}}};
					\pgftext[x=3.5cm,y=16.5cm,top,left]{\scalebox{0.77}[1]{\fontsize{30}{30}{\fontfamily{phv}\selectfont{}\textbf{\textcolor{white}{>{}>{}>}\hspace{0.7cm}\textcolor{BaseColor}{\parbox[t]{19cm}{\raggedright\MyTitle}}}}}};
%					\pgftext[x=5.5cm,y=14.5cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{20}{20}{\fontfamily{phv}\selectfont{}\textcolor{BaseColor}{\MyAuthor}}}};
%					\path ++(2, 0);
					\pgftext[x=5.5cm,y=13.2cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{\ifdefined\mydate {\mydate} \else {\today} \fi}}}};
					\ifdefined\mygroup \pgftext[x=5.5cm,y=12.6cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\mygroup}}}; \else\fi
					\pgftext[x=5.5cm,y=12.0cm,top,left]{\scalebox{0.77}[1]{\fontsize{20}{20}{\fontfamily{phv}\selectfont{}\textcolor{BaseColor}{\begin{minipage}{19cm}\MyAuthor\end{minipage}}}}};
					\pgftext[x=1.1cm,y=5.2cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{CERI - LIA}}}};
					\pgftext[x=1.1cm,y=4.7cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{339 chemin des Meinajariès}}}};
					\pgftext[x=1.1cm,y=4.4cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{BP 1228}}}};
					\pgftext[x=1.1cm,y=4.0cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{84911 AVIGNON Cedex 9}}}};
					\pgftext[x=1.1cm,y=3.6cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{France}}}};
					\pgftext[x=1.1cm,y=2.9cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{Tél. +33 (0)4 90 84 35 00}}}};
					\pgftext[x=1.1cm,y=2.4cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{Fax +33 (0)4 90 84 35 01}}}};
					\pgftext[x=1.1cm,y=1.8cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{http://ceri.univ-avignon.fr}}}};                        
				\end{tikzpicture}
			};
		\end{tikzpicture}
	\end{titlepage}

	\setcounter{page}{2} 	% set the second page... to number 2
	\thispagestyle{fancy}	% force header/footer
	\newpage
		
	% insert abstract
	\ifdefined\myresume
		\phantomsection
		\addcontentsline{toc}{section}{\abstractname}	% add the abstract in the TOC
		\noindent \textbf{\huge \abstractname}
           
		\vspace{1cm}
		\myresume
		\newpage
	\else\fi
        
	% insert ToC
	\MyToc
}
\renewcommand{\maketitle}{\maketitleZ}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handles the "light" option
\DeclareOption{light}{%
	\SetWatermarkText{BROUILLON}

	\renewcommand{\maketitle}{
		% setup PDF doc info
		\hypersetup{
    		pdftitle={\ifdefined\MyTitle \MyTitle \else \fi},
	    	pdfauthor={\ifdefined\MyAuthor \MyAuthor \else \fi},
    		pdfsubject={\ifdefined\myclassname \myclassname \else \fi}
		}
			
		% custom headers and footers
		\pagestyle{fancy}
		\fancyhf{}
		\renewcommand{\headrulewidth}{0.4pt}
		\renewcommand{\footrulewidth}{0.4pt}
		\cfoot{\thepage\ / \pageref*{LastPage}} 
		\chead{\MyTitle} 

		% first page style
		\fancypagestyle{firststyle}
		{	\fancyhf{}
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{0.4pt}
			\cfoot{\thepage\ / \pageref*{LastPage}} 
		}
			
		% draw title page
		\phantomsection 
		\addcontentsline{toc}{section}{Titre}	% add the title page in the TOC (yes! for PDF bookmark)
		\begin{center}
           	% title
			\Huge{\textbf{\textcolor{TextColor}{\MyTitle}}} \\
			% authors
			\Large{\MyAuthor} \\
			% group name
			\ifdefined\mygroup
				\normalsize{\mygroup} \\
			\else\fi
			% grade name
            \ifdefined\myformation
				\normalsize{\textbf{\myformation}}
				\ifdefined\myparcours
					\normalsize{ -- }
				\else
					\\
				\fi
			\else\fi
			\ifdefined\myparcours
            	\normalsize{\textbf{\myparcours}} \\
            \else\fi
			% class name
			\ifdefined\myclassname
				\normalsize{\textbf{UE} \myclassname} \\
			\else\fi
            % date
			\ifdefined\mydate
				\small{\mydate} \\
			\else
				\small{\today} \\
			\fi
            % abstract
            \ifdefined\myresume
            	\phantomsection
                \addcontentsline{toc}{section}{\abstractname}	% add the abstract in the TOC
                \parbox[c][][s]{0.75\textwidth}{\footnotesize \vspace{0.5cm} \noindent \textbf{\abstractname.} \myresume}
			\else\fi
		\end{center}	
	
		\setcounter{page}{1} 		% set the second page... to number 2
		\thispagestyle{firststyle}	% force header/footer
	}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handles the "full" option
\DeclareOption{full}{%
	\renewcommand{\maketitle}
	{	\maketitleZ
    	% Insert list of figures
		\MyLof
		% Insert list of tables
		\MyLot
	}
}
\ProcessOptions


