% Auteur : Dylan Miquel
% Date : 31 janvier 2021

\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{DylCours}[2021/09/24 Package des Cours de Dylan Miquel]%

\LoadClass[a4paper]{article}% classe de base

% traite les arguments non pris en charge et les passe à la classe de base
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}%
\ProcessOptions\relax%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Importation de packages nécessaires             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[a4paper,includeheadfoot,tmargin=0.5cm,bmargin=2cm,rmargin=1.5cm,lmargin=1.5cm]{geometry}% marges

% configuration de document en français
\RequirePackage[utf8]{inputenc}% iso-latin1 sur windows
\RequirePackage[french]{babel}% compatibilité avec babel
\RequirePackage[T1]{fontenc}% Encodage des polices FR

% liens hypertextes
\usepackage{url}%
\let\urlorig\url%
\renewcommand{\url}[1]{\begin{otherlanguage}{english}\urlorig{#1}\end{otherlanguage}}%pour afficher correctement les urls (conflit avec babel français)
\RequirePackage[hidelinks]{hyperref}%

\pdfstringdefDisableCommands{%redefine commands that are usually not supported in PDF bookmark strings
  \def\\{}%
  \def\texttt#1{<#1>}%
  \def\cup{∪}%
  \def\cap{∩}%
  \def\times{×}%
}


% mise en page
\RequirePackage{fix-cm}% allège les limitations de taille des fontes Computer Modern
\RequirePackage{fancyhdr}% mise en page avec en-tête et pied
\RequirePackage{lastpage}% numérotation de page
\RequirePackage[skins]{tcolorbox}% boites colorées
\RequirePackage{fancybox}% boites pouvant contenir d'autres types de caractères
\RequirePackage{wrapfig}% disposition de texte autour des images et tableaux
\RequirePackage{tabularx}% tableaux adaptifs
\RequirePackage{color,colortbl,xcolor}% définition de couleurs personnalisées
\RequirePackage{titlesec} % couleur des titres de section
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{listings}

%\RequirePackage{bibTex} %bibliographie
%\RequirePackage{beamer} %Présentation diapo

\renewcommand{\familydefault}{\sfdefault}% Font sans serif

% bibliothèques tikz
\RequirePackage{tikz}%
\RequirePackage{tkz-tab}%
\RequirePackage{textcomp}%
\RequirePackage{pgfplots}%
\pgfplotsset{compat=newest}%
\usetikzlibrary{babel,patterns,decorations.pathmorphing,calc,shapes.geometric}%

\RequirePackage{eurosym}% symbole €
\newcommand{\Euro}{\euro\ }%

\RequirePackage{ulem}%
	%\sout{text à barrer}
	%\xout{texte à hachurer}
	%\uwave{texte à souligner par une vaguelette}
	%\dotuline{texte à souligner en pointillés}
	%\dashuline{texte à souligner en tirés}

%\RequirePackage[frenchkw,ruled,resetcount,linesnumbered,titlenotnumbered]{algorithm2e}
\RequirePackage[french,onelanguage,ruled,resetcount,linesnumbered,titlenotnumbered]{algorithm2e}
	\SetKwBlock{KwDecla}{déclarations}{finDéclaration}
	\SetKwBlock{KwParam}{paramètres :}{}
	\SetKwBlock{KwVar}{variables :}{}
	\SetKwBlock{KwConst}{constantes :}{}
	\SetKwBlock{KwConstG}{constantes globales :}{}
	\SetKw{KwFin}{fin}
	\SetKw{KwSin}{sinon }
	\SetKwRepeat{FaireTq}{faire}{tant\ que}
	\newcommand{\KwComment}[1]{\color{d_comment} // #1}



% Définition du jeu de couleurs du document
\definecolor{d_emph1}{RGB}{255, 145, 77}% orange poco
\definecolor{d_emph2}{RGB}{30,61,89}%{255,169,68}%{238, 163, 55}%
\definecolor{d_emph3}{RGB}{255,193,59}%
\definecolor{d_emph4}{RGB}{87, 89, 91}% gris poco
\definecolor{d_dark1}{RGB}{0, 0, 0}% noir
\definecolor{d_dark2}{RGB}{67, 67, 67}% gris foncé
\definecolor{d_dark3}{RGB}{127, 127, 127}% gris clair
\definecolor{d_dark4}{RGB}{179, 179, 179}% gris très clair
\definecolor{d_light}{RGB}{255, 255, 255}% blanc
\definecolor{d_warning}{RGB}{200, 0, 0}% rouge danger
\definecolor{d_comment}{RGB}{96,186,56}% vert commentaire


% Couleur des titres de section
\titleformat*{\section}{\normalfont\Large\bfseries\color{d_emph1}}%
\titleformat*{\subsection}{\normalfont\large\bfseries\color{d_emph2}}%
\titleformat*{\subsubsection}{\normalfont\normalsize\bfseries\color{d_emph3}}%d_dark2}}%
\titleformat*{\paragraph}{\normalfont\normalsize\bfseries\color{d_dark1}}%
\titleformat*{\subparagraph}{\normalfont\normalsize\bfseries\color{d_dark1}}%


% Paramètres du document
\def\@doctitle{Titre du document}%
\def\@docsubtitle{Sous-titre du document}%
\def\@docauthor{Dylan Miquel}%
\def\@docsubauthor{\today}%

\def\doctitle#1{\def\@doctitle{#1}}%
\def\docsubtitle#1{\def\@docsubtitle{#1}}%
\def\docauthor#1{\def\@docauthor{#1}}%
\def\docsubauthor#1{\def\@docsubauthor{#1}}%

\graphicspath{{img/}}%

%commandes du document
\newcommand{\guil}[1]{\og #1 \fg{}}% guillemets

\newcommand{\la}{$\leftarrow$ }% flèche gauche
\newcommand{\ra}{$\rightarrow$ }% flèche droite
\newcommand{\rp}{• }%
\newcommand{\itema}{\item[$\rightarrow$]}%
\newcommand{\itemp}{\item[•]}%
\newcommand{\subitemp}{\subitem \rp}%
\newcommand{\subitema}{\subitem \ra}%

\newcommand{\definition}[1]{\paragraph{Définition : #1}}
\newcommand{\subdefinition}[1]{\subparagraph{Définition : #1}}

\newcommand{\remarque}{\paragraph{Remarque :}}
\newcommand{\subremarque}{\subparagraph{Remarque :}}

\newcommand{\exemple}{\paragraph{Exemple :}}
\newcommand{\subexemple}{\subparagraph{Exemple :}}

\newcommand{\propriete}{\paragraph{Propriété :}}
\newcommand{\subpropriete}{\subparagraph{Propriété :}}

\newcommand{\notation}{\paragraph{Notation :}}
\newcommand{\subnotation}{\subparagraph{Notation :}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Bloc d'image avec légende                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\img}[3][0.7]{%
	\begin{figure}[ht]%
		\centering%
		\includegraphics[width=#1\textwidth]{#2}%
		\caption{#3}%
	\end{figure}%
}%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Boites de texte colorées                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtcolorbox{cbx}[3][]{%
	enhanced jigsaw,% amélioration du rendu
	borderline west={2pt}{0pt}{#3},% ligne verticale à gauche
	sharp corners,% pas de coins arrondis
	boxrule=0pt,% pas de cadre
	fonttitle={\normalsize\bfseries},%
	coltitle={#3},% couleur du titre
	title={#2\\},% texte du titre
	attach title to upper,% titre en haut à gauche du cadre
	#1% contenu de l'encadré
}

\newcommand{\note}[1]{\begin{cbx}{\textbf{Note}}{d_emph1}#1\end{cbx}}%
\newcommand{\important}[1]{\begin{cbx}{\textbf{Attention}}{d_warning}#1\end{cbx}}%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        Initialisation de la mise en page du document        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{%
	
	\tolerance=1% retire les coupures de mots trop longs
	\emergencystretch=\maxdimen%
	\hyphenpenalty=10000%
	\hbadness=10000%
	\normalem% \emph is not underline
	
	\begin{titlepage}%
		\begin{tikzpicture}[remember picture,overlay]%
			\fill [d_emph1] (current page.north west) --++ (0,-2.2) --++ (2.5,0) --++ (0.8,0.65) --++ (18,0) -- (current page.north east) -- cycle;%
			%\node[anchor=center] at (current page.center) {\includegraphics[width=.9\textwidth]{aeelogo.png}};%
			\fill [d_emph1] (current page.south east) --++ (0,2.2) --++ (-2.5,0) --++ (-0.8,-0.65) --++ (-18,0) -- (current page.south west) -- cycle;%
		\end{tikzpicture}%
		\vspace*{\fill}%
		\begin{center}%
			{\fontsize{45pt}{30pt}\selectfont\color{d_emph1}\bf \@doctitle}\\%
			\vspace*{12pt}%
			{\fontsize{25pt}{20pt}\selectfont\color{d_dark2} \@docsubtitle}\\%
			\vspace*{50pt}%
			{\fontsize{20pt}{25pt}\selectfont\color{d_dark2}\bf \@docauthor\\\ }\\%
			\vspace*{35pt}%
			{\fontsize{15pt}{10pt}\selectfont\color{d_dark2} \@docsubauthor\\\ }\\%
			\vspace*{20pt}%
			{\fontsize{15pt}{10pt}\selectfont\color{d_dark2} \today}%
		\end{center}%
		\vspace*{\fill}%
	\end{titlepage}%
	\tableofcontents% Table des matière
	\newpage% Saut de page
}%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Structure principale du document avec titre et mise en page %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{fancy}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
\fancyhf{}%
\fancyfoot[R]{%
	\begin{tikzpicture}[remember picture,overlay]%
		\node[xshift=1cm,yshift=-1cm,anchor=west] at (current page.north west) {\color{d_dark1}\large\textit{\@doctitle}};% titre du document en-tête de page
		\node[xshift=-1cm,yshift=-1cm,anchor=east] at (current page.north east) {\color{d_dark1}\large\textit{\@docsubtitle}};% sous-titre du document en-tête de page
		\fill [d_emph1] (current page.south west) --++ (0,2.3) --++ (-2.5,0) --++ (-0.8,-0.65) --++ (-18,0) --++ (0,-0.7) --++ (2.3,0) --++ (1.3, -1.2) -- cycle;% motif abstrait de pied de page
		\node[xshift=0.9cm,yshift=0.7cm,anchor=center] at (current page.south west) {\color{d_dark3} \fontsize{12}{20}\selectfont \textbf{\thepage} / \pageref{LastPage}};% numéro de page
		\node[xshift=-1.5cm,yshift=1.1cm,anchor=center] at (current page.south east) {\includegraphics[width=2cm]{PocoIcon.png}};% logo AEE de pied de page
	\end{tikzpicture}%
}%
