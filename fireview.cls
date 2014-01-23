%%
%% LaTeX style class for Thesis Review on FI MUNI.
%% Author: Ph4r05
%% Date: 23.1.2014
%% 
%% Based on letter style class.
%% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fireview}[2014/01/23 version 0.1 MU Review class]

\newcommand\@ptsize{}
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility
  \DeclareOption{twoside}{\@latexerr{No `twoside' layout for letters}%
                                   \@eha}
\else
  \DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\fi
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0.7em}
\setlength\parindent{0\p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setlength\headheight{12\p@}
\setlength\headsep   {45\p@}
\setlength\footskip{25\p@}
\if@compatibility
  \setlength\textwidth{365\p@}
  \setlength\textheight{505\p@}
\fi
\if@compatibility
  \setlength\oddsidemargin{53pt}
  \setlength\evensidemargin{53pt}
  \setlength\marginparwidth{90pt}
\else
  \setlength\@tempdima{\paperwidth}
  \addtolength\@tempdima{-2in}
  \addtolength\@tempdima{-\textwidth}
  \setlength\oddsidemargin   {.5\@tempdima}
  \setlength\evensidemargin  {\oddsidemargin}
  \setlength\marginparwidth  {90\p@}
\fi
\setlength\marginparsep {11\p@}
\setlength\marginparpush{5\p@}
\setlength\topmargin{27pt}
\setlength\footnotesep{12\p@}
\setlength{\skip\footins}{10\p@ \@plus 2\p@ \@minus 4\p@}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@oddhead{\slshape\headtoname{} \ignorespaces\toname
                    \hfil \@date
                    \hfil \pagename{} \thepage}%
      \let\@evenhead\@oddhead}
\else
  \def\ps@headings{%
      \let\@oddfoot\@empty
      \def\@oddhead{\slshape\headtoname{} \ignorespaces\toname
                    \hfil \@date
                    \hfil \pagename{} \thepage}}
\fi
\def\ps@empty{%
      \let\@oddfoot\@empty\let\@oddhead\@empty
      \let\@evenfoot\@empty\let\@evenhead\@empty}
\def\ps@firstpage{%
     \let\@oddhead\@empty
     \def\@oddfoot{\raisebox{-45\p@}[\z@]{%
        \hb@xt@\textwidth{\hspace*{100\p@}%
          \ifcase \@ptsize\relax
             \normalsize
          \or
             \small
          \or
             \footnotesize
          \fi
        \fromlocation \hfill \telephonenum}}\hss}}
\def\ps@plain{%
      \let\@oddhead\@empty
      \def\@oddfoot{\normalfont\hfil\thepage\hfil}%
      \def\@evenfoot{\normalfont\hfil\thepage\hfil}}

\newcommand*{\name}[1]{\def\fromname{#1}}
\newcommand*{\signature}[1]{\def\fromsig{#1}}
\newcommand*{\address}[1]{\def\fromaddress{#1}}
\newcommand*{\location}[1]{\def\fromlocation{#1}}
\newcommand*{\telephone}[1]{\def\telephonenum{#1}}
\name{}
\signature{}
\address{}
\location{}
\telephone{}
\newcommand*{\makelabels}{%
  \AtBeginDocument{%
     \let\@startlabels\startlabels
     \let\@mlabel\mlabel
     \if@filesw
       \immediate\write\@mainaux{\string\@startlabels}\fi}%
  \AtEndDocument{%
     \if@filesw\immediate\write\@mainaux{\string\clearpage}\fi}}
\@onlypreamble\makelabels
\newenvironment{letter}[1]
  {\newpage
    \if@twoside \ifodd\c@page
                \else\thispagestyle{empty}\null\newpage\fi
    \fi
    \c@page \@ne
    \c@footnote \z@
    \interlinepenalty=200 % smaller than the TeXbook value
    \@processto{\leavevmode\ignorespaces #1}}
  {\stopletter\@@par\pagebreak\@@par
    \if@filesw
      \begingroup
        \let\\=\relax
        \let\protect\@unexpandable@protect
        \immediate\write\@auxout{%
          \string\@mlabel{\returnaddress}{\toname\\\toaddress}}%
      \endgroup
    \fi}
\long\def\@processto#1{%
  \@xproc #1\\@@@%
  \ifx\toaddress\@empty
  \else
    \@yproc #1@@@%
  \fi}
\long\def\@xproc #1\\#2@@@{\def\toname{#1}\def\toaddress{#2}}
\long\def\@yproc #1\\#2@@@{\def\toaddress{#2}}
\newcommand*{\stopbreaks}{%
  \interlinepenalty\@M
  \def\par{\@@par\nobreak}%
  \let\\\@nobreakcr
  \let\vspace\@nobreakvspace}
\DeclareRobustCommand\@nobreakvspace
   {\@ifstar\@nobreakvspacex\@nobreakvspacex}
\def\@nobreakvspacex#1{%
  \ifvmode
    \nobreak\vskip #1\relax
  \else
    \@bsphack\vadjust{\nobreak\vskip #1}\@esphack
  \fi}
\def\@nobreakcr{\@ifstar{\@normalcr*}{\@normalcr*}}
\newcommand*{\startbreaks}{%
  \let\\\@normalcr
  \interlinepenalty 200%
  \def\par{\@@par\penalty 200\relax}}
\newdimen\longindentation
\longindentation=.5\textwidth
\newdimen\indentedwidth
\indentedwidth=\textwidth
\advance\indentedwidth -\longindentation
\newcommand*{\opening}[1]{\ifx\@empty\fromaddress
  \thispagestyle{firstpage}%
    {\raggedleft\@date\par}%
  \else  % home address
    \thispagestyle{empty}%
    {\raggedleft\begin{tabular}{l@{}}\ignorespaces
      \fromaddress \\*[2\parskip]%
      \@date \end{tabular}\par}%
  \fi
  \vspace{2\parskip}%
  {\raggedright \toname \\ \toaddress \par}%
  \vspace{2\parskip}%
  #1\par\nobreak}
\newcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
  \stopbreaks
  \noindent
  \ifx\@empty\fromaddress\else
  \hspace*{\longindentation}\fi
  \parbox{\indentedwidth}{\raggedright
       \ignorespaces #1\\[6\medskipamount]%
       \ifx\@empty\fromsig
           \fromname
       \else \fromsig \fi\strut}%
   \par}
\medskipamount=\parskip
\newcommand*{\cc}[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{%
    \@hangfrom{\normalfont\ccname: }%
    \ignorespaces #1\strut}\par}
\newcommand*{\encl}[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{%
    \@hangfrom{\normalfont\enclname: }%
    \ignorespaces #1\strut}\par}
\newcommand*{\ps}{\par\startbreaks}
\newcommand*{\stopletter}{}
\newcommand*{\returnaddress}{}
\newcount\labelcount
\newcommand*{\startlabels}{\labelcount\z@
  \pagestyle{empty}%
  \let\@texttop\relax
  \topmargin -50\p@
  \headsep \z@
  \oddsidemargin -35\p@
  \evensidemargin -35\p@
  \textheight 10in
  \@colht\textheight  \@colroom\textheight \vsize\textheight
  \textwidth 550\p@
  \columnsep 26\p@
  \ifcase \@ptsize\relax
    \normalsize
  \or
    \small
  \or
    \footnotesize
  \fi
  \baselineskip \z@
  \lineskip \z@
  \boxmaxdepth \z@
  \parindent \z@
  \twocolumn\relax}
\let\@startlabels=\relax
\newcommand*{\mlabel}[2]{%
  \parbox[b][2in][c]{262\p@}{\strut\ignorespaces #2}%
  }
\let\@mlabel=\@gobbletwo
\setlength\leftmargini  {2.5em}
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength\leftmargin    {\leftmargini}
\setlength  \labelsep  {5\p@}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\setlength\partopsep{0\p@}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\def\@listI{\setlength\leftmargin{\leftmargini}%
            \setlength\parsep {0\p@}%
            \setlength\topsep {.4em}%
            \setlength\itemsep{.4em}}
\let\@listi\@listI
\@listi
\def\@listii {\setlength  \leftmargin{\leftmarginii}%
              \setlength  \labelwidth{\leftmarginii}%
              \addtolength\labelwidth{-\labelsep}}
\def\@listiii{\setlength  \leftmargin{\leftmarginiii}%
              \setlength  \labelwidth{\leftmarginiii}%
              \addtolength\labelwidth{-\labelsep}%
              \setlength  \topsep    {.2em}%
              \setlength  \itemsep   {\topsep}}
\def\@listiv {\setlength  \leftmargin{\leftmarginiv}%
              \setlength  \labelwidth{\leftmarginiv}%
              \addtolength\labelwidth{-\labelsep}}
\def\@listv  {\setlength  \leftmargin{\leftmarginv}%
              \setlength  \labelwidth{\leftmarginv}%
              \addtolength\labelwidth{-\labelsep}}
\def\@listvi {\setlength  \leftmargin{\leftmarginvi}%
              \setlength  \labelwidth{\leftmarginvi}%
              \addtolength\labelwidth{-\labelsep}}
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*{\descriptionlabel}[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\=\@centercr
                \list{}{\setlength\itemsep{\z@}%
                        \setlength\itemindent{-15\p@}%
                        \setlength\listparindent{\itemindent}%
                        \setlength\rightmargin{\leftmargin}%
                        \addtolength\leftmargin{15\p@}}%
                \item[]}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\setlength\listparindent{1.5em}%
                        \setlength\itemindent{\listparindent}%
                        \setlength\rightmargin{\leftmargin}}%
                \item[]}
               {\endlist}
\newenvironment{quote}
               {\list{}{\setlength\rightmargin{\leftmargin}}%
                \item[]}
               {\endlist}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand\theequation{\@arabic\c@equation}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\relax}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\relax}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}
\renewcommand\footnoterule{%
  \kern-\p@
  \hrule \@width .4\columnwidth
  \kern .6\p@}
\long\def\@makefntext#1{%
    \noindent
    \hangindent 5\p@
    \hb@xt@5\p@{\hss\@makefnmark}#1}
\newcommand*{\ccname}{cc}
\newcommand*{\enclname}{encl}
\newcommand*{\pagename}{Page}
\newcommand*{\headtoname}{To}
\newcommand*{\today}{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\raggedbottom
\def\@texttop{\ifnum\c@page=1\vskip \z@ plus.00006fil\relax\fi}
\onecolumn

% -------------------------------------------------------------------------
%   <Thesis review>
% -------------------------------------------------------------------------
\RequirePackage{palatino}
%\RequirePackage{babel}

% Disabling page numbering
\pagenumbering{gobble} %\pagenumbering{arabic}

\def\ReviewDefaultGeometry{%
\textwidth 6.75in
\oddsidemargin -.25in
\evensidemargin -.25in
\textheight 10.0in
\topmargin -1.0in
\longindentation 0.50\textwidth
\parindent 0.4in
}

% Definition of language support: Czech (default), English and Slovak
\def\Langcs{cs}
\def\Langsk{sk}
\def\Langen{en}
\def\@reviewlang{cs}

% Review keyword
\def\ThesisReview{%
\ifx\@reviewlang\Langen
    Review%
 \else \ifx\@reviewlang\Langcs
	Posudek%
    \else
	Posudok%
    \fi
\fi
}

% Thesis type
\def\ThesisTypeBc{bc}
\def\ThesisTypeMgr{mgr}
\def\@thesistype{\ThesisTypeBc}
\def\@thesisacro{BP}

% Definition of review title, Czech, Slovak, English
\def\BachelorThesisCs{Bakal\'{a}\v{r}sk\'{e} pr\'{a}ce}
\def\BachelorThesisSk{Bakal\'{a}rskej pr\'{a}ce}
\def\BachelorThesisEn{of a Bachelor thesis}
\def\MasterThesisCs{Diplomov\'{e} pr\'{a}ce}
\def\MasterThesisSk{Diplomovej pr\'{a}ce}
\def\MasterThesisEn{of a Diploma thesis}
\def\@reviewsubtitle{Bakal\'{a}rskej pr\'{a}ce} % default thesis title
\def\ThesisReviewTitle{%
    \ifx\@thesistype\ThesisTypeBc
	\ifx\@reviewlang\Langen
	    \BachelorThesisEn
	 \else \ifx\@reviewlang\Langcs
	    \BachelorThesisCs
	   \else 
	    \BachelorThesisSk
	   \fi
	 \fi
    \else \ifx \@thesistype\ThesisTypeMgr
	\ifx\@reviewlang\Langen
	    \MasterThesisEn
	 \else \ifx\@reviewlang\Langcs
	    \MasterThesisCs
	   \else 
	    \MasterThesisSk
	   \fi
	 \fi
     \else 
	\@reviewsubtitle
     \fi
    \fi
}

% Acronym for the thesis type
\def\ThesisAcronym{%
    \ifx\@thesistype\ThesisTypeBc
	\ifx\@reviewlang\Langen
	    BT%
	 \else \ifx\@reviewlang\Langcs
	    BP%
	   \else 
	    BP%
	   \fi
	 \fi
    \else \ifx \@thesistype\ThesisTypeMgr
	\ifx\@reviewlang\Langen
	    DT%
	 \else \ifx\@reviewlang\Langcs
	    DP%
	   \else 
	    DP%
	   \fi
	 \fi
     \else 
	\@thesisacro%
     \fi
    \fi
}

% Labels for thesis review template, localized
\def\@labelstudent{%
\ifx\@reviewlang\Langen
    Student%
 \else \ifx\@reviewlang\Langcs
	Student%
    \else
	\v{S}tudent%
    \fi \fi
}
\def\@labeladvisor{%
\ifx\@reviewlang\Langen
    \ThesisAcronym~Advisor%
 \else \ifx\@reviewlang\Langcs
	Vedouc\'{i}~\ThesisAcronym%
    \else
	Ved\'{u}ci~\ThesisAcronym%
    \fi \fi
}
\def\@labeloponent{%
\ifx\@reviewlang\Langen
    \ThesisAcronym~Oponent%
 \else \ifx\@reviewlang\Langcs
	Oponent~\ThesisAcronym%
    \else
	Oponent~\ThesisAcronym%
    \fi \fi
}
\def\@labeltitle{%
\ifx\@reviewlang\Langen
    Title%
 \else \ifx\@reviewlang\Langcs
	N\'{a}zev%
    \else
	N\'{a}zov%
    \fi \fi
}
\def\@labelreview{%
\ifx\@reviewlang\Langen
    Review%
 \else \ifx\@reviewlang\Langcs
	Posudek%
    \else
	Posudok%
    \fi
\fi
}
\def\@labelmark{%
\ifx\@reviewlang\Langen
    Rating%
 \else \ifx\@reviewlang\Langcs
	Hodnocen\'{i}%
    \else
	Hodnotenie%
    \fi
\fi
}

% Table with basic information about thesis
\def\ThesisReviewBox{%
    \noindent
    {
	\renewcommand{\arraystretch}{1.5}
	\hspace{-0.25in}
	\begin{tabular}{l l}
	\bf \@labelstudent: & \ThesisStudent \\ 		 % [1.5ex] manual line spacing
	\bf \@labeladvisor: & \ThesisAdvisor \\
	\bf \@labeloponent: & \ThesisOponent \\
	\bf \@labeltitle: & \ThesisTitle \\
	\bf \@labelreview: &  ~
	\end{tabular}
    }
}

% Thesis final grade:
\def\Grade#1{{\bf \MakeUppercase{#1}}}

% Rating:
\def\ThesisRating{%
    \noindent
    {\bf \@labelmark:}
}

% Rating environment
\newenvironment{thesisrating}
{
    \noindent
    {\bf \@labelmark:}
    
}{}

% Commands to global definiton
\def\reviewsubtitle#1{\gdef\@reviewsubtitle{#1}}
\def\newreviewsubtitle#1{\gdef\@reviewsubtitle{#1}}
\def\thesistype#1{\gdef\@thesistype{#1}}
\def\thesisacro#1{\gdef\@thesisacro{#1}}
\def\ThesisStudent#1{\gdef\@ThesisStudent{#1}}
\def\ThesisAdvisor#1{\gdef\@ThesisAdvisor{#1}}
\def\ThesisOponent#1{\gdef\@ThesisOponent{#1}}
\def\ThesisTitle#1{\gdef\@ThesisTitle{#1}}
\def\ReviewDate#1{\gdef\@ReviewDate{#1}}
\def\ReviewAuthor#1{\gdef\@ReviewAuthor{#1}} % Your name
\def\Role#1{\gdef\@Role{#1}}
\def\What#1{\gdef\@What{#1}} % Your title
\def\Where#1{\gdef\@Where{#1}a} % Your department/institution
\def\Address#1{\gdef\@Address{#1}} % Your address
\def\reviewlang#1{\gdef\@reviewlang{#1} 

    \ifx\@reviewlang\Langen
 	\usepackage[english]{babel}
 	\selectlanguage{english}
	\ifx \uv\undefined \newcommand\uv[1]{``{##1}''}
	\else \renewcommand\uv[1]{``{##1}''} \fi
     \else \ifx\@reviewlang\Langcs
	\usepackage[czech]{babel}
	\selectlanguage{czech}
      \else 
	\usepackage[slovak]{babel}
	\selectlanguage{slovak}
      \fi
    \fi
}

% Create a new command for the horizontal rule in the document which allows thickness specification
\makeatletter
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
\makeatother

\font\filogo fi-logo at 22mm % as logo of FI, METAFONT logo will be used        
\address{%
\hspace{-6.0in} % Position of the institution logo, increase to move left, decrease to move right
{\filogo SL}%\\[0.4in]
\vskip -1.05in~\\ % Position of the text in relation to the institution logo, increase to move down, decrease to move up
\hspace{\fill}\parbox[t]{2.5in}{ % Create a box for your details underneath the horizontal rule on the right
\linespread{1.2}%
\selectfont 
\ReviewAuthor \\ % Your name, all text after this will be italicized \em % italization
\Where\\ % Your department
\Address \\% Your address
}
~\\%[-0.11in] % Reduce the whitespace above the horizontal rule
\vhrulefill{0.5pt}\\
\vspace{0.25in} % Move the letter content up for a more compact look
\centering \Large \bf \MakeUppercase{\ThesisReview~\ThesisReviewTitle}
}

\def\myopening#1{\thispagestyle{empty}
{\centering\fromaddress \vspace{0.1in} \\ % Print the header and from address here, add whitespace to move date down
\hspace*{\longindentation}\hspace*{\fill}\par
}}

\newcommand\signatureRole[2]{%
    \centering \rule{1.5in}{1pt}\\
    \vspace{12pt}

    \parbox{4cm}{
    \centering
    #1\\
    (#2)
    }
}

\long\def\myclosing#1{
    \vspace*{\fill} % Put this block on the bottom of the page
    \noindent % Stop paragraph indentation
    \parbox{\textwidth}{%
	\parbox{2in}{%
	    \raggedright
	    \vskip 0.5in
	    \hspace{0.35in}
	    \ReviewDate
	}
	\hfill
	\parbox{1.5in}{%
	    \raggedright
	    #1 % Print the signature text
	    \vskip 0.65in % Whitespace between the signature text and your name
	    \signatureRole{\ReviewAuthor}{\Role}
	}
    }
}

\newenvironment{thesisreview}[1]
{\begin{letter}
    
    \myopening{}
    \ThesisReviewBox 
}{\myclosing{}
    \end{letter}
}

% -------------------------------------------------------------------------
%   </Thesis review>
% -------------------------------------------------------------------------



\endinput

%%
%% End of file `fithesis2.cls'.
