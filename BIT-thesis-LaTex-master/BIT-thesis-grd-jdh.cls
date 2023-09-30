%==================================================
%% BIT-thesis-grd.cls for BIT Thesis
%% modified by Jian dahao
%% version: 1.6
%% last update: May 10th, 2019
%%==================================================
  
%% math packages -- conflict with xunicode
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs,mathptmx}
% 直立希腊字母字体
\RequirePackage{upgreek}

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{BIT-thesis-grd}
  [2018/03/25 v1.2 BIT-thesis-grd document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifBIT@master\BIT@masterfalse
\newif\ifBIT@doctor\BIT@doctorfalse
\newif\ifBIT@istwoside\BIT@istwosidefalse
\DeclareOption{twoside}{\BIT@istwosidetrue}
\DeclareOption{master}{\BIT@mastertrue}
\DeclareOption{doctor}{\BIT@doctortrue}
% 添加编译模式
\newif\ifBIT@isnormal\BIT@isnormalfalse%是否普通模式
\newif\ifBIT@isselfsimilarcheck\BIT@isselfsimilarcheckfalse %是否重复率自查模式
\newif\ifBIT@isblindcheck\BIT@isblindcheckfalse%是否盲审模式
\DeclareOption{selfSimilarCheck}{\BIT@isselfsimilarchecktrue} 
\DeclareOption{blindCheck}{\BIT@isblindchecktrue}
\DeclareOption{normal}{\BIT@isnormaltrue}
%新定义不同模式下的命令

\ProcessOptions\relax
\ifBIT@istwoside
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi

%%
%% the setup of ctex package
%%
\def\contentsname{目\BITspace 录}
\def\listfigurename{插\BITspace 图}
\def\listtablename{表\BITspace 格}

%%
%% 封面标题
%%
\def\BIT@label@primarymajor{一级学科:}
\def\BIT@label@major{学科专业:}
\def\BIT@label@majorin{研究方向:}
\def\BIT@label@title{论文题目}
\def\BIT@label@author{作者姓名:}
\def\BIT@label@classification{中图分类号：}
\def\BIT@label@confidential{密级}
\def\BIT@label@UDC{学科分类号：}
\def\BIT@label@serialnumber{编号}
\def\BIT@label@thesis{学位论文}
\def\BIT@label@advisor{指导教师:}
\def\BIT@label@degree{申~~~~请~~~~学~~~~位}
\def\BIT@label@submitdate{论文提交日期}
\def\BIT@label@defenddate{论~文~答~辩~日~期}
\def\BIT@label@institute{学~~~~院~~~~名~~~~称}
\def\BIT@label@school{学~位~授~予~单~位}
\def\BIT@label@chairman{答辩委员会主席}
\def\BIT@label@papernumber{论文编号:}
\def\BIT@label@secretclass{密~~~~~~~~级:}
%%
%% 封面内容
%%

\def\BIT@value@classification{}
\def\BIT@value@confidential{}
\def\BIT@value@UDC{}
\def\BIT@value@serialnumber{}
\def\BIT@value@school{}
\def\BIT@value@degree{}
\def\BIT@value@title{~~~~~（论~文~题~目）~~~~~}
\def\BIT@value@vtitle{竖排论文题目}
\def\BIT@value@titlemark{\BIT@value@title}
\def\BIT@value@author{（作~者~姓~名）}
\def\BIT@value@advisor{（姓名、专业技术职务、学位）}
\def\BIT@value@advisorinstitute{（单位）}
\def\BIT@value@major{}
\def\BIT@value@studentnumber{}
\def\BIT@value@submitdate{}
\def\BIT@value@defenddate{}
\def\BIT@value@institute{}
\def\BIT@value@chairman{}
\def\BIT@label@statement{}


%% 设置圆圈的格式 或使用\textcircled
\usepackage{tikz}
\usepackage{etoolbox}
\usepackage{ctex}
\setCJKfamilyfont{hwxw}{STXinwei}           %使用STXinwei华文新魏
\newcommand{\huawenxingwei}{\CJKfamily{hwxw}}


\setCJKfamilyfont{hwcy}{STCaiyun}             %使用STCaiyun华文彩云字体
\newcommand{\huawencaiyun}{\CJKfamily{hwcy}}

\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}

