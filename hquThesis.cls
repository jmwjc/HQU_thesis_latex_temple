
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{hquThesis}
%---------------------------------------------------------------------------%
%->> Declare options and parameters
%---------------------------------------------------------------------------%
\DeclareOption{doctor}{
    \def\degree{博士}
    \def\coverfig{covers/doctor.png}
}
\DeclareOption{master}{
    \def\degree{硕士}
    \def\coverfig{covers/master.png}
}
\DeclareOption{engineeringmaster}{
    \def\degree{硕士}
    \def\coverfig{covers/engineering_master.png}
}
\ProcessOptions\relax

\newcommand\titleZh[1]{\def\@titleZh{#1}}
\newcommand\titleEn[1]{\def\@titleEn{#1}}
\newcommand\authorZh[1]{\def\@authorZh{#1}}
\newcommand\authorEn[1]{\def\@authorEn{#1}}
\newcommand\id[1]{\def\@id{#1}}
\newcommand\departmentZh[1]{\def\@departmentZh{#1}}
\newcommand\departmentEn[1]{\def\@departmentEn{#1}}
\newcommand\supervisorZh[2]{\def\@supervisorZh{#1}\def\@supervisorTitleZh{#2}}
\newcommand\supervisorEn[2]{\def\@supervisorEn{#1}\def\@supervisorTitleEn{#2}}
\newcommand\cosupervisorZh[2]{\def\@cosupervisorZh{#1}\def\@cosupervisorTitleZh{#2}}
\newcommand\practicevisorZh[2]{\def\@practicevisorZh{#1}\def\@practicevisorTitleZh{#2}}
\newcommand\fieldZh[1]{\def\@fieldZh{#1}}
\newcommand\fieldEn[1]{\def\@fieldEn{#1}}
\newcommand\major[1]{\def\@major{#1}}
\newcommand\majortype[1]{\def\@majortype{#1}}
\newcommand\coverdate[1]{\def\@coverdate{#1}}

%---------------------------------------------------------------------------%
%->> Load class and require packages
%---------------------------------------------------------------------------%
\LoadClass[twoside, openright, UTF8]{book}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{xeCJK,lmodern}
\RequirePackage{caption,subcaption}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{hyperref}
\RequirePackage{tocloft}
% \RequirePackage[titletoc,title,header]{appendix}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage{enumerate}


%---------------------------------------------------------------------------%
%->> Fonts, geometry, fancyhdr, gbt7714
%---------------------------------------------------------------------------%
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setCJKmainfont{simsun.ttc}[Path=./fonts/, AutoFakeSlant, AutoFakeBold={2}]
\setCJKsansfont{simhei.ttf}[Path=./fonts/, AutoFakeSlant, AutoFakeBold={2}]
\setCJKmonofont{Kaiti_GB2312.ttf}[Path=./fonts/, AutoFakeSlant, AutoFakeBold={2}]
\newCJKfontfamily\declarationfont{simfang.ttf}[Path=./fonts/, AutoFakeSlant, AutoFakeBold={2}]
\geometry{a4paper,top=3.8cm,bottom=3.8cm,left=3.2cm,right=3.2cm,bindingoffset=0cm,voffset=0.3cm,footskip=1cm,headheight=14pt}
\sloppy
\pagestyle{empty}
\fancyhf{}
\fancyhead[CO]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \leftmark}
\fancyhead[CE]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont 华侨大学\degree 学位论文}
\bibliographystyle{gbt7714-2005-numerical}
\setlength{\parindent}{24pt}

%---------------------------------------------------------------------------%
%->> makecover, frontmatter, mainmatter, backmatter
%---------------------------------------------------------------------------%
\newcommand{\makecover}{
    \newgeometry{top=3.2cm,bottom=2.6cm,left=2.4cm,right=2.2cm,bindingoffset=0cm}
    \noindent\parbox{\textwidth}{\ttfamily\setstretch{1.5}\fontsize{10.5pt}{\baselineskip}\selectfont
        学校代码：\hspace{6pt}\underline{\textrm{10385}}\hfill 分类号：\underline{\hspace{72pt}}

        研究生学号：\underline{\makebox[72pt]{\textrm{\ifdefined\@id \@id \fi}}}\hfill 密\hspace{10.5pt}集：\underline{\hspace{72pt}}
    }

    \begin{figure}[h!]
        \noindent\makebox[\textwidth]{\includegraphics[width=\paperwidth]{\coverfig}}
    \end{figure}

    \noindent\parbox{\textwidth}{\rmfamily\bfseries\setstretch{1.5}\centering\fontsize{16pt}{\baselineskip}\selectfont
        \ifdefined\@titleZh
            \@titleZh
        \else
            华侨大学\degree 研究生论文 \LaTeX 模版
        \fi
        
        \ifdefined\@titleEn
            \@titleEn
        \else
            \LaTeX\  Thesis Template for Huaqiao University
        \fi
    }

    \vfill

    \ifdefined\@majortype
        \def\titlelength{88pt}
    \else
        \def\titlelength{60pt}
    \fi
    \def\infolength{100pt}

    \noindent\parbox{\textwidth}{
        \sffamily\bfseries\setstretch{1.5}\centering\fontsize{14pt}{\baselineskip}\selectfont
        \makebox[\titlelength][s]{作者姓名}： \underline{\makebox[182pt][c]{\makebox[42pt][s]{\textrm{\textbf{\ifdefined\@authorZh
            \@authorZh
        \else
            张三
        \fi}}}}}

        \makebox[\titlelength][s]{指导教师}： \underline{\makebox[182pt][c]{\makebox[\infolength]{\makebox[42pt][s]{\textrm{\textbf{\ifdefined\@supervisorZh
            \@supervisorZh
        \else
            李四
        \fi}}}
        \hfill
        \makebox[42pt][s]{\textrm{\textbf{\ifdefined\@supervisorTitleZh
            \@supervisorTitleZh
        \else
            教授
        \fi}}}}}}

        \ifdefined\@cosupervisorZh
            \makebox[\titlelength][s]{合作教师}： \underline{\makebox[182pt][c]{\makebox[\infolength]{\makebox[42pt][s]{\textrm{\textbf{\@cosupervisorZh}}}
                \hfill
                \makebox[42pt][s]{\textrm{\textbf{\@cosupervisorTitleZh}}}}}
            }
        \fi

        \ifdefined\@practicevisorZh
            \makebox[\titlelength][s]{实践教师}： \underline{\makebox[182pt][c]{\makebox[\infolength]{\makebox[42pt][s]{\textrm{\textbf{\@practicevisorZh}}}
                \hfill
                \makebox[42pt][s]{\textrm{\textbf{\@practicevisorTitleZh}}}}}
            }
        \fi

        \ifdefined\@majortype
            \makebox[\titlelength][s]{专业学位类别}： \underline{\makebox[182pt][c]{\textrm{\textbf{\@majortype}}}}

            \makebox[\titlelength][s]{专业学位领域}： \underline{\makebox[182pt][c]{\textrm{\textbf{\ifdefined\@major
                    \@major
                \else
                    土木水利
                \fi}}
            }}
        \else
            \makebox[\titlelength][s]{学科}： \underline{\makebox[182pt][c]{\textrm{\textbf{\ifdefined\@major
                \@major
            \else
                土木工程
            \fi}}}}
        \fi

        \makebox[\titlelength][s]{研究方向}： \underline{\makebox[182pt][c]{\textrm{\textbf{\ifdefined\@fieldZh
            \@fieldZh
        \else
            结构体系创新与工程应用
        \fi}}}}

        \makebox[\titlelength][s]{所在学院}： \underline{\makebox[182pt][c]{\textrm{\textbf{\ifdefined\@departmentZh
            \@departmentZh
        \else
            土木工程学院
        \fi}}}}
    }

    \vfill

    \noindent\begin{center}
        \sffamily\setstretch{1.5}\fontsize{14pt}{\baselineskip}\selectfont
        论文提交日期： \textrm{\textbf{\ifdefined\@coverdate
            \@coverdate
        \else
            二〇一八年五月二十八日
        \fi}}
    \end{center}
    \restoregeometry
}

\renewcommand{\frontmatter}{
    \pagestyle{fancy}
    \setcounter{page}{1}
    \fancyfoot[C]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \@Roman\thepage}
}

\renewcommand{\mainmatter}{
    \cleardoublepage
    \pagestyle{fancy}
    \setcounter{page}{1}
    \fancyfoot[C]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \@arabic\thepage}
    \fontsize{12pt}{20pt}\selectfont
}

\renewcommand{\backmatter}{
    \cleardoublepage
    \pagestyle{fancy}
    \fancyhead[CO]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont \leftmark}
    \fontsize{12pt}{20pt}\selectfont
}
%---------------------------------------------------------------------------%
%->> abstract, keywords, acknowledgements, CV
%---------------------------------------------------------------------------%
\newenvironment{abstract}{
    \markboth{摘\hspace{10.5pt}要}{}
    \setlength{\parindent}{24pt}
    \chapter*{摘\hspace{16pt}要}
    \indent\rmfamily\fontsize{12pt}{20pt}\selectfont
}{\vspace{20pt}\par}

\newenvironment{abstractEn}{
    \markboth{Abstract}{}
    \setlength{\parindent}{24pt}
    \chapter*{Abstract}
    \indent\rmfamily\fontsize{12pt}{20pt}\selectfont
}{\vspace{20pt}\par}

\newcommand\keywords[1]{
    \hangafter 1
    \hangindent 48pt
    \noindent\rmfamily\fontsize{12pt}{20pt}\selectfont \textbf{关键词：} #1
    \cleardoublepage
}

\newcommand\keywordsEn[1]{
    \hangafter 1
    \hangindent 60pt
    \noindent\rmfamily\fontsize{12pt}{20pt}\selectfont \textbf{Keywords:} #1
    \cleardoublepage
}

\newenvironment{acknowledgements}{
    \cleardoublepage
    \markboth{致\hspace{10.5pt}谢}{}
    \chapter*{致\hspace{16pt}谢}
    \phantomsection
    \addcontentsline{toc}{chapter}{致\hspace{12pt}谢}
    \indent\ttfamily\fontsize{12pt}{20pt}\selectfont
}{\vspace{20pt}\par}

\newenvironment{cv}{
    \cleardoublepage
    \markboth{个人简历、在学期间发表的学术论文与研究成果}{}
    \phantomsection
    \chapter*{个人简历、在学期间发表的学术论文与研究成果}
    \addcontentsline{toc}{chapter}{个人简历、在学期间发表的学术论文与研究成果}
    \indent\rmfamily\fontsize{12pt}{20pt}\selectfont
}{\vspace{20pt}\par}
%---------------------------------------------------------------------------%
%->> Structure layout
%---------------------------------------------------------------------------%
%- chapter
\renewcommand{\cftchappresnum}{第}
\renewcommand{\cftchapaftersnum}{章}
\renewcommand{\cftchapfont}{\sffamily\fontsize{12pt}{20pt}\selectfont}
\titleformat{\chapter}[block]{\centering\sffamily\bfseries\fontsize{16pt}{\baselineskip}\selectfont}{第\ \arabic{chapter}\ 章}{16pt}{}
\titlespacing{\chapter}{0pt}{24pt}{18pt}
\assignpagestyle{\chapter}{fancy}
\setlength{\cftchapindent}{0pt}
\renewcommand{\chaptermark}[1]{
    \markboth{第\ \thechapter\ 章\ #1}{#1}
}
\renewcommand{\cftchapdotsep}{4.5}
\setlength{\cftbeforechapskip}{6pt}
\setlength{\cftchapnumwidth}{48pt}
%- section
\renewcommand{\cftsecfont}{\rmfamily\fontsize{12pt}{20pt}\selectfont}
\titleformat{\section}[hang]{\sffamily\bfseries\fontsize{14pt}{20pt}\selectfont}{\arabic{chapter}.\arabic{section}}{14pt}{}
\titlespacing{\section}{0pt}{24pt}{6pt}
%- subsection
\renewcommand{\cftsubsecfont}{\rmfamily\fontsize{12pt}{20pt}\selectfont}
\setlength{\cftsecindent}{12pt}
\setlength{\cftbeforesecskip}{0pt}
%- subsubsection
\setlength{\cftsubsecindent}{24pt}
\setlength{\cftbeforesubsecskip}{0pt}
\titleformat{\subsection}[hang]{\sffamily\bfseries\fontsize{12pt}{20pt}\selectfont}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}{12pt}{}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titleformat{\subsubsection}[hang]{\sffamily\fontsize{12pt}{20pt}\selectfont}{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{12pt}{}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}
%- appendix
% \renewcommand{\appendixname}{附录}
\let\oldappendix\appendix
\renewcommand{\appendix}{
    \oldappendix
    \titleformat{\chapter}[block]{\centering\sffamily\bfseries\fontsize{16pt}{\baselineskip}\selectfont}{附录\Alph{chapter}}{16pt}{}
    \fancyhead[CO]{\rmfamily\fontsize{10.5pt}{\baselineskip}\selectfont 附录\thechapter\ \rightmark}
    % \protect\renewcommand{\chaptermark}[1]{\markboth{附录\ \thechapter\ #1}{}}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftchappresnum}{附录}}
    \addtocontents{toc}{\protect\renewcommand{\protect\cftchapaftersnum}{}}
    \cleardoublepage
}
%- bibliography
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{
    \cleardoublepage
    \markboth{参考文献}{}
    \phantomsection
    \addcontentsline{toc}{chapter}{参考文献}
    \rmfamily\fontsize{10.5pt}{16pt}\selectfont\oldbibliography{#1}
}
%- TOC
\tocloftpagestyle{fancy}
\renewcommand{\contentsname}{\centerline{目\hspace{16pt}录}}
\renewcommand{\cfttoctitlefont}{\sffamily\bfseries\fontsize{16pt}{\baselineskip}\selectfont}
\renewcommand{\cftbeforetoctitleskip}{24pt}
\renewcommand{\cftaftertoctitleskip}{18pt}
%- Others
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\renewcommand\bibname{参考文献}
\DeclareCaptionFont{captionfont}{\rmfamily\fontsize{11pt}{\baselineskip}\selectfont}
\captionsetup{font=captionfont,labelsep=quad,skip=6pt,subrefformat=parens}
\setlength{\cftparskip}{0pt}
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}
\titleformat{\paragraph}[runin]{\rmfamily\fontsize{12pt}{20pt}\selectfont}{}{}{}
\titlespacing{\paragraph}{0pt}{0pt}{0pt}
\setlength{\parskip}{0pt}