%% 论文原创性声明
\def\BIT@label@original{{\huawenxingwei \zihao{2}独立性声明}}
\def\BIT@label@authorization{{\huawenxingwei \zihao{2}学位论文使用权的说明}}
\def\BIT@label@authorsign{学位论文作者签名：}
\def\BIT@label@Supervisorsign{导师签名：}
\def\BIT@label@originalDate{签字日期：}
\def\BIT@label@originalcontent{\BITspace\BITspace 本人声明所呈交的学位论文是本人在导师指导下进行的研究工作和取得的研究成果，除了文中特别加以标注和致谢之处外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得{\huawenxingwei \underline{\BITspace \textbf{天津理工大学}\BITspace}}或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。}
\def\BIT@label@authorizationcontent{\BITspace\BITspace 本学位论文作者完全了解{\huawenxingwei \underline{\BITspace 天津理工大学\BITspace}}有关保留、使用学位论文的规定。特授权{\huawenxingwei \underline{\BITspace 天津理工大学\BITspace}}可以将学位论文的全部或部分内容编入有关数据库进行检索，并采用影印、缩印或扫描等复制手段保存、汇编，以供查阅和借阅。同意学校向国家有关部门或机构送交论文的复本和电子文件。\par
（保密的学位论文在解密后适用本授权说明）
}


%%
%% 英语封面标题
%%
\def\BIT@label@englishadvisor{Supervisor}
\def\BIT@label@englishstatement{Submitted in total fulfilment
  of the requirements for the degree of \BIT@value@englishdegree \\
  in \BIT@value@englishmajor}
\def\BIT@label@englishauthor{By}
\def\BIT@label@englishadvisor{Faculty Mentor:}
\def\BIT@label@englishchairman{Chair, Thesis Committee:}
\def\BIT@label@englishinstitute{School or Department:}
\def\BIT@label@englishdegree{Degree Applied:}
\def\BIT@label@englishmajor{Major:}
\def\BIT@label@englishschool{Degree by:}
\def\BIT@label@englishdate{The Date of Defence:}


%%
%% 英语封面内容
%%
\def\BIT@value@englishtitle{(English Title of Thesis)}
\def\BIT@value@englishauthor{(Author Name)}
\def\BIT@value@englishadvisor{(Supervisor Name)}
\def\BIT@value@englishinstitute{(Institute Name)}
\def\BIT@value@englishscholl{(BIT)}
\def\BIT@value@englishchair{(someone)}
\def\BIT@value@englishdate{}
\def\BIT@value@englishdegree{}
\def\BIT@value@englishmajor{}



\def\BIT@label@abstract{摘要}
\def\BIT@label@englishabstract{Abstract}
\def\BIT@label@keywords{关键词：}
\def\BIT@label@englishkeywords{Key Words:~}
\def\BIT@label@conclusion{结论}
\def\BIT@label@appendix{附录}
\def\BIT@label@publications{攻读学位期间发表论文与研究成果清单}
\def\BIT@label@projects{攻读学位期间参与的项目}
\def\BIT@label@resume{作者简介}
\def\BIT@label@reference{参考文献！！！！}
\def\BIT@label@thanks{致谢}
\def\BIT@value@templateversion{v1.2}
%%
%% label in the head 页眉页脚
%%
\def\BIT@label@headschoolname{天津理工大学硕士学位论文}

%% 当前模板的版本
\newcommand{\version}{\BIT@value@templateversion}

%%==============引用geometry 宏包设置纸张和页面========================
%设置版面:上3.5cm，下2.5cm，左2.7cm，右2.7cm，页眉2.5cm，页脚1.8cm，装订线0cm 已经改成学校的了
\usepackage[%
paper=a4paper,%
top=2.54cm,% 上 2.54cm %
bottom=2.54cm,% 下 2.54cm %
left=3.57cm,% 左3.57cm %
right=2.77cm,% 右 2.77cm %
headheight=1.5cm,% 页眉 1.5cm %
footskip=1.75cm% 页脚 1.75cm %
]{geometry} % 页面设置 %
%% =========================================================

\parskip 0.5ex plus 0.25ex minus 0.25ex
%% Command -- Clear Double Page
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%设置行距，大概为22榜
\RequirePackage{setspace}
\setstretch{1.523}

%% 设置章节格式, 黑体三号居中
\ctexset{chapter={
      name = {第,章},
      number = {\chinese{chapter}},
      format = { \sffamily \centering \zihao{-3}},
      pagestyle = {BIT@headings},
      beforeskip = 30 pt,
      afterskip = 36 pt,
      fixskip = true,
  }
}
%% 设置一级章节格式
% 黑体四号顶左，行距22磅，与上一节的间距为1行，与下面正文或节标题的段间间距为0.5行。序号与题目间空一格。

\ctexset{section={
  format={\raggedright  \sffamily \zihao{4}},
  beforeskip = 28bp plus 1ex minus .2ex,
  afterskip = 24bp plus .2ex,
  fixskip = true,
  }
}

% 设置二级标题格式

% 黑体小四顶左，行距22磅，与上一节的间距为1行，与下面正文或节标题的段间间距为0.5行。序号与题目间空一格。 

\ctexset{subsection={
   format = { \sffamily \raggedright \zihao{-4}},
   beforeskip =28bp plus 1ex minus .2ex,
   afterskip = 24bp plus .2ex,
   fixskip = true,
   }
}


% 设置三节标题格式

\ctexset{subsubsection={
      format={\heiti \raggedright \zihao{-4}},
      beforeskip=28bp plus 1ex minus .2ex,
      afterskip=24bp plus .2ex,
      fixskip=true,
  }
}

%% 设定目录格式。目录颜色更改黑色
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\songti \zihao{4}}
    {\thecontentslabel\hspace{\ccwd}}{} % 取消的加粗显示效果
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2\ccwd]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4\ccwd]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{figure}[0pt]{\songti\zihao{-4}}
    {\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
    {\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}

%% 选择编译
\RequirePackage{ifthen}

%% check pdfTeX mode
\RequirePackage{ifpdf}

%% fancyhdr 页眉页脚控制
\RequirePackage{fancyhdr}

% 空 页眉页脚
\fancypagestyle{BIT@empty}{%
  \fancyhf{}}

%======正文页眉页脚=================
\fancypagestyle{BIT@headings}{%
  \fancyhf{}
  \fancyfoot[C]{\songti\zihao{5} -\thepage-}
  \fancyhead[C]{\ifBIT@master\zihao{5}{\songti \noindent  天津理工大学硕士学位论文 \hfill \leftmark}
                \else\zihao{5}{\songti 天津理工大学博士学位论文}\fi}
  }

%==================================对于openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚。===================
\let\BIT@cleardoublepage\cleardoublepage
\newcommand{\BIT@clearemptydoublepage}{%
	\clearpage{\pagestyle{BIT@empty}\BIT@cleardoublepage}}
\let\cleardoublepage\BIT@clearemptydoublepage

 %================修该frontmatter 的页码为大写罗马格式，并调整页面风格===============
\renewcommand{\frontmatter}{
 \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{BIT@headings}
}
%=======================修改mainmatter 的页码为阿拉伯格式，并调整页面风格========================
\renewcommand{\mainmatter}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{BIT@headings}
}

%%%
% 内容插入命令
%%%
\newcommand\insertContents[1]{\ifBIT@isselfsimilarcheck {} \else #1 \fi} %内容插入控制命令
\newcommand\insertFigure[1]{\insertContents{#1}} % 图片插入控制命令
\newcommand\insertTable[1]{\insertContents{#1}} % 表格插入控制命令
\newcommand\insertEquation[1]{\insertContents{#1}} % 公式插入控制命令
\newcommand\nref[1]{\ifBIT@isselfsimilarcheck {} \else \ref{#1} \fi}

%% 复杂表格
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}


%% 定义几个常用的数学常量符号
\newcommand{\me}{\mathrm{e}} %定义 对数常数e，虚数符号i,j以及微分算子d为直立体。
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}} 

\theoremstyle{plain}
  \newtheorem{algo}{算法~}[chapter]
  \newtheorem{thm}{定理~}[chapter]
  \newtheorem{lem}[thm]{引理~}
  \newtheorem{prop}[thm]{命题~}
  \newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
  \newtheorem{defn}{定义~}[chapter]
  \newtheorem{conj}{猜想~}[chapter]
  \newtheorem{exmp}{例~}[chapter]
  \newtheorem{rem}{注~}
  \newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

%% 英文字体使用 Times New Roman
\RequirePackage{fontspec}
\RequirePackage{xltxtra} % \XeTeX Logo
%% Times Fonts
\RequirePackage{times}
%% Set Old Fonts Encoding 
\usepackage[T1]{fontenc}
\usepackage{ctex}

%% graphics packages
\RequirePackage{graphicx}
%% 并列子图
\RequirePackage{subfigure}

\RequirePackage{wrapfig}
%%===========================设置图表标题选项==========================
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}
\captionsetup{
  font = {fontsize},
  labelsep = zhspace,
}
\captionsetup[table]{
  position = top,
  aboveskip = 6bp,
  belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
  position = bottom,
  aboveskip = 6bp,
  belowskip = 6bp,
}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
% ccaption -- bicaption
%\RequirePackage{ccaption}
%\captiondelim{\ }
%\captionnamefont{\songti\zihao{5}}
%\captiontitlefont{\songti\zihao{5}}


%% sort and compress citations
%\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
\RequirePackage[sort&compress,numbers]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\newcommand{\nupcite}[1]{\ifBIT@isselfsimilarcheck {} \else \upcite{#1} \fi}
\newcommand{\ncite}[1]{\ifBIT@isselfsimilarcheck {} \else \cite{#1} \fi}

% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% 定公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}

% 颜色宏包
\RequirePackage{xcolor}


% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% listings 源代码显示宏包
\RequirePackage{listings}
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头


%% hyperref package

\definecolor{navyblue}{RGB}{0,0,128} 
\RequirePackage{hyperref}
\hypersetup{
  bookmarksnumbered,%
  colorlinks,%
  linkcolor=black,%
  citecolor=black,%
  plainpages=false,%
  pdfstartview=FitH
 % bookmarksnumbered,%
 % linktoc=all,
 % colorlinks=true,
 % citecolor=black,
 % filecolor=cyan,
 % linkcolor=black,
 % linkbordercolor=black,
   urlcolor=black,
 % plainpages=false,%
 % pdfstartview=FitH
}

%% enumerate 列表环境间距调节
\usepackage{enumitem}
% \setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
% \setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
% \setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

%_  参考文献风格 added by wei.jianwen@gmail.com
\bibliographystyle{GBT7714-2005NLang}

%_ BITspace
%\newcommand\BITspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\newcommand{\BITspace}[1][1]{\hspace{#1\ccwd}}

\def\BIT@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\BITfiledate{#1}%
  \def\BITfileversion{#2}%
  \def\BITfileinfo{#3}}%
\expandafter\ifx\csname ver@bitmaster-xetex.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_bitmaster-xetex.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@bitmaster-xetex.cls\endcsname}
\fi
\expandafter\BIT@getfileinfo\reserved@a\relax? ? \relax\relax
\def\BIT@underline[#1]#2{%
  \underline{\hbox to #1{\hfill#2\hfill}}}
\def\BITunderline{\@ifnextchar[\BIT@underline\underline}

%%%%中文标题页的可用命令
\newcommand\classification[1]{\def\BIT@value@classification{#1}}
\newcommand\primarymajor[1]{\def\BIT@value@primarymajor{#1}}
\newcommand\majorin[1]{\def\BIT@value@majorin{#1}}
\newcommand\studentnumber[1]{\def\BIT@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\BIT@value@confidential{#1}}
\newcommand\papernumber[1]{\def\BIT@value@papernumber{#1}}
\newcommand\secretclass[1]{\def\BIT@value@secretclass{#1}}
\newcommand\UDC[1]{\def\BIT@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\BIT@value@serialnumber{#1}}
\newcommand\school[1]{\def\BIT@value@school{#1}}
\newcommand\degree[1]{\def\BIT@value@degree{#1}}
\renewcommand\title[2][\BIT@value@title]{%
  \def\BIT@value@title{#2}
  \def\BIT@value@titlemark{\MakeUppercase{#1}}}

\newcommand\vtitle[1]{\def\BIT@value@vtitle{#1}}
\renewcommand\author[1]{\ifBIT@isblindcheck \def\BIT@value@author{* * *} \else \def\BIT@value@author{#1}\fi}
\newcommand\advisor[1]{\ifBIT@isblindcheck \def\BIT@value@advisor{* * *} \else \def\BIT@value@advisor{#1} \fi}
\newcommand\advisorinstitute[1]{\def\BIT@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\BIT@value@major{#1}}
\newcommand\submitdate[1]{\def\BIT@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\BIT@value@defenddate{#1}}
\newcommand\institute[1]{\def\BIT@value@institute{#1}}
\newcommand\chairman[1]{\def\BIT@value@chairman{#1}}


%% 第一页和第二页
%_ “绘制”BIT中文标题页
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{60mm}
    {\heiti\zihao{-2} \BIT@value@title}
    \vskip 40mm
    {\heiti \zihao{-3} \BIT@value@author} %黑体 小三
     \vskip 4mm
    {\heiti \zihao{-3} \BIT@value@defenddate} %黑体 小三
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
 }
\setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun}
\renewcommand*{\songti}{\CJKfamily{zhsong}}
\newcommand\makeChInfo[1]%
 {
  \newpage
  \cleardoublepage
  \thispagestyle{empty}

%udc ltz 
{ %
  {\songti \zihao{-4} \noindent \BIT@label@classification} \BIT@value@classification \hfill {\songti \zihao{-4} \BIT@label@papernumber}  \BIT@value@papernumber\\
  {\songti \zihao{-4} \BIT@label@UDC}  \BIT@value@UDC \hfill {\songti \zihao{-4} \BIT@label@secretclass}  \BIT@value@secretclass
}


   \begin{center}
{\songti\zihao{3}\textbf{天津理工大学研究生学位论文}}
    \vskip \stretch{1}
       {\songti\zihao{1} \textbf{\BIT@value@title}}\\
{\songti \zihao{3} \textbf{（申请硕士学位）}}
    \vskip \stretch{1}
	
    {\fangsong\zihao{4}}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}

	%宋体 四号
    {\songti\zihao{4}
     \begin{tabular}{l p{3mm} c}
      \BIT@label@primarymajor & &{\zihao{4}\textbf{\BIT@value@primarymajor}}

    \\
      \BIT@label@majorin & &  {\zihao{4}\textbf{\BIT@value@majorin}}
    \\
      \BIT@label@author & &   {\zihao{4}\textbf{\BIT@value@author}}
    \\
      \BIT@label@advisor & &    {\zihao{4}\textbf{\BIT@value@advisor}}


    \end{tabular}}
\vskip \stretch{1}
\songti\zihao{4} \textbf{2xxx年x月}
  \end{center}

  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
\newcommand\makeChineseInfo[1]{\ifBIT@isnormal  \makeChInfo \else {} \fi}

% English Title Page
% 英文标题页可用命令
\newcommand\englishtitle[1]{\def\BIT@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\ifBIT@isblindcheck \def\BIT@value@englishauthor{***} \else \def\BIT@value@englishauthor{#1}\fi}
\newcommand\englishadvisor[1]{\ifBIT@isblindcheck \def\BIT@value@englishadvisor{***}\else \def\BIT@value@englishadvisor{#1}\fi}
\newcommand\englishschool[1]{\def\BIT@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\BIT@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\BIT@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\BIT@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\BIT@value@englishmajor{#1}}
\newcommand\englishchairman[1]{\def\BIT@value@englishchairman{#1}}

% "绘制"英文标题页
\def\BIT@underline@Length{230pt} %下划线长度
\newcommand\makeEnInfo[1]{%
  \cleardoublepage
  \thispagestyle{empty}

   \begin{center}


   \vspace*{5em}
%论文题目	  Times New Roman 一号 加粗
   {\zihao{-2}\bfseries\textbf{\BIT@value@englishtitle}}
   %\bfseries
   \vskip \stretch{2.5}
   
% Times New Roman 小三
   {\zihao{4}
 

      \BIT@label@englishauthor \\ {\zihao{4}\textbf{\BIT@value@englishauthor}}
    \vskip \stretch{0.5}
      \BIT@label@englishadvisor \\  {\zihao{4}\textbf{\BIT@value@englishadvisor}}
    \vskip \stretch{0.5}
     
      \BIT@label@englishdate    {\zihao{4}\textbf{\BIT@value@englishdate}}
}

  \end{center}

  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
  \thispagestyle{empty}
   \cleardoublepage
  \fi
}
\newcommand\makeEnglishInfo[1]{\ifBIT@isnormal \makeEnInfo \else {} \fi}

%绘制书脊，绘制树立排放的论文题目、作者姓名和学校名称
\newcommand\makeVerticalenWords[1]{\\\rotatebox[origin=c]{270}{#1} }%设置英文字母树立排放效果
\newcommand\makeVerticalTitle{
   \ifBIT@isnormal{
   \cleardoublepage
   \thispagestyle{empty}
   \vskip 5cm
   \begin{center}
    \setstretch{1.1}
    \begin{minipage}{1em}
        {\heiti\zihao{3}\BIT@value@vtitle}
        \vskip 2cm
        {\heiti\zihao{3}{\ifBIT@isblindcheck \rotatebox[origin=c]{270}{* * *}\else \BIT@value@author \fi}}  
        \vskip 2cm
        {\heiti\zihao{3}\BIT@value@school}
    \end{minipage}
   \end{center}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
	} 
	\fi

}


% 原创性声明
\newcommand\makeDeclareOriginaltemp{%
  \cleardoublepage
  \pdfbookmark[0]{声明}{statement}
  \thispagestyle{empty}
  \begin{center}
  {\bf\zihao{3} \BIT@label@original}
  \end{center}
  \vskip 10pt
  {\zihao{4}\BIT@label@originalcontent}
  \vskip 10pt
  \begin{flushleft}{\huawenxingwei \zihao{-3}\BIT@label@authorsign} \hspace{8.5em} {\huawenxingwei \zihao{-3}\BIT@label@originalDate \BITspace    年   \BITspace  月  \BITspace   日}\end{flushleft}

  \vskip 30mm

  \begin{center}
  {\bf\zihao{3} \BIT@label@authorization}
  \end{center}
  \vskip 10pt
  {\zihao{4} \BIT@label@authorizationcontent}
  \vskip 40pt

  \begin{flushleft}{{\huawenxingwei \zihao{-3}\BIT@label@authorsign}}  \hspace{8.5em} {{\huawenxingwei \zihao{-3}\BIT@label@Supervisorsign}} {}\end{flushleft}

  \vskip 15pt
\begin{flushleft}{\huawenxingwei \zihao{-3}\BIT@label@originalDate \BITspace   年    \BITspace 月  \BITspace   日}\hspace{5.5em} {\huawenxingwei \zihao{-3}\BIT@label@originalDate  \BITspace  年   \BITspace  月 \BITspace   日}\end{flushleft}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi

}
\newcommand\makeDeclareOriginal{\ifBIT@isnormal \makeDeclareOriginaltemp  \else  {} \fi} 

% 页眉页脚
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\songti \zihao{5} \BIT@label@headschoolname}  % 奇数页左页眉
\fancyfoot[C]{\songti \zihao{5} {\thepage}}      % 页脚


\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
  \fancyhf{}%
  \fancyfoot[C]{\songti \zihao{5} \BIT@label@headschoolname}
  \fancyfoot[C]{\songti \zihao{5} ~---~{\thepage}~---~} %%首页页脚格式
}


 % 中文摘要
 \newenvironment{abstract}
 {
  \cleardoublepage
  \chapter{\BIT@label@abstract}
 }
 {}
%下一页从偶数页开始
 \newcommand\beginatevenpage{
 \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
 }
 % 中文关键词
 \newcommand\keywords[1]{%
   \vspace{2ex}\noindent{\bf \BIT@label@keywords} #1}

 % 英文摘要
 \newenvironment{englishabstract}
 {
  \clearpage
  \chapter{\BIT@label@englishabstract}
 }
 {}

 % 英文摘要
 \newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \BIT@label@englishkeywords} #1}


%_ 目录
\renewcommand\tableofcontents{%
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi
  \zihao{-4}
  \chapter*{\contentsname}%目录里显示“目录”，否则\chapter*
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \pdfbookmark[0]{目录}{bittoc}
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}


%_ 参考文献环境
\renewenvironment{thebibliography}[1]
     {\zihao{5}
      \chapter*{\bibname}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \addcontentsline{toc}{chapter}{参考文献}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \setlength{\parsep}{1mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\newcommand{\pubitem}[5]{\ifBIT@isblindcheck \item{第#1作者 + #3 + #5.} \else \item{#2. #3[#4]. #5.} \fi}
\newenvironment{publications}[1]
     {\chapter{\BIT@label@publications}%
      \@mkboth{\MakeUppercase\BIT@label@publications}
              {\MakeUppercase\BIT@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \setlength{\parsep}{1mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

\newenvironment{projects}[1]
     {\chapter{\BIT@label@projects}%
      \@mkboth{\MakeUppercase\BIT@label@projects}
              {\MakeUppercase\BIT@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

    \newenvironment{resume}
  {\chapter{\BIT@label@resume}}
  {}

\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}

\newenvironment{resumeli}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}

\newenvironment{conclusion}
  {\chapter*{结论}
    \@mkboth{结论}{结论}%
    \addcontentsline{toc}{chapter}{结论}}
  {}

\renewenvironment{thanks}
  {\chapter{\BIT@label@thanks}
  \fangsong
  }
  {}
% 增加用于致谢的命令，在盲审模式下不显示
\newcommand\sayThanks[1]{\ifBIT@isblindcheck {} \else \chapter{\BIT@label@thanks} \fangsong{#1}\fi}

\newenvironment{symbolnote}
  {\chapter{\BIT@label@symbolnote}
  \fangsong}
  {}

  %%%============================术语=====================
  \newcommand{\bit@denotation@name}{主要符号对照表}
  \newenvironment{denotation}[1][2.5cm]{
      \chapter{\bit@denotation@name} % no tocline
      \noindent\begin{list}{}%
      {\vskip-30bp\zihao{-4}
       \renewcommand\makelabel[1]{##1\hfil}
       \setlength{\labelwidth}{#1} % 标签盒子宽度
       \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
       \setlength{\itemindent}{0cm} % 标签缩进量
       \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
       \setlength{\rightmargin}{0cm}
       \setlength{\parsep}{0cm} % 段落间距
       \setlength{\itemsep}{0cm} % 标签间距
      \setlength{\listparindent}{0cm} % 段落缩进量
      \setlength{\topsep}{0pt} % 标签与上文的间距
     }}{\end{list}}
%====增加化学、国际单位宏包
     \RequirePackage[version=4]{mhchem}
     \RequirePackage{siunitx}
\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)


\endinput
%%
%% End of file `bitmaster-xetex.cls'.