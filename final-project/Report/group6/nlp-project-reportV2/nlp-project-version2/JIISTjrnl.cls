%%
%% JIISTjrnl.cls  2016/05/20 version V1.0 based on
%% IEEEtran.cls 2015/08/26 version V1.8b 
%% 
%% This file contains name changes and some format changes from original document
%%
%% This is the official JIIST LaTeX class for authors of the Journal of Intelligent Informatics and Smart Technology
%% 
%% http://jiist.aiat.in.th/
%%
%% 
%%*************************************************************************
%% Legal Notice:
%% This code is offered as-is without any warranty either expressed or
%% implied; without even the implied warranty of MERCHANTABILITY or
%% FITNESS FOR A PARTICULAR PURPOSE! 
%% User assumes all risk.
%% In no event shall JIIST or any contributor to this code be liable for
%% any damages or losses, including, but not limited to, incidental,
%% consequential, or any other damages, resulting from the use or misuse
%% of any information contained here.
%%
%%
%% This work is distributed under the LaTeX Project Public License (LPPL)
%% ( http://www.latex-project.org/ ) version 1.3, and may be freely used,
%% distributed and modified. A copy of the LPPL, version 1.3, is included
%% in the base LaTeX documentation of all distributions of LaTeX released
%% 2003/12/01 or later.
%% Retain all contribution notices and credits.
%% ** Modified files should be clearly indicated as such, including  **
%% ** renaming them and changing author support contact information. **
%%
%%*************************************************************************
%%
%

% Available class options 
% e.g., \documentclass[10pt,conference]{JIISTjrnl} 
% 
%             *** choose only one from each category ***
%
% 9pt, 10pt, 11pt, 12pt
%    Sets normal font size. The default is 10pt.
% 
% conference, journal, technote, peerreview, peerreviewca
%    determines format mode - conference papers, journal papers,
%    correspondence papers (technotes), or peer review papers. The user
%    should also select 9pt when using technote. peerreview is like
%    journal mode, but provides for a single-column "cover" title page for
%    anonymous peer review. The paper title (without the author names) is
%    repeated at the top of the page after the cover page. For peer review
%    papers, the \JIISTpeerreviewmaketitle command must be executed (will
%    automatically be ignored for non-peerreview modes) at the place the
%    cover page is to end, usually just after the abstract (keywords are
%    not normally used with peer review papers). peerreviewca is like
%    peerreview, but allows the author names to be entered and formatted
%    as with conference mode so that author affiliation and contact
%    information can be easily seen on the cover page.
%    The default is journal.
%
% draft, draftcls, draftclsnofoot, final
%    determines if paper is formatted as a widely spaced draft (for
%    handwritten editor comments) or as a properly typeset final version.
%    draftcls restricts draft mode to the class file while all other LaTeX
%    packages (i.e., \usepackage{graphicx}) will behave as final - allows
%    for a draft paper with visible figures, etc. draftclsnofoot is like
%    draftcls, but does not display the date and the word "DRAFT" at the foot
%    of the pages. If using one of the draft modes, the user will probably
%    also want to select onecolumn.
%    The default is final.
%
% letterpaper, a4paper, cspaper
%    determines paper size: 8.5in X 11in, 210mm X 297mm or 7.875in X 10.75in.
%    Changing the paper size in the standard journal and conference modes
%    will not alter the typesetting of the document - only the margins will
%    be affected. In particular, documents using the a4paper option will
%    have reduced side margins (A4 is narrower than US letter) and a longer
%    bottom margin (A4 is longer than US letter). For both cases, the top
%    margins will be the same and the text will be horizontally centered.
%    For the compsoc conference and draft modes, it is the margins that will
%    remain constant, and thus the text area size will vary, with changes in
%    the paper size.
%    The cspaper option is the special ``trim'' paper size (7.875in x 10.75in)
%    used in the actual publication of Computer Society journals. Under
%    compsoc journal mode, this option does not alter the typesetting of the
%    document. Authors should invoke the cspaper option only if requested to
%    do so by the editors of the specific journal they are submitting to.
%    For final submission to the JIIST, authors should generally use US letter 
%    (8.5 X 11in) paper unless otherwise instructed. Note that authors should
%    ensure that all post-processing (ps, pdf, etc.) uses the same paper
%    specificiation as the .tex document. Problems here are by far the number
%    one reason for incorrect margins. JIISTjrnl will automatically set the
%    default paper size under pdflatex (without requiring any change to
%    pdftex.cfg), so this issue is more important to dvips users. Fix
%    config.ps, config.pdf, or ~/.dvipsrc for dvips, or use the
%    dvips -t papersize option instead as needed. For the cspaper option,
%    the corresponding dvips paper name is "IEEEcs".
%    See the testflow documentation
%    http://www.ctan.org/tex-archive/macros/latex/contrib/IEEEtran/testflow
%    for more details on dvips paper size configuration.
%    The default is letterpaper.
%
% oneside, twoside
%    determines if layout follows single sided or two sided (duplex)
%    printing. The only notable change is with the headings at the top of
%    the pages.
%    The default is oneside.
%
% onecolumn, twocolumn
%    determines if text is organized into one or two columns per page. One
%    column mode is usually used only with draft papers.
%    The default is twocolumn.
%
% romanappendices
%    Use the "Appendix I" convention when numbering appendices. JIISTjrnl.cls
%    now defaults to Alpha "Appendix A" convention - the opposite of what
%    v1.6b and earlier did.
%
% captionsoff
%    disables the display of the figure/table captions. Some JIIST journals
%    request that captions be removed and figures/tables be put on pages
%    of their own at the end of an initial paper submission. The endfloat
%    package can be used with this class option to achieve this format.
%
% nofonttune
%    turns off tuning of the font interword spacing. Maybe useful to those
%    not using the standard Times fonts or for those who have already "tuned"
%    their fonts.
%    The default is to enable JIISTjrnl to tune font parameters.
%
%
%----------
% Available CLASSINPUTs provided (all are macros unless otherwise noted):
% \CLASSINPUTbaselinestretch
% \CLASSINPUTinnersidemargin
% \CLASSINPUToutersidemargin
% \CLASSINPUTtoptextmargin
% \CLASSINPUTbottomtextmargin
%
% Available CLASSINFOs provided:
% \ifCLASSINFOpdf                       (TeX if conditional)
% \CLASSINFOpaperwidth                  (macro)
% \CLASSINFOpaperheight                 (macro)
% \CLASSINFOnormalsizebaselineskip      (length)
% \CLASSINFOnormalsizeunitybaselineskip (length)
%
% Available CLASSOPTIONs provided:
% all class option flags (TeX if conditionals) unless otherwise noted,
% e.g., \ifCLASSOPTIONcaptionsoff
% point size options provided as a single macro:
% \CLASSOPTIONpt
% which will be defined as 9, 10, 11, or 12 depending on the document's
% normalsize point size.
% also, class option peerreviewca implies the use of class option peerreview
% and classoption draft implies the use of class option draftcls





\ProvidesClass{JIISTjrnl}[2016/05/20 V1.0]
\typeout{-- See the "http://jiist.aiat.in.th/" for usage information.}
\NeedsTeXFormat{LaTeX2e}

% JIISTjrnl.cls version numbers, provided as of V1.3
% These values serve as a way a .tex file can
% determine if the new features are provided.
% The version number of this JIISTjrnls.cls can be obtained from 
% these values. i.e., V1.4
% KEEP THESE AS INTEGERS! i.e., NO {4a} or anything like that-
% (no need to enumerate "a" minor changes here)
\def\JIISTjrnlsversionmajor{1}
\def\JIISTjrnlsversionminor{0}


% hook to allow easy changeover to JIISTjrnl.cls/tools.sty error reporting
\def\@JIISTclspkgerror{\ClassError{JIISTjrnl}}


% These do nothing, but provide them like in article.cls
\newif\if@restonecol
\newif\if@titlepage


% class option conditionals
\newif\ifCLASSOPTIONonecolumn       \CLASSOPTIONonecolumnfalse
\newif\ifCLASSOPTIONtwocolumn       \CLASSOPTIONtwocolumntrue

\newif\ifCLASSOPTIONoneside         \CLASSOPTIONonesidetrue
\newif\ifCLASSOPTIONtwoside         \CLASSOPTIONtwosidefalse

\newif\ifCLASSOPTIONfinal           \CLASSOPTIONfinaltrue
\newif\ifCLASSOPTIONdraft           \CLASSOPTIONdraftfalse
\newif\ifCLASSOPTIONdraftcls        \CLASSOPTIONdraftclsfalse
\newif\ifCLASSOPTIONdraftclsnofoot  \CLASSOPTIONdraftclsnofootfalse

\newif\ifCLASSOPTIONpeerreview      \CLASSOPTIONpeerreviewfalse
\newif\ifCLASSOPTIONpeerreviewca    \CLASSOPTIONpeerreviewcafalse

\newif\ifCLASSOPTIONjournal         \CLASSOPTIONjournaltrue
\newif\ifCLASSOPTIONconference      \CLASSOPTIONconferencefalse
\newif\ifCLASSOPTIONtechnote        \CLASSOPTIONtechnotefalse

\newif\ifCLASSOPTIONnofonttune      \CLASSOPTIONnofonttunefalse

\newif\ifCLASSOPTIONcaptionsoff     \CLASSOPTIONcaptionsofffalse

\newif\ifCLASSOPTIONcomsoc          \CLASSOPTIONcomsocfalse
\newif\ifCLASSOPTIONcompsoc         \CLASSOPTIONcompsocfalse
\newif\ifCLASSOPTIONtransmag        \CLASSOPTIONtransmagfalse

\newif\ifCLASSOPTIONromanappendices \CLASSOPTIONromanappendicesfalse


% class info conditionals

% indicates if pdf (via pdflatex) output
\newif\ifCLASSINFOpdf               \CLASSINFOpdffalse


% V1.6b internal flag to show if using a4paper
\newif\if@JIISTusingAfourpaper       \@JIISTusingAfourpaperfalse
% V1.6b internal flag to show if using cspaper
\newif\if@JIISTusingcspaper          \@JIISTusingcspaperfalse


% JIISTjrnl class scratch pad registers
% dimen
\newdimen\@JIISTjrnltmpdimenA
\newdimen\@JIISTjrnltmpdimenB
\newdimen\@JIISTjrnltmpdimenC
% count
\newcount\@JIISTjrnltmpcountA
\newcount\@JIISTjrnltmpcountB
\newcount\@JIISTjrnltmpcountC
% token list
\newtoks\@JIISTjrnltmptoksA

% we use \CLASSOPTIONpt so that we can ID the point size (even for 9pt docs)
% as well as LaTeX's \@ptsize to retain some compatability with some
% external packages
\def\@ptsize{0}
% LaTeX does not support 9pt, so we set \@ptsize to 0 - same as that of 10pt
\DeclareOption{9pt}{\def\CLASSOPTIONpt{9}\def\@ptsize{0}}
\DeclareOption{10pt}{\def\CLASSOPTIONpt{10}\def\@ptsize{0}}
\DeclareOption{11pt}{\def\CLASSOPTIONpt{11}\def\@ptsize{1}}
\DeclareOption{12pt}{\def\CLASSOPTIONpt{12}\def\@ptsize{2}}



\DeclareOption{letterpaper}{\setlength{\paperwidth}{8.5in}%
                            \setlength{\paperheight}{11in}%
                            \@JIISTusingAfourpaperfalse
                            \@JIISTusingcspaperfalse
                            \def\CLASSOPTIONpaper{letter}%
                            \def\CLASSINFOpaperwidth{8.5in}%
                            \def\CLASSINFOpaperheight{11in}}


\DeclareOption{a4paper}{\setlength{\paperwidth}{210mm}%
                        \setlength{\paperheight}{297mm}%
                        \@JIISTusingAfourpapertrue
                        \@JIISTusingcspaperfalse
                        \def\CLASSOPTIONpaper{a4}%
                        \def\CLASSINFOpaperwidth{210mm}%
                        \def\CLASSINFOpaperheight{297mm}}

% special paper option for compsoc journals
\DeclareOption{cspaper}{\setlength{\paperwidth}{7.875in}%
                        \setlength{\paperheight}{10.75in}%
                        \@JIISTusingcspapertrue
                        \@JIISTusingAfourpaperfalse
                        \def\CLASSOPTIONpaper{JIISTcs}%
                        \def\CLASSINFOpaperwidth{7.875in}%
                        \def\CLASSINFOpaperheight{10.75in}}

\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse
                        \CLASSOPTIONonesidetrue\CLASSOPTIONtwosidefalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue
                        \CLASSOPTIONtwosidetrue\CLASSOPTIONonesidefalse}

\DeclareOption{onecolumn}{\CLASSOPTIONonecolumntrue\CLASSOPTIONtwocolumnfalse}
\DeclareOption{twocolumn}{\CLASSOPTIONtwocolumntrue\CLASSOPTIONonecolumnfalse}

% If the user selects draft, then this class AND any packages
% will go into draft mode.
\DeclareOption{draft}{\CLASSOPTIONdrafttrue\CLASSOPTIONdraftclstrue
                      \CLASSOPTIONdraftclsnofootfalse} 
% draftcls is for a draft mode which will not affect any packages
% used by the document.
\DeclareOption{draftcls}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclstrue
                         \CLASSOPTIONdraftclsnofootfalse} 
% draftclsnofoot is like draftcls, but without the footer.
\DeclareOption{draftclsnofoot}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclstrue
                               \CLASSOPTIONdraftclsnofoottrue} 
\DeclareOption{final}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclsfalse
                      \CLASSOPTIONdraftclsnofootfalse}

\DeclareOption{journal}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                        \CLASSOPTIONjournaltrue\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotefalse}

\DeclareOption{conference}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                           \CLASSOPTIONjournalfalse\CLASSOPTIONconferencetrue\CLASSOPTIONtechnotefalse}

\DeclareOption{technote}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                         \CLASSOPTIONjournalfalse\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotetrue}

\DeclareOption{peerreview}{\CLASSOPTIONpeerreviewtrue\CLASSOPTIONpeerreviewcafalse
                           \CLASSOPTIONjournalfalse\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotefalse}

\DeclareOption{peerreviewca}{\CLASSOPTIONpeerreviewtrue\CLASSOPTIONpeerreviewcatrue
                             \CLASSOPTIONjournalfalse\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotefalse}

\DeclareOption{nofonttune}{\CLASSOPTIONnofonttunetrue}

\DeclareOption{captionsoff}{\CLASSOPTIONcaptionsofftrue}

\DeclareOption{comsoc}{\CLASSOPTIONcomsoctrue\CLASSOPTIONcompsocfalse\CLASSOPTIONtransmagfalse}

\DeclareOption{compsoc}{\CLASSOPTIONcomsocfalse\CLASSOPTIONcompsoctrue\CLASSOPTIONtransmagfalse}

\DeclareOption{transmag}{\CLASSOPTIONtransmagtrue\CLASSOPTIONcomsocfalse\CLASSOPTIONcompsocfalse}

\DeclareOption{romanappendices}{\CLASSOPTIONromanappendicestrue}


% default to US letter paper, 10pt, twocolumn, one sided, final, journal
\ExecuteOptions{a4paper,10pt,twocolumn,oneside,final,journal}
% overrride these defaults per user requests
\ProcessOptions



%% -- Command Argument Scanning Support Functions --

% Sets the category codes for punctuation to their normal values.
% For local use with argument scanning.
\def\JIISTnormalcatcodespunct{\catcode`\!=12 \catcode`\,=12 \catcode`\:=12
\catcode`\;=12 \catcode`\`=12 \catcode`\'=12 \catcode`\"=12 \catcode`\.=12
\catcode`\/=12 \catcode`\?=12 \catcode`\*=12 \catcode`\+=12 \catcode`\-=12
\catcode`\<=12 \catcode`\>=12 \catcode`\(=12 \catcode`\)=12 \catcode`\[=12
\catcode`\]=12 \catcode`\==12 \catcode`\|=12}
% Sets the category codes for numbers to their normal values.
% For local use with argument scanning.
\def\JIISTnormalcatcodesnum{\catcode`\0=12 \catcode`\1=12 \catcode`\2=12
\catcode`\3=12 \catcode`\4=12 \catcode`\5=12 \catcode`\6=12 \catcode`\7=12
\catcode`\8=12 \catcode`\9=12}
% combined action of \JIISTnormalcatcodespunct and \JIISTnormalcatcodesnum
\def\JIISTnormalcatcodes{\JIISTnormalcatcodespunct\JIISTnormalcatcodesnum}


% usage: \@JIISTextracttoken*{}
% \@JIISTextracttoken fully expands its argument (which it then stores in
% \@JIISTextracttokenarg) via \edef and then the meaning of the first
% nonbrace (but including the empty group) token found is assigned via \let
% to \@JIISTextractedtoken as well as stored in the macro
% \@JIISTextractedtokenmacro. Tokens that would otherwise be discarded during
% the acquisition of the first are stored in \@JIISTextractedtokensdiscarded,
% however their original relative brace nesting depths are not guaranteed to
% be preserved.
% If the argument is empty, or if a first nonbrace token does not exist (or
% is an empty group), \@JIISTextractedtoken will be \relax and
% \@JIISTextractedtokenmacro and \@JIISTextractedtokensdiscarded will be empty.
%
% For example:
% \@JIISTextracttoken{{{ab}{cd}}{{ef}g}}
% results in:
%
% \@JIISTextracttokenarg          ==> a macro containing {{ab}{cd}}{{ef}g}
% \@JIISTextractedtoken           ==> the letter a
% \@JIISTextractedtokenmacro      ==> a macro containing a
% \@JIISTextractedtokensdiscarded ==> a macro containing bcd{ef}g
%
% the *-star form, \@JIISTextracttoken*, does not expand its argument
% contents during processing.
\def\@JIISTextracttoken{\@ifstar{\let\@JIISTextracttokendef=\def\@@JIISTextracttoken}{\let\@JIISTextracttokendef=\edef\@@JIISTextracttoken}}

\def\@@JIISTextracttoken#1{\@JIISTextracttokendef\@JIISTextracttokenarg{#1}\relax
\def\@JIISTextractedtokensdiscarded{}\relax % initialize to empty
% if the macro is unchanged after being acquired as a single undelimited argument
% with anything after it being stripped off as a delimited argument
% we know we have one token without any enclosing braces. loop until this is true.
\let\@JIISTextracttokencurgroup\@JIISTextracttokenarg
\loop
  % trap case of an empty argument as this would cause a problem with
  % \@@@JIISTextracttoken's first (nondelimited) argument acquisition
  \ifx\@JIISTextracttokencurgroup\@empty
    \def\@JIISTextractedtokenmacro{}\relax
  \else
    \expandafter\@@@JIISTextracttoken\@JIISTextracttokencurgroup\@JIISTgeneralsequenceDELIMITER\relax
  \fi
  \ifx\@JIISTextractedtokenmacro\@JIISTextracttokencurgroup
  \else
    \let\@JIISTextracttokencurgroup=\@JIISTextractedtokenmacro
\repeat
% we can safely do a \let= here because there should be at most one token
% the relax is needed to handle the case of no token found
\expandafter\let\expandafter\@JIISTextractedtoken\@JIISTextractedtokenmacro\relax}

\def\@@@JIISTextracttoken#1#2\@JIISTgeneralsequenceDELIMITER{\def\@JIISTextractedtokenmacro{#1}\relax
\def\@@JIISTextractedtokensdiscarded{#2}\expandafter\expandafter\expandafter\def\expandafter\expandafter\expandafter
\@JIISTextractedtokensdiscarded\expandafter\expandafter\expandafter
{\expandafter\@@JIISTextractedtokensdiscarded\@JIISTextractedtokensdiscarded}}
%%
%% -- End of Command Argument Scanning Support Functions --



% Computer Society conditional execution command
\long\def\@JIISTcompsoconly#1{\relax\ifCLASSOPTIONcompsoc\relax#1\relax\fi\relax}
% inverse
\long\def\@JIISTnotcompsoconly#1{\relax\ifCLASSOPTIONcompsoc\else\relax#1\relax\fi\relax}
% compsoc conference
\long\def\@JIISTcompsocconfonly#1{\relax\ifCLASSOPTIONcompsoc\ifCLASSOPTIONconference\relax#1\relax\fi\fi\relax}
% compsoc not conference
\long\def\@JIISTcompsocnotconfonly#1{\relax\ifCLASSOPTIONcompsoc\ifCLASSOPTIONconference\else\relax#1\relax\fi\fi\relax}


% comsoc verify that newtxmath, mtpro2, mt11p or mathtime has been loaded
\def\@JIISTcomsocverifymathfont{\typeout{-- Verifying Times compatible math font.}\relax
  \@ifpackageloaded{newtxmath}{\typeout{-- newtxmath loaded, OK.}}{\@@JIISTcomsocverifymathfont}}
\def\@@JIISTcomsocverifymathfont{\@ifpackageloaded{mtpro2}{\typeout{-- mtpro2 loaded, OK.}}{\@@@JIISTcomsocverifymathfont}}
\def\@@@JIISTcomsocverifymathfont{\@ifpackageloaded{mt11p}{\typeout{-- mt11p2 loaded, OK.}}{\@@@@JIISTcomsocverifymathfont}}
\def\@@@@JIISTcomsocverifymathfont{\@ifpackageloaded{mathtime}{\typeout{-- mathtime loaded, OK.}}{\@JIISTcomsocenforcemathfont}}

% comsoc, if a Times math font was not loaded by user, enforce it
\def\@JIISTcomsocenforcemathfont{\typeout{** Times compatible math font not found, forcing.}\relax
\IfFileExists{newtxmath.sty}{\typeout{-- Found newtxmath, loading.}\RequirePackage{newtxmath}}{\@@JIISTcomsocenforcemathfont}}
\def\@@JIISTcomsocenforcemathfont{\IfFileExists{mtpro2.sty}{\typeout{-- Found mtpro2, loading.}\RequirePackage{mtpro2}}{\@@@JIISTcomsocenforcemathfont}}
\def\@@@JIISTcomsocenforcemathfont{\IfFileExists{mt11p.sty}{\typeout{-- Found mt11p, loading.}\RequirePackage{mt11p}}{\@@@@JIISTcomsocenforcemathfont}}
\def\@@@@JIISTcomsocenforcemathfont{\IfFileExists{mathtime.sty}{\typeout{-- Found mathtime, loading.}\RequirePackage{mathtime}}{\@@@@@JIISTcomsocenforcemathfont}}
% if no acceptable Times math font package found, error with newtxmath requirement
\def\@@@@@JIISTcomsocenforcemathfont{\typeout{** No Times compatible math font package found. newtxmath is required.}\RequirePackage{newtxmath}}


\ifCLASSOPTIONcomsoc
  % ensure that if newtxmath is used, the cmintegrals option is also invoked
  \PassOptionsToPackage{cmintegrals}{newtxmath}
  % comsoc requires a Times like math font
  % ensure this requirement is satisfied at document start
  \AtBeginDocument{\@JIISTcomsocverifymathfont}
\fi



% The JIIST uses Times Roman font, so we'll default to Times.
% These three commands make up the entire times.sty package.
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{ptm}
\renewcommand{\ttdefault}{pcr}

% V1.7 compsoc nonconference papers, use Palatino/Palladio as the main text font,
% not Times Roman.
\@JIISTcompsocnotconfonly{\renewcommand{\rmdefault}{ppl}}

% enable the selected main text font
\normalfont\selectfont


\ifCLASSOPTIONcomsoc
  \typeout{-- Using JIIST Communications Society mode.}
\fi

\ifCLASSOPTIONcompsoc
  \typeout{-- Using JIIST Computer Society mode.}
\fi


% V1.7 conference notice message hook
\def\@JIISTconsolenoticeconference{\typeout{}%
\typeout{** Conference Paper **}%
\typeout{Before submitting the final camera ready copy, remember to:}%
\typeout{}%
\typeout{ 1. Manually equalize the lengths of two columns on the last page}%
\typeout{ of your paper;}%
\typeout{}%
\typeout{ 2. Ensure that any PostScript and/or PDF output post-processing}%
\typeout{ uses only Type 1 fonts and that every step in the generation}%
\typeout{ process uses the appropriate paper size.}%
\typeout{}}


% we can send console reminder messages to the user here
\AtEndDocument{\ifCLASSOPTIONconference\@JIISTconsolenoticeconference\fi}


% warn about the use of single column other than for draft mode
\ifCLASSOPTIONtwocolumn\else%
  \ifCLASSOPTIONdraftcls\else%
   \typeout{** ATTENTION: Single column mode is not typically used with JIIST publications.}%
  \fi%
\fi


% V1.7 improved paper size setting code.
% Set pdfpage and dvips paper sizes. Conditional tests are similar to that
% of ifpdf.sty. Retain within {} to ensure tested macros are never altered,
% even if only effect is to set them to \relax.
% if \pdfoutput is undefined or equal to relax, output a dvips special
{\@ifundefined{pdfoutput}{\AtBeginDvi{\special{papersize=\CLASSINFOpaperwidth,\CLASSINFOpaperheight}}}{%
% pdfoutput is defined and not equal to \relax
% check for pdfpageheight existence just in case someone sets pdfoutput
% under non-pdflatex. If exists, set them regardless of value of \pdfoutput.
\@ifundefined{pdfpageheight}{\relax}{\global\pdfpagewidth\paperwidth
\global\pdfpageheight\paperheight}%
% if using \pdfoutput=0 under pdflatex, send dvips papersize special
\ifcase\pdfoutput
\AtBeginDvi{\special{papersize=\CLASSINFOpaperwidth,\CLASSINFOpaperheight}}%
\else
% we are using pdf output, set CLASSINFOpdf flag
\global\CLASSINFOpdftrue
\fi}}

% let the user know the selected papersize
\typeout{-- Using \CLASSINFOpaperwidth\space x \CLASSINFOpaperheight\space
(\CLASSOPTIONpaper)\space paper.}

\ifCLASSINFOpdf
\typeout{-- Using PDF output.}
\else
\typeout{-- Using DVI output.}
\fi


% The idea hinted here is for LaTeX to generate markleft{} and markright{}
% automatically for you after you enter \author{}, \journal{},
% \journaldate{}, journalvol{}, \journalnum{}, etc.
% However, there may be some backward compatibility issues here as
% well as some special applications for JIISTjrnl.cls and special issues
% that may require the flexible \markleft{}, \markright{} and/or \markboth{}.
% We'll leave this as an open future suggestion.
%\newcommand{\journal}[1]{\def\@journal{#1}}
%\def\@journal{}



% pointsize values
% used with ifx to determine the document's normal size
\def\@JIISTptsizenine{9}
\def\@JIISTptsizeten{10}
\def\@JIISTptsizeeleven{11}
\def\@JIISTptsizetwelve{12}



% FONT DEFINITIONS (No sizexx.clo file needed) 
% V1.6 revised font sizes, displayskip values and
%      revised normalsize baselineskip to reduce underfull vbox problems
%      on the 58pc = 696pt = 9.5in text height we want
%      normalsize     #lines/column  baselineskip (aka leading)
%             9pt     63             11.0476pt (truncated down)
%            10pt     58             12pt      (exact)
%            11pt     52             13.3846pt (truncated down)
%            12pt     50             13.92pt   (exact)
%

% we need to store the nominal baselineskip for the given font size
% in case baselinestretch ever changes.
% this is a dimen, so it will not hold stretch or shrink
\newdimen\@JIISTnormalsizeunitybaselineskip
\@JIISTnormalsizeunitybaselineskip\baselineskip



%% ******* WARNING! *******
%%
%% Authors should not alter font sizes, baselineskip ("leading"),
%% margins or other spacing values in an attempt to squeeze more
%% material on each page.
%%
%% The JIIST's own typesetting software will restore the correct
%% values when re-typesetting/proofing the submitted document,
%% possibly resulting in unexpected article over length charges.
%%
%% ******* WARNING! *******


% 9pt option defaults
\ifx\CLASSOPTIONpt\@JIISTptsizenine
\typeout{-- This is a 9 point document.}
\def\normalsize{\@setfontsize{\normalsize}{9}{11.0476pt}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{11.0476pt}
\normalsize
\abovedisplayskip 1.5ex plus 3pt minus 1pt
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 3pt
\belowdisplayshortskip 1.5ex plus 3pt minus 1pt
\def\small{\@setfontsize{\small}{8.5}{10pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{9pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{8pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
% sublargesize is the same as large - 10pt
\def\sublargesize{\@setfontsize{\sublargesize}{10}{12pt}}
\def\large{\@setfontsize{\large}{10}{12pt}}
\def\Large{\@setfontsize{\Large}{12}{14pt}}
\def\LARGE{\@setfontsize{\LARGE}{14}{17pt}}
\def\huge{\@setfontsize{\huge}{17}{20pt}}
\def\Huge{\@setfontsize{\Huge}{20}{24pt}}
\fi
%
% 10pt option defaults
\ifx\CLASSOPTIONpt\@JIISTptsizeten
\typeout{-- This is a 10 point document.}
\def\normalsize{\@setfontsize{\normalsize}{10}{12.00pt}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{12pt}
\normalsize
\abovedisplayskip 1.5ex plus 4pt minus 2pt
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 4pt
\belowdisplayshortskip 1.5ex plus 4pt minus 2pt
\def\small{\@setfontsize{\small}{9}{10pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{9pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{8pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
% sublargesize is a tad smaller than large - 11pt
\def\sublargesize{\@setfontsize{\sublargesize}{11}{13.4pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi
%
% 11pt option defaults
\ifx\CLASSOPTIONpt\@JIISTptsizeeleven
\typeout{-- This is an 11 point document.}
\def\normalsize{\@setfontsize{\normalsize}{11}{13.3846pt}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{13.3846pt}
\normalsize
\abovedisplayskip 1.5ex plus 5pt minus 3pt
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 5pt
\belowdisplayshortskip 1.5ex plus 5pt minus 3pt
\def\small{\@setfontsize{\small}{10}{12pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{9}{10.5pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{8}{9pt}}
\def\tiny{\@setfontsize{\tiny}{6}{7pt}}
% sublargesize is the same as large - 12pt
\def\sublargesize{\@setfontsize{\sublargesize}{12}{14pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi
%
% 12pt option defaults
\ifx\CLASSOPTIONpt\@JIISTptsizetwelve
\typeout{-- This is a 12 point document.}
\def\normalsize{\@setfontsize{\normalsize}{12}{13.92pt}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{13.92pt}
\normalsize
\abovedisplayskip 1.5ex plus 6pt minus 4pt
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 6pt
\belowdisplayshortskip 1.5ex plus 6pt minus 4pt
\def\small{\@setfontsize{\small}{10}{12pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{9}{10.5pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{8}{9pt}}
\def\tiny{\@setfontsize{\tiny}{6}{7pt}}
% sublargesize is the same as large - 14pt
\def\sublargesize{\@setfontsize{\sublargesize}{14}{17pt}}
\def\large{\@setfontsize{\large}{14}{17pt}}
\def\Large{\@setfontsize{\Large}{17}{20pt}}
\def\LARGE{\@setfontsize{\LARGE}{20}{24pt}}
\def\huge{\@setfontsize{\huge}{22}{26pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi



% V1.8a compsoc font sizes
% compsoc font sizes use bp "Postscript" point units (1/72in) 
% rather than the traditional pt (1/72.27)
\ifCLASSOPTIONcompsoc
% -- compsoc defaults --
% ** will override some of these values later **
% 9pt
\ifx\CLASSOPTIONpt\@JIISTptsizenine
\def\normalsize{\@setfontsize{\normalsize}{9bp}{11bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{11bp}
\normalsize
\abovedisplayskip 1.5ex plus 3bp minus 1bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0bp plus 3bp
\belowdisplayshortskip 1.5ex plus 3bp minus 1bp
\def\small{\@setfontsize{\small}{8.5bp}{10bp}}
\def\footnotesize{\@setfontsize{\footnotesize}{8bp}{9bp}}
\def\scriptsize{\@setfontsize{\scriptsize}{7bp}{8bp}}
\def\tiny{\@setfontsize{\tiny}{5bp}{6bp}}
% sublargesize is the same as large - 10bp
\def\sublargesize{\@setfontsize{\sublargesize}{10bp}{12bp}}
\def\large{\@setfontsize{\large}{10bp}{12bp}}
\def\Large{\@setfontsize{\Large}{12bp}{14bp}}
\def\LARGE{\@setfontsize{\LARGE}{14bp}{17bp}}
\def\huge{\@setfontsize{\huge}{17bp}{20bp}}
\def\Huge{\@setfontsize{\Huge}{20bp}{24bp}}
\fi
%
% 10pt
\ifx\CLASSOPTIONpt\@JIISTptsizeten
\def\normalsize{\@setfontsize{\normalsize}{10bp}{12bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{12bp}
\normalsize
\abovedisplayskip 1.5ex plus 4bp minus 2bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 4bp
\belowdisplayshortskip 1.5ex plus 4bp minus 2bp
\def\small{\@setfontsize{\small}{9bp}{10bp}}
\def\footnotesize{\@setfontsize{\footnotesize}{8bp}{9bp}}
\def\scriptsize{\@setfontsize{\scriptsize}{7bp}{8bp}}
\def\tiny{\@setfontsize{\tiny}{5bp}{6bp}}
% sublargesize is a tad smaller than large - 11bp
\def\sublargesize{\@setfontsize{\sublargesize}{11bp}{13.5bp}}
\def\large{\@setfontsize{\large}{12bp}{14bp}}
\def\Large{\@setfontsize{\Large}{14bp}{17bp}}
\def\LARGE{\@setfontsize{\LARGE}{17bp}{20bp}}
\def\huge{\@setfontsize{\huge}{20bp}{24bp}}
\def\Huge{\@setfontsize{\Huge}{24bp}{28bp}}
\fi
%
% 11pt
\ifx\CLASSOPTIONpt\@JIISTptsizeeleven
\def\normalsize{\@setfontsize{\normalsize}{11bp}{13.5bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{13.5bp}
\normalsize
\abovedisplayskip 1.5ex plus 5bp minus 3bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 5bp
\belowdisplayshortskip 1.5ex plus 5bp minus 3bp
\def\small{\@setfontsize{\small}{10bp}{12bp}}
\def\footnotesize{\@setfontsize{\footnotesize}{9bp}{10.5bp}}
\def\scriptsize{\@setfontsize{\scriptsize}{8bp}{9bp}}
\def\tiny{\@setfontsize{\tiny}{6bp}{7bp}}
% sublargesize is the same as large - 12bp
\def\sublargesize{\@setfontsize{\sublargesize}{12bp}{14bp}}
\def\large{\@setfontsize{\large}{12bp}{14bp}}
\def\Large{\@setfontsize{\Large}{14bp}{17bp}}
\def\LARGE{\@setfontsize{\LARGE}{17bp}{20bp}}
\def\huge{\@setfontsize{\huge}{20bp}{24bp}}
\def\Huge{\@setfontsize{\Huge}{24bp}{28bp}}
\fi
%
% 12pt
\ifx\CLASSOPTIONpt\@JIISTptsizetwelve
\def\normalsize{\@setfontsize{\normalsize}{12bp}{14bp}}%
\setlength{\@JIISTnormalsizeunitybaselineskip}{14bp}%
\normalsize
\abovedisplayskip 1.5ex plus 6bp minus 4bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 6bp
\belowdisplayshortskip 1.5ex plus 6bp minus 4bp
\def\small{\@setfontsize{\small}{10bp}{12bp}}
\def\footnotesize{\@setfontsize{\footnotesize}{9bp}{10.5bp}}
\def\scriptsize{\@setfontsize{\scriptsize}{8bp}{9bp}}
\def\tiny{\@setfontsize{\tiny}{6bp}{7bp}}
% sublargesize is the same as large - 14bp
\def\sublargesize{\@setfontsize{\sublargesize}{14bp}{17bp}}
\def\large{\@setfontsize{\large}{14bp}{17bp}}
\def\Large{\@setfontsize{\Large}{17bp}{20bp}}
\def\LARGE{\@setfontsize{\LARGE}{20bp}{24bp}}
\def\huge{\@setfontsize{\huge}{22bp}{26bp}}
\def\Huge{\@setfontsize{\Huge}{24bp}{28bp}}
\fi
%
% -- override defaults: compsoc journals use special normalsizes --
\ifCLASSOPTIONconference
% 
% compsoc conferences
% 9pt
\ifx\CLASSOPTIONpt\@JIISTptsizenine
\def\normalsize{\@setfontsize{\normalsize}{9bp}{10.8bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{10.8bp}
\normalsize
\abovedisplayskip 1.5ex plus 3bp minus 1bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0bp plus 3bp
\belowdisplayshortskip 1.5ex plus 3bp minus 1bp
\fi
% 10pt
\ifx\CLASSOPTIONpt\@JIISTptsizeten
\def\normalsize{\@setfontsize{\normalsize}{10bp}{11.2bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{11.2bp}
\normalsize
\abovedisplayskip 1.5ex plus 4bp minus 2bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 4bp
\belowdisplayshortskip 1.5ex plus 4bp minus 2bp
\fi
% 11pt
\ifx\CLASSOPTIONpt\@JIISTptsizeeleven
\def\normalsize{\@setfontsize{\normalsize}{11bp}{13.2bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{13.2bp}
\normalsize
\abovedisplayskip 1.5ex plus 5bp minus 3bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 5bp
\belowdisplayshortskip 1.5ex plus 5bp minus 3bp
\fi
% 12pt
\ifx\CLASSOPTIONpt\@JIISTptsizetwelve
\def\normalsize{\@setfontsize{\normalsize}{12bp}{14.4bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{14.4bp}
\normalsize
\abovedisplayskip 1.5ex plus 6bp minus 4bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 6bp
\belowdisplayshortskip 1.5ex plus 6bp minus 4bp
\fi
% 
% compsoc nonconferences
\else
% 9pt
\ifx\CLASSOPTIONpt\@JIISTptsizenine
\def\normalsize{\@setfontsize{\normalsize}{9bp}{10.8bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{10.8bp}
\normalsize
\abovedisplayskip 1.5ex plus 3bp minus 1bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0bp plus 3bp
\belowdisplayshortskip 1.5ex plus 3bp minus 1bp
\fi
% 10pt
\ifx\CLASSOPTIONpt\@JIISTptsizeten
% the official spec is 9.5bp with 11.4bp leading for 10pt,
% but measurements of proofs suggest upto 11.723bp leading
% here we'll use 11.54bp which gives 61 lines per column
% with the standard compsoc margins
\def\normalsize{\@setfontsize{\normalsize}{9.5bp}{11.54bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{11.54bp}
\normalsize
\abovedisplayskip 1.5ex plus 4bp minus 2bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 4bp
\belowdisplayshortskip 1.5ex plus 4bp minus 2bp
\fi
% 11pt
\ifx\CLASSOPTIONpt\@JIISTptsizeeleven
\def\normalsize{\@setfontsize{\normalsize}{11bp}{13.2bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{13.2bp}
\normalsize
\abovedisplayskip 1.5ex plus 5bp minus 3bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 5bp
\belowdisplayshortskip 1.5ex plus 5bp minus 3bp
\fi
% 12pt
\ifx\CLASSOPTIONpt\@JIISTptsizetwelve
\def\normalsize{\@setfontsize{\normalsize}{12bp}{14.4bp}}
\setlength{\@JIISTnormalsizeunitybaselineskip}{14.4bp}
\normalsize
\abovedisplayskip 1.5ex plus 6bp minus 4bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 6bp
\belowdisplayshortskip 1.5ex plus 6bp minus 4bp
\fi
\fi\fi




% V1.6 The Computer Modern Fonts will issue a substitution warning for
% 24pt titles (24.88pt is used instead, but the default and correct
% Times font will scale exactly as needed) increase the substitution
% tolerance to turn off this warning.
% 
% V1.8a, the compsoc bp font sizes can also cause bogus font substitution
% warnings with footnote or scriptsize math and the $\bullet$ itemized
% list of \JIISTcompsocitemizethanks. So, increase this to 1.5pt or more.
\def\fontsubfuzz{1.7bp}


% warn the user in case they forget to use the 9pt option with
% technote
\ifCLASSOPTIONtechnote%
 \ifx\CLASSOPTIONpt\@JIISTptsizenine\else%
  \typeout{** ATTENTION: Technotes are normally 9pt documents.}%
 \fi%
\fi


% V1.7
% Improved \textunderscore to provide a much better fake _ when used with
% OT1 encoding. Under OT1, detect use of pcr or cmtt \ttfamily and use
% available true _ glyph for those two typewriter fonts.
\def\@JIISTstringptm{ptm} % Times Roman family
\def\@JIISTstringppl{ppl} % Palatino Roman family
\def\@JIISTstringphv{phv} % Helvetica Sans Serif family
\def\@JIISTstringpcr{pcr} % Courier typewriter family
\def\@JIISTstringcmtt{cmtt} % Computer Modern typewriter family
\DeclareTextCommandDefault{\textunderscore}{\leavevmode
\ifx\f@family\@JIISTstringpcr\string_\else
\ifx\f@family\@JIISTstringcmtt\string_\else
\ifx\f@family\@JIISTstringptm\kern 0em\vbox{\hrule\@width 0.5em\@height 0.5pt\kern -0.3ex}\else
\ifx\f@family\@JIISTstringppl\kern 0em\vbox{\hrule\@width 0.5em\@height 0.5pt\kern -0.3ex}\else
\ifx\f@family\@JIISTstringphv\kern -0.03em\vbox{\hrule\@width 0.62em\@height 0.52pt\kern -0.33ex}\kern -0.03em\else
\kern 0.09em\vbox{\hrule\@width 0.6em\@height 0.44pt\kern -0.63pt\kern -0.42ex}\kern 0.09em\fi\fi\fi\fi\fi\relax}




% set the default \baselinestretch
\def\baselinestretch{1}
\ifCLASSOPTIONdraftcls
  \def\baselinestretch{1.5}% default baselinestretch for draft modes
\fi 


% process CLASSINPUT baselinestretch
\ifx\CLASSINPUTbaselinestretch\@JIISTundefined
\else
  \edef\baselinestretch{\CLASSINPUTbaselinestretch} % user CLASSINPUT override
  \typeout{** ATTENTION: Overriding \string\baselinestretch\space to
           \baselinestretch\space via \string\CLASSINPUT.}
\fi

\small\normalsize % make \baselinestretch take affect




% store the normalsize baselineskip
\newdimen\CLASSINFOnormalsizebaselineskip
\CLASSINFOnormalsizebaselineskip=\baselineskip\relax
% and the normalsize unity (baselinestretch=1) baselineskip
% we could save a register by giving the user access to
% \@JIISTnormalsizeunitybaselineskip. However, let's protect
% its read only internal status
\newdimen\CLASSINFOnormalsizeunitybaselineskip
\CLASSINFOnormalsizeunitybaselineskip=\@JIISTnormalsizeunitybaselineskip\relax
% store the nominal value of jot
\newdimen\JIISTnormaljot
\JIISTnormaljot=0.25\baselineskip\relax

% set \jot
\jot=\JIISTnormaljot\relax




% V1.6, we are now going to fine tune the interword spacing
% The default interword glue for Times under TeX appears to use a
% nominal interword spacing of 25% (relative to the font size, i.e., 1em)
% a maximum of 40% and a minimum of 19%.
% For example, 10pt text uses an interword glue of:
% 
% 2.5pt plus 1.49998pt minus 0.59998pt
% 
% However, the JIIST allows for a more generous range which reduces the need
% for hyphenation, especially for two column text. Furthermore, the JIIST
% tends to use a little bit more nominal space between the words.
% The JIIST's interword spacing percentages appear to be:
% 35% nominal
% 23% minimum
% 50% maximum
% (They may even be using a tad more for the largest fonts such as 24pt.)
% 
% for bold text, the JIIST increases the spacing a little more:
% 37.5% nominal
% 23% minimum
% 55% maximum

% here are the interword spacing ratios we'll use
% for medium (normal weight)
\def\@JIISTinterspaceratioM{0.35}
\def\@JIISTinterspaceMINratioM{0.23}
\def\@JIISTinterspaceMAXratioM{0.50}

% for bold
\def\@JIISTinterspaceratioB{0.375}
\def\@JIISTinterspaceMINratioB{0.23}
\def\@JIISTinterspaceMAXratioB{0.55}


% compsoc nonconference papers use Palatino,
% tweak settings to better match the proofs
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference\else
% for medium (normal weight)
\def\@JIISTinterspaceratioM{0.28}
\def\@JIISTinterspaceMINratioM{0.21}
\def\@JIISTinterspaceMAXratioM{0.47}
% for bold
\def\@JIISTinterspaceratioB{0.305}
\def\@JIISTinterspaceMINratioB{0.21}
\def\@JIISTinterspaceMAXratioB{0.52}
\fi\fi


% command to revise the interword spacing for the current font under TeX:
% \fontdimen2 = nominal interword space
% \fontdimen3 = interword stretch
% \fontdimen4 = interword shrink
% since all changes to the \fontdimen are global, we can enclose these commands
% in braces to confine any font attribute or length changes
\def\@@@JIISTsetfontdimens#1#2#3{{%
\setlength{\@JIISTjrnltmpdimenB}{\f@size pt}% grab the font size in pt, could use 1em instead.
\setlength{\@JIISTjrnltmpdimenA}{#1\@JIISTjrnltmpdimenB}%
\fontdimen2\font=\@JIISTjrnltmpdimenA\relax
\addtolength{\@JIISTjrnltmpdimenA}{-#2\@JIISTjrnltmpdimenB}%
\fontdimen3\font=-\@JIISTjrnltmpdimenA\relax
\setlength{\@JIISTjrnltmpdimenA}{#1\@JIISTjrnltmpdimenB}%
\addtolength{\@JIISTjrnltmpdimenA}{-#3\@JIISTjrnltmpdimenB}%
\fontdimen4\font=\@JIISTjrnltmpdimenA\relax}}

% revise the interword spacing for each font weight
\def\@@JIISTsetfontdimens{{%
\mdseries
\@@@JIISTsetfontdimens{\@JIISTinterspaceratioM}{\@JIISTinterspaceMAXratioM}{\@JIISTinterspaceMINratioM}%
\bfseries
\@@@JIISTsetfontdimens{\@JIISTinterspaceratioB}{\@JIISTinterspaceMAXratioB}{\@JIISTinterspaceMINratioB}%
}}

% revise the interword spacing for each font shape
% \slshape is not often used for JIIST work and is not altered here. The \scshape caps are
% already a tad too large in the free LaTeX fonts (as compared to what the JIIST uses) so we
% won't alter these either.
\def\@JIISTsetfontdimens{{%
\normalfont
\@@JIISTsetfontdimens
\normalfont\itshape
\@@JIISTsetfontdimens
}}

% command to revise the interword spacing for each font size (and shape
% and weight). Only the \rmfamily is done here as \ttfamily uses a 
% fixed spacing and \sffamily is not used as the main text of JIIST papers.
\def\@JIISTtunefonts{{\selectfont\rmfamily
\tiny\@JIISTsetfontdimens
\scriptsize\@JIISTsetfontdimens
\footnotesize\@JIISTsetfontdimens
\small\@JIISTsetfontdimens
\normalsize\@JIISTsetfontdimens
\sublargesize\@JIISTsetfontdimens
\large\@JIISTsetfontdimens
\LARGE\@JIISTsetfontdimens
\huge\@JIISTsetfontdimens
\Huge\@JIISTsetfontdimens}}

% if the nofonttune class option is not given, revise the interword spacing
% now - in case JIISTjrnl makes any default length measurements, and make
% sure all the default fonts are loaded
\ifCLASSOPTIONnofonttune\else
\@JIISTtunefonts
\fi

% and again at the start of the document in case the user loaded different fonts
\AtBeginDocument{\ifCLASSOPTIONnofonttune\else\@JIISTtunefonts\fi}





% -- V1.8a page setup commands --

% The default sample text for calculating margins
% Note that JIIST publications use \scriptsize for headers and footers.
\def\JIISTdefaultsampletext{\normalfont\normalsize gT}
\def\JIISTdefaultheadersampletext{\normalfont\scriptsize T}% JIIST headers default to uppercase
\def\JIISTdefaultfootersampletext{\normalfont\scriptsize gT}



% usage: \JIISTsettextwidth{inner margin}{outer margin}
% Sets \textwidth to allow the specified inner and outer margins
% for the current \paperwidth.
\def\JIISTsettextwidth#1#2{\@JIISTjrnltmpdimenA\paperwidth
\@JIISTjrnltmpdimenB#1\relax
\advance\@JIISTjrnltmpdimenA by -\@JIISTjrnltmpdimenB
\@JIISTjrnltmpdimenB#2\relax
\advance\@JIISTjrnltmpdimenA by -\@JIISTjrnltmpdimenB
\textwidth\@JIISTjrnltmpdimenA}



% usage: \JIISTsetsidemargin{mode: i, o, c, a}{margin/offset}
% Sets \oddsidemargin and \evensidemargin to yield the specified margin
% of the given mode.
% The available modes are:
% i = inner margin
% o = outer margin
% c = centered, with the given offset
% a = adjust the margins using the given offset
% For the offsets, positive values increase the inner margin.
% \textwidth should be set properly for the given margins before calling this
% function.
\def\JIISTsetsidemargin#1#2{\@JIISTjrnltmpdimenA #2\relax
\@JIISTextracttoken{#1}\relax
% check for mode errors
\ifx\@JIISTextractedtokenmacro\@empty
  \@JIISTclspkgerror{Empty mode type in \string\JIISTsetsidemargin\space (line \the\inputlineno).\MessageBreak
  Defaulting to `i'}{Valid modes for \string\JIISTsetsidemargin\space are: i, o, c and a.}\relax
  \let\@JIISTextractedtoken=i\relax
  \def\@JIISTextractedtokenmacro{i}\relax
\else
  \ifx\@JIISTextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\JIISTsetsidemargin\space mode specifiers after the first in `\@JIISTextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% handle each mode
\if\@JIISTextractedtoken a\relax
  \advance\oddsidemargin by \@JIISTjrnltmpdimenA\relax
\else
\if\@JIISTextractedtoken c\relax
  \oddsidemargin\paperwidth
  \advance\oddsidemargin by -\textwidth
  \divide\oddsidemargin by 2\relax
  \advance\oddsidemargin by -1in\relax
  \advance\oddsidemargin by \@JIISTjrnltmpdimenA\relax
\else
\if\@JIISTextractedtoken o\relax
  \oddsidemargin\paperwidth
  \advance\oddsidemargin by -\textwidth
  \advance\oddsidemargin by -\@JIISTjrnltmpdimenA
  \advance\oddsidemargin by -1in\relax
\else
  \if\@JIISTextractedtoken i\relax
  \else
    \@JIISTclspkgerror{Unknown mode type `\@JIISTextractedtokenmacro' in \string\JIISTsetsidemargin\space (line \the\inputlineno).\MessageBreak
    Defaulting to `i'}%
    {Valid modes for \string\JIISTsetsidemargin\space are: i, o, c  and a.}%
  \fi
  \oddsidemargin\@JIISTjrnltmpdimenA
  \advance\oddsidemargin by -1in\relax
\fi\fi\fi
% odd and even side margins both mean "inner" for single sided pages
\evensidemargin\oddsidemargin
% but are mirrors of each other when twosided is in effect
\if@twoside
  \evensidemargin\paperwidth
  \advance\evensidemargin by -\textwidth
  \advance\evensidemargin by -\oddsidemargin
  % have to compensate for both the builtin 1in LaTex offset
  % and the fact we already subtracted this offset from \oddsidemargin
  \advance\evensidemargin -2in\relax
\fi}



% usage: \JIISTsettextheight[sample text]{top text margin}{bottom text margin}
% Sets \textheight based on the specified top margin and bottom margin.
% Takes into consideration \paperheight, \topskip, and (by default) the
% the actual height and depth of the \JIISTdefaultsampletext text. 
\def\JIISTsettextheight{\@ifnextchar [{\@JIISTsettextheight}{\@JIISTsettextheight[\JIISTdefaultsampletext]}}
\def\@JIISTsettextheight[#1]#2#3{\textheight\paperheight\relax
  \@JIISTjrnltmpdimenA #2\relax
  \advance \textheight by -\@JIISTjrnltmpdimenA% subtract top margin
  \@JIISTjrnltmpdimenA #3\relax
  \advance \textheight by -\@JIISTjrnltmpdimenA% subtract bottom margin
  \advance \textheight by \topskip% add \topskip
  % subtract off everything above the top, and below the bottom, baselines
  \settoheight{\@JIISTjrnltmpdimenA}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance \textheight by -\@JIISTjrnltmpdimenA
  \settodepth{\@JIISTjrnltmpdimenA}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance \textheight by -\@JIISTjrnltmpdimenA}



\newdimen\JIISTquantizedlength
\JIISTquantizedlength 0sp\relax
\newdimen\JIISTquantizedlengthdiff
\JIISTquantizedlengthdiff 0sp\relax
\def\JIISTquantizedlengthint{0}

% usage: \JIISTquantizelength{mode: d, c, i}{base unit}{length}
% Sets the length \JIISTquantizedlength to be an integer multiple of the given
% (nonzero) base unit such that \JIISTquantizedlength approximates the given
% length.
% \JIISTquantizedlengthdiff is a length equal to the difference between the
% \JIISTquantizedlength and the given length.
% \JIISTquantizedlengthint is a macro containing the integer number of base units
% in \JIISTquantizedlength.
% i.e., \JIISTquantizedlength =  \JIISTquantizedlengthint * base unit
% The mode determines how \JIISTquantizedlength is quantized:
% d = always decrease (always round down \JIISTquantizeint)
% c = use the closest match
% i = always increase (always round up \JIISTquantizeint)
% In anycase, if the given length is already quantized,
% \JIISTquantizedlengthdiff will be set to zero.
\def\JIISTquantizelength#1#2#3{\begingroup
% work in isolation so as not to externally disturb the \@JIISTjrnltmp
% variables
% load the argument values indirectly via \JIISTquantizedlengthdiff
% in case the user refers to our \@JIISTjrnltmpdimenX, \JIISTquantizedlength,
% etc. in the arguments. we also will work with these as counters,
% i.e., in sp units
% A has the base unit
\JIISTquantizedlengthdiff #2\relax\relax\relax\relax
\@JIISTjrnltmpcountA\JIISTquantizedlengthdiff
% B has the input length
\JIISTquantizedlengthdiff #3\relax\relax\relax\relax
\@JIISTjrnltmpcountB\JIISTquantizedlengthdiff
\@JIISTjrnltmpdimenA\the\@JIISTjrnltmpcountA sp\relax
\@JIISTjrnltmpdimenB\the\@JIISTjrnltmpcountB sp\relax
% \@JIISTjrnltmpcountC will have the quantized int
% \JIISTquantizedlength will have the quantized length
% \@JIISTjrnltmpdimenC will have the quantized diff
% initialize them to zero as this is what will be
% exported if an error occurs
\@JIISTjrnltmpcountC 0\relax
\JIISTquantizedlength 0sp\relax
\@JIISTjrnltmpdimenC 0sp\relax
% extract mode
\@JIISTextracttoken{#1}\relax
% check for mode errors
\ifx\@JIISTextractedtokenmacro\@empty
  \@JIISTclspkgerror{Empty mode type in \string\JIISTquantizelength\space (line \the\inputlineno).\MessageBreak
  Defaulting to `d'}{Valid modes for \string\JIISTquantizelength\space are: d, c and i.}\relax
  \let\@JIISTextractedtoken=d\relax
  \def\@JIISTextractedtokenmacro{d}\relax
\else
  \ifx\@JIISTextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\JIISTquantizelength\space mode specifiers after the first in `\@JIISTextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% check for base unit is zero error
\ifnum\@JIISTjrnltmpcountA=0\relax
\@JIISTclspkgerror{Base unit is zero in \string\JIISTquantizelength\space (line \the\inputlineno).\MessageBreak
  \string\JIISTquantizedlength\space and \string\JIISTquantizedlengthdiff\space are set to zero}{Division by zero is not allowed.}\relax
\else% base unit is nonzero
  % \@JIISTjrnltmpcountC carries the number of integer units
  % in the quantized length (integer length \ base)
  \@JIISTjrnltmpcountC\@JIISTjrnltmpcountB\relax
  \divide\@JIISTjrnltmpcountC by \@JIISTjrnltmpcountA\relax
  % \JIISTquantizedlength has the (rounded down) quantized length
  % = base * int
  \JIISTquantizedlength\@JIISTjrnltmpdimenA\relax
  \multiply\JIISTquantizedlength by \@JIISTjrnltmpcountC\relax
  % \@JIISTjrnltmpdimenC has the difference
  % = quantized length - length
  \@JIISTjrnltmpdimenC\JIISTquantizedlength\relax
  \advance\@JIISTjrnltmpdimenC by -\@JIISTjrnltmpdimenB\relax
  % trap special case of length being already quantized
  % to avoid a roundup under i option
  \ifdim\@JIISTjrnltmpdimenC=0sp\relax
  \else % length not is already quantized
    % set dimenA to carry the upper quantized (absolute value) difference:
    % quantizedlength + base - length
    \advance\@JIISTjrnltmpdimenA by \JIISTquantizedlength\relax
    \advance\@JIISTjrnltmpdimenA by -\@JIISTjrnltmpdimenB\relax
    % set dimenB to carry the lower quantized (absolute value) difference:
    % length - quantizedlength
    \advance\@JIISTjrnltmpdimenB by -\JIISTquantizedlength\relax
    % handle each mode
    \if\@JIISTextractedtoken c\relax
      % compare upper and lower amounts, select upper if lower > upper
      \ifdim\@JIISTjrnltmpdimenB>\@JIISTjrnltmpdimenA\relax
        % use upper
        \advance\JIISTquantizedlength by \the\@JIISTjrnltmpcountA sp\relax
        \advance\@JIISTjrnltmpcountC by 1\relax
        \@JIISTjrnltmpdimenC\@JIISTjrnltmpdimenA
      \else% <=. uselower
        % no need to do anything for lower, use output values already setup
      \fi
    \else% not mode c
    \if\@JIISTextractedtoken i\relax
      % always round up under i mode
      \advance\JIISTquantizedlength by \the\@JIISTjrnltmpcountA sp\relax
      \advance\@JIISTjrnltmpcountC by 1\relax
      \@JIISTjrnltmpdimenC\@JIISTjrnltmpdimenA
    \else
      \if\@JIISTextractedtoken d\relax
      \else
        \@JIISTclspkgerror{Unknown mode type `\@JIISTextractedtokenmacro' in \string\JIISTquantizelength\space (line \the\inputlineno).\MessageBreak
        Defaulting to `d'}%
        {Valid modes for \string\JIISTquantizelength\space are: d, c, and i.}\relax
      \fi % if d
      % no need to do anything for d, use output values already setup
    \fi\fi % if i, c
  \fi % if length is already quantized
\fi% if base unit is zero
% globally assign the results to macros we use here to escape the enclosing
% group without needing to call \global on any of the \@JIISTjrnltmp variables.
% \@JIISTjrnltmpcountC has the quantized int
% \JIISTquantizedlength has the quantized length
% \@JIISTjrnltmpdimenC has the quantized diff
\xdef\@JIISTquantizedlengthintmacro{\the\@JIISTjrnltmpcountC}\relax
\@JIISTjrnltmpcountC\JIISTquantizedlength\relax
\xdef\@JIISTquantizedlengthmacro{\the\@JIISTjrnltmpcountC}\relax
\@JIISTjrnltmpcountC\@JIISTjrnltmpdimenC\relax
\xdef\@JIISTquantizedlengthdiffmacro{\the\@JIISTjrnltmpcountC}\relax
\endgroup
% locally assign the outputs here from the macros
\expandafter\JIISTquantizedlength\@JIISTquantizedlengthmacro sp\relax
\expandafter\JIISTquantizedlengthdiff\@JIISTquantizedlengthdiffmacro sp\relax
\edef\JIISTquantizedlengthint{\@JIISTquantizedlengthintmacro}\relax}



\newdimen\JIISTquantizedtextheightdiff
\JIISTquantizedtextheightdiff 0sp\relax

% usage: \JIISTquantizetextheight[base unit]{mode: d, c, i}
% Sets \textheight to be an integer multiple of the current \baselineskip
% (or the optionally specified base unit) plus the first (\topskip) line.
% \JIISTquantizedtextheightdiff is a length equal to the difference between
% the new quantized and original \textheight.
% \JIISTquantizedtextheightlpc is a macro containing the integer number of
% lines per column under the quantized \textheight. i.e.,
% \textheight = \JIISTquantizedtextheightlpc * \baselineskip + \topskip
% The mode determines how \textheight is quantized:
% d = always decrease (always round down the number of lines per column)
% c = use the closest match
% i = always increase (always round up the number of lines per column)
% In anycase, if \textheight is already quantized, it will remain unchanged,
% and \JIISTquantizedtextheightdiff will be set to zero.
% Depends on: \JIISTquantizelength
\def\JIISTquantizetextheight{\@ifnextchar [{\@JIISTquantizetextheight}{\@JIISTquantizetextheight[\baselineskip]}}
\def\@JIISTquantizetextheight[#1]#2{\begingroup
% use our \JIISTquantizedtextheightdiff as a scratch pad
% we need to subtract off \topskip before quantization
\JIISTquantizedtextheightdiff\textheight
\advance\JIISTquantizedtextheightdiff by -\topskip\relax
\JIISTquantizelength{#2}{#1}{\JIISTquantizedtextheightdiff}
% add back \topskip line
\advance\JIISTquantizedlength by \topskip
\@JIISTjrnltmpcountC\JIISTquantizedlengthint\relax
\advance\@JIISTjrnltmpcountC by 1\relax
% globally assign the results to macros we use here to escape the enclosing
% group without needing to call \global on any of the \@JIISTjrnltmp variables.
\xdef\@JIISTquantizedtextheightlpcmacro{\the\@JIISTjrnltmpcountC}\relax
\@JIISTjrnltmpcountC\JIISTquantizedlength\relax
\xdef\@JIISTquantizedtextheightmacro{\the\@JIISTjrnltmpcountC}\relax
\@JIISTjrnltmpcountC\JIISTquantizedlengthdiff\relax
\xdef\@JIISTquantizedtextheightdiffmacro{\the\@JIISTjrnltmpcountC}\relax
\endgroup
% locally assign the outputs here from the macros
\textheight\@JIISTquantizedtextheightmacro sp\relax
\JIISTquantizedtextheightdiff\@JIISTquantizedtextheightdiffmacro sp\relax
\edef\JIISTquantizedtextheightlpc{\@JIISTquantizedtextheightlpcmacro}}



% usage: \JIISTsettopmargin[sample text]{mode: t, b, c, a, q}{margin/offset}
% Sets \topmargin based on the specified vertical margin.
% Takes into consideration the base 1in offset, \headheight, \headsep,
% \topskip, and (by default) the the actual height (or, for the bottom, depth)
% of the \JIISTdefaultsampletext text.
% The available modes are:
% t = top margin
% b = bottom margin
% c = vertically centered, with the given offset
% a = adjust the vertical margins using the given offset
% q = adjust the margins using \JIISTquantizedtextheightdiff and the given offset
% For the offsets, positive values increase the top margin.
% \headheight, \headsep, \topskip and \textheight should be set properly for the
% given margins before calling this function.
\def\JIISTsettopmargin{\@ifnextchar [{\@JIISTsettopmargin}{\@JIISTsettopmargin[\JIISTdefaultsampletext]}}
\def\@JIISTsettopmargin[#1]#2#3{\@JIISTjrnltmpdimenA #3\relax
\@JIISTextracttoken{#2}\relax
% check for mode errors
\ifx\@JIISTextractedtokenmacro\@empty
  \@JIISTclspkgerror{Empty mode type in \string\JIISTsettopmargin\space (line \the\inputlineno).\MessageBreak
  Defaulting to `t'}{Valid modes for \string\JIISTsettopmargin\space are: t, b, c, a and q.}\relax
  \let\@JIISTextractedtoken=t\relax
  \def\@JIISTextractedtokenmacro{t}\relax
\else
  \ifx\@JIISTextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\JIISTsettopmargin\space mode specifiers after the first in `\@JIISTextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% handle each mode
\if\@JIISTextractedtoken a\relax
  \advance\topmargin by \@JIISTjrnltmpdimenA\relax
\else
\if\@JIISTextractedtoken q\relax
  % we need to adjust by half the \JIISTquantizedtextheightdiff value
  \@JIISTjrnltmpdimenB\JIISTquantizedtextheightdiff\relax
  \divide\@JIISTjrnltmpdimenB by 2\relax
  % a positive \JIISTquantizedtextheightdiff means we need to reduce \topmargin
  % because \textheight has been lenghtened
  \advance\topmargin by -\@JIISTjrnltmpdimenB\relax
  \advance\topmargin by \@JIISTjrnltmpdimenA\relax
\else
\if\@JIISTextractedtoken c\relax
  \topmargin\paperheight
  \advance\topmargin by -\textheight
  % \textheight includes \topskip, but we should not count topskip whitespace here, backout
  \advance \topmargin by \topskip
  \settoheight{\@JIISTjrnltmpdimenB}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\topmargin by -\@JIISTjrnltmpdimenB\relax
  \settodepth{\@JIISTjrnltmpdimenB}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\topmargin by -\@JIISTjrnltmpdimenB\relax
  \divide\topmargin by 2\relax
  \advance\topmargin by \@JIISTjrnltmpdimenA\relax
\else
\if\@JIISTextractedtoken b\relax
  \topmargin\paperheight
  \advance\topmargin by -\textheight
  % \textheight includes \topskip, but we should not count topskip whitespace here, backout
  \advance \topmargin by \topskip
  \settodepth{\@JIISTjrnltmpdimenB}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\topmargin by -\@JIISTjrnltmpdimenB\relax
  \advance\topmargin by -\@JIISTjrnltmpdimenA\relax
\else
  \if\@JIISTextractedtoken t\relax
  \else
    \@JIISTclspkgerror{Unknown mode type `\@JIISTextractedtokenmacro' in \string\JIISTsettopmargin\space (line \the\inputlineno).\MessageBreak
    Defaulting to `t'}%
    {Valid modes for \string\JIISTsettopmargin\space are: t, b, c, a and q.}\relax
  \fi
  \topmargin\@JIISTjrnltmpdimenA\relax
  \settoheight{\@JIISTjrnltmpdimenB}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\topmargin by \@JIISTjrnltmpdimenB\relax
\fi\fi % if t, b, c
% convert desired top margin into actual \topmargin
% this is not done for the q or a modes because they are only adjustments
\advance \topmargin by -\topskip
\advance \topmargin by -1in
\advance \topmargin by -\headheight
\advance \topmargin by -\headsep
\fi\fi % if q, a
}



% usage: \JIISTsetheadermargin[header sample][text sample]{mode: t, b, c, a}{margin/offset}
% Differentially adjusts \topmargin and \headsep (such that their sum is unchanged)
% based on the specified header margin.
% Takes into consideration the base 1in offset, \headheight, \topskip, and (by default)
% the actual height (or depth) of the \JIISTdefaultheadersampletext and
% \JIISTdefaultsampletext text.
% The available modes are:
% t = top margin (top of the header text to the top of the page)
% b = bottom margin (bottom of the header text to the top of the main text)
% c = vertically centered between the main text and the top of the page,
%     with the given offset
% a = adjust the vertical position using the given offset
% For the offsets, positive values move the header downward.
% \headheight, \headsep, \topskip and \topmargin should be set properly before
% calling this function.
\def\JIISTsetheadermargin{\@ifnextchar [{\@JIISTsetheadermargin}{\@JIISTsetheadermargin[\JIISTdefaultheadersampletext]}}
\def\@JIISTsetheadermargin[#1]{\@ifnextchar [{\@@JIISTsetheadermargin[#1]}{\@@JIISTsetheadermargin[#1][\JIISTdefaultsampletext]}}
\def\@@JIISTsetheadermargin[#1][#2]#3#4{\@JIISTjrnltmpdimenA #4\relax
\@JIISTextracttoken{#3}\relax
% check for mode errors
\ifx\@JIISTextractedtokenmacro\@empty
  \@JIISTclspkgerror{Empty mode type in \string\JIISTsetheadermargin\space (line \the\inputlineno).\MessageBreak
  Defaulting to `t'}{Valid modes for \string\JIISTsetheadermargin\space are: t, b, c, and a.}\relax
  \let\@JIISTextractedtoken=t\relax
  \def\@JIISTextractedtokenmacro{t}\relax
\else
  \ifx\@JIISTextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\JIISTsetheadermargin\space mode specifiers after the first in `\@JIISTextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% handle each mode
\if\@JIISTextractedtoken a\relax
  % No need to do anything here and can pass through the adjustment
  % value as is. The end adjustment of \topmargin and \headsep will
  % do all that is needed
\else
\if\@JIISTextractedtoken c\relax
  % get the bottom margin
  \@JIISTjrnltmpdimenB\headsep\relax
  \settodepth{\@JIISTjrnltmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenC
  \advance\@JIISTjrnltmpdimenB by \topskip
  \settoheight{\@JIISTjrnltmpdimenC}{\begingroup #2\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenC
  % at this point \@JIISTjrnltmpdimenB has the actual header bottom margin
  % subtract from it the top header margin
  \advance\@JIISTjrnltmpdimenB -1in\relax % take into consideration the system 1in offset of the top margin
  \advance\@JIISTjrnltmpdimenB by -\topmargin
  \advance\@JIISTjrnltmpdimenB by -\headheight
  \settoheight{\@JIISTjrnltmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by \@JIISTjrnltmpdimenC
  % at this point \@JIISTjrnltmpdimenB has the difference between the bottom and top margins
  % we need to adjust by half this amount to center the header
  \divide\@JIISTjrnltmpdimenB by 2\relax
  % and add to offset
  \advance\@JIISTjrnltmpdimenA by \@JIISTjrnltmpdimenB
\else
\if\@JIISTextractedtoken b\relax
  \@JIISTjrnltmpdimenB\headsep\relax
  \settodepth{\@JIISTjrnltmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenC
  \advance\@JIISTjrnltmpdimenB by \topskip
  \settoheight{\@JIISTjrnltmpdimenC}{\begingroup #2\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenC
  % at this point \@JIISTjrnltmpdimenB has the actual header bottom margin
  % get the difference between the actual and the desired
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenA
  \@JIISTjrnltmpdimenA\@JIISTjrnltmpdimenB
\else
  \if\@JIISTextractedtoken t\relax
  \else
    \@JIISTclspkgerror{Unknown mode type `\@JIISTextractedtokenmacro' in \string\JIISTsetheadermargin\space (line \the\inputlineno).\MessageBreak
    Defaulting to `t'}%
    {Valid modes for \string\JIISTsetheadermargin\space are: t, b, c and a.}\relax
  \fi
  \@JIISTjrnltmpdimenB 1in\relax % take into consideration the system 1in offset of the top margin
  \advance\@JIISTjrnltmpdimenB by \topmargin
  \advance\@JIISTjrnltmpdimenB by \headheight
  \settoheight{\@JIISTjrnltmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenC
  % at this point \@JIISTjrnltmpdimenB has the actual header top margin
  % get the difference between the desired and the actual
  \advance\@JIISTjrnltmpdimenA by -\@JIISTjrnltmpdimenB
\fi\fi % if t, b, c
\fi % if a
% advance \topmargin by the needed amount and reduce \headsep by the same
% so as not to disturb the location of the main text
\advance\topmargin by \@JIISTjrnltmpdimenA\relax
\advance\headsep by -\@JIISTjrnltmpdimenA\relax
}



% usage: \JIISTsetfootermargin[footer sample][text sample]{mode: t, b, c, a}{margin/offset}
% Adjusts \footskip based on the specified footer margin.
% Takes into consideration the base 1in offset, \paperheight, \headheight,
% \headsep, \textheight and (by default) the actual height (or depth) of the
% \JIISTdefaultfootersampletext and \JIISTdefaultsampletext text.
% The available modes are:
% t = top margin (top of the footer text to the bottom of the main text)
% b = bottom margin (bottom of the footer text to the bottom of page)
% c = vertically centered between the main text and the bottom of the page,
%     with the given offset
% a = adjust the vertical position using the given offset
% For the offsets, positive values move the footer downward.
% \headheight, \headsep, \topskip, \topmargin, and \textheight should be set
% properly before calling this function.
\def\JIISTsetfootermargin{\@ifnextchar [{\@JIISTsetfootermargin}{\@JIISTsetfootermargin[\JIISTdefaultfootersampletext]}}
\def\@JIISTsetfootermargin[#1]{\@ifnextchar [{\@@JIISTsetfootermargin[#1]}{\@@JIISTsetfootermargin[#1][\JIISTdefaultsampletext]}}
\def\@@JIISTsetfootermargin[#1][#2]#3#4{\@JIISTjrnltmpdimenA #4\relax
\@JIISTextracttoken{#3}\relax
% check for mode errors
\ifx\@JIISTextractedtokenmacro\@empty
  \@JIISTclspkgerror{Empty mode type in \string\JIISTsetfootermargin\space (line \the\inputlineno).\MessageBreak
  Defaulting to `t'}{Valid modes for \string\JIISTsetfootermargin\space are: t, b, c, and a.}\relax
  \let\@JIISTextractedtoken=t\relax
  \def\@JIISTextractedtokenmacro{t}\relax
\else
  \ifx\@JIISTextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\JIISTsetfootermargin\space mode specifiers after the first in `\@JIISTextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% handle each mode
\if\@JIISTextractedtoken a\relax
  % No need to do anything here and can pass through the adjustment
  % value as is. The end adjustment of \footskip will do all that
  % is needed
\else
\if\@JIISTextractedtoken c\relax
  % calculate the bottom margin
  \@JIISTjrnltmpdimenB 1in\relax % system 1in offset
  \advance\@JIISTjrnltmpdimenB\topmargin\relax
  \advance\@JIISTjrnltmpdimenB\headheight\relax
  \advance\@JIISTjrnltmpdimenB\headsep\relax
  \advance\@JIISTjrnltmpdimenB\textheight\relax
  \advance\@JIISTjrnltmpdimenB\footskip\relax
  \settodepth{\@JIISTjrnltmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenC by \@JIISTjrnltmpdimenB
  \@JIISTjrnltmpdimenB\paperheight
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenC
  % at this point \@JIISTjrnltmpdimenB has the actual footer bottom margin
  % now subtract off the footer top margin
  \advance\@JIISTjrnltmpdimenB -\footskip\relax
  \settodepth{\@JIISTjrnltmpdimenC}{\begingroup #2\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by \@JIISTjrnltmpdimenC
  \settoheight{\@JIISTjrnltmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by \@JIISTjrnltmpdimenC
  % at this point \@JIISTjrnltmpdimenB has the difference between the bottom
  % and top footer margins
  % our adjustment must be half this value to center the footer
  \divide\@JIISTjrnltmpdimenB by 2\relax
  % add to the offset
  \advance\@JIISTjrnltmpdimenA by \@JIISTjrnltmpdimenB
\else
\if\@JIISTextractedtoken b\relax
  % calculate the bottom margin
  \@JIISTjrnltmpdimenB 1in\relax % system 1in offset
  \advance\@JIISTjrnltmpdimenB\topmargin\relax
  \advance\@JIISTjrnltmpdimenB\headheight\relax
  \advance\@JIISTjrnltmpdimenB\headsep\relax
  \advance\@JIISTjrnltmpdimenB\textheight\relax
  \advance\@JIISTjrnltmpdimenB\footskip\relax
  \settodepth{\@JIISTjrnltmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenC by \@JIISTjrnltmpdimenB
  \@JIISTjrnltmpdimenB\paperheight
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenC
  % at this point \@JIISTjrnltmpdimenB has the actual footer bottom margin
  % get the difference between the actual and the desired
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenA
  \@JIISTjrnltmpdimenA\@JIISTjrnltmpdimenB
\else
  \if\@JIISTextractedtoken t\relax
  \else
    \@JIISTclspkgerror{Unknown mode type `\@JIISTextractedtokenmacro' in \string\JIISTsetfootermargin\space (line \the\inputlineno).\MessageBreak
    Defaulting to `t'}%
    {Valid modes for \string\JIISTsetfootermargin\space are: t, b, c and a.}\relax
  \fi
  \@JIISTjrnltmpdimenB\footskip\relax
  \settodepth{\@JIISTjrnltmpdimenC}{\begingroup #2\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenC
  \settoheight{\@JIISTjrnltmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@JIISTjrnltmpdimenB by -\@JIISTjrnltmpdimenC
  % at this point \@JIISTjrnltmpdimenB has the actual footer top margin
  % get the difference between the desired and the actual
  \advance\@JIISTjrnltmpdimenA by -\@JIISTjrnltmpdimenB
\fi\fi % if t, b, c
\fi % if a
% advance \footskip by the needed amount
\advance\footskip by \@JIISTjrnltmpdimenA\relax
}

% -- End V1.8a page setup commands --





% V1.6
% LaTeX is a little to quick to use hyphenations
% So, we increase the penalty for their use and raise
% the badness level that triggers an underfull hbox
% warning. The author may still have to tweak things,
% but the appearance will be much better "right out
% of the box" than that under V1.5 and prior.
% TeX default is 50
\hyphenpenalty=750
\ifCLASSOPTIONcompsoc
\hyphenpenalty 500
\fi
% If we didn't adjust the interword spacing, 2200 might be better.
% The TeX default is 1000
\hbadness=1350
% The JIIST does not use extra spacing after punctuation
\frenchspacing

% V1.7 increase this a tad to discourage equation breaks
\binoppenalty=1000 % default 700
\relpenalty=800     % default 500

% v1.8a increase these to discourage widows and orphans
\clubpenalty=1000          % default 150
\widowpenalty=1000         % default 150
\displaywidowpenalty=1000 % default  50


% margin note stuff
\marginparsep      10pt
\marginparwidth    20pt
\marginparpush     25pt


% if things get too close, go ahead and let them touch
\lineskip            0pt
\normallineskip      0pt
\lineskiplimit       0pt
\normallineskiplimit 0pt

% The distance from the lower edge of the text body to the
% footline
\footskip 0.4in

% normally zero, should be relative to font height.
% put in a little rubber to help stop some bad breaks (underfull vboxes)
\parskip 0ex plus 0.2ex minus 0.1ex

\parindent    1.0em
\ifCLASSOPTIONcompsoc
  \parindent    1.5em
\fi

\headheight   12pt
\headsep      18pt
% use the normal font baselineskip
% so that \topskip is unaffected by changes in \baselinestretch
\topskip=\@JIISTnormalsizeunitybaselineskip


% V1.8 \maxdepth defaults to 4pt, but should be font size dependent
\maxdepth=0.5\@JIISTnormalsizeunitybaselineskip
\textheight       58pc  % 9.63in, 696pt

% set the default top margin to 58pt
% which results in a \topmargin of -49.59pt for 10pt documents
\JIISTsettopmargin{t}{58pt}
% tweak textheight to a perfect integer number of lines/column.
% standard is: 9pt/63 lpc; 10pt/58 lpc; 11pt/52 lpc; 12pt/50 lpc
\JIISTquantizetextheight{c}
% tweak top margin so that the error is shared equally at the top and bottom
\JIISTsettopmargin{q}{0sp}


\columnsep         1pc
\textwidth        43pc   % 2 x 21pc + 1pc = 43pc

% set the default side margins to center the text
\JIISTsetsidemargin{c}{0pt}


% adjust margins for default conference mode
\ifCLASSOPTIONconference
 \textheight        9.25in % The standard for conferences (668.4975pt)
 \JIISTsettopmargin{t}{0.75in}
 % tweak textheight to a perfect integer number of lines/page.
 % standard is: 9pt/61 lpc; 10pt/56 lpc; 11pt/50 lpc; 12pt/48 lpc
 \JIISTquantizetextheight{c}
 % tweak top margin so that the error is shared equally at the top and bottom
 \JIISTsettopmargin{q}{0sp}
\fi


% compsoc text sizes, margins and spacings
\ifCLASSOPTIONcompsoc
 \columnsep         12bp
 % CS specs for \textwdith are 6.875in
 % \textwidth         6.875in
 % however, measurements from proofs show they are using 3.5in columns
 \textwidth         7in
 \advance\textwidth by \columnsep
 % set the side margins to center the text
 \JIISTsetsidemargin{c}{0pt}
 % top/bottom margins to center
 % could just set \textheight to 9.75in for all the different paper sizes
 % and then quantize, but we'll do it the long way here to allow for easy
 % future per-paper size adjustments
 \JIISTsettextheight{0.625in}{0.625in}% 11in - 2 * 0.625in = 9.75in is the standard text height for compsoc journals
 \JIISTsettopmargin{t}{0.625in}
 \if@JIISTusingcspaper
   \JIISTsettextheight{0.5in}{0.5in}% 10.75in - 2 * 0.5in = 9.75in
   \JIISTsettopmargin{t}{0.5in}
 \fi
 \if@JIISTusingAfourpaper
   \JIISTsettextheight{24.675mm}{24.675mm}% 297mm - 2 * 24.675mm = 247.650mm (9.75in)
   \JIISTsettopmargin{t}{24.675mm}
 \fi
 % tweak textheight to a perfect integer number of lines/page.
 % standard is: 9pt/65 lpc; 10pt/61 lpc; 11pt/53 lpc; 12pt/49 lpc
 \JIISTquantizetextheight{c}
 % tweak top margin so that the error is shared equally at the top and bottom
 \JIISTsettopmargin{q}{0sp}

% compsoc conference
 \ifCLASSOPTIONconference
  % compsoc conference use a larger value for columnsep
  \columnsep 0.25in
  \JIISTsettextwidth{0.64in}{0.64in}
  % set the side margins to center the text (0.75in for letterpaper)
  \JIISTsetsidemargin{c}{0pt}
  % compsoc conferences want 1in top and bottom margin
  \JIISTsettextheight{1in}{1in}
  \JIISTsettopmargin{t}{1in}
  % tweak textheight to a perfect integer number of lines/page.
  % standard is: 9pt/58 lpc; 10pt/53 lpc; 11pt/48 lpc; 12pt/46 lpc
  \JIISTquantizetextheight{c}
  % tweak top margin so that the error is shared equally at the top and bottom
  \JIISTsettopmargin{q}{0sp}
 \fi
\fi



% draft mode settings override that of all other modes
% provides a nice 1in margin all around the paper and extra
% space between the lines for editor's comments
\ifCLASSOPTIONdraftcls
  % we want 1in side margins regardless of paper type
  \JIISTsettextwidth{0.64in}{0.64in}
  \JIISTsetsidemargin{c}{0pt}
  % want 1in top and bottom margins
  \JIISTsettextheight{1in}{1in}
  \JIISTsettopmargin{t}{1in}
  % digitize textheight to be an integer number of lines.
  % this may cause the top and bottom margins to be off a tad
  \JIISTquantizetextheight{c}
  % tweak top margin so that the error is shared equally at the top and bottom
  \JIISTsettopmargin{q}{0sp}
\fi



% process CLASSINPUT inner/outer margin
% if inner margin defined, but outer margin not, set outer to inner.
\ifx\CLASSINPUTinnersidemargin\@JIISTundefined
\else
  \ifx\CLASSINPUToutersidemargin\@JIISTundefined
    \edef\CLASSINPUToutersidemargin{\CLASSINPUTinnersidemargin}
  \fi
\fi

\ifx\CLASSINPUToutersidemargin\@JIISTundefined
\else
  % if outer margin defined, but inner margin not, set inner to outer.
  \ifx\CLASSINPUTinnersidemargin\@JIISTundefined
    \edef\CLASSINPUTinnersidemargin{\CLASSINPUToutersidemargin}
  \fi
  \JIISTsettextwidth{\CLASSINPUTinnersidemargin}{\CLASSINPUToutersidemargin}
  \JIISTsetsidemargin{i}{\CLASSINPUTinnersidemargin}
  \typeout{** ATTENTION: Overriding inner side margin to \CLASSINPUTinnersidemargin\space and 
           outer side margin to \CLASSINPUToutersidemargin\space via \string\CLASSINPUT.}
\fi



% process CLASSINPUT top/bottom text margin
% if toptext margin defined, but bottomtext margin not, set bottomtext to toptext margin
\ifx\CLASSINPUTtoptextmargin\@JIISTundefined
\else
  \ifx\CLASSINPUTbottomtextmargin\@JIISTundefined
    \edef\CLASSINPUTbottomtextmargin{\CLASSINPUTtoptextmargin}
  \fi
\fi

\ifx\CLASSINPUTbottomtextmargin\@JIISTundefined
\else
  % if bottomtext margin defined, but toptext margin not, set toptext to bottomtext margin
  \ifx\CLASSINPUTtoptextmargin\@JIISTundefined
    \edef\CLASSINPUTtoptextmargin{\CLASSINPUTbottomtextmargin}
  \fi
  \JIISTsettextheight{\CLASSINPUTtoptextmargin}{\CLASSINPUTbottomtextmargin}
  \JIISTsettopmargin{t}{\CLASSINPUTtoptextmargin}
  \typeout{** ATTENTION: Overriding top text margin to \CLASSINPUTtoptextmargin\space and 
           bottom text margin to \CLASSINPUTbottomtextmargin\space via \string\CLASSINPUT.}
\fi



% default to center header and footer text in the margins
\JIISTsetheadermargin{c}{0pt}
\JIISTsetfootermargin{c}{0pt}

% adjust header and footer positions for compsoc journals
\ifCLASSOPTIONcompsoc
  \ifCLASSOPTIONjournal
    \JIISTsetheadermargin{b}{\@JIISTnormalsizeunitybaselineskip}
    \JIISTsetfootermargin{t}{\@JIISTnormalsizeunitybaselineskip}
  \fi
\fi


% V1.8a display lines per column info message on user's console
\def\JIISTdisplayinfolinespercolumn{\@JIISTjrnltmpdimenA=\textheight
% topskip represents only one line even if > baselineskip
\advance\@JIISTjrnltmpdimenA by -1\topskip
\@JIISTjrnltmpcountA=\@JIISTjrnltmpdimenA
\@JIISTjrnltmpcountB=\@JIISTjrnltmpdimenA
\divide\@JIISTjrnltmpcountB by \baselineskip
% need to add one line to include topskip (first) line
\advance\@JIISTjrnltmpcountB by 1
% save lines per column value as text
\edef\@JIISTnumlinespercolumninfotxt{\the\@JIISTjrnltmpcountB}
% backout topskip advance to allow direct \@JIISTjrnltmpcountA comparison
\advance\@JIISTjrnltmpcountB by -1
% restore value as text height (without topskip) rather than just as number of lines
\multiply\@JIISTjrnltmpcountB by \baselineskip
% is the column height an integer number of lines per column?
\ifnum\@JIISTjrnltmpcountA=\@JIISTjrnltmpcountB
\edef\@JIISTnumlinespercolumnexactinfotxt{exact}
\else
\@JIISTjrnltmpdimenA\@JIISTjrnltmpcountA sp\relax
\advance\@JIISTjrnltmpdimenA by -\@JIISTjrnltmpcountB sp\relax
\edef\@JIISTnumlinespercolumnexactinfotxt{approximate, difference = \the\@JIISTjrnltmpdimenA}
\fi
\typeout{-- Lines per column: \@JIISTnumlinespercolumninfotxt\space (\@JIISTnumlinespercolumnexactinfotxt).}}
% delay execution till start of document to allow for user changes
\AtBeginDocument{\JIISTdisplayinfolinespercolumn}



% LIST SPACING CONTROLS

% Controls the amount of EXTRA spacing
% above and below \trivlist 
% Both \list and IED lists override this.
% However, \trivlist will use this as will most
% things built from \trivlist like the \center
% environment.
\topsep           0.5\baselineskip

% Controls the additional spacing around lists preceded
% or followed by blank lines. the JIIST does not increase
% spacing before or after paragraphs so it is set to zero.
% \z@ is the same as zero, but faster.
\partopsep          \z@

% Controls the spacing between paragraphs in lists. 
% The JIIST does not increase spacing before or after paragraphs
% so this is also zero. 
% With JIISTjrnl.cls, global changes to
% this value DO affect lists (but not IED lists).
\parsep             \z@

% Controls the extra spacing between list items. 
% The JIIST does not put extra spacing between items.
% With JIISTjrnl.cls, global changes to this value DO affect
% lists (but not IED lists).
\itemsep            \z@

% \itemindent is the amount to indent the FIRST line of a list
% item. It is auto set to zero within the \list environment. To alter
% it, you have to do so when you call the \list.
% However, the JIIST uses this for the theorem environment
% There is an alternative value for this near \leftmargini below
\itemindent         -1em

% \leftmargin, the spacing from the left margin of the main text to
% the left of the main body of a list item is set by \list.
% Hence this statement does nothing for lists.
% But, quote and verse do use it for indention.
\leftmargin         2em

% we retain this stuff from the older JIISTjrnl.cls so that \list
% will work the same way as before. However, itemize, enumerate and
% description (IED) could care less about what these are as they
% all are overridden.
\leftmargini        2em
%\itemindent         2em  % Alternative values: sometimes used.
%\leftmargini        0em
\leftmarginii       1em
\leftmarginiii    1.5em
\leftmarginiv     1.5em
\leftmarginv      1.0em
\leftmarginvi     1.0em
\labelsep         0.5em 
\labelwidth         \z@


% The old JIISTjrnl.cls behavior of \list is retained.
% However, the new V1.3 IED list environments override all the
% @list stuff (\@listX is called within \list for the
% appropriate level just before the user's list_decl is called). 
% \topsep is now 2pt as the JIIST puts a little extra space around
% lists - used by those non-IED macros that depend on \list.
% Note that \parsep and \itemsep are not redefined as in 
% the sizexx.clo \@listX (which article.cls uses) so global changes
% of these values DO affect \list
% 
\def\@listi{\leftmargin\leftmargini \topsep 2pt plus 1pt minus 1pt}
\let\@listI\@listi
\def\@listii{\leftmargin\leftmarginii\labelwidth\leftmarginii%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listiii{\leftmargin\leftmarginiii\labelwidth\leftmarginiii%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listiv{\leftmargin\leftmarginiv\labelwidth\leftmarginiv%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listv{\leftmargin\leftmarginv\labelwidth\leftmarginv%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listvi{\leftmargin\leftmarginvi\labelwidth\leftmarginvi%
    \advance\labelwidth-\labelsep \topsep 2pt}


% The JIIST uses 5) not 5.
\def\labelenumi{\theenumi)}     \def\theenumi{\arabic{enumi}}

% The JIIST uses a) not (a)
\def\labelenumii{\theenumii)}  \def\theenumii{\alph{enumii}}

% The JIIST uses iii) not iii.
\def\labelenumiii{\theenumiii)} \def\theenumiii{\roman{enumiii}}

% The JIIST uses A) not A.
\def\labelenumiv{\theenumiv)}   \def\theenumiv{\Alph{enumiv}}

% exactly the same as in article.cls
\def\p@enumii{\theenumi}
\def\p@enumiii{\theenumi(\theenumii)}
\def\p@enumiv{\p@enumiii\theenumiii}

% itemized list label styles
\def\labelitemi{$\scriptstyle\bullet$}
\def\labelitemii{\textbf{--}}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}



% **** V1.3 ENHANCEMENTS ****
% Itemize, Enumerate and Description (IED) List Controls
% ***************************
% 
% 
% The JIIST seems to use at least two different values by
% which ITEMIZED list labels are indented to the right
% For The Journal of Lightwave Technology (JLT) and The Journal
% on Selected Areas in Communications (JSAC), they tend to use
% an indention equal to \parindent. For Transactions on Communications
% they tend to indent ITEMIZED lists a little more--- 1.3\parindent.
% We'll provide both values here for you so that you can choose 
% which one you like in your document using a command such as:
% setlength{\JIISTilabelindent}{\JIISTilabelindentB}
\newdimen\JIISTilabelindentA
\JIISTilabelindentA \parindent

\newdimen\JIISTilabelindentB
\JIISTilabelindentB 1.3\parindent
% However, we'll default to using \parindent
% which makes more sense to me
\newdimen\JIISTilabelindent
\JIISTilabelindent \JIISTilabelindentA


% This controls the default amount the enumerated list labels
% are indented to the right.
% Normally, this is the same as the paragraph indention
\newdimen\JIISTelabelindent
\JIISTelabelindent \parindent

% This controls the default amount the description list labels
% are indented to the right.
% Normally, this is the same as the paragraph indention
\newdimen\JIISTdlabelindent
\JIISTdlabelindent \parindent

% This is the value actually used within the IED lists.
% The IED environments automatically set its value to
% one of the three values above, so global changes do 
% not have any effect
\newdimen\JIISTlabelindent
\JIISTlabelindent \parindent

% The actual amount labels will be indented is
% \JIISTlabelindent multiplied by the factor below
% corresponding to the level of nesting depth
% This provides a means by which the user can
% alter the effective \JIISTlabelindent for deeper
% levels
% There may not be such a thing as correct "standard JIIST"
% values. What the JIIST actually does may depend on the specific
% circumstances.
% The first list level almost always has full indention.
% The second levels I've seen have only 75% of the normal indentation
% Three level or greater nestings are very rare. I am guessing
% that they don't use any indentation.
\def\JIISTlabelindentfactori{1.0}   % almost always one
\def\JIISTlabelindentfactorii{0.75} % 0.0 or 1.0 may be used in some cases
\def\JIISTlabelindentfactoriii{0.0} % 0.75? 0.5? 0.0?
\def\JIISTlabelindentfactoriv{0.0}
\def\JIISTlabelindentfactorv{0.0}
\def\JIISTlabelindentfactorvi{0.0}

% value actually used within IED lists, it is auto
% set to one of the 6 values above
% global changes here have no effect
\def\JIISTlabelindentfactor{1.0}

% This controls the default spacing between the end of the IED
% list labels and the list text, when normal text is used for
% the labels.
% compsoc uses a larger value here, but we'll set that later
% in the class so that this code block area can be extracted
% as-is for JIISTjrnltools.sty
\newdimen\JIISTiednormlabelsep
\JIISTiednormlabelsep 0.6em

% This controls the default spacing between the end of the IED
% list labels and the list text, when math symbols are used for
% the labels (nomenclature lists). The JIIST usually increases the 
% spacing in these cases
\newdimen\JIISTiedmathlabelsep
\JIISTiedmathlabelsep 1.2em

% This controls the extra vertical separation put above and
% below each IED list. the JIIST usually puts a little extra spacing
% around each list. However, this spacing is barely noticeable.
% compsoc uses a larger value here, but we'll set that later
% in the class so that this code block area can be extracted
% as-is for JIISTjrnltools.sty
\newskip\JIISTiedtopsep
\JIISTiedtopsep 2pt plus 1pt minus 1pt


% This command is executed within each IED list environment
% at the beginning of the list. You can use this to set the 
% parameters for some/all your IED list(s) without disturbing 
% global parameters that affect things other than lists.
% i.e., renewcommand{\JIISTiedlistdecl}{\setlength{\labelsep}{5em}}
% will alter the \labelsep for the next list(s) until 
% \JIISTiedlistdecl is redefined. 
\def\JIISTiedlistdecl{\relax}

% This command provides an easy way to set \leftmargin based
% on the \labelwidth, \labelsep and the argument \JIISTlabelindent
% Usage: \JIISTcalcleftmargin{width-to-indent-the-label}
% output is in the \leftmargin variable, i.e., effectively:
% \leftmargin = argument + \labelwidth + \labelsep
% Note controlled spacing here, shield end of lines with %
\def\JIISTcalcleftmargin#1{\setlength{\leftmargin}{#1}%
\addtolength{\leftmargin}{\labelwidth}%
\addtolength{\leftmargin}{\labelsep}}

% This command provides an easy way to set \labelwidth to the
% width of the given text. It is the same as
% \settowidth{\labelwidth}{label-text}
% and useful as a shorter alternative.
% Typically used to set \labelwidth to be the width
% of the longest label in the list
\def\JIISTsetlabelwidth#1{\settowidth{\labelwidth}{#1}}

% When this command is executed, IED lists will use the 
% JIISTiedmathlabelsep label separation rather than the normal
% spacing. To have an effect, this command must be executed via
% the \JIISTiedlistdecl or within the option of the IED list
% environments.
\def\JIISTusemathlabelsep{\setlength{\labelsep}{\JIISTiedmathlabelsep}}

% A flag which controls whether the IED lists automatically
% calculate \leftmargin from \JIISTlabelindent, \labelwidth and \labelsep
% Useful if you want to specify your own \leftmargin
% This flag must be set (\JIISTnocalcleftmargintrue or \JIISTnocalcleftmarginfalse) 
% via the \JIISTiedlistdecl or within the option of the IED list
% environments to have an effect.
\newif\ifJIISTnocalcleftmargin
\JIISTnocalcleftmarginfalse

% A flag which controls whether \JIISTlabelindent is multiplied by
% the \JIISTlabelindentfactor for each list level.
% This flag must be set via the \JIISTiedlistdecl or within the option 
% of the IED list environments to have an effect.
\newif\ifJIISTnolabelindentfactor
\JIISTnolabelindentfactorfalse


% internal variable to indicate type of IED label
% justification
% 0 - left; 1 - center; 2 - right
\def\@JIISTiedjustify{0}


% commands to allow the user to control IED
% label justifications. Use these commands within
% the IED environment option or in the \JIISTiedlistdecl
% Note that changing the normal list justifications
% is nonstandard and the JIIST may not like it if you do so!
% I include these commands as they may be helpful to
% those who are using these enhanced list controls for
% other non-JIIST related LaTeX work.
% itemize and enumerate automatically default to right
% justification, description defaults to left.
\def\JIISTiedlabeljustifyl{\def\@JIISTiedjustify{0}}%left
\def\JIISTiedlabeljustifyc{\def\@JIISTiedjustify{1}}%center
\def\JIISTiedlabeljustifyr{\def\@JIISTiedjustify{2}}%right




% commands to save to and restore from the list parameter copies
% this allows us to set all the list parameters within
% the list_decl and prevent \list (and its \@list) 
% from overriding any of our parameters
% V1.6 use \edefs instead of dimen's to conserve dimen registers
% Note controlled spacing here, shield end of lines with %
\def\@JIISTsavelistparams{\edef\@JIISTiedtopsep{\the\topsep}%
\edef\@JIISTiedlabelwidth{\the\labelwidth}%
\edef\@JIISTiedlabelsep{\the\labelsep}%
\edef\@JIISTiedleftmargin{\the\leftmargin}%
\edef\@JIISTiedpartopsep{\the\partopsep}%
\edef\@JIISTiedparsep{\the\parsep}%
\edef\@JIISTieditemsep{\the\itemsep}%
\edef\@JIISTiedrightmargin{\the\rightmargin}%
\edef\@JIISTiedlistparindent{\the\listparindent}%
\edef\@JIISTieditemindent{\the\itemindent}}

% Note controlled spacing here
\def\@JIISTrestorelistparams{\topsep\@JIISTiedtopsep\relax%
\labelwidth\@JIISTiedlabelwidth\relax%
\labelsep\@JIISTiedlabelsep\relax%
\leftmargin\@JIISTiedleftmargin\relax%
\partopsep\@JIISTiedpartopsep\relax%
\parsep\@JIISTiedparsep\relax%
\itemsep\@JIISTieditemsep\relax%
\rightmargin\@JIISTiedrightmargin\relax%
\listparindent\@JIISTiedlistparindent\relax%
\itemindent\@JIISTieditemindent\relax}


% v1.6b provide original LaTeX IED list environments
% note that latex.ltx defines \itemize and \enumerate, but not \description
% which must be created by the base classes
% save original LaTeX itemize and enumerate
\let\LaTeXitemize\itemize
\let\endLaTeXitemize\enditemize
\let\LaTeXenumerate\enumerate
\let\endLaTeXenumerate\endenumerate

% provide original LaTeX description environment from article.cls
\newenvironment{LaTeXdescription}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                 \normalfont\bfseries #1}


% override LaTeX's default IED lists
\def\itemize{\@JIISTitemize}
\def\enditemize{\@endJIISTitemize}
\def\enumerate{\@JIISTenumerate}
\def\endenumerate{\@endJIISTenumerate}
\def\description{\@JIISTdescription}
\def\enddescription{\@endJIISTdescription}

% provide the user with aliases - may help those using packages that
% override itemize, enumerate, or description
\def\JIISTitemize{\@JIISTitemize}
\def\endJIISTitemize{\@endJIISTitemize}
\def\JIISTenumerate{\@JIISTenumerate}
\def\endJIISTenumerate{\@endJIISTenumerate}
\def\JIISTdescription{\@JIISTdescription}
\def\endJIISTdescription{\@endJIISTdescription}


% V1.6 we want to keep the JIISTjrnl IED list definitions as our own internal
% commands so they are protected against redefinition
\def\@JIISTitemize{\@ifnextchar[{\@@JIISTitemize}{\@@JIISTitemize[\relax]}}
\def\@JIISTenumerate{\@ifnextchar[{\@@JIISTenumerate}{\@@JIISTenumerate[\relax]}}
\def\@JIISTdescription{\@ifnextchar[{\@@JIISTdescription}{\@@JIISTdescription[\relax]}}
\def\@endJIISTitemize{\endlist}
\def\@endJIISTenumerate{\endlist}
\def\@endJIISTdescription{\endlist}


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% JIISTjrnl itemized list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@JIISTitemize[#1]{%
                \ifnum\@itemdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@itemdepth\@ne%
                \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
                % get the JIISTlabelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\JIISTlabelindentfactor{\csname JIISTlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@JIISTiedjustify{2}% right justified labels are default
                % set other defaults
                \JIISTnocalcleftmarginfalse%
                \JIISTnolabelindentfactorfalse%
                \topsep\JIISTiedtopsep%
                \JIISTlabelindent\JIISTilabelindent%
                \labelsep\JIISTiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % calculate the label width
                % the user can override this later if
                % they specified a \labelwidth
                \settowidth{\labelwidth}{\csname labelitem\romannumeral\the\@itemdepth\endcsname}%
                \@JIISTsavelistparams% save our list parameters
                \list{\csname\@itemitem\endcsname}{%
                \@JIISTrestorelistparams% override any list{} changes
                                       % to our globals
                \let\makelabel\@JIISTiedmakelabel% v1.6b setup \makelabel
                \JIISTiedlistdecl% let user alter parameters
                #1\relax%
                % If the user has requested not to use the
                % JIISTlabelindent factor, don't revise \JIISTlabelindent
                \ifJIISTnolabelindentfactor\relax%
                \else\JIISTlabelindent=\JIISTlabelindentfactor\JIISTlabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \JIISTlabelindent, \labelwidth and
                % \labelsep
                \ifJIISTnocalcleftmargin\relax%
                \else\JIISTcalcleftmargin{\JIISTlabelindent}%
                \fi}\fi\fi}%


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% JIISTjrnl enumerate list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@JIISTenumerate[#1]{%
                \ifnum\@enumdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@enumdepth\@ne%
                \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
                % get the JIISTlabelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\JIISTlabelindentfactor{\csname JIISTlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@JIISTiedjustify{2}% right justified labels are default
                % set other defaults
                \JIISTnocalcleftmarginfalse%
                \JIISTnolabelindentfactorfalse%
                \topsep\JIISTiedtopsep%
                \JIISTlabelindent\JIISTelabelindent%
                \labelsep\JIISTiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % calculate the label width
                % We'll set it to the width suitable for all labels using
                % normalfont 1) to 9)
                % The user can override this later
                \settowidth{\labelwidth}{9)}%
                \@JIISTsavelistparams% save our list parameters
                \list{\csname label\@enumctr\endcsname}{\usecounter{\@enumctr}%
                \@JIISTrestorelistparams% override any list{} changes
                                       % to our globals
                \let\makelabel\@JIISTiedmakelabel% v1.6b setup \makelabel
                \JIISTiedlistdecl% let user alter parameters 
                #1\relax%
                % If the user has requested not to use the
                % JIISTlabelindent factor, don't revise \JIISTlabelindent
                \ifJIISTnolabelindentfactor\relax%
                \else\JIISTlabelindent=\JIISTlabelindentfactor\JIISTlabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \JIISTlabelindent, \labelwidth and
                % \labelsep
                \ifJIISTnocalcleftmargin\relax%
                \else\JIISTcalcleftmargin{\JIISTlabelindent}%
                \fi}\fi\fi}%


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% JIISTjrnl description list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@JIISTdescription[#1]{%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                % get the JIISTlabelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\JIISTlabelindentfactor{\csname JIISTlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@JIISTiedjustify{0}% left justified labels are default
                % set other defaults
                \JIISTnocalcleftmarginfalse%
                \JIISTnolabelindentfactorfalse%
                \topsep\JIISTiedtopsep% 
                \JIISTlabelindent\JIISTdlabelindent%
                % assume normal labelsep
                \labelsep\JIISTiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % Bogus label width in case the user forgets
                % to set it.
                % TIP: If you want to see what a variable's width is you
                % can use the TeX command \showthe\width-variable to 
                % display it on the screen during compilation 
                % (This might be helpful to know when you need to find out
                % which label is the widest)
                \settowidth{\labelwidth}{Hello}%
                \@JIISTsavelistparams% save our list parameters
                \list{}{\@JIISTrestorelistparams% override any list{} changes
                                               % to our globals
                \let\makelabel\@JIISTiedmakelabel% v1.6b setup \makelabel
                \JIISTiedlistdecl% let user alter parameters 
                #1\relax%
                % If the user has requested not to use the
                % labelindent factor, don't revise \JIISTlabelindent
                \ifJIISTnolabelindentfactor\relax%
                \else\JIISTlabelindent=\JIISTlabelindentfactor\JIISTlabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \JIISTlabelindent, \labelwidth and
                % \labelsep
                \ifJIISTnocalcleftmargin\relax%
                \else\JIISTcalcleftmargin{\JIISTlabelindent}\relax%
                \fi}\fi}

% v1.6b we use one makelabel that does justification as needed.
\def\@JIISTiedmakelabel#1{\relax\if\@JIISTiedjustify 0\relax
\makebox[\labelwidth][l]{\normalfont #1}\else
\if\@JIISTiedjustify 1\relax
\makebox[\labelwidth][c]{\normalfont #1}\else
\makebox[\labelwidth][r]{\normalfont #1}\fi\fi}


% compsoc uses a larger value for the normal labelsep
% and also extra spacing above and below each list
\ifCLASSOPTIONcompsoc
  \JIISTiednormlabelsep 1.2em
  \JIISTiedtopsep 6pt plus 3pt minus 3pt
\fi


% VERSE and QUOTE
% V1.7 define environments with newenvironment
\newenvironment{verse}{\let\\=\@centercr
    \list{}{\itemsep\z@ \itemindent -1.5em \listparindent \itemindent
    \rightmargin\leftmargin\advance\leftmargin 1.5em}\item\relax}
    {\endlist}
\newenvironment{quotation}{\list{}{\listparindent 1.5em \itemindent\listparindent
    \rightmargin\leftmargin \parsep 0pt plus 1pt}\item\relax}
    {\endlist}
\newenvironment{quote}{\list{}{\rightmargin\leftmargin}\item\relax}
    {\endlist}


% \titlepage
% provided only for backward compatibility. \maketitle is the correct
% way to create the title page. 
\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \else \newpage \fi \thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% standard values from article.cls
\arraycolsep     5pt
\arrayrulewidth .4pt
\doublerulesep   2pt

\tabcolsep       6pt
\tabbingsep      0.5em


%% FOOTNOTES
%
%\skip\footins 10pt plus 4pt minus 2pt
% V1.6 respond to changes in font size
% space added above the footnotes (if present)
\skip\footins 0.9\baselineskip  plus 0.4\baselineskip  minus 0.2\baselineskip

% V1.6, we need to make \footnotesep responsive to changes
% in \baselineskip or strange spacings will result when in
% draft mode. Here is a little LaTeX secret - \footnotesep
% determines the height of an invisible strut that is placed
% *above* the baseline of footnotes after the first. Since
% LaTeX considers the space for characters to be 0.7\baselineskip
% above the baseline and 0.3\baselineskip below it, we need to
% use 0.7\baselineskip as a \footnotesep to maintain equal spacing
% between all the lines of the footnotes. The JIIST often uses a tad
% more, so use 0.8\baselineskip. This slightly larger value also helps
% the text to clear the footnote marks. Note that \thanks in JIISTjrnl
% uses its own value of \footnotesep which is set in \maketitle.
{\footnotesize
\global\footnotesep 0.8\baselineskip}


\skip\@mpfootins = \skip\footins
\fboxsep = 3pt
\fboxrule = .4pt
% V1.6 use 1em, then use LaTeX2e's \@makefnmark
% Note that the JIIST normally *left* aligns the footnote marks, so we don't need
% box resizing tricks here.
\long\def\@makefntext#1{\parindent 1em\indent\hbox{\@makefnmark}#1}% V1.6 use 1em
% V1.7 compsoc does not use superscipts for footnote marks
\ifCLASSOPTIONcompsoc
\def\@JIISTcompsocmakefnmark{\hbox{\normalfont\@thefnmark.\ }}
\long\def\@makefntext#1{\parindent 1em\indent\hbox{\@JIISTcompsocmakefnmark}#1}
\fi

% The JIIST does not use footnote rules
\def\footnoterule{\vskip-2pt \hrule height 0.6pt depth \z@ \vskip1.6pt\relax}
\toks@\expandafter{\@setminipage\let\footnoterule\relax\footnotesep\z@}
\edef\@setminipage{\the\toks@}

% V1.7 for compsoc, the JIIST uses a footnote rule only for \thanks. We devise a "one-shot"
% system to implement this.
\newif\if@JIISTenableoneshotfootnoterule
\@JIISTenableoneshotfootnoterulefalse
\ifCLASSOPTIONcompsoc
\def\footnoterule{\relax\if@JIISTenableoneshotfootnoterule
\kern-5pt
\hbox to \columnwidth{\hfill\vrule width 0.5\columnwidth height 0.4pt\hfill}
\kern4.6pt
\global\@JIISTenableoneshotfootnoterulefalse
\else
\relax
\fi}
\fi

% V1.6 do not allow LaTeX to break a footnote across multiple pages
\interfootnotelinepenalty=10000

% V1.6 discourage breaks within equations
% Note that amsmath normally sets this to 10000,
% but LaTeX2e normally uses 100.
\interdisplaylinepenalty=2500

% default allows section depth up to /paragraph
\setcounter{secnumdepth}{4}

% technotes do not allow /paragraph
\ifCLASSOPTIONtechnote
   \setcounter{secnumdepth}{3}
\fi
% neither do compsoc conferences
\@JIISTcompsocconfonly{\setcounter{secnumdepth}{3}}


\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]

% used only by JIISTjrnl's JIISTeqnarray as other packages may
% have their own, different, implementations
\newcounter{JIISTsubequation}[equation]

% as shown when called by user from \ref, \label and in table of contents
\def\theequation{\arabic{equation}}                          % 1
\def\theJIISTsubequation{\theequation\alph{JIISTsubequation}}  % 1a (used only by JIISTjrnl's JIISTeqnarray)
\ifCLASSOPTIONcompsoc
% compsoc is all arabic
\def\thesection{\arabic{section}}                
\def\thesubsection{\thesection.\arabic{subsection}}
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\def\theparagraph{\thesubsubsection.\arabic{paragraph}}
\else
\def\thesection{\Roman{section}}                             % I
% V1.7, \mbox prevents breaks around - 
\def\thesubsection{\mbox{\thesection-\Alph{subsection}}}     % I-A
% V1.7 use I-A1 format used by the JIIST rather than I-A.1
\def\thesubsubsection{\thesubsection\arabic{subsubsection}}  % I-A1
\def\theparagraph{\thesubsubsection\alph{paragraph}}         % I-A1a
\fi

% From Heiko Oberdiek. Because of the \mbox in \thesubsection, we need to
% tell hyperref to disable the \mbox command when making PDF bookmarks.
% This done already with hyperref.sty version 6.74o and later, but
% it will not hurt to do it here again for users of older versions.
\@ifundefined{pdfstringdefPreHook}{\let\pdfstringdefPreHook\@empty}{}%
\g@addto@macro\pdfstringdefPreHook{\let\mbox\relax}


% Main text forms (how shown in main text headings)
% V1.6, using \thesection in \thesectiondis allows changes
% in the former to automatically appear in the latter
\ifCLASSOPTIONcompsoc
  \ifCLASSOPTIONconference% compsoc conference
    \def\thesectiondis{\thesection.}
    \def\thesubsectiondis{\thesectiondis\arabic{subsection}.}
    \def\thesubsubsectiondis{\thesubsectiondis\arabic{subsubsection}.}
    \def\theparagraphdis{\thesubsubsectiondis\arabic{paragraph}.}
  \else% compsoc not conferencs
    \def\thesectiondis{\thesection}
    \def\thesubsectiondis{\thesectiondis.\arabic{subsection}}
    \def\thesubsubsectiondis{\thesubsectiondis.\arabic{subsubsection}}
    \def\theparagraphdis{\thesubsubsectiondis.\arabic{paragraph}}
  \fi
\else% not compsoc
  \def\thesectiondis{\thesection.}                   % I.
  \def\thesubsectiondis{\Alph{subsection}.}          % B.
  \def\thesubsubsectiondis{\arabic{subsubsection})}  % 3)
  \def\theparagraphdis{\alph{paragraph})}            % d)
\fi

% just like LaTeX2e's \@eqnnum
\def\theequationdis{{\normalfont \normalcolor (\theequation)}}% (1)
% JIISTsubequation used only by JIISTjrnl's JIISTeqnarray
\def\theJIISTsubequationdis{{\normalfont \normalcolor (\theJIISTsubequation)}}% (1a)
% redirect LaTeX2e's equation number display and all that depend on
% it, through JIISTjrnl's \theequationdis
\def\@eqnnum{\theequationdis}



% V1.7 provide string macros as article.cls does
\def\contentsname{Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\refname{References}
\def\indexname{Index}
\def\figurename{Fig.}
\def\tablename{TABLE}
\@JIISTcompsocconfonly{\def\figurename{Figure}}
\def\partname{Part}
\def\appendixname{Appendix}
\def\abstractname{Abstract}
% JIIST specific names
\def\JIISTkeywordsname{Index Terms}
\def\JIISTproofname{Proof}


% LIST OF FIGURES AND TABLES AND TABLE OF CONTENTS
%
\def\@pnumwidth{1.55em}
\def\@tocrmarg{2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{3}

% adjusted some spacings here so that section numbers will not easily 
% collide with the section titles. 
% VIII; VIII-A; and VIII-A.1 are usually the worst offenders.
% MDS 1/2001
\def\tableofcontents{\section*{\contentsname}\@starttoc{toc}}
\def\l@section#1#2{\addpenalty{\@secpenalty}\addvspace{1.0em plus 1pt}%
    \@tempdima 2.75em \begingroup \parindent \z@ \rightskip \@pnumwidth%
    \parfillskip-\@pnumwidth {\bfseries\leavevmode #1}\hfil\hbox to\@pnumwidth{\hss #2}\par%
    \endgroup}
% argument format #1:level, #2:labelindent,#3:labelsep
\def\l@subsection{\@dottedtocline{2}{2.75em}{3.75em}}
\def\l@subsubsection{\@dottedtocline{3}{6.5em}{4.5em}}
% must provide \l@ defs for ALL sublevels EVEN if tocdepth
% is such as they will not appear in the table of contents
% these defs are how TOC knows what level these things are!
\def\l@paragraph{\@dottedtocline{4}{6.5em}{5.5em}}
\def\l@subparagraph{\@dottedtocline{5}{6.5em}{6.5em}}
\def\listoffigures{\section*{\listfigurename}\@starttoc{lof}}
\def\l@figure{\@dottedtocline{1}{0em}{2.75em}}
\def\listoftables{\section*{\listtablename}\@starttoc{lot}}
\let\l@table\l@figure


% Definitions for floats
%
% Normal Floats
% V1.8 floatsep et al. revised down by 0.15\baselineskip
% to account for the sideeffects of \topskip compensation
\floatsep 0.85\baselineskip plus  0.2\baselineskip minus  0.2\baselineskip
\textfloatsep 1.55\baselineskip plus  0.2\baselineskip minus  0.4\baselineskip
\@fptop 0pt plus 1fil
\@fpsep 0.75\baselineskip plus 2fil
\@fpbot 0pt plus 1fil
\def\topfraction{0.9}
\def\bottomfraction{0.4}
\def\floatpagefraction{0.8}
% V1.7, let top floats approach 90% of page
\def\textfraction{0.1}

% Double Column Floats
\dblfloatsep 0.85\baselineskip plus  0.2\baselineskip minus  0.2\baselineskip

\dbltextfloatsep 1.55\baselineskip plus  0.2\baselineskip minus  0.4\baselineskip
% Note that it would be nice if the rubber here actually worked in LaTeX2e.
% There is a long standing limitation in LaTeX, first discovered (to the best
% of my knowledge) by Alan Jeffrey in 1992. LaTeX ignores the stretchable
% portion of \dbltextfloatsep, and as a result, double column figures can and
% do result in an non-integer number of lines in the main text columns with
% underfull vbox errors as a consequence. A post to comp.text.tex
% by Donald Arseneau confirms that this had not yet been fixed in 1998.
% JIISTjrnl V1.6 will fix this problem for you in the titles, but it doesn't
% protect you from other double floats. Happy vspace'ing.

\@dblfptop 0pt plus 1fil
\@dblfpsep 0.75\baselineskip plus 2fil
\@dblfpbot 0pt plus 1fil
\def\dbltopfraction{0.8}
\def\dblfloatpagefraction{0.8}
\setcounter{dbltopnumber}{4}

\intextsep 0.85\baselineskip plus 0.2\baselineskip minus  0.2\baselineskip
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}



% article class provides these, we should too.
\newlength\abovecaptionskip
\newlength\belowcaptionskip
% but only \abovecaptionskip is used above figure captions and *below* table
% captions
\setlength\abovecaptionskip{0.5\baselineskip}
% compsoc journals are a little more generous
\ifCLASSOPTIONcompsoc\ifCLASSOPTIONjournal
  \setlength\abovecaptionskip{0.75\baselineskip}
\fi\fi
\setlength\belowcaptionskip{0pt}
% V1.6 create hooks in case the caption spacing ever needs to be
% overridden by a user
\def\@JIISTfigurecaptionsepspace{\vskip\abovecaptionskip\relax}%
\def\@JIISTtablecaptionsepspace{\vskip\abovecaptionskip\relax}%


% 1.6b revise caption system so that \@makecaption uses two arguments
% as with LaTeX2e. Otherwise, there will be problems when using hyperref.
\def\@JIISTtablestring{table}


% V1.8 compensate for \topskip so top of top figures align with tops of the first lines of main text
% here we calculate a space equal to the amount \topskip exceeds the main text height
% we hook in at \@floatboxreset
\def\@JIISTfiguretopskipspace{\ifdim\prevdepth=-1000pt\relax
\setlength{\@JIISTjrnltmpdimenA}{1\topskip}\relax
\addtolength{\@JIISTjrnltmpdimenA}{-0.7\@JIISTnormalsizeunitybaselineskip}\relax
\vspace*{\@JIISTjrnltmpdimenA}\fi}
% V1.8 compensate for \topskip at the top of top tables so caption text is on main text baseline
% use a strut set on the caption baseline within \@makecaption
\def\@JIISTtabletopskipstrut{\ifdim\prevdepth=-1000pt\rule{0pt}{\topskip}\fi}
% the \ifdim\prevdepth checks are always expected to be true for JIIST style float caption ordering
% because top of figure content and top of captions in tables is the first thing on the vertical
% list of these floats
% thanks to Donald Arseneau for his 2000/11/11 post "Re: caption hacking" with info on this topic.


\ifCLASSOPTIONcompsoc
% V1.7 compsoc \@makecaption
\ifCLASSOPTIONconference% compsoc conference
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@JIISTtablestring%
% if a table, do table caption
\footnotesize\bgroup\par\centering\@JIISTtabletopskipstrut{\normalfont\footnotesize {#1.}\nobreakspace\scshape #2}\par\addvspace{0.5\baselineskip}\egroup%
\@JIISTtablecaptionsepspace
% if not a table, format it as a figure
\else
\@JIISTfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\footnotesize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center
\else%
\hbox to\hsize{\normalfont\footnotesize\hfil\box\@tempboxa\hfil}%
\fi\fi}
%
\else% nonconference compsoc
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@JIISTtablestring%
% if a table, do table caption
\footnotesize\bgroup\par\centering\@JIISTtabletopskipstrut{\normalfont\sffamily\footnotesize #1}\\{\normalfont\sffamily\footnotesize #2}\par\addvspace{0.5\baselineskip}\egroup%
\@JIISTtablecaptionsepspace
% if not a table, format it as a figure
\else
\@JIISTfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\sffamily\footnotesize {#1.}\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\sffamily\footnotesize {#1.}\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\sffamily\footnotesize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, left justify
\else%
\hbox to\hsize{\normalfont\sffamily\footnotesize\box\@tempboxa\hfil}%
\fi\fi}
\fi
%
\else% traditional noncompsoc \@makecaption
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@JIISTtablestring%
% if a table, do table caption
\footnotesize\bgroup\par\centering\@JIISTtabletopskipstrut{\normalfont\footnotesize #1}\\{\normalfont\footnotesize\scshape #2}\par\addvspace{0.5\baselineskip}\egroup%
\@JIISTtablecaptionsepspace
% if not a table, format it as a figure
\else
\@JIISTfigurecaptionsepspace
% 3/2001 use footnotesize, not small; use two nonbreaking spaces, not one
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}\nobreakspace\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}\nobreakspace\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\footnotesize\noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center if conference, left justify otherwise
\else%
\ifCLASSOPTIONconference \hbox to\hsize{\normalfont\footnotesize\hfil\box\@tempboxa\hfil}%
\else \hbox to\hsize{\normalfont\footnotesize\box\@tempboxa\hfil}%
\fi\fi\fi}
\fi



% V1.7 disable captions class option, do so in a way that retains operation of \label
% within \caption
\ifCLASSOPTIONcaptionsoff
\long\def\@makecaption#1#2{\vspace*{2em}\footnotesize\bgroup\par\addvspace{0.5\baselineskip}\centering{\footnotesize #1}\par\addvspace{0.5\baselineskip}\egroup%
\let\@JIISTtemporiglabeldefsave\label
\let\@JIISTtemplabelargsave\relax
\def\label##1{\gdef\@JIISTtemplabelargsave{##1}}%
\setbox\@tempboxa\hbox{#2}%
\let\label\@JIISTtemporiglabeldefsave
\ifx\@JIISTtemplabelargsave\relax\else\label{\@JIISTtemplabelargsave}\fi}
\fi


% V1.7 define end environments with \def not \let so as to work OK with
% preview-latex
\newcounter{figure}
\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
% V1.8 within figures add \@JIISTfiguretopskipspace compensation to LaTeX2e's \@floatboxreset
\def\figure{\def\@floatboxreset{\reset@font\normalsize\@setminipage\@JIISTfiguretopskipspace}\@float{figure}}
\def\endfigure{\end@float}
% V1.8 also add \@JIISTfiguretopskipspace compensation to \figure*
\@namedef{figure*}{\def\@floatboxreset{\reset@font\normalsize\@setminipage\@JIISTfiguretopskipspace}\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

\newcounter{table}
\ifCLASSOPTIONcompsoc
\def\thetable{\arabic{table}}
\else
\def\thetable{\@Roman\c@table}
\fi
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
% V1.6 The JIIST uses 8pt text for tables
% within tables alter LaTeX2e's \@floatboxreset to use \footnotesize
\def\table{\def\@floatboxreset{\reset@font\footnotesize\@setminipage}\@float{table}}
\def\endtable{\end@float}
% v1.6b double column tables need to default to footnotesize as well.
\@namedef{table*}{\def\@floatboxreset{\reset@font\footnotesize\@setminipage}\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}




%% -- Command Argument Scanning Support Functions --
%% V1.8a 

% usage: \@JIISTstripouterbraces*{}
% \@JIISTstripouterbraces fully expands its argument (which it then stores
% in \@JIISTstripouterbracesarg) via \edef, then removes any outer enclosing
% braces, and finally stores the result in the macro
% \@JIISTstrippedouterbraces.
%
% For example:
% \@JIISTstripouterbraces{{{{ab}c}}}
% results in:
%
% \@JIISTstripouterbracesarg ==> a macro containing {{{ab}c}}
% \@JIISTstrippedouterbraces ==> a macro containing {ab}c
%
% the *-star form,\@JIISTstripouterbraces*, does not expand the argument
% contents during processing
\def\@JIISTstripouterbraces{\@ifstar{\let\@JIISTstripouterbracesdef=\def\@@JIISTstripouterbraces}{\let\@JIISTstripouterbracesdef=\edef\@@JIISTstripouterbraces}}

\def\@@JIISTstripouterbraces#1{\@JIISTstripouterbracesdef\@JIISTstripouterbracesarg{#1}\relax
% If the macro is unchanged after being acquired as a single delimited
% argument, we know we have one sequence of tokens without any enclosing
% braces. Loop until this is true.
\loop
  \expandafter\@@@JIISTstripouterbraces\@JIISTstripouterbracesarg\@JIISTgeneralsequenceDELIMITER
\ifx\@JIISTstrippedouterbraces\@JIISTstripouterbracesarg
\else
  \let\@JIISTstripouterbracesarg\@JIISTstrippedouterbraces
\repeat}

\def\@@@JIISTstripouterbraces#1\@JIISTgeneralsequenceDELIMITER{\def\@JIISTstrippedouterbraces{#1}}



% usage: \@JIISTextractgroup*{}
% \@JIISTextractgroup fully expands its argument (which it then stores in
% \@JIISTextractgrouparg) via \edef and then assigns the first "brace group"
% of tokens to the macro \@JIISTextractedgroup.
% The remaining groups, if any, are stored in the macro
% \@JIISTextractedgroupremain. If the argument does not contain the requisite
% groups, the respective macros will be defined to be empty.
% There is an asymmetry in that \@JIISTextractedgroup is stripped of its first
% outer grouping while \@JIISTextractedgroupremain retains even the outer
% grouping (if present) that originally identified it as a group.
%
% For example:
% \@JIISTextractgroup{{{ab}}{c{de}}}
% results in:
%
% \@JIISTextractgrouparg       ==> a macro containing {{ab}}{c{de}}
% \@JIISTextractedgroup        ==> a macro containing {ab}
% \@JIISTextractedgroupremain  ==> a macro containing {c{de}}
%
% The *-star form, \@JIISTextractgroup*, does not expand its argument
% contents during processing.
\def\@JIISTextractgroup{\@ifstar{\let\@JIISTextractgroupdef=\def\@@JIISTextractgroup}{\let\@JIISTextractgroupdef=\edef\@@JIISTextractgroup}}

\def\@@JIISTextractgroup#1{\@JIISTextractgroupdef\@JIISTextractgrouparg{#1}\relax
% trap the case of an empty extracted group as this would cause problems with
% \@JIISTextractgroupremain's argument acquisition
\ifx\@JIISTextractgrouparg\@empty
  \def\@JIISTextractedgroup{}\relax
  \def\@JIISTextractedgroupremain{}\relax
\else
  % We have to use some dirty tricks here. We want to insert {} around
  % whatever remains after the first group so that TeX's argument scanner
  % will preserve any originally enclosing braces as well as provide an
  % empty argument to acquire even if there isn't a second group.
  % In this first of two dirty tricks, we put a } at the end of the structure
  % we are going to extract from. The \ifnum0=`{\fi keeps TeX happy to allow
  % what would otherwise be an unbalanced macro definition for
  % \@@JIISTextractgroup to be acceptable to it.
  \ifnum0=`{\fi\expandafter\@JIISTextractgroupremain\@JIISTextractgrouparg}\relax
\fi}

% In the second part of the dirty tricks, we insert a leading { right after
% the first group is acquired, but before the remainder is. Again, the
% \ifnum0=`}\fi keeps TeX happy during definition time, but will disappear
% during run time.
\def\@JIISTextractgroupremain#1{\def\@JIISTextractedgroup{#1}\expandafter\@@JIISTextractgroupremain\expandafter{\ifnum0=`}\fi}

\def\@@JIISTextractgroupremain#1{\def\@JIISTextractedgroupremain{#1}}



% \@JIISTextracttoken relocated at top because margin setting commands rely on it



% usage: \@JIISTextracttokengroups*{}
% \@JIISTextracttokengroups fully expands its argument (which it then stores
% in \@JIISTextracttokengroupsarg) and then assigns the first "brace group" of
% tokens (with the outermost braces removed) to the macro
% \@JIISTextractedfirstgroup.
% The meaning of the first nonbrace (but including the empty group) token
% within this first group is assigned via \let to \@JIISTextractedfirsttoken
% as well as stored in the macro \@JIISTextractedfirsttokenmacro. If a first
% nonbrace token does not exist (or is an empty group), these will be \relax
% and empty, respectively.  Tokens that would otherwise be discarded during
% the acquisition of the first token in the first group are stored in
% \@JIISTextractedfirsttokensdiscarded, however their original relative brace
% nesting depths are not guaranteed to be preserved.
% The first group within this first group is stored in the macro
% \@JIISTextractedfirstfirstgroup.
% Likewise for the next group after the first: \@JIISTextractednextgroup,
% \@JIISTextractednextfirstgroup, \@JIISTextractednextgroupfirsttoken,
% \@JIISTextractednextgroupfirsttokenmacro, and 
% \@JIISTextractednextfirsttokensdiscarded.
% All tokens/groups after the first group, including any enclosing braces,
% are stored in the macro \@JIISTextractedafterfirstgroupremain which will
% be empty if none exist.
%
% For example:
% \@JIISTextracttokengroups{{{ab}{cd}}{{ef}g}}
% will result in:
%
% \@JIISTextracttokengroupsarg             ==> a macro containing {{ab}{cd}}{{ef}g}
% \@JIISTextractedfirstgroup               ==> a macro containing {ab}{cd}
% \@JIISTextractedafterfirstgroupremain    ==> a macro containing {{ef}g}
% \@JIISTextractedfirsttoken               ==> the letter a
% \@JIISTextractedfirsttokenmacro          ==> a macro containing a
% \@JIISTextractedfirsttokensdiscarded     ==> a macro containing bcd
% \@JIISTextractedfirstfirstgroup          ==> a macro containing ab
% \@JIISTextractednextgroup                ==> a macro containing {ef}g
% \@JIISTextractednextfirsttoken           ==> the letter e
% \@JIISTextractednextfirsttokenmacro      ==> a macro containing e
% \@JIISTextractednextfirsttokensdiscarded ==> a macro containing fg
% \@JIISTextractednextfirstgroup           ==> a macro containing ef
%
% If given an empty argument, \@JIISTextractedfirsttoken and
% \@JIISTextractednextfirsttoken will be set to \relax
% and all the macros will be empty.
% the *-star form, \@JIISTextracttokengroups*, does not expand its argument
% contents during processing.
%
% Depends on: \@JIISTextractgroup, \@JIISTextracttoken
\def\@JIISTextracttokengroups{\@ifstar{\let\@JIISTextracttokengroupsdef=\def\@@JIISTextracttokengroups}{\let\@JIISTextracttokengroupsdef=\edef\@@JIISTextracttokengroups}}
\def\@@JIISTextracttokengroups#1{\@JIISTextracttokengroupsdef\@JIISTextracttokengroupsarg{#1}\relax
% begin extraction, these functions are safe with empty arguments
% first group
\expandafter\@JIISTextractgroup\expandafter*\expandafter{\@JIISTextracttokengroupsarg}\relax
\let\@JIISTextractedfirstgroup\@JIISTextractedgroup
\let\@JIISTextractedafterfirstgroupremain\@JIISTextractedgroupremain
\expandafter\@JIISTextracttoken\expandafter*\expandafter{\@JIISTextractedfirstgroup}\relax
\let\@JIISTextractedfirsttoken\@JIISTextractedtoken
\let\@JIISTextractedfirsttokenmacro\@JIISTextractedtokenmacro
\let\@JIISTextractedfirsttokensdiscarded\@JIISTextractedtokensdiscarded
% first first group
\expandafter\@JIISTextractgroup\expandafter*\expandafter{\@JIISTextractedfirstgroup}\relax
\let\@JIISTextractedfirstfirstgroup\@JIISTextractedgroup
% next group
\expandafter\@JIISTextractgroup\expandafter*\expandafter{\@JIISTextractedafterfirstgroupremain}\relax
\let\@JIISTextractednextgroup\@JIISTextractedgroup
\expandafter\@JIISTextracttoken\expandafter*\expandafter{\@JIISTextractednextgroup}\relax
\let\@JIISTextractednextfirsttoken\@JIISTextractedtoken
\let\@JIISTextractednextfirsttokenmacro\@JIISTextractedtokenmacro
\let\@JIISTextractednextfirsttokensdiscarded\@JIISTextractedtokensdiscarded
% next first group
\expandafter\@JIISTextractgroup\expandafter*\expandafter{\@JIISTextractednextgroup}\relax
\let\@JIISTextractednextfirstgroup\@JIISTextractedgroup}


%% -- End of Command Argument Scanning Support Functions --




%%
%% START OF JIISTeqnarray DEFINITIONS
%%
%% Inspired by the concepts, examples, and previous works of LaTeX 
%% coders and developers such as Donald Arseneau, Fred Bartlett, 
%% David Carlisle, Tony Liu, Frank Mittelbach, Piet van Oostrum, 
%% Roland Winkler and Mark Wooding.
%% I don't make the claim that my work here is even near their calibre. ;)


\newif\if@JIISTeqnarrayboxnojot% flag to indicate if the environment was called as the star form
\@JIISTeqnarrayboxnojotfalse

\newif\if@advanceJIISTeqncolcnt% tracks if the environment should advance the col counter
% allows a way to make an \JIISTeqnarraybox that can be used within an \JIISTeqnarray
% used by JIISTeqnarraymulticol so that it can work properly in both
\@advanceJIISTeqncolcnttrue

\newcount\@JIISTeqnnumcols % tracks how many JIISTeqnarray cols are defined
\newcount\@JIISTeqncolcnt  % tracks how many JIISTeqnarray cols the user actually used


% The default math style used by the columns
\def\JIISTeqnarraymathstyle{\displaystyle}
% The default text style used by the columns
% default to using the current font
\def\JIISTeqnarraytextstyle{\relax}

% like the iedlistdecl but for \JIISTeqnarray
\def\JIISTeqnarraydecl{\relax}
\def\JIISTeqnarrayboxdecl{\relax}



% V1.8 flags to indicate that equation numbering is to persist
\newif\if@JIISTeqnumpersist%
\@JIISTeqnumpersistfalse
\newif\if@JIISTsubeqnumpersist%
\@JIISTsubeqnumpersistfalse
%
% V1.8 flags to indicate if (sub)equation number of last line was preadvanced
\newif\if@JIISTeqnumpreadv%
\@JIISTeqnumpreadvfalse
\newif\if@JIISTsubeqnumpreadv%
\@JIISTsubeqnumpreadvfalse

\newcount\@JIISTsubeqnnumrollback% saves previous value of JIISTsubequation number in case we need to restore it

% \yesnumber is the opposite of \nonumber
% a novel concept with the same def as the equationarray package
% However, we give JIIST versions too since some LaTeX packages such as 
% the MDWtools mathenv.sty redefine \nonumber to something else.
% This command is intended for use in non-JIISTeqnarray math environments
\providecommand{\yesnumber}{\global\@eqnswtrue}


% JIISTyes/nonumber 
% V1.8 add persistant * forms
% These commands can alter the type of equation an JIISTeqnarray line is.
\def\JIISTyesnumber{\@ifstar{\global\@JIISTeqnumpersisttrue\global\@JIISTsubeqnumpersistfalse\@JIISTyesnumber}{\@JIISTyesnumber}}

\def\@JIISTyesnumber{\global\@eqnswtrue
\if@JIISTeqnarrayISinner% alter counters and label only inside an JIISTeqnarray
\ifnum\c@JIISTsubequation>0\relax
   \stepcounter{equation}\setcounter{JIISTsubequation}{0}\gdef\@currentlabel{\p@equation\theequation}\relax
   \gdef\@currentHref{\@JIISTtheHrefequation}% setup hyperref label
\fi
% even if we reached this eqn num via a preadv, it is legit now
\global\@JIISTeqnumpreadvfalse\global\@JIISTsubeqnumpreadvfalse
\fi}

\def\JIISTnonumber{\@ifstar{\global\@JIISTeqnumpersistfalse\global\@JIISTsubeqnumpersistfalse\global\@eqnswfalse}{\global\@eqnswfalse}}


\def\JIISTyessubnumber{\@ifstar{\global\@JIISTsubeqnumpersisttrue\@JIISTyessubnumber}{\@JIISTyessubnumber}}
%
\def\@JIISTyessubnumber{\if@JIISTeqnarrayISinner% alter counters and label only inside an JIISTeqnarray
  \ifnum\c@JIISTsubequation>0\relax% if it already is a subequation, we are good to go as-is
  \else% if we are a regular equation we have to watch out for two cases
    \if@JIISTeqnumpreadv% if this equation is the result of a preadvance, backout and bump the sub eqnnum
       \global\advance\c@equation\m@ne\global\c@JIISTsubequation=\@JIISTsubeqnnumrollback\addtocounter{JIISTsubequation}{1}\relax
    \else% non-preadvanced equations just need initialization of their sub eqnnum
       \setcounter{JIISTsubequation}{1}\relax
    \fi
  \fi% fi already is subequation
  \gdef\@currentlabel{\p@JIISTsubequation\theJIISTsubequation}\relax
  \gdef\@currentHref{\@JIISTtheHrefsubequation}% setup hyperref label
  \global\@JIISTeqnumpreadvfalse\global\@JIISTsubeqnumpreadvfalse% no longer a preadv anymore
  \global\@eqnswtrue
\fi}


\def\JIISTnosubnumber{\@ifstar{\global\@JIISTsubeqnumpersistfalse\@JIISTnosubnumber}{\@JIISTnosubnumber}}
%
\def\@JIISTnosubnumber{\if@JIISTeqnarrayISinner% alter counters and label only inside an JIISTeqnarray
  \if@eqnsw % we do nothing unless we know we will display because we play with the counters here
    % if it currently is a subequation, bump up to the next equation number and turn off the subequation
    \ifnum\c@JIISTsubequation>0\relax\addtocounter{equation}{1}\setcounter{JIISTsubequation}{0}\relax
    \fi
    \global\@JIISTeqnumpreadvfalse\global\@JIISTsubeqnumpreadvfalse% no longer a preadv anymore
    \gdef\@currentlabel{\p@equation\theequation}\relax
    \gdef\@currentHref{\@JIISTtheHrefequation}% setup hyperref label
  \fi
\fi}



% allows users to "push away" equations that get too close to the equation numbers
\def\JIISTeqnarraynumspace{\hphantom{\ifnum\c@JIISTsubequation>0\relax\theJIISTsubequationdis\else\theequationdis\fi}}

% provides a way to span multiple columns within JIISTeqnarray environments
% will consider \if@advanceJIISTeqncolcnt before globally advancing the
% column counter - so as to work within \JIISTeqnarraybox
% usage: \JIISTeqnarraymulticol{number cols. to span}{col type}{cell text}
\long\def\JIISTeqnarraymulticol#1#2#3{\multispan{#1}\relax
% check if column is defined for the precolumn definition
% We have to be careful here because TeX scans for & even within an \iffalse
% where it does not expand macros. So, if we used only one \ifx and a #3
% appeared in the false branch and the user inserted another alignment
% structure that uses & in the \JIISTeqnarraymulticol{}, TeX will not see that
% there is an inner alignment in the false branch yet still will see any &
% there and will think that they apply to the outer alignment resulting in an
% incomplete \ifx error.
% So, here we use separate checks for the pre and post parts in order to keep
% the #3 outside of all conditionals.
\relax\expandafter\ifx\csname @JIISTeqnarraycolDEF#2\endcsname\@JIISTeqnarraycolisdefined\relax
\csname @JIISTeqnarraycolPRE#2\endcsname
\else% if not, error and use default type
\@JIISTclspkgerror{Invalid column type "#2" in \string\JIISTeqnarraymulticol.\MessageBreak
Using a default centering column instead}%
{You must define JIISTeqnarray column types before use.}%
\csname @JIISTeqnarraycolPRE@JIISTdefault\endcsname
\fi
% The ten \relax are to help prevent misleading error messages in case a user
% accidently inserted a macro that tries to acquire additional arguments.
#3\relax\relax\relax\relax\relax\relax\relax\relax\relax\relax
% check if column is defined for the postcolumn definition
\expandafter\ifx\csname @JIISTeqnarraycolDEF#2\endcsname\@JIISTeqnarraycolisdefined\relax
\csname @JIISTeqnarraycolPOST#2\endcsname
\else% if not, use the default type
\csname @JIISTeqnarraycolPOST@JIISTdefault\endcsname
\fi
% advance column counter only if the JIISTeqnarray environment wants it
\if@advanceJIISTeqncolcnt\global\advance\@JIISTeqncolcnt by #1\relax\fi}

% like \omit, but maintains track of the column counter for \JIISTeqnarray
\def\JIISTeqnarrayomit{\omit\if@advanceJIISTeqncolcnt\global\advance\@JIISTeqncolcnt by 1\relax\fi}


% provides a way to define a letter referenced column type
% usage: \JIISTeqnarraydefcol{col. type letter/name}{pre insertion text}{post insertion text}
\def\JIISTeqnarraydefcol#1#2#3{\expandafter\def\csname @JIISTeqnarraycolPRE#1\endcsname{#2}%
\expandafter\def\csname @JIISTeqnarraycolPOST#1\endcsname{#3}%
\expandafter\def\csname @JIISTeqnarraycolDEF#1\endcsname{1}}


% provides a way to define a numerically referenced inter-column glue types
% usage: \JIISTeqnarraydefcolsep{col. glue number}{glue definition}
\def\JIISTeqnarraydefcolsep#1#2{\expandafter\def\csname @JIISTeqnarraycolSEP\romannumeral #1\endcsname{#2}%
\expandafter\def\csname @JIISTeqnarraycolSEPDEF\romannumeral #1\endcsname{1}}


\def\@JIISTeqnarraycolisdefined{1}% just a macro for 1, used for checking undefined column types


% expands and appends the given argument to the \@JIISTjrnltmptoksA token list
% used to build up the \halign preamble
\def\@JIISTappendtoksA#1{\edef\@@JIISTappendtoksA{\@JIISTjrnltmptoksA={\the\@JIISTjrnltmptoksA #1}}%
\@@JIISTappendtoksA}

% also appends to \@JIISTjrnltmptoksA, but does not expand the argument
% uses \toks8 as a scratchpad register
\def\@JIISTappendNOEXPANDtoksA#1{\toks8={#1}%
\edef\@@JIISTappendNOEXPANDtoksA{\@JIISTjrnltmptoksA={\the\@JIISTjrnltmptoksA\the\toks8}}%
\@@JIISTappendNOEXPANDtoksA}

% define some common column types for the user
% math
\JIISTeqnarraydefcol{l}{$\JIISTeqnarraymathstyle}{$\hfil}
\JIISTeqnarraydefcol{c}{\hfil$\JIISTeqnarraymathstyle}{$\hfil}
\JIISTeqnarraydefcol{r}{\hfil$\JIISTeqnarraymathstyle}{$}
\JIISTeqnarraydefcol{L}{$\JIISTeqnarraymathstyle{}}{{}$\hfil}
\JIISTeqnarraydefcol{C}{\hfil$\JIISTeqnarraymathstyle{}}{{}$\hfil}
\JIISTeqnarraydefcol{R}{\hfil$\JIISTeqnarraymathstyle{}}{{}$}
% text
\JIISTeqnarraydefcol{s}{\JIISTeqnarraytextstyle}{\hfil}
\JIISTeqnarraydefcol{t}{\hfil\JIISTeqnarraytextstyle}{\hfil}
\JIISTeqnarraydefcol{u}{\hfil\JIISTeqnarraytextstyle}{}

% vertical rules
\JIISTeqnarraydefcol{v}{}{\vrule width\arrayrulewidth}
\JIISTeqnarraydefcol{vv}{\vrule width\arrayrulewidth\hfil}{\hfil\vrule width\arrayrulewidth}
\JIISTeqnarraydefcol{V}{}{\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth}
\JIISTeqnarraydefcol{VV}{\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth\hfil}%
{\hfil\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth}

% horizontal rules
\JIISTeqnarraydefcol{h}{}{\leaders\hrule height\arrayrulewidth\hfil}
\JIISTeqnarraydefcol{H}{}{\leaders\vbox{\hrule width\arrayrulewidth\vskip\doublerulesep\hrule width\arrayrulewidth}\hfil}

% plain
\JIISTeqnarraydefcol{x}{}{}
\JIISTeqnarraydefcol{X}{$}{$}

% the default column type to use in the event a column type is not defined
\JIISTeqnarraydefcol{@JIISTdefault}{\hfil$\JIISTeqnarraymathstyle}{$\hfil}


% a zero tabskip (used for "-" col types)
\def\@JIISTeqnarraycolSEPzero{0pt plus 0pt minus 0pt}
% a centering tabskip (used for "+" col types)
\def\@JIISTeqnarraycolSEPcenter{1000pt plus 0pt minus 1000pt}

% top level default tabskip glues for the start, end, and inter-column
% may be reset within environments not always at the top level, e.g., \JIISTeqnarraybox
\edef\@JIISTeqnarraycolSEPdefaultstart{\@JIISTeqnarraycolSEPcenter}% default start glue
\edef\@JIISTeqnarraycolSEPdefaultend{\@JIISTeqnarraycolSEPcenter}% default end glue
\edef\@JIISTeqnarraycolSEPdefaultmid{\@JIISTeqnarraycolSEPzero}% default inter-column glue



% creates a vertical rule that extends from the bottom to the top a a cell
% Provided in case other packages redefine \vline some other way.
% usage: \JIISTeqnarrayvrule[rule thickness]
% If no argument is provided, \arrayrulewidth will be used for the rule thickness. 
\newcommand\JIISTeqnarrayvrule[1][\arrayrulewidth]{\vrule\@width#1\relax}

% creates a blank separator row
% usage: \JIISTeqnarrayseprow[separation length][font size commands]
% default is \JIISTeqnarrayseprow[0.25\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \skip5 as a scratch register - calls \@JIISTeqnarraystrutsize which uses more scratch registers
\def\JIISTeqnarrayseprow{\relax\@ifnextchar[{\@JIISTeqnarrayseprow}{\@JIISTeqnarrayseprow[0.25\normalbaselineskip]}}
\def\@JIISTeqnarrayseprow[#1]{\relax\@ifnextchar[{\@@JIISTeqnarrayseprow[#1]}{\@@JIISTeqnarrayseprow[#1][\relax]}}
\def\@@JIISTeqnarrayseprow[#1][#2]{\def\@JIISTeqnarrayseprowARGONE{#1}%
\ifx\@JIISTeqnarrayseprowARGONE\@empty%
% get the skip value, based on the font commands
% use skip5 because \JIISTeqnarraystrutsize uses \skip0, \skip2, \skip3
% assign within a bogus box to confine the font changes
{\setbox0=\hbox{#2\relax\global\skip5=0.25\normalbaselineskip}}%
\else%
{\setbox0=\hbox{#2\relax\global\skip5=#1}}%
\fi%
\@JIISTeqnarrayhoptolastcolumn\JIISTeqnarraystrutsize{\skip5}{0pt}[\relax]\relax}

% creates a blank separator row, but omits all the column templates
% usage: \JIISTeqnarrayseprowcut[separation length][font size commands]
% default is \JIISTeqnarrayseprowcut[0.25\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \skip5 as a scratch register - calls \@JIISTeqnarraystrutsize which uses more scratch registers
\def\JIISTeqnarrayseprowcut{\multispan{\@JIISTeqnnumcols}\relax% span all the cols
% advance column counter only if the JIISTeqnarray environment wants it
\if@advanceJIISTeqncolcnt\global\advance\@JIISTeqncolcnt by \@JIISTeqnnumcols\relax\fi%
\@ifnextchar[{\@JIISTeqnarrayseprowcut}{\@JIISTeqnarrayseprowcut[0.25\normalbaselineskip]}}
\def\@JIISTeqnarrayseprowcut[#1]{\relax\@ifnextchar[{\@@JIISTeqnarrayseprowcut[#1]}{\@@JIISTeqnarrayseprowcut[#1][\relax]}}
\def\@@JIISTeqnarrayseprowcut[#1][#2]{\def\@JIISTeqnarrayseprowARGONE{#1}%
\ifx\@JIISTeqnarrayseprowARGONE\@empty%
% get the skip value, based on the font commands
% use skip5 because \JIISTeqnarraystrutsize uses \skip0, \skip2, \skip3
% assign within a bogus box to confine the font changes
{\setbox0=\hbox{#2\relax\global\skip5=0.25\normalbaselineskip}}%
\else%
{\setbox0=\hbox{#2\relax\global\skip5=#1}}%
\fi%
\JIISTeqnarraystrutsize{\skip5}{0pt}[\relax]\relax}



% draws a single rule across all the columns optional
% argument determines the rule width, \arrayrulewidth is the default
% updates column counter as needed and turns off struts
% usage: \JIISTeqnarrayrulerow[rule line thickness]
\def\JIISTeqnarrayrulerow{\multispan{\@JIISTeqnnumcols}\relax% span all the cols
% advance column counter only if the JIISTeqnarray environment wants it
\if@advanceJIISTeqncolcnt\global\advance\@JIISTeqncolcnt by \@JIISTeqnnumcols\relax\fi%
\@ifnextchar[{\@JIISTeqnarrayrulerow}{\@JIISTeqnarrayrulerow[\arrayrulewidth]}}
\def\@JIISTeqnarrayrulerow[#1]{\leaders\hrule height#1\hfil\relax% put in our rule 
% turn off any struts
\JIISTeqnarraystrutsize{0pt}{0pt}[\relax]\relax}


% draws a double rule by using a single rule row, a separator row, and then
% another single rule row 
% first optional argument determines the rule thicknesses, \arrayrulewidth is the default
% second optional argument determines the rule spacing, \doublerulesep is the default
% usage: \JIISTeqnarraydblrulerow[rule line thickness][rule spacing]
\def\JIISTeqnarraydblrulerow{\multispan{\@JIISTeqnnumcols}\relax% span all the cols
% advance column counter only if the JIISTeqnarray environment wants it
\if@advanceJIISTeqncolcnt\global\advance\@JIISTeqncolcnt by \@JIISTeqnnumcols\relax\fi%
\@ifnextchar[{\@JIISTeqnarraydblrulerow}{\@JIISTeqnarraydblrulerow[\arrayrulewidth]}}
\def\@JIISTeqnarraydblrulerow[#1]{\relax\@ifnextchar[{\@@JIISTeqnarraydblrulerow[#1]}%
{\@@JIISTeqnarraydblrulerow[#1][\doublerulesep]}}
\def\@@JIISTeqnarraydblrulerow[#1][#2]{\def\@JIISTeqnarraydblrulerowARG{#1}%
% we allow the user to say \JIISTeqnarraydblrulerow[][]
\ifx\@JIISTeqnarraydblrulerowARG\@empty%
\@JIISTeqnarrayrulerow[\arrayrulewidth]%
\else%
\@JIISTeqnarrayrulerow[#1]\relax%
\fi%
\def\@JIISTeqnarraydblrulerowARG{#2}%
\ifx\@JIISTeqnarraydblrulerowARG\@empty%
\\\JIISTeqnarrayseprow[\doublerulesep][\relax]%
\else%
\\\JIISTeqnarrayseprow[#2][\relax]%
\fi%
\\\multispan{\@JIISTeqnnumcols}%
% advance column counter only if the JIISTeqnarray environment wants it
\if@advanceJIISTeqncolcnt\global\advance\@JIISTeqncolcnt by \@JIISTeqnnumcols\relax\fi%
\def\@JIISTeqnarraydblrulerowARG{#1}%
\ifx\@JIISTeqnarraydblrulerowARG\@empty%
\@JIISTeqnarrayrulerow[\arrayrulewidth]%
\else%
\@JIISTeqnarrayrulerow[#1]%
\fi%
}

% draws a double rule by using a single rule row, a separator (cutting) row, and then
% another single rule row 
% first optional argument determines the rule thicknesses, \arrayrulewidth is the default
% second optional argument determines the rule spacing, \doublerulesep is the default
% usage: \JIISTeqnarraydblrulerow[rule line thickness][rule spacing]
\def\JIISTeqnarraydblrulerowcut{\multispan{\@JIISTeqnnumcols}\relax% span all the cols
% advance column counter only if the JIISTeqnarray environment wants it
\if@advanceJIISTeqncolcnt\global\advance\@JIISTeqncolcnt by \@JIISTeqnnumcols\relax\fi%
\@ifnextchar[{\@JIISTeqnarraydblrulerowcut}{\@JIISTeqnarraydblrulerowcut[\arrayrulewidth]}}
\def\@JIISTeqnarraydblrulerowcut[#1]{\relax\@ifnextchar[{\@@JIISTeqnarraydblrulerowcut[#1]}%
{\@@JIISTeqnarraydblrulerowcut[#1][\doublerulesep]}}
\def\@@JIISTeqnarraydblrulerowcut[#1][#2]{\def\@JIISTeqnarraydblrulerowARG{#1}%
% we allow the user to say \JIISTeqnarraydblrulerow[][]
\ifx\@JIISTeqnarraydblrulerowARG\@empty%
\@JIISTeqnarrayrulerow[\arrayrulewidth]%
\else%
\@JIISTeqnarrayrulerow[#1]%
\fi%
\def\@JIISTeqnarraydblrulerowARG{#2}%
\ifx\@JIISTeqnarraydblrulerowARG\@empty%
\\\JIISTeqnarrayseprowcut[\doublerulesep][\relax]%
\else%
\\\JIISTeqnarrayseprowcut[#2][\relax]%
\fi%
\\\multispan{\@JIISTeqnnumcols}%
% advance column counter only if the JIISTeqnarray environment wants it
\if@advanceJIISTeqncolcnt\global\advance\@JIISTeqncolcnt by \@JIISTeqnnumcols\relax\fi%
\def\@JIISTeqnarraydblrulerowARG{#1}%
\ifx\@JIISTeqnarraydblrulerowARG\@empty%
\@JIISTeqnarrayrulerow[\arrayrulewidth]%
\else%
\@JIISTeqnarrayrulerow[#1]%
\fi%
}



% inserts a full row's worth of &'s
% relies on \@JIISTeqnnumcols to provide the correct number of columns
% uses \@JIISTjrnltmptoksA, \count0 as scratch registers
\def\@JIISTeqnarrayhoptolastcolumn{\@JIISTjrnltmptoksA={}\count0=1\relax%
\loop% add cols if the user did not use them all
\ifnum\count0<\@JIISTeqnnumcols\relax%
\@JIISTappendtoksA{&}%
\advance\count0 by 1\relax% update the col count
\repeat%
\the\@JIISTjrnltmptoksA%execute the &'s
}



\newif\if@JIISTeqnarrayISinner % flag to indicate if we are within the lines
\@JIISTeqnarrayISinnerfalse    % of an JIISTeqnarray - after the JIISTeqnarraydecl

\edef\@JIISTeqnarrayTHEstrutheight{0pt} % height and depth of JIISTeqnarray struts
\edef\@JIISTeqnarrayTHEstrutdepth{0pt}

\edef\@JIISTeqnarrayTHEmasterstrutheight{0pt} % default height and depth of
\edef\@JIISTeqnarrayTHEmasterstrutdepth{0pt}  % struts within an JIISTeqnarray

\edef\@JIISTeqnarrayTHEmasterstrutHSAVE{0pt} % saved master strut height
\edef\@JIISTeqnarrayTHEmasterstrutDSAVE{0pt} % and depth

\newif\if@JIISTeqnarrayusemasterstrut % flag to indicate that the master strut value
\@JIISTeqnarrayusemasterstruttrue     % is to be used



% saves the strut height and depth of the master strut
\def\@JIISTeqnarraymasterstrutsave{\relax%
\expandafter\skip0=\@JIISTeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@JIISTeqnarrayTHEmasterstrutdepth\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% save values
\edef\@JIISTeqnarrayTHEmasterstrutHSAVE{\the\dimen0}%
\edef\@JIISTeqnarrayTHEmasterstrutDSAVE{\the\dimen2}}

% restores the strut height and depth of the master strut
\def\@JIISTeqnarraymasterstrutrestore{\relax%
\expandafter\skip0=\@JIISTeqnarrayTHEmasterstrutHSAVE\relax%
\expandafter\skip2=\@JIISTeqnarrayTHEmasterstrutDSAVE\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% restore values
\edef\@JIISTeqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@JIISTeqnarrayTHEmasterstrutdepth{\the\dimen2}}


% globally restores the strut height and depth to the 
% master values and sets the master strut flag to true
\def\@JIISTeqnarraystrutreset{\relax%
\expandafter\skip0=\@JIISTeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@JIISTeqnarrayTHEmasterstrutdepth\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% restore values
\xdef\@JIISTeqnarrayTHEstrutheight{\the\dimen0}%
\xdef\@JIISTeqnarrayTHEstrutdepth{\the\dimen2}%
\global\@JIISTeqnarrayusemasterstruttrue}


% if the master strut is not to be used, make the current
% values of \@JIISTeqnarrayTHEstrutheight, \@JIISTeqnarrayTHEstrutdepth
% and the use master strut flag, global
% this allows user strut commands issued in the last column to be carried
% into the isolation/strut column
\def\@JIISTeqnarrayglobalizestrutstatus{\relax%
\if@JIISTeqnarrayusemasterstrut\else%
\xdef\@JIISTeqnarrayTHEstrutheight{\@JIISTeqnarrayTHEstrutheight}%
\xdef\@JIISTeqnarrayTHEstrutdepth{\@JIISTeqnarrayTHEstrutdepth}%
\global\@JIISTeqnarrayusemasterstrutfalse%
\fi}



% usage: \JIISTeqnarraystrutsize{height}{depth}[font size commands]
% If called outside the lines of an JIISTeqnarray, sets the height
% and depth of both the master and local struts. If called inside
% an JIISTeqnarray line, sets the height and depth of the local strut
% only and sets the flag to indicate the use of the local strut
% values. If the height or depth is left blank, 0.7\normalbaselineskip
% and 0.3\normalbaselineskip will be used, respectively.
% The optional argument can be used to evaluate the lengths under
% a different font size and styles. If none is specified, the current
% font is used.
% uses scratch registers \skip0, \skip2, \skip3, \dimen0, \dimen2
\def\JIISTeqnarraystrutsize#1#2{\relax\@ifnextchar[{\@JIISTeqnarraystrutsize{#1}{#2}}{\@JIISTeqnarraystrutsize{#1}{#2}[\relax]}}
\def\@JIISTeqnarraystrutsize#1#2[#3]{\def\@JIISTeqnarraystrutsizeARG{#1}%
\ifx\@JIISTeqnarraystrutsizeARG\@empty%
{\setbox0=\hbox{#3\relax\global\skip3=0.7\normalbaselineskip}}%
\skip0=\skip3\relax%
\else% arg one present
{\setbox0=\hbox{#3\relax\global\skip3=#1\relax}}%
\skip0=\skip3\relax%
\fi% if null arg
\def\@JIISTeqnarraystrutsizeARG{#2}%
\ifx\@JIISTeqnarraystrutsizeARG\@empty%
{\setbox0=\hbox{#3\relax\global\skip3=0.3\normalbaselineskip}}%
\skip2=\skip3\relax%
\else% arg two present
{\setbox0=\hbox{#3\relax\global\skip3=#2\relax}}%
\skip2=\skip3\relax%
\fi% if null arg
% remove stretchability, just to be safe
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
\if@JIISTeqnarrayISinner% inner does not touch master strut size
\edef\@JIISTeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@JIISTeqnarrayTHEstrutdepth{\the\dimen2}%
\@JIISTeqnarrayusemasterstrutfalse% do not use master
\else% outer, have to set master strut too
\edef\@JIISTeqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@JIISTeqnarrayTHEmasterstrutdepth{\the\dimen2}%
\edef\@JIISTeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@JIISTeqnarrayTHEstrutdepth{\the\dimen2}%
\@JIISTeqnarrayusemasterstruttrue% use master strut
\fi}


% usage: \JIISTeqnarraystrutsizeadd{added height}{added depth}[font size commands]
% If called outside the lines of an JIISTeqnarray, adds the given height
% and depth to both the master and local struts.
% If called inside an JIISTeqnarray line, adds the given height and depth
% to the local strut only and sets the flag to indicate the use 
% of the local strut values.
% In both cases, if a height or depth is left blank, 0pt is used instead.
% The optional argument can be used to evaluate the lengths under
% a different font size and styles. If none is specified, the current
% font is used.
% uses scratch registers \skip0, \skip2, \skip3, \dimen0, \dimen2
\def\JIISTeqnarraystrutsizeadd#1#2{\relax\@ifnextchar[{\@JIISTeqnarraystrutsizeadd{#1}{#2}}{\@JIISTeqnarraystrutsizeadd{#1}{#2}[\relax]}}
\def\@JIISTeqnarraystrutsizeadd#1#2[#3]{\def\@JIISTeqnarraystrutsizearg{#1}%
\ifx\@JIISTeqnarraystrutsizearg\@empty%
\skip0=0pt\relax%
\else% arg one present
{\setbox0=\hbox{#3\relax\global\skip3=#1}}%
\skip0=\skip3\relax%
\fi% if null arg
\def\@JIISTeqnarraystrutsizearg{#2}%
\ifx\@JIISTeqnarraystrutsizearg\@empty%
\skip2=0pt\relax%
\else% arg two present
{\setbox0=\hbox{#3\relax\global\skip3=#2}}%
\skip2=\skip3\relax%
\fi% if null arg
% remove stretchability, just to be safe
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
\if@JIISTeqnarrayISinner% inner does not touch master strut size
% get local strut size
\expandafter\skip0=\@JIISTeqnarrayTHEstrutheight\relax%
\expandafter\skip2=\@JIISTeqnarrayTHEstrutdepth\relax%
% add it to the user supplied values
\advance\dimen0 by \skip0\relax%
\advance\dimen2 by \skip2\relax%
% update the local strut size
\edef\@JIISTeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@JIISTeqnarrayTHEstrutdepth{\the\dimen2}%
\@JIISTeqnarrayusemasterstrutfalse% do not use master
\else% outer, have to set master strut too
% get master strut size
\expandafter\skip0=\@JIISTeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@JIISTeqnarrayTHEmasterstrutdepth\relax%
% add it to the user supplied values
\advance\dimen0 by \skip0\relax%
\advance\dimen2 by \skip2\relax%
% update the local and master strut sizes
\edef\@JIISTeqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@JIISTeqnarrayTHEmasterstrutdepth{\the\dimen2}%
\edef\@JIISTeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@JIISTeqnarrayTHEstrutdepth{\the\dimen2}%
\@JIISTeqnarrayusemasterstruttrue% use master strut
\fi}


% allow user a way to see the struts
\newif\ifJIISTvisiblestruts
\JIISTvisiblestrutsfalse

% inserts an invisible strut using the master or local strut values
% uses scratch registers \skip0, \skip2, \dimen0, \dimen2
\def\@JIISTeqnarrayinsertstrut{\relax%
\if@JIISTeqnarrayusemasterstrut
% get master strut size
\expandafter\skip0=\@JIISTeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@JIISTeqnarrayTHEmasterstrutdepth\relax%
\else%
% get local strut size
\expandafter\skip0=\@JIISTeqnarrayTHEstrutheight\relax%
\expandafter\skip2=\@JIISTeqnarrayTHEstrutdepth\relax%
\fi%
% remove stretchability, probably not needed
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
% allow user to see struts if desired
\ifJIISTvisiblestruts%
\vrule width0.2pt height\dimen0 depth\dimen2\relax%
\else%
\vrule width0pt height\dimen0 depth\dimen2\relax\fi}


% creates an invisible strut, useable even outside \JIISTeqnarray
% if \JIISTvisiblestrutstrue, the strut will be visible and 0.2pt wide. 
% usage: \JIISTstrut[height][depth][font size commands]
% default is \JIISTstrut[0.7\normalbaselineskip][0.3\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \dimen0, \dimen2, \skip0, \skip2
\def\JIISTstrut{\relax\@ifnextchar[{\@JIISTstrut}{\@JIISTstrut[0.7\normalbaselineskip]}}
\def\@JIISTstrut[#1]{\relax\@ifnextchar[{\@@JIISTstrut[#1]}{\@@JIISTstrut[#1][0.3\normalbaselineskip]}}
\def\@@JIISTstrut[#1][#2]{\relax\@ifnextchar[{\@@@JIISTstrut[#1][#2]}{\@@@JIISTstrut[#1][#2][\relax]}}
\def\@@@JIISTstrut[#1][#2][#3]{\mbox{#3\relax%
\def\@JIISTstrutARG{#1}%
\ifx\@JIISTstrutARG\@empty%
\skip0=0.7\normalbaselineskip\relax%
\else%
\skip0=#1\relax%
\fi%
\def\@JIISTstrutARG{#2}%
\ifx\@JIISTstrutARG\@empty%
\skip2=0.3\normalbaselineskip\relax%
\else%
\skip2=#2\relax%
\fi%
% remove stretchability, probably not needed
\dimen0\skip0\relax%
\dimen2\skip2\relax%
\ifJIISTvisiblestruts%
\vrule width0.2pt height\dimen0 depth\dimen2\relax%
\else%
\vrule width0.0pt height\dimen0 depth\dimen2\relax\fi}}


% enables strut mode by setting a default strut size and then zeroing the
% \baselineskip, \lineskip, \lineskiplimit and \jot
\def\JIISTeqnarraystrutmode{\JIISTeqnarraystrutsize{0.7\normalbaselineskip}{0.3\normalbaselineskip}[\relax]%
\baselineskip=0pt\lineskip=0pt\lineskiplimit=0pt\jot=0pt}


% equation and subequation forms to use to setup hyperref's \@currentHref
\def\@JIISTtheHrefequation{equation.\theHequation}
\def\@JIISTtheHrefsubequation{equation.\theHequation\alph{JIISTsubequation}}


\def\JIISTeqnarray{\@JIISTeqnumpersisttrue\@JIISTsubeqnumpersistfalse\@JIISTeqnarray}
\def\endJIISTeqnarray{\end@JIISTeqnarray}

\@namedef{JIISTeqnarray*}{\@JIISTeqnumpersistfalse\@JIISTsubeqnumpersistfalse\@JIISTeqnarray}
\@namedef{endJIISTeqnarray*}{\end@JIISTeqnarray}


% \JIISTeqnarray is an enhanced \eqnarray. 
% The star form defaults to not putting equation numbers at the end of each row.
% usage: \JIISTeqnarray[decl]{cols}
\def\@JIISTeqnarray{\relax\@ifnextchar[{\@@JIISTeqnarray}{\@@JIISTeqnarray[\relax]}}
% We have to be careful here to normalize catcodes just before acquiring the
% cols as that specification may contain punctuation which could be subject
% to document catcode changes.
\def\@@JIISTeqnarray[#1]{\begingroup\JIISTnormalcatcodes\@@@JIISTeqnarray[#1]}
\def\@@@JIISTeqnarray[#1]#2{\endgroup
   % default to showing the equation number or not based on whether or not
   % the star form was involked
   \if@JIISTeqnumpersist\global\@eqnswtrue
   \else% not the star form
   \global\@eqnswfalse
   \fi% if star form
   % provide a basic hyperref \theHequation if this has not already been setup (hyperref not loaded, or no section counter)
   \@ifundefined{theHequation}{\def\theHequation{\arabic{equation}}}{}\relax
   % provide dummy hyperref commands in case hyperref is not loaded
   \providecommand{\Hy@raisedlink}[1]{}\relax
   \providecommand{\hyper@anchorstart}[1]{}\relax
   \providecommand{\hyper@anchorend}{}\relax
   \providecommand{\@currentHref}{}\relax
   \@JIISTeqnumpreadvfalse% reset eqnpreadv flag
   \@JIISTsubeqnumpreadvfalse% reset subeqnpreadv flag
   \@JIISTeqnarrayISinnerfalse% not yet within the lines of the halign
   \@JIISTeqnarraystrutsize{0pt}{0pt}[\relax]% turn off struts by default
   \@JIISTeqnarrayusemasterstruttrue% use master strut till user asks otherwise
   \JIISTvisiblestrutsfalse% diagnostic mode defaults to off
   % no extra space unless the user specifically requests it
   \lineskip=0pt\relax
   \lineskiplimit=0pt\relax
   \baselineskip=\normalbaselineskip\relax%
   \jot=\JIISTnormaljot\relax%
   \mathsurround\z@\relax% no extra spacing around math
   \@advanceJIISTeqncolcnttrue% advance the col counter for each col the user uses, 
                             % used in \JIISTeqnarraymulticol and in the preamble build
   %V1.8 Here we preadvance to the next equation number.
   % If the user later wants a continued subequation, we can roll back.
   \global\@JIISTsubeqnnumrollback=\c@JIISTsubequation%
   \stepcounter{equation}\@JIISTeqnumpreadvtrue% advance equation counter before first line
   \setcounter{JIISTsubequation}{0}% no subequation yet
   \let\@JIISTcurrentlabelsave\@currentlabel% save current label as we later change it globally
   \let\@JIISTcurrentHrefsave\@currentHref% save current href label as we later change it globally
   \def\@currentlabel{\p@equation\theequation}% redefine the ref label
   \def\@currentHref{\@JIISTtheHrefequation}% setup hyperref label
   \JIISTeqnarraydecl\relax% allow a way for the user to make global overrides
   #1\relax% allow user to override defaults
   \let\\\@JIISTeqnarraycr% replace newline with one that can put in eqn. numbers
   \global\@JIISTeqncolcnt\z@% col. count = 0 for first line
   \@JIISTbuildpreamble{#2}\relax% build the preamble and put it into \@JIISTjrnltmptoksA 
   % put in the column for the equation number
   \ifnum\@JIISTeqnnumcols>0\relax\@JIISTappendtoksA{&}\fi% col separator for those after the first
   \toks0={##}%
   % advance the \@JIISTeqncolcnt for the isolation col, this helps with error checking
   \@JIISTappendtoksA{\global\advance\@JIISTeqncolcnt by 1\relax}%
   % add the isolation column
   \@JIISTappendtoksA{\tabskip\z@skip\bgroup\the\toks0\egroup}%
   % advance the \@JIISTeqncolcnt for the equation number col, this helps with error checking
   \@JIISTappendtoksA{&\global\advance\@JIISTeqncolcnt by 1\relax}%
   % add the equation number col to the preamble
   \@JIISTappendtoksA{\tabskip\z@skip\hb@xt@\z@\bgroup\hss\the\toks0\egroup}%
   % note \@JIISTeqnnumcols does not count the equation col or isolation col
   % set the starting tabskip glue as determined by the preamble build
   \tabskip=\@JIISTBPstartglue\relax
   % begin the display alignment
   \@JIISTeqnarrayISinnertrue% commands are now within the lines
   $$\everycr{}\halign to\displaywidth\bgroup
   % "exspand" the preamble
   \span\the\@JIISTjrnltmptoksA\cr}

% enter isolation/strut column (or the next column if the user did not use
% every column), record the strut status, complete the columns, do the strut if needed,
% restore counters (to backout any equation setup for a next line that was never used)
% to their correct values and exit
\def\end@JIISTeqnarray{\@JIISTeqnarrayglobalizestrutstatus&\@@JIISTeqnarraycr\egroup
\if@JIISTsubeqnumpreadv\global\advance\c@JIISTsubequation\m@ne\fi
\if@JIISTeqnumpreadv\global\advance\c@equation\m@ne\global\c@JIISTsubequation=\@JIISTsubeqnnumrollback\fi
\global\let\@currentlabel\@JIISTcurrentlabelsave% restore current label
\global\let\@currentHref\@JIISTcurrentHrefsave% restore current href label
$$\@ignoretrue}


% JIISTeqnarray uses a modifed \\ instead of the plain \cr to
% end rows. This allows for things like \\*[vskip amount]
% These "cr" macros are modified versions of those for LaTeX2e's eqnarray
% the {\ifnum0=`} braces must be kept away from the last column to avoid
% altering spacing of its math, so we use & to advance to the next column
% as there is an isolation/strut column after the user's columns
\def\@JIISTeqnarraycr{\@JIISTeqnarrayglobalizestrutstatus&% save strut status and advance to next column
   {\ifnum0=`}\fi
   \@ifstar{%
      \global\@eqpen\@M\@JIISTeqnarrayYCR
   }{%
      \global\@eqpen\interdisplaylinepenalty \@JIISTeqnarrayYCR
   }%
}

\def\@JIISTeqnarrayYCR{\@testopt\@JIISTeqnarrayXCR\z@skip}

\def\@JIISTeqnarrayXCR[#1]{%
   \ifnum0=`{\fi}%
   \@@JIISTeqnarraycr
   \noalign{\penalty\@eqpen\vskip\jot\vskip #1\relax}}%

\def\@@JIISTeqnarraycr{\@JIISTjrnltmptoksA={}% clear token register
    \advance\@JIISTeqncolcnt by -1\relax% adjust col count because of the isolation column
    \ifnum\@JIISTeqncolcnt>\@JIISTeqnnumcols\relax
    \@JIISTclspkgerror{Too many columns within the JIISTeqnarray\MessageBreak
                          environment}%
    {Use fewer \string &'s or put more columns in the JIISTeqnarray column\MessageBreak 
     specifications.}\relax%
    \else
    \loop% add cols if the user did not use them all
    \ifnum\@JIISTeqncolcnt<\@JIISTeqnnumcols\relax
    \@JIISTappendtoksA{&}%
    \advance\@JIISTeqncolcnt by 1\relax% update the col count
    \repeat
    % this number of &'s will take us the the isolation column
    \fi
    % execute the &'s
    \the\@JIISTjrnltmptoksA%
    % handle the strut/isolation column
    \@JIISTeqnarrayinsertstrut% do the strut if needed
    \@JIISTeqnarraystrutreset% reset the strut system for next line or JIISTeqnarray
    &% and enter the equation number column
    \if@eqnsw% only if we display something
      \Hy@raisedlink{\hyper@anchorstart{\@currentHref}}% start a hyperref anchor
      \global\@JIISTeqnumpreadvfalse\relax% displaying an equation number means
      \global\@JIISTsubeqnumpreadvfalse\relax% the equation counters point to valid equations
      % V1.8 Here we setup the counters, currentlabel and status for what would be the *next*
      % equation line as would be the case under the current settings. However, there are two problems.
      % One problem is that there might not ever be a next line. The second problem is that the user
      % may later alter the meaning of a line with commands such as \JIISTyessubnumber. So, to handle
      % these cases we have to record the current values of the (sub)equation counters and revert back
      % to them if the next line is changed or never comes. The \if@JIISTeqnumpreadv, \if@JIISTsubeqnumpreadv
      % and \@JIISTsubeqnnumrollback stuff tracks this.
      % The logic to handle all this is surprisingly complex, but a nice feature of the approach here is
      % that the equation counters and labels remain valid for what the line would be unless a
      % \JIISTyessubnumber et al. later changes it. So, any hyperref links are always correct.
      \ifnum\c@JIISTsubequation>0\relax% handle subequation
         \theJIISTsubequationdis\relax
         \if@JIISTsubeqnumpersist% setup for default type of next line
            \stepcounter{JIISTsubequation}\global\@JIISTsubeqnumpreadvtrue\relax
            \gdef\@currentlabel{\p@JIISTsubequation\theJIISTsubequation}\relax
            \gdef\@currentHref{\@JIISTtheHrefsubequation}% setup hyperref label
         \else
             % if no subeqnum persist, go ahead and setup for a new equation number
             \global\@JIISTsubeqnnumrollback=\c@JIISTsubequation
             \stepcounter{equation}\global\@JIISTeqnumpreadvtrue\relax
             \setcounter{JIISTsubequation}{0}\gdef\@currentlabel{\p@equation\theequation}\relax
             \gdef\@currentHref{\@JIISTtheHrefequation}% setup hyperref label
         \fi
      \else% display a standard equation number
        \theequationdis\relax
        \setcounter{JIISTsubequation}{0}\relax% not really needed
        \if@JIISTsubeqnumpersist% setup for default type of next line
           % subequations that follow plain equations carry the same equation number e.g, 5, 5a rather than 5, 6a
           \stepcounter{JIISTsubequation}\global\@JIISTsubeqnumpreadvtrue\relax
           \gdef\@currentlabel{\p@JIISTsubequation\theJIISTsubequation}\relax
           \gdef\@currentHref{\@JIISTtheHrefsubequation}% setup hyperref label
         \else
             % if no subeqnum persist, go ahead and setup for a new equation number
             \global\@JIISTsubeqnnumrollback=\c@JIISTsubequation
             \stepcounter{equation}\global\@JIISTeqnumpreadvtrue\relax
             \setcounter{JIISTsubequation}{0}\gdef\@currentlabel{\p@equation\theequation}\relax
             \gdef\@currentHref{\@JIISTtheHrefequation}% setup hyperref label
         \fi
      \fi%
      \Hy@raisedlink{\hyper@anchorend}% end hyperref anchor
    \fi% fi only if we display something
    % reset the flags to indicate the default preferences of the display of equation numbers
    \if@JIISTeqnumpersist\global\@eqnswtrue\else\global\@eqnswfalse\fi
    \if@JIISTsubeqnumpersist\global\@eqnswtrue\fi% ditto for the subequation flag
    % reset the number of columns the user actually used
    \global\@JIISTeqncolcnt\z@\relax
    % the real end of the line
    \cr}





% \JIISTeqnarraybox is like \JIISTeqnarray except the box form puts everything
% inside a vtop, vbox, or vcenter box depending on the letter in the second
% optional argument (t,b,c). Vbox is the default. Unlike \JIISTeqnarray,
% equation numbers are not displayed and \JIISTeqnarraybox can be nested.
% \JIISTeqnarrayboxm is for math mode (like \array) and does not put the vbox
% within an hbox.
% \JIISTeqnarrayboxt is for text mode (like \tabular) and puts the vbox within
% a \hbox{$ $} construct.
% \JIISTeqnarraybox will auto detect whether to use \JIISTeqnarrayboxm or 
% \JIISTeqnarrayboxt depending on the math mode.
% The third optional argument specifies the width this box is to be set to -
% natural width is the default.
% The * forms do not add \jot line spacing
% usage: \JIISTeqnarraybox[decl][pos][width]{cols}
\def\JIISTeqnarrayboxm{\@JIISTeqnarrayboxnojotfalse\@JIISTeqnarrayboxHBOXSWfalse\@JIISTeqnarraybox}
\def\endJIISTeqnarrayboxm{\end@JIISTeqnarraybox}
\@namedef{JIISTeqnarrayboxm*}{\@JIISTeqnarrayboxnojottrue\@JIISTeqnarrayboxHBOXSWfalse\@JIISTeqnarraybox}
\@namedef{endJIISTeqnarrayboxm*}{\end@JIISTeqnarraybox}

\def\JIISTeqnarrayboxt{\@JIISTeqnarrayboxnojotfalse\@JIISTeqnarrayboxHBOXSWtrue\@JIISTeqnarraybox}
\def\endJIISTeqnarrayboxt{\end@JIISTeqnarraybox}
\@namedef{JIISTeqnarrayboxt*}{\@JIISTeqnarrayboxnojottrue\@JIISTeqnarrayboxHBOXSWtrue\@JIISTeqnarraybox}
\@namedef{endJIISTeqnarrayboxt*}{\end@JIISTeqnarraybox}

\def\JIISTeqnarraybox{\@JIISTeqnarrayboxnojotfalse\ifmmode\@JIISTeqnarrayboxHBOXSWfalse\else\@JIISTeqnarrayboxHBOXSWtrue\fi%
\@JIISTeqnarraybox}
\def\endJIISTeqnarraybox{\end@JIISTeqnarraybox}

\@namedef{JIISTeqnarraybox*}{\@JIISTeqnarrayboxnojottrue\ifmmode\@JIISTeqnarrayboxHBOXSWfalse\else\@JIISTeqnarrayboxHBOXSWtrue\fi%
\@JIISTeqnarraybox}
\@namedef{endJIISTeqnarraybox*}{\end@JIISTeqnarraybox}

% flag to indicate if the \JIISTeqnarraybox needs to put things into an hbox{$ $} 
% for \vcenter in non-math mode
\newif\if@JIISTeqnarrayboxHBOXSW%
\@JIISTeqnarrayboxHBOXSWfalse

\def\@JIISTeqnarraybox{\relax\@ifnextchar[{\@@JIISTeqnarraybox}{\@@JIISTeqnarraybox[\relax]}}
% We have to be careful here to normalize catcodes just before acquiring the
% cols as that specification may contain punctuation which could be subject
% to document catcode changes.
\def\@@JIISTeqnarraybox[#1]{\relax\begingroup\JIISTnormalcatcodes\@ifnextchar[{\@@@JIISTeqnarraybox[#1]}{\@@@JIISTeqnarraybox[#1][b]}}
\def\@@@JIISTeqnarraybox[#1][#2]{\relax\@ifnextchar[{\@@@@JIISTeqnarraybox[#1][#2]}{\@@@@JIISTeqnarraybox[#1][#2][\relax]}}

% #1 = decl; #2 = t,b,c; #3 = width, #4 = col specs
\def\@@@@JIISTeqnarraybox[#1][#2][#3]#4{\endgroup\@JIISTeqnarrayISinnerfalse % not yet within the lines of the halign
   \@JIISTeqnarraymasterstrutsave% save current master strut values
   \@JIISTeqnarraystrutsize{0pt}{0pt}[\relax]% turn off struts by default
   \@JIISTeqnarrayusemasterstruttrue% use master strut till user asks otherwise
   \JIISTvisiblestrutsfalse% diagnostic mode defaults to off
   % no extra space unless the user specifically requests it
   \lineskip=0pt\relax%
   \lineskiplimit=0pt\relax%
   \baselineskip=\normalbaselineskip\relax%
   \jot=\JIISTnormaljot\relax%
   \mathsurround\z@\relax% no extra spacing around math
   % the default end glues are zero for an \JIISTeqnarraybox
   \edef\@JIISTeqnarraycolSEPdefaultstart{\@JIISTeqnarraycolSEPzero}% default start glue
   \edef\@JIISTeqnarraycolSEPdefaultend{\@JIISTeqnarraycolSEPzero}% default end glue
   \edef\@JIISTeqnarraycolSEPdefaultmid{\@JIISTeqnarraycolSEPzero}% default inter-column glue
   \@advanceJIISTeqncolcntfalse% do not advance the col counter for each col the user uses, 
                              % used in \JIISTeqnarraymulticol and in the preamble build
   \JIISTeqnarrayboxdecl\relax% allow a way for the user to make global overrides
   #1\relax% allow user to override defaults
   \let\\\@JIISTeqnarrayboxcr% replace newline with one that allows optional spacing
   \@JIISTbuildpreamble{#4}\relax% build the preamble and put it into \@JIISTjrnltmptoksA
   % add an isolation column to the preamble to stop \\'s {} from getting into the last col
   \ifnum\@JIISTeqnnumcols>0\relax\@JIISTappendtoksA{&}\fi% col separator for those after the first
   \toks0={##}%
   % add the isolation column to the preamble
   \@JIISTappendtoksA{\tabskip\z@skip\bgroup\the\toks0\egroup}% 
   % set the starting tabskip glue as determined by the preamble build
   \tabskip=\@JIISTBPstartglue\relax
   % begin the alignment
   \everycr{}%
   % use only the very first token to determine the positioning
   \@JIISTextracttoken{#2}\relax
   \ifx\@JIISTextractedtokensdiscarded\@empty\else
     \typeout{** WARNING: JIISTeqnarraybox position specifiers after the first in `\@JIISTextracttokenarg' ignored (line \the\inputlineno).}\relax
   \fi
   % \@JIISTextractedtoken has the first token, the rest are ignored
   % if we need to put things into and hbox and go into math mode, do so now
   \if@JIISTeqnarrayboxHBOXSW \leavevmode \hbox \bgroup $\fi%
   % use the appropriate vbox type
   \if\@JIISTextractedtoken t\relax\vtop\else\if\@JIISTextractedtoken c\relax%
   \vcenter\else\vbox\fi\fi\bgroup%
   \@JIISTeqnarrayISinnertrue% commands are now within the lines
   \ifx#3\relax\halign\else\halign to #3\relax\fi%
   \bgroup
   % "exspand" the preamble
   \span\the\@JIISTjrnltmptoksA\cr}

% carry strut status and enter the isolation/strut column, 
% exit from math mode if needed, and exit
\def\end@JIISTeqnarraybox{\@JIISTeqnarrayglobalizestrutstatus% carry strut status
&% enter isolation/strut column
\@JIISTeqnarrayinsertstrut% do strut if needed
\@JIISTeqnarraymasterstrutrestore% restore the previous master strut values
% reset the strut system for next JIISTeqnarray
% (sets local strut values back to previous master strut values)
\@JIISTeqnarraystrutreset%
% ensure last line, exit from halign, close vbox
\crcr\egroup\egroup%
% exit from math mode and close hbox if needed
\if@JIISTeqnarrayboxHBOXSW $\egroup\fi}



% JIISTeqnarraybox uses a modifed \\ instead of the plain \cr to
% end rows. This allows for things like \\[vskip amount]
% This "cr" macros are modified versions those for LaTeX2e's eqnarray
% For JIISTeqnarraybox, \\* is the same as \\
% the {\ifnum0=`} braces must be kept away from the last column to avoid
% altering spacing of its math, so we use & to advance to the isolation/strut column
% carry strut status into isolation/strut column
\def\@JIISTeqnarrayboxcr{\@JIISTeqnarrayglobalizestrutstatus% carry strut status
&% enter isolation/strut column
\@JIISTeqnarrayinsertstrut% do strut if needed
% reset the strut system for next line or JIISTeqnarray
\@JIISTeqnarraystrutreset%
{\ifnum0=`}\fi%
\@ifstar{\@JIISTeqnarrayboxYCR}{\@JIISTeqnarrayboxYCR}}

% test and setup the optional argument to \\[]
\def\@JIISTeqnarrayboxYCR{\@testopt\@JIISTeqnarrayboxXCR\z@skip}

% JIISTeqnarraybox does not automatically increase line spacing by \jot
\def\@JIISTeqnarrayboxXCR[#1]{\ifnum0=`{\fi}%
\cr\noalign{\if@JIISTeqnarrayboxnojot\else\vskip\jot\fi\vskip#1\relax}}



% usage: \@JIISTbuildpreamble{column specifiers}
% starts the halign preamble build 
% the assembled preamble is put in \@JIISTjrnltmptoksA
\def\@JIISTbuildpreamble#1{\@JIISTjrnltmptoksA={}% clear token register
\let\@JIISTBPcurtype=u%current column type is not yet known
\let\@JIISTBPprevtype=s%the previous column type was the start
\let\@JIISTBPnexttype=u%next column type is not yet known
% ensure these are valid
\def\@JIISTBPcurglue={0pt plus 0pt minus 0pt}%
\def\@JIISTBPcurcolname{@JIISTdefault}% name of current column definition
% currently acquired numerically referenced glue
% use a name that is easier to remember
\let\@JIISTBPcurnum=\@JIISTjrnltmpcountA%
\@JIISTBPcurnum=0%
% tracks number of columns in the preamble
\@JIISTeqnnumcols=0%
% record the default end glues
\edef\@JIISTBPstartglue{\@JIISTeqnarraycolSEPdefaultstart}%
\edef\@JIISTBPendglue{\@JIISTeqnarraycolSEPdefaultend}%
\edef\@JIISTedefMACRO{#1}\relax% fully expand the preamble to support macro containers
% now parse the user's column specifications
% \ignorespaces is used as a delimiter, need at least one trailing \relax because
% \@@JIISTbuildpreamble looks into the future 
\expandafter\@@JIISTbuildpreamble\@JIISTedefMACRO\ignorespaces\relax\relax}


% usage: \@@JIISTbuildpreamble{current column}{next column}
% parses and builds the halign preamble
\def\@@JIISTbuildpreamble#1#2{\let\@@nextJIISTbuildpreamble=\@@JIISTbuildpreamble%
% use only the very first token to check the end
\@JIISTextracttokengroups{#1}\relax
\ifx\@JIISTextractedfirsttoken\ignorespaces\let\@@nextJIISTbuildpreamble=\@@JIISTfinishpreamble\else%
% identify current and next token type
\@JIISTgetcoltype{#1}{\@JIISTBPcurtype}{1}% current, error on invalid
\@JIISTgetcoltype{#2}{\@JIISTBPnexttype}{0}% next, no error on invalid next
% if curtype is a glue, get the glue def
\if\@JIISTBPcurtype g\@JIISTgetcurglue{#1}{\@JIISTBPcurglue}\fi%
% if curtype is a column, get the column def and set the current column name
\if\@JIISTBPcurtype c\@JIISTgetcurcol{#1}\fi%
% if curtype is a numeral, acquire the user defined glue
\if\@JIISTBPcurtype n\@JIISTprocessNcol{#1}\fi%
% process the acquired glue 
\if\@JIISTBPcurtype g\@JIISTprocessGcol\fi%
% process the acquired col 
\if\@JIISTBPcurtype c\@JIISTprocessCcol\fi%
% ready prevtype for next col spec.
\let\@JIISTBPprevtype=\@JIISTBPcurtype%
% be sure and put back the future token(s) as a group
\fi\@@nextJIISTbuildpreamble{#2}}


% usage: \@@JIISTfinishpreamble{discarded}
% executed just after preamble build is completed
% warn about zero cols, and if prevtype type = u, put in end tabskip glue
% argument is not used
\def\@@JIISTfinishpreamble#1{\ifnum\@JIISTeqnnumcols<1\relax
\@JIISTclspkgerror{No column specifiers declared for JIISTeqnarray}%
{At least one column type must be declared for each JIISTeqnarray.}%
\fi%num cols less than 1
%if last type undefined, set default end tabskip glue
\if\@JIISTBPprevtype u\@JIISTappendtoksA{\tabskip=\@JIISTBPendglue}\fi}


% usage: \@JIISTgetcoltype{col specifier}{\output}{error more}
% Identify and return the column specifier's type code in the given
% \output macro:
% n = number
% g = glue (any other char in catagory 12)
% c = letter
% e = \ignorespaces (end of sequence)
% u = undefined
% error mode: 0 = no error message, 1 = error on invalid char
\def\@JIISTgetcoltype#1#2#3{%
% use only the very first token to determine the type
\@JIISTextracttoken{#1}\relax
% \@JIISTextractedtoken has the first token, the rest are discarded
\let#2=u\relax% assume invalid until know otherwise
\ifx\@JIISTextractedtoken\ignorespaces\let#2=e\else
\ifcat\@JIISTextractedtoken\relax\else% screen out control sequences
\if0\@JIISTextractedtoken\let#2=n\else
\if1\@JIISTextractedtoken\let#2=n\else
\if2\@JIISTextractedtoken\let#2=n\else
\if3\@JIISTextractedtoken\let#2=n\else
\if4\@JIISTextractedtoken\let#2=n\else
\if5\@JIISTextractedtoken\let#2=n\else
\if6\@JIISTextractedtoken\let#2=n\else
\if7\@JIISTextractedtoken\let#2=n\else
\if8\@JIISTextractedtoken\let#2=n\else
\if9\@JIISTextractedtoken\let#2=n\else
\ifcat,\@JIISTextractedtoken\let#2=g\relax
\else\ifcat a\@JIISTextractedtoken\let#2=c\relax\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
\if#2u\relax
\if0\noexpand#3\relax\else\@JIISTclspkgerror{Invalid character in column specifications}%
{Only letters, numerals and certain other symbols are allowed \MessageBreak
as JIISTeqnarray column specifiers.}\fi\fi}


% usage: \@JIISTgetcurcol{col specifier}
% verify the letter referenced column exists
% and return its name in \@JIISTBPcurcolname
% if column specifier is invalid, use the default column @JIISTdefault
\def\@JIISTgetcurcol#1{\expandafter\ifx\csname @JIISTeqnarraycolDEF#1\endcsname\@JIISTeqnarraycolisdefined%
\def\@JIISTBPcurcolname{#1}\else% invalid column name
\@JIISTclspkgerror{Invalid column type "#1" in column specifications.\MessageBreak
Using a default centering column instead}%
{You must define JIISTeqnarray column types before use.}%
\def\@JIISTBPcurcolname{@JIISTdefault}\fi}


% usage: \@JIISTgetcurglue{glue specifier}{\output}
% identify the predefined (punctuation) glue value
% and return it in the given output macro
\def\@JIISTgetcurglue#1#2{%
% ! = \! (neg small)  -0.16667em (-3/18 em)
% , = \, (small)       0.16667em ( 3/18 em)
% : = \: (med)         0.22222em ( 4/18 em)
% ; = \; (large)       0.27778em ( 5/18 em)
% ' = \quad            1em
% " = \qquad           2em
% . = 0.5\arraycolsep
% / = \arraycolsep
% ? = 2\arraycolsep
% * = 1fil
% + = \@JIISTeqnarraycolSEPcenter
% - = \@JIISTeqnarraycolSEPzero
% Note that all em values are referenced to the math font (textfont2) fontdimen6
% value for 1em.
% 
% use only the very first token to determine the type
\@JIISTextracttoken{#1}\relax
\ifx\@JIISTextractedtokensdiscarded\@empty\else
  \typeout{** WARNING: JIISTeqnarray predefined inter-column glue type specifiers after the first in `\@JIISTextracttokenarg' ignored (line \the\inputlineno).}\relax
\fi
% get the math font 1em value
% LaTeX2e's NFSS2 does not preload the fonts, but \JIISTeqnarray needs
% to gain access to the math (\textfont2) font's spacing parameters.
% So we create a bogus box here that uses the math font to ensure
% that \textfont2 is loaded and ready. If this is not done,
% the \textfont2 stuff here may not work.
% Thanks to Bernd Raichle for his 1997 post on this topic.
{\setbox0=\hbox{$\displaystyle\relax$}}%
% fontdimen6 has the width of 1em (a quad).
\@JIISTjrnltmpdimenA=\fontdimen6\textfont2\relax%
% identify the glue value based on the first token
% we discard anything after the first
\if!\@JIISTextractedtoken\@JIISTjrnltmpdimenA=-0.16667\@JIISTjrnltmpdimenA\edef#2{\the\@JIISTjrnltmpdimenA}\else
\if,\@JIISTextractedtoken\@JIISTjrnltmpdimenA=0.16667\@JIISTjrnltmpdimenA\edef#2{\the\@JIISTjrnltmpdimenA}\else
\if:\@JIISTextractedtoken\@JIISTjrnltmpdimenA=0.22222\@JIISTjrnltmpdimenA\edef#2{\the\@JIISTjrnltmpdimenA}\else
\if;\@JIISTextractedtoken\@JIISTjrnltmpdimenA=0.27778\@JIISTjrnltmpdimenA\edef#2{\the\@JIISTjrnltmpdimenA}\else
\if'\@JIISTextractedtoken\@JIISTjrnltmpdimenA=1\@JIISTjrnltmpdimenA\edef#2{\the\@JIISTjrnltmpdimenA}\else
\if"\@JIISTextractedtoken\@JIISTjrnltmpdimenA=2\@JIISTjrnltmpdimenA\edef#2{\the\@JIISTjrnltmpdimenA}\else
\if.\@JIISTextractedtoken\@JIISTjrnltmpdimenA=0.5\arraycolsep\edef#2{\the\@JIISTjrnltmpdimenA}\else
\if/\@JIISTextractedtoken\edef#2{\the\arraycolsep}\else
\if?\@JIISTextractedtoken\@JIISTjrnltmpdimenA=2\arraycolsep\edef#2{\the\@JIISTjrnltmpdimenA}\else
\if *\@JIISTextractedtoken\edef#2{0pt plus 1fil minus 0pt}\else
\if+\@JIISTextractedtoken\edef#2{\@JIISTeqnarraycolSEPcenter}\else
\if-\@JIISTextractedtoken\edef#2{\@JIISTeqnarraycolSEPzero}\else
\edef#2{\@JIISTeqnarraycolSEPzero}%
\@JIISTclspkgerror{Invalid predefined inter-column glue type "#1" in\MessageBreak
column specifications. Using a default value of\MessageBreak
0pt instead}%
{Only !,:;'"./?*+ and - are valid predefined glue types in the\MessageBreak 
JIISTeqnarray column specifications.}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi}


% usage: \@JIISTprocessNcol{digit}
% process a numerical digit from the column specification
% and look up the corresponding user defined glue value
% can transform current type from n to g or a as the user defined glue is acquired
\def\@JIISTprocessNcol#1{\if\@JIISTBPprevtype g%
\@JIISTclspkgerror{Back-to-back inter-column glue specifiers in column\MessageBreak
specifications. Ignoring consecutive glue specifiers\MessageBreak
after the first}%
{You cannot have two or more glue types next to each other\MessageBreak 
in the JIISTeqnarray column specifications.}%
\let\@JIISTBPcurtype=a% abort this glue, future digits will be discarded
\@JIISTBPcurnum=0\relax%
\else% if we previously aborted a glue
\if\@JIISTBPprevtype a\@JIISTBPcurnum=0\let\@JIISTBPcurtype=a%maintain digit abortion
\else%acquire this number
% save the previous type before the numerical digits started
\if\@JIISTBPprevtype n\else\let\@JIISTBPprevsavedtype=\@JIISTBPprevtype\fi%
\multiply\@JIISTBPcurnum by 10\relax%
\advance\@JIISTBPcurnum by #1\relax% add in number, \relax is needed to stop TeX's number scan
\if\@JIISTBPnexttype n\else%close acquisition
\expandafter\ifx\csname @JIISTeqnarraycolSEPDEF\expandafter\romannumeral\number\@JIISTBPcurnum\endcsname\@JIISTeqnarraycolisdefined%
\edef\@JIISTBPcurglue{\csname @JIISTeqnarraycolSEP\expandafter\romannumeral\number\@JIISTBPcurnum\endcsname}%
\else%user glue not defined
\@JIISTclspkgerror{Invalid user defined inter-column glue type "\number\@JIISTBPcurnum" in\MessageBreak
column specifications. Using a default value of\MessageBreak
0pt instead}%
{You must define all JIISTeqnarray numerical inter-column glue types via\MessageBreak
\string\JIISTeqnarraydefcolsep \space before they are used in column specifications.}%
\edef\@JIISTBPcurglue{\@JIISTeqnarraycolSEPzero}%
\fi% glue defined or not
\let\@JIISTBPcurtype=g% change the type to reflect the acquired glue
\let\@JIISTBPprevtype=\@JIISTBPprevsavedtype% restore the prev type before this number glue
\@JIISTBPcurnum=0\relax%ready for next acquisition
\fi%close acquisition, get glue
\fi%discard or acquire number
\fi%prevtype glue or not
}


% process an acquired glue
% add any acquired column/glue pair to the preamble
\def\@JIISTprocessGcol{\if\@JIISTBPprevtype a\let\@JIISTBPcurtype=a%maintain previous glue abortions
\else
% if this is the start glue, save it, but do nothing else 
% as this is not used in the preamble, but before
\if\@JIISTBPprevtype s\edef\@JIISTBPstartglue{\@JIISTBPcurglue}%
\else%not the start glue
\if\@JIISTBPprevtype g%ignore if back to back glues
\@JIISTclspkgerror{Back-to-back inter-column glue specifiers in column\MessageBreak
specifications. Ignoring consecutive glue specifiers\MessageBreak
after the first}%
{You cannot have two or more glue types next to each other\MessageBreak 
in the JIISTeqnarray column specifications.}%
\let\@JIISTBPcurtype=a% abort this glue
\else% not a back to back glue
\if\@JIISTBPprevtype c\relax% if the previoustype was a col, add column/glue pair to preamble
\ifnum\@JIISTeqnnumcols>0\relax\@JIISTappendtoksA{&}\fi
\toks0={##}%
% make preamble advance col counter if this environment needs this
\if@advanceJIISTeqncolcnt\@JIISTappendtoksA{\global\advance\@JIISTeqncolcnt by 1\relax}\fi
% insert the column defintion into the preamble, being careful not to expand
% the column definition
\@JIISTappendtoksA{\tabskip=\@JIISTBPcurglue}%
\@JIISTappendNOEXPANDtoksA{\begingroup\csname @JIISTeqnarraycolPRE}%
\@JIISTappendtoksA{\@JIISTBPcurcolname}%
\@JIISTappendNOEXPANDtoksA{\endcsname}%
\@JIISTappendtoksA{\the\toks0}%
\@JIISTappendNOEXPANDtoksA{\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @JIISTeqnarraycolPOST}%
\@JIISTappendtoksA{\@JIISTBPcurcolname}%
\@JIISTappendNOEXPANDtoksA{\endcsname\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\endgroup}%
\advance\@JIISTeqnnumcols by 1\relax%one more column in the preamble
\else% error: non-start glue with no pending column
\@JIISTclspkgerror{Inter-column glue specifier without a prior column\MessageBreak
type in the column specifications. Ignoring this glue\MessageBreak 
specifier}%
{Except for the first and last positions, glue can be placed only\MessageBreak
between column types.}%
\let\@JIISTBPcurtype=a% abort this glue
\fi% previous was a column
\fi% back-to-back glues
\fi% is start column glue
\fi% prev type not a
}


% process an acquired letter referenced column and, if necessary, add it to the preamble
\def\@JIISTprocessCcol{\if\@JIISTBPnexttype g\else
\if\@JIISTBPnexttype n\else
% we have a column followed by something other than a glue (or numeral glue)
% so we must add this column to the preamble now
\ifnum\@JIISTeqnnumcols>0\relax\@JIISTappendtoksA{&}\fi%col separator for those after the first
\if\@JIISTBPnexttype e\@JIISTappendtoksA{\tabskip=\@JIISTBPendglue\relax}\else%put in end glue
\@JIISTappendtoksA{\tabskip=\@JIISTeqnarraycolSEPdefaultmid\relax}\fi% or default mid glue
\toks0={##}%
% make preamble advance col counter if this environment needs this
\if@advanceJIISTeqncolcnt\@JIISTappendtoksA{\global\advance\@JIISTeqncolcnt by 1\relax}\fi
% insert the column definition into the preamble, being careful not to expand
% the column definition
\@JIISTappendNOEXPANDtoksA{\begingroup\csname @JIISTeqnarraycolPRE}%
\@JIISTappendtoksA{\@JIISTBPcurcolname}%
\@JIISTappendNOEXPANDtoksA{\endcsname}%
\@JIISTappendtoksA{\the\toks0}%
\@JIISTappendNOEXPANDtoksA{\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @JIISTeqnarraycolPOST}%
\@JIISTappendtoksA{\@JIISTBPcurcolname}%
\@JIISTappendNOEXPANDtoksA{\endcsname\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\endgroup}%
\advance\@JIISTeqnnumcols by 1\relax%one more column in the preamble
\fi%next type not numeral
\fi%next type not glue
}


%%
%% END OF JIISTeqnarray DEFINITIONS
%%





% set up the running headers and footers
%
% header and footer font and size specifications
\def\@JIISTheaderstyle{\normalfont\scriptsize}
\def\@JIISTfooterstyle{\normalfont\scriptsize}
%
% compsoc uses sans-serif headers and footers
\ifCLASSOPTIONcompsoc
  \def\@JIISTheaderstyle{\normalfont\sffamily\scriptsize}
  \def\@JIISTfooterstyle{\normalfont\sffamily\scriptsize}
\fi


% standard page style, ps@headings
\def\ps@headings{% default to standard twoside headers, no footers
% will change later if the mode requires otherwise
\def\@oddhead{\hbox{}\@JIISTheaderstyle\rightmark\hfil\thepage}\relax
\def\@evenhead{\@JIISTheaderstyle\thepage\hfil\leftmark\hbox{}}\relax
\let\@oddfoot\@empty
\let\@evenfoot\@empty
\ifCLASSOPTIONtechnote
  % technote twoside
  \def\@oddhead{\hbox{}\@JIISTheaderstyle\leftmark\hfil\thepage}\relax
  \def\@evenhead{\@JIISTheaderstyle\thepage\hfil\leftmark\hbox{}}\relax
\fi
\ifCLASSOPTIONdraftcls
  % draft footers
  \def\@oddfoot{\@JIISTfooterstyle\@date\hfil DRAFT}\relax
  \def\@evenfoot{\@JIISTfooterstyle DRAFT\hfil\@date}\relax
\fi
% oneside
\if@twoside\else
  % standard one side headers
  \def\@oddhead{\hbox{}\@JIISTheaderstyle\leftmark\hfil\thepage}\relax
  \let\@evenhead\@empty
  \ifCLASSOPTIONdraftcls
    % oneside draft footers
    \def\@oddfoot{\@JIISTfooterstyle\@date\hfil DRAFT}\relax
    \let\@evenfoot\@empty
  \fi
\fi
% turn off headers for conferences
\ifCLASSOPTIONconference
  \let\@oddhead\@empty
  \let\@evenhead\@empty
\fi
% turn off footers for draftclsnofoot
\ifCLASSOPTIONdraftclsnofoot
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
\fi}


% title page style, ps@JIISTtitlepagestyle
\def\ps@JIISTtitlepagestyle{% default title page headers, no footers
\def\@oddhead{\hbox{}\@JIISTheaderstyle\leftmark\hfil\thepage}\relax
\def\@evenhead{\@JIISTheaderstyle\thepage\hfil\leftmark\hbox{}}\relax
\let\@oddfoot\@empty
\let\@evenfoot\@empty
% will change later if the mode requires otherwise
\ifCLASSOPTIONdraftcls
  % draft footers
  \ifCLASSOPTIONdraftclsnofoot\else
    % but only if not draftclsnofoot
    \def\@oddfoot{\@JIISTfooterstyle\@date\hfil DRAFT}\relax
    \def\@evenfoot{\@JIISTfooterstyle DRAFT\hfil\@date}\relax
  \fi
\else
  % all nondraft mode footers
  \if@JIISTusingpubid
    % for title pages that are using a pubid
    % do not repeat pubid on the title page if using a peer review cover page
    \ifCLASSOPTIONpeerreview\else
      % for noncompsoc papers, the pubid uses footnotesize and
      % is at the same vertical position as where the last baseline would normally be
      \def\@oddfoot{\hbox{}\hss\@JIISTfooterstyle\footnotesize\raisebox{\footskip}[0pt][0pt]{\@JIISTpubid}\hss\hbox{}}\relax
      \def\@evenfoot{\hbox{}\hss\@JIISTfooterstyle\footnotesize\raisebox{\footskip}[0pt][0pt]{\@JIISTpubid}\hss\hbox{}}\relax
      \ifCLASSOPTIONcompsoc
        % for compsoc papers, the pubid is at the same vertical position as the normal footer
        \def\@oddfoot{\hbox{}\hss\@JIISTfooterstyle\raisebox{0pt}[0pt][0pt]{\@JIISTpubid}\hss\hbox{}}\relax
        \def\@evenfoot{\hbox{}\hss\@JIISTfooterstyle\raisebox{0pt}[0pt][0pt]{\@JIISTpubid}\hss\hbox{}}\relax
      \fi
    \fi
  \fi
\fi
% turn off headers for conferences
\ifCLASSOPTIONconference
  \let\@oddhead\@empty
  \let\@evenhead\@empty
\fi}


% peer review cover page style, ps@JIISTpeerreviewcoverpagestyle
\def\ps@JIISTpeerreviewcoverpagestyle{% default peer review cover no headers, no footers
\let\@oddhead\@empty
\let\@evenhead\@empty
\let\@oddfoot\@empty
\let\@evenfoot\@empty
% will change later if the mode requires otherwise
\ifCLASSOPTIONdraftcls
  % draft footers
  \ifCLASSOPTIONdraftclsnofoot\else
    % but only if not draftclsnofoot
    \def\@oddfoot{\@JIISTfooterstyle\@date\hfil DRAFT}\relax
    \def\@evenfoot{\@JIISTfooterstyle DRAFT\hfil\@date}\relax
  \fi
\else
  % all nondraft mode footers
  \if@JIISTusingpubid
    % for peer review cover pages that are using a pubid
    % for noncompsoc papers, the pubid uses footnotesize and
    % is at the same vertical position as where the last baseline would normally be
    \def\@oddfoot{\hbox{}\hss\@JIISTfooterstyle\footnotesize\raisebox{\footskip}[0pt][0pt]{\@JIISTpubid}\hss\hbox{}}\relax
    \def\@evenfoot{\hbox{}\hss\@JIISTfooterstyle\footnotesize\raisebox{\footskip}[0pt][0pt]{\@JIISTpubid}\hss\hbox{}}\relax
    \ifCLASSOPTIONcompsoc
      % for compsoc papers, the pubid is at the same vertical position as the normal footer
      \def\@oddfoot{\hbox{}\hss\@JIISTfooterstyle\raisebox{0pt}[0pt][0pt]{\@JIISTpubid}\hss\hbox{}}\relax
      \def\@evenfoot{\hbox{}\hss\@JIISTfooterstyle\raisebox{0pt}[0pt][0pt]{\@JIISTpubid}\hss\hbox{}}\relax
    \fi
  \fi
\fi}



%% Defines the command for putting the header.
%% Note that all the text is forced into uppercase, if you have some text
%% that needs to be in lower case, for instance et. al., then either manually
%% set \leftmark and \rightmark or use \MakeLowercase{et. al.} within the
%% arguments to \markboth.
%% V1.7b add \protect to work with Babel
\def\markboth#1#2{\def\leftmark{\MakeUppercase{\protect#1}}%
\def\rightmark{\MakeUppercase{\protect#2}}}

\def\today{\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space\number\day, \number\year}




%% CITATION AND BIBLIOGRAPHY COMMANDS
%% 
%% V1.6 no longer supports the older, nonstandard \shortcite and \citename setup stuff
% 
% 
% Modify Latex2e \@citex to separate citations with "], ["
\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{], [}%
     \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
       {\hbox{\csname b@\@citeb\endcsname}}}}{#1}}

% V1.6 we create hooks for the optional use of Donald Arseneau's
% cite.sty package. cite.sty is "smart" and will notice that the
% following format controls are already defined and will not
% redefine them. The result will be the proper sorting of the
% citation numbers and auto detection of 3 or more entry "ranges" -
% all in JIIST style:  [1], [2], [5]--[7], [12]
% This also allows for an optional note, i.e., \cite[mynote]{..}.
% If the \cite with note has more than one reference, the note will
% be applied to the last of the listed references. It is generally
% desired that if a note is given, only one reference is listed in
% that \cite.
% Thanks to Mr. Arseneau for providing the required format arguments
% to produce the JIIST style.
\def\citepunct{], [}
\def\citedash{]--[}

% V1.7 default to using same font for urls made by url.sty
\AtBeginDocument{\csname url@samestyle\endcsname}

% V1.6 class files should always provide these
\def\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
% V1.8b article.cls is now providing these too
% we do not use \@mkboth, nor alter the page style
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}



% Provide support for the control entries of JIISTjrnl.bst V1.00 and later.
% V1.7 optional argument allows for a different aux file to be specified in
% order to handle multiple bibliographies. For example, with multibib.sty:
% \newcites{sec}{Secondary Literature}
% \bstctlcite[@auxoutsec]{BSTcontrolhak}
\def\bstctlcite{\@ifnextchar[{\@bstctlcite}{\@bstctlcite[@auxout]}}
\def\@bstctlcite[#1]#2{\@bsphack
  \@for\@citeb:=#2\do{%
    \edef\@citeb{\expandafter\@firstofone\@citeb}%
    \if@filesw\immediate\write\csname #1\endcsname{\string\citation{\@citeb}}\fi}%
  \@esphack}

% \JIISTnoauxwrite{} allows for citations that do not add to or affect
% the order of the existing citation list. Can be useful for \cite
% within \thanks{}.
\DeclareRobustCommand{\JIISTnoauxwrite}[1]{\relax
\if@filesw
\@fileswfalse
#1\relax\relax\relax\relax\relax
\@fileswtrue
\else
#1\relax\relax\relax\relax\relax
\fi}

% V1.6 provide a way for a user to execute a command just before 
% a given reference number - used to insert a \newpage to balance
% the columns on the last page
\edef\@JIISTtriggerrefnum{0}   % the default of zero means that
                              % the command is not executed
\def\@JIISTtriggercmd{\newpage}

% allow the user to alter the triggered command
\long\def\JIISTtriggercmd#1{\long\def\@JIISTtriggercmd{#1}}

% allow user a way to specify the reference number just before the
% command is executed
\def\JIISTtriggeratref#1{\@JIISTjrnltmpcountA=#1%
\edef\@JIISTtriggerrefnum{\the\@JIISTjrnltmpcountA}}%

% trigger command at the given reference
\def\@JIISTbibitemprefix{\@JIISTjrnltmpcountA=\@JIISTtriggerrefnum\relax%
\advance\@JIISTjrnltmpcountA by -1\relax%
\ifnum\c@enumiv=\@JIISTjrnltmpcountA\relax\@JIISTtriggercmd\relax\fi}


\def\@biblabel#1{[#1]}

% compsoc journals and conferences left align the reference numbers
\@JIISTcompsoconly{\def\@biblabel#1{[#1]\hfill}}

% controls bib item spacing
\def\JIISTbibitemsep{0pt plus .5pt}

\@JIISTcompsocconfonly{\def\JIISTbibitemsep{0.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}}


\def\thebibliography#1{\section*{\refname}%
    \addcontentsline{toc}{section}{\refname}%
    % V1.6 add some rubber space here and provide a command trigger
    \footnotesize\vskip 0.3\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep\relax
    \itemsep \JIISTbibitemsep\relax
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \let\@JIISTlatexbibitem\bibitem%
    \def\bibitem{\@JIISTbibitemprefix\@JIISTlatexbibitem}%
\def\newblock{\hskip .11em plus .33em minus .07em}%
% originally:
%   \sloppy\clubpenalty4000\widowpenalty4000%
% by adding the \interlinepenalty here, we make it more
% difficult, but not impossible, for LaTeX to break within a reference.
% The JIIST almost never breaks a reference (but they do it more often with
% technotes). You may get an underfull vbox warning around the bibliography, 
% but the final result will be much more like what the JIIST will publish. 
% MDS 11/2000
\ifCLASSOPTIONtechnote\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty100%
\else\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty500\fi%
    \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist




% TITLE PAGE COMMANDS
% 
% 
% \JIISTmembership is used to produce the sublargesize italic font used to indicate author 
% JIIST membership. compsoc uses a large size sans slant font
\def\JIISTmembership#1{{\@JIISTnotcompsoconly{\sublargesize}\normalfont\@JIISTcompsoconly{\sffamily}\textit{#1}}}
 

% \JIISTauthorrefmark{} produces a footnote type symbol to indicate author affiliation.
% When given an argument of 1 to 9, \JIISTauthorrefmark{} follows the standard LaTeX footnote
% symbol sequence convention. However, for arguments 10 and above, \JIISTauthorrefmark{} 
% reverts to using lower case roman numerals, so it cannot overflow. Do note that you 
% cannot use \footnotemark[] in place of \JIISTauthorrefmark{} within \author as the footnote
% symbols will have been turned off to prevent \thanks from creating footnote marks.
% \JIISTauthorrefmark{} produces a symbol that appears to LaTeX as having zero vertical
% height - this allows for a more compact line packing, but the user must ensure that
% the interline spacing is large enough to prevent \JIISTauthorrefmark{} from colliding
% with the text above.
% V1.7 make this a robust command
% V1.8 transmag uses an arabic author affiliation symbol
\ifCLASSOPTIONtransmag
\DeclareRobustCommand*{\JIISTauthorrefmark}[1]{\raisebox{0pt}[0pt][0pt]{\textsuperscript{\footnotesize #1}}}
\else
\DeclareRobustCommand*{\JIISTauthorrefmark}[1]{\raisebox{0pt}[0pt][0pt]{\textsuperscript{\footnotesize\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or%
    \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger%
    \or \ddagger\ddagger \else\textsuperscript{\expandafter\romannumeral#1}\fi}}}}
\fi


% FONT CONTROLS AND SPACINGS FOR CONFERENCE MODE AUTHOR NAME AND AFFILIATION BLOCKS
% 
% The default font styles for the author name and affiliation blocks (confmode)
\def\@JIISTauthorblockNstyle{\normalfont\@JIISTcompsocnotconfonly{\sffamily}\sublargesize}
\def\@JIISTauthorblockAstyle{\normalfont\@JIISTcompsocnotconfonly{\sffamily}\@JIISTcompsocconfonly{\itshape}\normalsize}
% The default if the user does not use an author block
\def\@JIISTauthordefaulttextstyle{\normalfont\@JIISTcompsocnotconfonly{\sffamily}\sublargesize}

% adjustment spacing from title (or special paper notice) to author name blocks (confmode)
% can be negative
\def\@JIISTauthorblockconfadjspace{-0.25em}
% compsoc conferences need more space here
\@JIISTcompsocconfonly{\def\@JIISTauthorblockconfadjspace{0.75\@JIISTnormalsizeunitybaselineskip}}

% spacing between name and affiliation blocks (confmode)
% This can be negative.
% The JIIST doesn't want any added spacing here, but I will leave these
% controls in place in case they ever change their mind.
% Personally, I like 0.75ex.
%\def\@JIISTauthorblockNtopspace{0.75ex}
%\def\@JIISTauthorblockAtopspace{0.75ex}
\def\@JIISTauthorblockNtopspace{0.0ex}
\def\@JIISTauthorblockAtopspace{0.5ex}
\def\@JIISTauthorblockAtopspace{1\@JIISTnormalsizeunitybaselineskip}

% baseline spacing within name and affiliation blocks (confmode)
% must be positive, spacings below certain values will make 
% the position of line of text sensitive to the contents of the
% line above it i.e., whether or not the prior line has descenders, 
% subscripts, etc. For this reason it is a good idea to keep
% these above 2.6ex
\def\@JIISTauthorblockNinterlinespace{2.6ex}
\def\@JIISTauthorblockAinterlinespace{2.75ex}

% This tracks the required strut size.
% See the \@JIISTauthorhalign command for the actual default value used.
\def\@JIISTauthorblockXinterlinespace{2.7ex}

% variables to retain font size and style across groups
% values given here have no effect as they will be overwritten later
\gdef\@JIISTSAVESTATEfontsize{10}
\gdef\@JIISTSAVESTATEfontbaselineskip{12}
\gdef\@JIISTSAVESTATEfontencoding{OT1}
\gdef\@JIISTSAVESTATEfontfamily{ptm}
\gdef\@JIISTSAVESTATEfontseries{m}
\gdef\@JIISTSAVESTATEfontshape{n}

% saves the current font attributes
\def\@JIISTcurfontSAVE{\global\let\@JIISTSAVESTATEfontsize\f@size%
\global\let\@JIISTSAVESTATEfontbaselineskip\f@baselineskip%
\global\let\@JIISTSAVESTATEfontencoding\f@encoding%
\global\let\@JIISTSAVESTATEfontfamily\f@family%
\global\let\@JIISTSAVESTATEfontseries\f@series%
\global\let\@JIISTSAVESTATEfontshape\f@shape}

% restores the saved font attributes
\def\@JIISTcurfontRESTORE{\fontsize{\@JIISTSAVESTATEfontsize}{\@JIISTSAVESTATEfontbaselineskip}%
\fontencoding{\@JIISTSAVESTATEfontencoding}%
\fontfamily{\@JIISTSAVESTATEfontfamily}%
\fontseries{\@JIISTSAVESTATEfontseries}%
\fontshape{\@JIISTSAVESTATEfontshape}%
\selectfont}


% variable to indicate if the current block is the first block in the column
\newif\if@JIISTprevauthorblockincol   \@JIISTprevauthorblockincolfalse


% the command places a strut with height and depth = \@JIISTauthorblockXinterlinespace
% we use this technique to have complete manual control over the spacing of the lines
% within the halign environment.
% We set the below baseline portion at 30%, the above
% baseline portion at 70% of the total length.
% Responds to changes in the document's \baselinestretch
\def\@JIISTauthorstrutrule{\@JIISTjrnltmpdimenA\@JIISTauthorblockXinterlinespace%
\@JIISTjrnltmpdimenA=\baselinestretch\@JIISTjrnltmpdimenA%
\rule[-0.3\@JIISTjrnltmpdimenA]{0pt}{\@JIISTjrnltmpdimenA}}


% blocks to hold the authors' names and affilations. 
% Makes formatting easy for conferences
%
% use real definitions in conference mode
% name block
\def\JIISTauthorblockN#1{\relax\@JIISTauthorblockNstyle% set the default text style
\gdef\@JIISTauthorblockXinterlinespace{0pt}% disable strut for spacer row
% the \expandafter hides the \cr in conditional tex, see the array.sty docs
% for details, probably not needed here as the \cr is in a macro
% do a spacer row if needed
\if@JIISTprevauthorblockincol\expandafter\@JIISTauthorblockNtopspaceline\fi
\global\@JIISTprevauthorblockincoltrue% we now have a block in this column
%restore the correct strut value
\gdef\@JIISTauthorblockXinterlinespace{\@JIISTauthorblockNinterlinespace}%
% input the author names
#1%
% end the row if the user did not already
\crcr}
% spacer row for names
\def\@JIISTauthorblockNtopspaceline{\cr\noalign{\vskip\@JIISTauthorblockNtopspace}}
%
% affiliation block
\def\JIISTauthorblockA#1{\relax\@JIISTauthorblockAstyle% set the default text style
\gdef\@JIISTauthorblockXinterlinespace{0pt}%disable strut for spacer row
% the \expandafter hides the \cr in conditional tex, see the array.sty docs
% for details, probably not needed here as the \cr is in a macro
% do a spacer row if needed
\if@JIISTprevauthorblockincol\expandafter\@JIISTauthorblockAtopspaceline\fi
\global\@JIISTprevauthorblockincoltrue% we now have a block in this column
%restore the correct strut value
\gdef\@JIISTauthorblockXinterlinespace{\@JIISTauthorblockAinterlinespace}%
% input the author affiliations
#1%
% end the row if the user did not already
\crcr
% V1.8 transmag does not use any additional affiliation spacing after the first author
\ifCLASSOPTIONtransmag\gdef\@JIISTauthorblockAtopspace{0pt}\fi}

% spacer row for affiliations
\def\@JIISTauthorblockAtopspaceline{\cr\noalign{\vskip\@JIISTauthorblockAtopspace}}


% allow papers to compile even if author blocks are used in modes other
% than conference or peerreviewca. For such cases, we provide dummy blocks.
\ifCLASSOPTIONconference
\else
   \ifCLASSOPTIONpeerreviewca\else
      % not conference, peerreviewca or transmag mode
      \ifCLASSOPTIONtransmag\else
         \def\JIISTauthorblockN#1{#1}%
         \def\JIISTauthorblockA#1{#1}%
      \fi
   \fi
\fi



% we provide our own halign so as not to have to depend on tabular
\def\@JIISTauthorhalign{\@JIISTauthordefaulttextstyle% default text style
   \lineskip=0pt\relax% disable line spacing
   \lineskiplimit=0pt\relax%
   \baselineskip=0pt\relax%
   \@JIISTcurfontSAVE% save the current font
   \mathsurround\z@\relax% no extra spacing around math
   \let\\\@JIISTauthorhaligncr% replace newline with halign friendly one
   \tabskip=0pt\relax% no column spacing
   \everycr{}% ensure no problems here
   \@JIISTprevauthorblockincolfalse% no author blocks yet
   \def\@JIISTauthorblockXinterlinespace{2.7ex}% default interline space
   \vtop\bgroup%vtop box
   \halign\bgroup&\relax\hfil\@JIISTcurfontRESTORE\relax ##\relax
   \hfil\@JIISTcurfontSAVE\@JIISTauthorstrutrule\cr}

% ensure last line, exit from halign, close vbox
\def\end@JIISTauthorhalign{\crcr\egroup\egroup}

% handle bogus star form
\def\@JIISTauthorhaligncr{{\ifnum0=`}\fi\@ifstar{\@@JIISTauthorhaligncr}{\@@JIISTauthorhaligncr}}

% test and setup the optional argument to \\[]
\def\@@JIISTauthorhaligncr{\@testopt\@@@JIISTauthorhaligncr\z@skip}

% end the line and do the optional spacer
\def\@@@JIISTauthorhaligncr[#1]{\ifnum0=`{\fi}\cr\noalign{\vskip#1\relax}}



% flag to prevent multiple \and warning messages
\newif\if@JIISTWARNand
\@JIISTWARNandtrue

% if in conference or peerreviewca modes, we support the use of \and as \author is a
% tabular environment, otherwise we warn the user that \and is invalid
% outside of conference or peerreviewca modes.
\def\and{\relax} % provide a bogus \and that we will then override

\renewcommand{\and}[1][\relax]{\if@JIISTWARNand\typeout{** WARNING: \noexpand\and is valid only
                               when in conference or peerreviewca}\typeout{modes (line \the\inputlineno).}\fi\global\@JIISTWARNandfalse}

\ifCLASSOPTIONconference%
\renewcommand{\and}[1][\hfill]{\end{@JIISTauthorhalign}#1\begin{@JIISTauthorhalign}}%
\fi
\ifCLASSOPTIONpeerreviewca
\renewcommand{\and}[1][\hfill]{\end{@JIISTauthorhalign}#1\begin{@JIISTauthorhalign}}%
\fi
% V1.8 transmag uses conference author format
\ifCLASSOPTIONtransmag
\renewcommand{\and}[1][\hfill]{\end{@JIISTauthorhalign}#1\begin{@JIISTauthorhalign}}%
\fi

% page clearing command
% based on LaTeX2e's \cleardoublepage, but allows different page styles
% for the inserted blank pages
\def\@JIISTcleardoublepage#1{\clearpage\if@twoside\ifodd\c@page\else
\hbox{}\thispagestyle{#1}\newpage\if@twocolumn\hbox{}\thispagestyle{#1}\newpage\fi\fi\fi}

% V1.8b hooks to allow adjustment of space above title
\def\JIISTtitletopspace{0.5\baselineskip}
% an added extra amount to allow for adjustment/offset
\def\JIISTtitletopspaceextra{0pt}

% user command to invoke the title page
\def\maketitle{\par%
  \begingroup%
  \normalfont%
  \def\thefootnote{}%  the \thanks{} mark type is empty
  \def\footnotemark{}% and kill space from \thanks within author
  \let\@makefnmark\relax% V1.7, must *really* kill footnotemark to remove all \textsuperscript spacing as well.
  \footnotesize%       equal spacing between thanks lines
  \footnotesep 0.7\baselineskip%see global setting of \footnotesep for more info
  % V1.7 disable \thanks note indention for compsoc
  \@JIISTcompsoconly{\long\def\@makefntext##1{\parindent 1em\noindent\hbox{\@makefnmark}##1}}%
  \normalsize%
  \ifCLASSOPTIONpeerreview
     \newpage\global\@topnum\z@ \@maketitle\@JIISTstatictitlevskip\@JIISTaftertitletext%
     \thispagestyle{JIISTpeerreviewcoverpagestyle}\@thanks%
  \else
     \if@twocolumn%
        \ifCLASSOPTIONtechnote%
           \newpage\global\@topnum\z@ \@maketitle\@JIISTstatictitlevskip\@JIISTaftertitletext%
        \else
           \twocolumn[{\JIISTquantizevspace{\@maketitle}[\JIISTquantizedisabletitlecmds]{0pt}[-\topskip]{\baselineskip}{\@JIISTNORMtitlevspace}{\@JIISTMINtitlevspace}\@JIISTaftertitletext}]%
        \fi
     \else
        \newpage\global\@topnum\z@ \@maketitle\@JIISTstatictitlevskip\@JIISTaftertitletext%
     \fi
     \thispagestyle{JIISTtitlepagestyle}\@thanks%
  \fi
  % pullup page for pubid if used.
  \if@JIISTusingpubid
     \enlargethispage{-\@JIISTpubidpullup}%
  \fi 
  \endgroup
  \setcounter{footnote}{0}\let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}%
  % v1.6b do not clear these as we will need the title again for peer review papers
  % \gdef\@author{}\gdef\@title{}%
  \let\thanks\relax}


% V1.8 parbox to format \@JIISTtitleabstractindextext
\long\def\@JIISTtitleabstractindextextbox#1{\parbox{1\textwidth}{#1}}
% V1.8 compsoc is partial width
\ifCLASSOPTIONjournal
% comparison with proofs suggests it's in the range of 92.1-92.3%
\long\def\@JIISTtitleabstractindextextbox#1{\parbox{0.922\textwidth}{\@JIISTcompsocnotconfonly{\rightskip\@flushglue\leftskip\z@skip}#1}}
\fi

% formats the Title, authors names, affiliations and special paper notice
% THIS IS A CONTROLLED SPACING COMMAND! Do not allow blank lines or unintentional
% spaces to enter the definition - use % at the end of each line
\def\@maketitle{\newpage
\bgroup\par\vskip\JIISTtitletopspace\vskip\JIISTtitletopspaceextra\centering%
\ifCLASSOPTIONtechnote% technotes, V1.8a abstract and index terms are not treated differently for compsoc technotes
   {\bfseries\large\@JIISTcompsoconly{\Large\sffamily}\@title\par}\vskip 1.3em{\lineskip .5em\@JIISTcompsoconly{\large\sffamily}\@author
   \@JIISTspecialpapernotice\par}\relax
\else% not a technote
   \vskip0.2em{\Huge\ifCLASSOPTIONtransmag\bfseries\LARGE\fi\@JIISTcompsoconly{\sffamily}\@JIISTcompsocconfonly{\normalfont\normalsize\vskip 2\@JIISTnormalsizeunitybaselineskip
   \bfseries\Large}\@JIISTcompsocnotconfonly{\vskip 0.75\@JIISTnormalsizeunitybaselineskip}\@title\par}\relax
   \@JIISTcompsocnotconfonly{\vskip 0.5\@JIISTnormalsizeunitybaselineskip}\vskip1.0em\par%
   % V1.6 handle \author differently if in conference mode
   \ifCLASSOPTIONconference%
      {\@JIISTspecialpapernotice\mbox{}\vskip\@JIISTauthorblockconfadjspace%
       \mbox{}\hfill\begin{@JIISTauthorhalign}\@author\end{@JIISTauthorhalign}\hfill\mbox{}\par}\relax
   \else% peerreviewca, peerreview or journal
      \ifCLASSOPTIONpeerreviewca
         % peerreviewca handles author names just like conference mode
         {\@JIISTcompsoconly{\sffamily}\@JIISTspecialpapernotice\mbox{}\vskip\@JIISTauthorblockconfadjspace%
          \mbox{}\hfill\begin{@JIISTauthorhalign}\@author\end{@JIISTauthorhalign}\hfill\mbox{}\par
          {\@JIISTcompsoconly{\vskip 1.5em\relax
           \@JIISTtitleabstractindextextbox{\@JIISTtitleabstractindextext}\par\noindent\hfill
           \JIISTcompsocdiamondline\hfill\hbox{}\par}}}\relax
      \else% journal, peerreview or transmag
         \ifCLASSOPTIONtransmag
            % transmag also handles author names just like conference mode
            % it also uses \@JIISTtitleabstractindextex, but with one line less
            % space above, and one more below
           {\@JIISTspecialpapernotice\mbox{}\vskip\@JIISTauthorblockconfadjspace%
            \mbox{}\hfill\begin{@JIISTauthorhalign}\@author\end{@JIISTauthorhalign}\hfill\mbox{}\par
           {\vspace{1\baselineskip}\relax\@JIISTtitleabstractindextextbox{\@JIISTtitleabstractindextext}\vspace{-1\baselineskip}\par}}\relax
         \else% journal or peerreview
           {\lineskip.5em\@JIISTcompsoconly{\sffamily}\sublargesize\@author\@JIISTspecialpapernotice\par
           {\@JIISTcompsoconly{\vskip 1.5em\relax
            \@JIISTtitleabstractindextextbox{\@JIISTtitleabstractindextext}\par\noindent\hfill
            \JIISTcompsocdiamondline\hfill\hbox{}\par}}}\relax
         \fi
      \fi
   \fi
\fi\par\addvspace{0.5\baselineskip}\egroup}


% V1.7 Computer Society "diamond line" which follows index terms for nonconference papers
% V1.8a full width diamond line for single column use
\def\@JIISTcompsocdiamondlinei{\vrule depth 0pt height 0.5pt width 4cm\nobreak\hspace{7.5pt}\nobreak
\raisebox{-3.5pt}{\fontfamily{pzd}\fontencoding{U}\fontseries{m}\fontshape{n}\fontsize{11}{12}\selectfont\char70}\nobreak
\hspace{7.5pt}\nobreak\vrule depth 0pt height 0.5pt width 4cm\relax}
% V1.8a narrower width diamond line for double column use
\def\@JIISTcompsocdiamondlineii{\vrule depth 0pt height 0.5pt width 2.5cm\nobreak\hspace{7.5pt}\nobreak
\raisebox{-3.5pt}{\fontfamily{pzd}\fontencoding{U}\fontseries{m}\fontshape{n}\fontsize{11}{12}\selectfont\char70}\nobreak
\hspace{7.5pt}\nobreak\vrule depth 0pt height 0.5pt width 2.5cm\relax}
% V1.8a bare core without rules to base a last resort on for very narrow linewidths
\def\@JIISTcompsocdiamondlineiii{\mbox{}\nobreak\hspace{7.5pt}\nobreak
\raisebox{-3.5pt}{\fontfamily{pzd}\fontencoding{U}\fontseries{m}\fontshape{n}\fontsize{11}{12}\selectfont\char70}\nobreak
\hspace{7.5pt}\nobreak\mbox{}\relax}

% V1.8a allow \JIISTcompsocdiamondline to adjust for different linewidths.
% Use \@JIISTcompsocdiamondlinei if its width is less than 0.66\linewidth (0.487 nominal for single column)
% if not, fall back to \@JIISTcompsocdiamondlineii if its width is less than 0.75\linewidth (0.659 nominal for double column)
% if all else fails, try to make a custom diamondline based on the abnormally narrow linewidth
\def\JIISTcompsocdiamondline{\settowidth{\@JIISTjrnltmpdimenA}{\@JIISTcompsocdiamondlinei}\relax
\ifdim\@JIISTjrnltmpdimenA<0.66\linewidth\relax\@JIISTcompsocdiamondlinei\relax
\else
\settowidth{\@JIISTjrnltmpdimenA}{\@JIISTcompsocdiamondlineii}\relax
\ifdim\@JIISTjrnltmpdimenA<0.75\linewidth\relax\@JIISTcompsocdiamondlineii\relax
\else
\settowidth{\@JIISTjrnltmpdimenA}{\@JIISTcompsocdiamondlineiii}\relax
\@JIISTjrnltmpdimenB=\linewidth\relax
\addtolength{\@JIISTjrnltmpdimenB}{-1\@JIISTjrnltmpdimenA}\relax
\vrule depth 0pt height 0.5pt width 0.33\@JIISTjrnltmpdimenB\@JIISTcompsocdiamondlineiii\vrule depth 0pt height 0.5pt width 0.33\@JIISTjrnltmpdimenB\relax
\fi\fi}


% V1.7 standard LateX2e \thanks, but with \itshape under compsoc. Also make it a \long\def
% We also need to trigger the one-shot footnote rule
\def\@JIISTtriggeroneshotfootnoterule{\global\@JIISTenableoneshotfootnoteruletrue}


\long\def\thanks#1{\footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{\@JIISTcompsoconly{\itshape
        \protect\@JIISTtriggeroneshotfootnoterule\relax}\ignorespaces#1}}}
\let\@thanks\@empty


% V1.7 allow \author to contain \par's. This is needed to allow \thanks to contain \par.
\long\def\author#1{\gdef\@author{#1}}


% in addition to setting up JIISTitemize, we need to remove a baselineskip space above and
% below it because \list's \pars introduce blank lines because of the footnote struts.
\def\@JIISTsetupcompsocitemizelist{\def\labelitemi{$\bullet$}%
\setlength{\JIISTlabelindent}{0pt}\setlength{\labelsep}{1.2em}\setlength{\parskip}{0pt}%
\setlength{\partopsep}{0pt}\setlength{\topsep}{0.5\baselineskip}\vspace{-1\baselineskip}\relax}


% flag for fake non-compsoc \JIISTcompsocthanksitem - prevents line break on very first item
\newif\if@JIISTbreakcompsocthanksitem \@JIISTbreakcompsocthanksitemfalse

\ifCLASSOPTIONcompsoc
% V1.7 compsoc bullet item \thanks
% also, we need to redefine this to destroy the argument in \JIISTquantizevspace
\long\def\JIISTcompsocitemizethanks#1{\relax\@JIISTbreakcompsocthanksitemfalse\footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{\itshape\protect\@JIISTtriggeroneshotfootnoterule
        {\let\JIISTiedlistdecl\relax\protect\begin{JIISTitemize}[\protect\@JIISTsetupcompsocitemizelist]\ignorespaces#1\relax
        \protect\end{JIISTitemize}}\protect\vspace{-1\baselineskip}}}}
\DeclareRobustCommand*{\JIISTcompsocthanksitem}{\item}
\else
% non-compsoc, allow for dual compilation via rerouting to normal \thanks
\long\def\JIISTcompsocitemizethanks#1{\thanks{#1}}
% redirect to "pseudo-par" \hfil\break\indent after swallowing [] from \JIISTcompsocthanksitem[]
\DeclareRobustCommand{\JIISTcompsocthanksitem}{\@ifnextchar [{\@JIISTthanksswallowoptionalarg}%
{\@JIISTthanksswallowoptionalarg[\relax]}}
% be sure and break only after first item, be sure and ignore spaces after optional argument
\def\@JIISTthanksswallowoptionalarg[#1]{\relax\if@JIISTbreakcompsocthanksitem\hfil\break
\indent\fi\@JIISTbreakcompsocthanksitemtrue\ignorespaces}
\fi


% V1.6b define the \JIISTpeerreviewmaketitle as needed
\ifCLASSOPTIONpeerreview
\def\JIISTpeerreviewmaketitle{\@JIISTcleardoublepage{empty}%
\ifCLASSOPTIONtwocolumn
\twocolumn[{\JIISTquantizevspace{\@JIISTpeerreviewmaketitle}[\JIISTquantizedisabletitlecmds]{0pt}[-\topskip]{\baselineskip}{\@JIISTNORMtitlevspace}{\@JIISTMINtitlevspace}}]
\else
\newpage\@JIISTpeerreviewmaketitle\@JIISTstatictitlevskip
\fi
\thispagestyle{JIISTtitlepagestyle}}
\else
% \JIISTpeerreviewmaketitle does nothing if peer review option has not been selected
\def\JIISTpeerreviewmaketitle{\relax}
\fi

% peerreview formats the repeated title like the title in journal papers.
\def\@JIISTpeerreviewmaketitle{\bgroup\par\addvspace{0.5\baselineskip}\centering\@JIISTcompsoconly{\sffamily}%
\normalfont\normalsize\vskip0.2em{\Huge\@title\par}\vskip1.0em\par
\par\addvspace{0.5\baselineskip}\egroup}



% V1.6 
% this is a static rubber spacer between the title/authors and the main text
% used for single column text, or when the title appears in the first column
% of two column text (technotes). 
\def\@JIISTstatictitlevskip{{\normalfont\normalsize
% adjust spacing to next text
% v1.6b handle peer review papers
\ifCLASSOPTIONpeerreview
% for peer review papers, the same value is used for both title pages
% regardless of the other paper modes
   \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip
\else
   \ifCLASSOPTIONconference% conference
      \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip%
   \else%
      \ifCLASSOPTIONtechnote% technote
         \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip%
      \else% journal uses more space
         \vskip 2.5\baselineskip plus 0.75\baselineskip minus 0.375\baselineskip%
      \fi
   \fi
\fi}}


% set the nominal and minimum values for the quantized title spacer
% the quantization algorithm will not allow the spacer size to
% become less than \@JIISTMINtitlevspace - instead it will be lengthened
% default to journal values
\def\@JIISTNORMtitlevspace{2.5\baselineskip}
\def\@JIISTMINtitlevspace{2\baselineskip}
% conferences and technotes need tighter spacing
\ifCLASSOPTIONconference% conference
  \def\@JIISTNORMtitlevspace{1\baselineskip}
  \def\@JIISTMINtitlevspace{0.75\baselineskip}
\fi
\ifCLASSOPTIONtechnote% technote
  \def\@JIISTNORMtitlevspace{1\baselineskip}
  \def\@JIISTMINtitlevspace{0.75\baselineskip}
\fi


% V1.8a
\def\JIISTquantizevspace{\begingroup\@ifstar{\@JIISTquantizevspacestarformtrue\@JIISTquantizevspace}{\@JIISTquantizevspacestarformfalse\@JIISTquantizevspace}}
% \JIISTquantizevspace[output dimen register]{object}[object decl]
%                    {top baselineskip}
%                    [offset][prevdepth][lineskip limit][lineskip]
%                    {unit height}{nominal vspace}{minimum vspace}
%
% Calculates and creates the vspace needed to make the combined height with
% the given object an integer multiple of the given unit height. This command
% is more general than the older \@JIISTdynamictitlevspace it replaces.
%
% The star form has no effect at present, but is reserved for future use.
%
% If the optional argument [output dimen register] is given, the calculated
% vspace height is stored in the given output dimen (or skip) register
% and no other action is taken, otherwise the object followed by a vspace*
% of the appropriate height is evaluated/output.
%
% The optional object decl (declarations) is code that is evaluated just
% before the object's height is evaluated. Its intented purpose is to allow
% for the alteration or disabling of code within the object during internal
% height evaluation (e.g., \long\def\thanks#1{\relax} ).
% This special code is not invoked if/when the object is rendered at the end.
%
% The nominal vspace is the target value of the added vspace and the minimum
% vspace is the lower allowed limit. The vspacer will be the value that achieves
% integral overall height, in terms of the given unit height, that is closest
% to the nominal vspace and that is not less than the specified minimum vspace.
%
% The line spacing algorithm of TeX is somewhat involved and requires special
% care with regard to the first line of a vertical list (which is indicated
% when \prevdepth is -1000pt or less). top baselineskip specifies the
% baselineskip or topskip used prior to the object. If the height of the
% first line of the object is greater than the given top baselineskip, then
% the top baselineskip is subtracted from the height of the first line and
% that difference is considered along with the rest of the object height
% (because the object will be shifted down by an amount = 
% top line height - top baselineskip). Otherwise, the height of the first line
% of the object is ignored as far as the calculations are concerned.
% This algorithm is adequate for objects that appear at the top of a page
% (e.g., titles) where \topskip spacing is used.
%
% However, as explained on page 78 of the TeXbook, interline spacing is more
% complex when \baselineskip is being used (indicated by \prevdepth > 
% -1000pt). The four optional parameters offset, prevdepth, lineskip limit and
% lineskip are assumed to be equal to be 0pt, \prevdepth, \lineskiplimit and
% \lineskip, respectively, if they are omitted.
%
% The prevdepth is the depth of the line before the object, the lineskip limit
% specifies how close the top of the object can come to the bottom of the
% previous line before \baselineskip is ignored and \lineskip is inserted
% between the object and the line above it. Lineskip does not come into
% play unless the first line of the object is high enough to "get too close"
% (as specified by lineskiplimit) to the line before it. The the prevdepth,
% lineskip limit, and lineskip optional parameters are not needed for the
% first object/line on a page (i.e., prevdepth <= -1000pt) where the simplier
% \topskip spacing rules are in effect.
%
% Offset is a manual adjustment that is added to the height calculations of
% object irrespective of the value of \prevdepth. It is useful when the top
% baselineskip will result in a noninteger unit height object placement even
% if the object itself has integral height. e.g., a footnotesize baselineskip
% is used before the object, thus an offset of, say -3pt, can be given as a
% correction.

% Common combinations of these parameters include:
%
% top baselineskip:   (and default values for offset, prevdepth, etc.)
% \topskip            % for objects that appear at the top of a page
% \maxdimen           % always ignore the height of the top line
% 0pt                 % always consider any positive height of the top line
%
% for objects to appear inline in normal text:
% top baselineskip = \baselineskip
%
% set prevdepth = -1000pt and top baselineskip = 0pt to consider the
% overall height of the object without any other external skip
% consideration

\newif\if@JIISTquantizevspacestarform       % flag to indicate star form
\newif\if@JIISTquantizevspaceuseoutdimenreg % flag to indicate output dimen register is to be used
% Use our own private registers because the object could contain a
% structure that uses the existing tmp scratch pad registers
\newdimen\@JIISTquantizeheightA
\newdimen\@JIISTquantizeheightB
\newdimen\@JIISTquantizeheightC
\newdimen\@JIISTquantizeprevdepth % need to save this early as can change
\newcount\@JIISTquantizemultiple
\newbox\@JIISTquantizeboxA


\def\@JIISTquantizevspace{\@ifnextchar [{\@JIISTquantizevspaceuseoutdimenregtrue\@@JIISTquantizevspace}{\@JIISTquantizevspaceuseoutdimenregfalse\@@JIISTquantizevspace[]}}


\long\def\@@JIISTquantizevspace[#1]#2{\relax
% acquire and store
% #1 optional output dimen register
% #2 object
\edef\@JIISTquantizeoutdimenreg{#1}\relax
% allow for object specifications that contain parameters
\@JIISTjrnltmptoksA={#2}\relax
\long\edef\@JIISTquantizeobject{\the\@JIISTjrnltmptoksA}\relax
\@ifnextchar [{\@@@JIISTquantizevspace}{\@@@JIISTquantizevspace[\relax]}}

\long\def\@@@JIISTquantizevspace[#1]#2{\relax
% acquire and store
% [#1] optional object decl, is \relax if not given by user
% #2 top baselineskip
% allow for object decl specifications that have parameters
\@JIISTjrnltmptoksA={#1}\relax
\long\edef\@JIISTquantizeobjectdecl{\the\@JIISTjrnltmptoksA}\relax
\edef\@JIISTquantizetopbaselineskip{#2}\ivJIISTquantizevspace}

% acquire optional argument set and store
% [offset][prevdepth][lineskip limit][lineskip]
\def\ivJIISTquantizevspace{\@ifnextchar [{\@vJIISTquantizevspace}{\@vJIISTquantizevspace[0pt]}}
\def\@vJIISTquantizevspace[#1]{\edef\@JIISTquantizeoffset{#1}\@ifnextchar [{\@viJIISTquantizevspace}{\@viJIISTquantizevspace[\prevdepth]}}
\def\@viJIISTquantizevspace[#1]{\@JIISTquantizeprevdepth=#1\relax\@ifnextchar [{\@viiJIISTquantizevspace}{\@viiJIISTquantizevspace[\lineskiplimit]}}
\def\@viiJIISTquantizevspace[#1]{\edef\@JIISTquantizelineskiplimit{#1}\@ifnextchar [{\@viiiJIISTquantizevspace}{\@viiiJIISTquantizevspace[\lineskip]}}
\def\@viiiJIISTquantizevspace[#1]{\edef\@JIISTquantizelineskip{#1}\@ixJIISTquantizevspace}

% main routine
\def\@ixJIISTquantizevspace#1#2#3{\relax
\edef\@JIISTquantizeunitheight{#1}\relax
\edef\@JIISTquantizenomvspace{#2}\relax
\edef\@JIISTquantizeminvspace{#3}\relax
% \@JIISTquantizeoutdimenreg
% \@JIISTquantizeobject
% \@JIISTquantizeobjectdecl
% \@JIISTquantizetopbaselineskip
% \@JIISTquantizeoffset
% \@JIISTquantizeprevdepth
% \@JIISTquantizelineskiplimit
% \@JIISTquantizelineskip
% \@JIISTquantizeunitheight
% \@JIISTquantizenomvspace
% \@JIISTquantizeminvspace
% get overall height of object
\setbox\@JIISTquantizeboxA\vbox{\begingroup\@JIISTquantizeobjectdecl\@JIISTquantizeobject\relax\endgroup}\relax
\@JIISTquantizeheightA\ht\@JIISTquantizeboxA\relax
% get height of first line of object
\setbox\@JIISTquantizeboxA\vtop{\begingroup\@JIISTquantizeobjectdecl\@JIISTquantizeobject\relax\endgroup}\relax
\@JIISTquantizeheightB\ht\@JIISTquantizeboxA\relax
\ifdim\@JIISTquantizeprevdepth>-1000pt\relax % prevdepth > -1000pf means full baselineskip\lineskip rules in effect
% lineskip spacing rule takes effect if height of top line > baselineskip - prevdepth - lineskiplimit, 
% otherwise the baselineskip rule is in effect and the height of the first line does not matter at all.
\@JIISTquantizeheightC=\@JIISTquantizetopbaselineskip\relax
\advance\@JIISTquantizeheightC-\@JIISTquantizeprevdepth\relax
\advance\@JIISTquantizeheightC-\@JIISTquantizelineskiplimit\relax % this works even though \@JIISTquantizelineskiplimit is a macro because TeX allows --10pt notation
\ifdim\@JIISTquantizeheightB>\@JIISTquantizeheightC\relax
% lineskip spacing rule is in effect i.e., the object is going to be shifted down relative to the
% baselineskip set position by its top line height (already a part of the total height) + prevdepth + lineskip - baselineskip
\advance\@JIISTquantizeheightA\@JIISTquantizeprevdepth\relax
\advance\@JIISTquantizeheightA\@JIISTquantizelineskip\relax
\advance\@JIISTquantizeheightA-\@JIISTquantizetopbaselineskip\relax
\else
% height of first line <= \@JIISTquantizetopbaselineskip - \@JIISTquantizeprevdepth - \@JIISTquantizelineskiplimit
% standard baselineskip rules are in effect, so don't consider height of first line
\advance\@JIISTquantizeheightA-\@JIISTquantizeheightB\relax
\fi
%
\else % prevdepth <= -1000pt, simplier \topskip type rules in effect
\ifdim\@JIISTquantizeheightB>\@JIISTquantizetopbaselineskip
% height of top line (already included in the total height) in excess of
% baselineskip is the amount it will be downshifted
\advance\@JIISTquantizeheightA-\@JIISTquantizetopbaselineskip\relax
\else
% height of first line is irrelevant, remove it
\advance\@JIISTquantizeheightA-\@JIISTquantizeheightB\relax
\fi
\fi % prevdepth <= -1000pt
%
% adjust height for any manual offset
\advance\@JIISTquantizeheightA\@JIISTquantizeoffset\relax
% add in nominal spacer
\advance\@JIISTquantizeheightA\@JIISTquantizenomvspace\relax
% check for nonzero unitheight
\@JIISTquantizeheightB=\@JIISTquantizeunitheight\relax
\ifnum\@JIISTquantizeheightB=0\relax
\@JIISTclspkgerror{JIISTquantizevspace unit height cannot be zero. Assuming 10pt.}%
{Division by zero is not allowed.}
\@JIISTquantizeheightB=10pt\relax
\fi
% get integer number of lines
\@JIISTquantizemultiple=\@JIISTquantizeheightA\relax
\divide\@JIISTquantizemultiple\@JIISTquantizeheightB\relax
% set A to contain the excess height over the \@JIISTquantizemultiple of lines
% A = height - multiple*unitheight
\@JIISTquantizeheightC\@JIISTquantizeheightB\relax
\multiply\@JIISTquantizeheightC\@JIISTquantizemultiple\relax
\advance\@JIISTquantizeheightA-\@JIISTquantizeheightC\relax
% set B to contain the height short of \@JIISTquantizemultiple+1 of lines
% B = unitheight - A
\advance\@JIISTquantizeheightB-\@JIISTquantizeheightA\relax
% choose A or B based on which is closer
\@JIISTquantizeheightC\@JIISTquantizenomvspace\relax
\ifdim\@JIISTquantizeheightA<\@JIISTquantizeheightB\relax
% C = nomvspace - A, go with lower
\advance\@JIISTquantizeheightC-\@JIISTquantizeheightA\relax
\else
% C = nomvspace + B, go with upper
\advance\@JIISTquantizeheightC\@JIISTquantizeheightB\relax
\fi
% if violate lower bound, use next integer bound
\ifdim\@JIISTquantizeheightC<\@JIISTquantizeminvspace\relax
% A + B = unitheight
\advance\@JIISTquantizeheightC\@JIISTquantizeheightA\relax
\advance\@JIISTquantizeheightC\@JIISTquantizeheightB\relax
\fi
% export object and spacer outside of group
\global\let\@JIISTquantizeobjectout\@JIISTquantizeobject\relax
\global\@JIISTquantizeheightC\@JIISTquantizeheightC\relax
\endgroup
\if@JIISTquantizevspaceuseoutdimenreg
\@JIISTquantizeoutdimenreg=\@JIISTquantizeheightC\relax
\else
\@JIISTquantizeobjectout\relax
\vskip\@JIISTquantizeheightC\relax
\fi}


% user command to disable all global assignments, possible use within object decl
\def\JIISTquantizedisableglobal{\let\global\relax
\let\gdef\def
\let\xdef\edef}
% user command to allow for the disabling of \thanks and other commands, possible use within object decl
\def\JIISTquantizedisabletitlecmds{\long\def\thanks##1{\relax}\relax
\long\def\JIISTcompsocitemizethanks##1{\relax}\def\newpage{\relax}}





% V1.6
% we allow the user access to the last part of the title area
% useful in emergencies such as when a different spacing is needed
% This text is NOT compensated for in the dynamic sizer.
\let\@JIISTaftertitletext=\relax
\long\def\JIISTaftertitletext#1{\def\@JIISTaftertitletext{#1}}


% V1.7 provide a way for users to enter abstract and keywords
% into the onecolumn title are. This text is compensated for
% in the dynamic sizer.
\let\@JIISTtitleabstractindextext=\relax
\long\def\JIISTtitleabstractindextext#1{\def\@JIISTtitleabstractindextext{#1}}

% V1.7 provide a way for users to get the \@JIISTtitleabstractindextext if
% not in compsoc or transmag journal mode - this way abstract and keywords
% can still be placed in their conventional position if not in those modes.
\def\JIISTdisplaynontitleabstractindextext{%
% display for all conference formats
\ifCLASSOPTIONconference\@JIISTtitleabstractindextext\relax
\else% non-conferences
  % V1.8a display for all technotes
  \ifCLASSOPTIONtechnote\@JIISTtitleabstractindextext\relax
  % V1.8a add diamond line after abstract and index terms for compsoc technotes
  \@JIISTcompsoconly{\noindent\hfill\JIISTcompsocdiamondline\hfill\hbox{}\par}\relax
  \else % non-conferences and non-technotes
    \ifCLASSOPTIONcompsoc% display if not compsoc and not transmag
    \else
      \ifCLASSOPTIONtransmag
      \else% not compsoc journal nor transmag journal
         \@JIISTtitleabstractindextext\relax
      \fi
    \fi
  \fi
\fi}


% command to allow alteration of baselinestretch, but only if the current
% baselineskip is unity. Used to tweak the compsoc abstract and keywords line spacing.
\def\@JIISTtweakunitybaselinestretch#1{{\def\baselinestretch{1}\selectfont
\global\@tempskipa\baselineskip}\ifnum\@tempskipa=\baselineskip%
\def\baselinestretch{#1}\selectfont\fi\relax}


% abstract and keywords are in \small, except 
% for 9pt docs in which they are in \footnotesize
% Because 9pt docs use an 8pt footnotesize, \small
% becomes a rather awkward 8.5pt
\def\@JIISTabskeysecsize{\small}
\ifx\CLASSOPTIONpt\@JIISTptsizenine
 \def\@JIISTabskeysecsize{\footnotesize}
\fi

% compsoc journals use \footnotesize, compsoc conferences use normalsize
\@JIISTcompsoconly{\def\@JIISTabskeysecsize{\footnotesize}}
\@JIISTcompsocconfonly{\def\@JIISTabskeysecsize{\small}}


% V1.6 have abstract and keywords strip leading spaces, pars and newlines
% so that spacing is more tightly controlled.
\def\abstract{\normalfont
    \if@twocolumn
      \@JIISTabskeysecsize\bfseries\textit{\abstractname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\vspace{-1.78ex}\@JIISTabskeysecsize\textbf{\abstractname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@JIISTabskeysecsize
    \fi\@JIISTgobbleleadPARNLSP}
% V1.6 The JIIST wants only 1 pica from end of abstract to introduction heading when in 
% conference mode (the heading already has this much above it)
\def\endabstract{\relax\ifCLASSOPTIONconference\vspace{0ex}\else\vspace{1.34ex}\fi\par\if@twocolumn\else\endquotation\fi
    \normalfont\normalsize}

\def\JIISTkeywords{\normalfont
    \if@twocolumn
      \@JIISTabskeysecsize\bfseries\textit{\JIISTkeywordsname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\@JIISTabskeysecsize\textbf{\JIISTkeywordsname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@JIISTabskeysecsize
    \fi\@JIISTgobbleleadPARNLSP}
\def\endJIISTkeywords{\relax\ifCLASSOPTIONtechnote\vspace{1.34ex}\else\vspace{0.67ex}\fi
    \par\if@twocolumn\else\endquotation\fi%
    \normalfont\normalsize}

% V1.7 compsoc keywords index terms
\ifCLASSOPTIONcompsoc
  \ifCLASSOPTIONconference% compsoc conference
\def\abstract{\normalfont\@JIISTtweakunitybaselinestretch{1.15}\bfseries
    \if@twocolumn
      \@JIISTabskeysecsize\noindent\textit{\abstractname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\vspace{-1.78ex}\@JIISTabskeysecsize\textbf{\abstractname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@JIISTabskeysecsize%
    \fi\@JIISTgobbleleadPARNLSP}
\def\JIISTkeywords{\normalfont\@JIISTtweakunitybaselinestretch{1.15}\bfseries
    \if@twocolumn
      \@JIISTabskeysecsize\vskip 0.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip\noindent
      \textit{\JIISTkeywordsname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\@JIISTabskeysecsize\textbf{\JIISTkeywordsname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@JIISTabskeysecsize%
    \fi\@JIISTgobbleleadPARNLSP}
  \else% compsoc not conference
\def\abstract{\normalfont\@JIISTtweakunitybaselinestretch{1.15}\sffamily
    \if@twocolumn
      \@JIISTabskeysecsize\noindent\textbf{\abstractname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\vspace{-1.78ex}\@JIISTabskeysecsize\textbf{\abstractname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@JIISTabskeysecsize%
    \fi\@JIISTgobbleleadPARNLSP}
\def\JIISTkeywords{\normalfont\@JIISTtweakunitybaselinestretch{1.15}\sffamily
    \if@twocolumn
      \@JIISTabskeysecsize\vskip 0.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip\noindent
      \textbf{\JIISTkeywordsname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\@JIISTabskeysecsize\textbf{\JIISTkeywordsname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@JIISTabskeysecsize%
    \fi\@JIISTgobbleleadPARNLSP}
  \fi
\fi

% V1.8 transmag keywords index terms
% no abstract name, use indentation
\ifCLASSOPTIONtransmag
\def\abstract{\normalfont\parindent 1em\relax
    \if@twocolumn
      \@JIISTabskeysecsize\bfseries\indent\textit{\abstractname}---
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\vspace{-1.78ex}\@JIISTabskeysecsize
      \textbf{\abstractname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@JIISTabskeysecsize
    \fi\@JIISTgobbleleadPARNLSP}

\def\JIISTkeywords{\normalfont\parindent 1em\relax
    \if@twocolumn
      \@JIISTabskeysecsize\vspace{1\baselineskip}\bfseries\indent\textit{\JIISTkeywordsname}---\relax
    \else
      \bgroup\par\vspace{1\baselineskip}\centering\@JIISTabskeysecsize
      \textbf{\JIISTkeywordsname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@JIISTabskeysecsize
    \fi\@JIISTgobbleleadPARNLSP}
\fi



% gobbles all leading \, \\ and \par, upon finding first token that
% is not a \ , \\ or a \par, it ceases and returns that token
% 
% used to strip leading \, \\ and \par from the input
% so that such things in the beginning of an environment will not
% affect the formatting of the text
\long\def\@JIISTgobbleleadPARNLSP#1{\let\@JIISTswallowthistoken=0%
\let\@JIISTgobbleleadPARNLSPtoken#1%
\let\@JIISTgobbleleadPARtoken=\par%
\let\@JIISTgobbleleadNLtoken=\\%
\let\@JIISTgobbleleadSPtoken=\ %
\def\@JIISTgobbleleadSPMACRO{\ }%
\ifx\@JIISTgobbleleadPARNLSPtoken\@JIISTgobbleleadPARtoken%
\let\@JIISTswallowthistoken=1%
\fi%
\ifx\@JIISTgobbleleadPARNLSPtoken\@JIISTgobbleleadNLtoken%
\let\@JIISTswallowthistoken=1%
\fi%
\ifx\@JIISTgobbleleadPARNLSPtoken\@JIISTgobbleleadSPtoken%
\let\@JIISTswallowthistoken=1%
\fi%
% a control space will come in as a macro
% when it is the last one on a line
\ifx\@JIISTgobbleleadPARNLSPtoken\@JIISTgobbleleadSPMACRO%
\let\@JIISTswallowthistoken=1%
\fi%
% if we have to swallow this token, do so and taste the next one
% else spit it out and stop gobbling
\ifx\@JIISTswallowthistoken 1\let\@JIISTnextgobbleleadPARNLSP=\@JIISTgobbleleadPARNLSP\else%
\let\@JIISTnextgobbleleadPARNLSP=#1\fi%
\@JIISTnextgobbleleadPARNLSP}%




% TITLING OF SECTIONS
\def\@JIISTsectpunct{:\ \,}  % Punctuation after run-in section heading  (headings which are
                            % part of the paragraphs), need little bit more than a single space
                            % spacing from section number to title
% compsoc conferences use regular period/space punctuation
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference
\def\@JIISTsectpunct{.\ }
\fi\fi


\def\@seccntformat#1{\csname the#1dis\endcsname\hskip 0.5em\relax}

\ifCLASSOPTIONcompsoc
% compsoc journals need extra spacing
\ifCLASSOPTIONconference\else
\def\@seccntformat#1{\csname the#1dis\endcsname\hskip 1em\relax}
\fi\fi

%v1.7 put {} after #6 to allow for some types of user font control
%and use \@@par rather than \par
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
     \let\@svsec\@empty
  \else
     \refstepcounter{#1}%
     % load section label and spacer into \@svsec
     \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi%
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@% tempskipa determines whether is treated as a high
     \begingroup #6{\relax% or low level heading
      \noindent % subsections are NOT indented
       % print top level headings. \@svsec is label, #8 is heading title
       % The JIIST does not block indent the section title text, it flows like normal
       {\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\@@par}}%
     \endgroup
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth\relax\else
               \protect\numberline{\csname the#1\endcsname}\fi#7}%
  \else % printout low level headings
     % svsechd seems to swallow the trailing space, protect it with \mbox{}
     % got rid of sectionmark stuff
     \def\@svsechd{#6{\hskip #3\relax\@svsec #8\@JIISTsectpunct\mbox{}}%
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth\relax\else
               \protect\numberline{\csname the#1\endcsname}\fi#7}}%
  \fi%skip down
  \@xsect{#5}}


% section* handler
%v1.7 put {} after #4 to allow for some types of user font control
%and use \@@par rather than \par
\def\@ssect#1#2#3#4#5{\@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
     %\begingroup #4\@hangfrom{\hskip #1}{\interlinepenalty \@M #5\par}\endgroup
     % The JIIST does not block indent the section title text, it flows like normal
     \begingroup \noindent #4{\relax{\hskip #1}{\interlinepenalty \@M #5\@@par}}\endgroup
  % svsechd swallows the trailing space, protect it with \mbox{}
  \else \def\@svsechd{#4{\hskip #1\relax #5\@JIISTsectpunct\mbox{}}}\fi
  \@xsect{#3}}


%% SECTION heading spacing and font
%%
% arguments are: #1 - sectiontype name
% (for \@sect)   #2 - section level
%                #3 - section heading indent
%                #4 - top separation (absolute value used, neg indicates not to indent main text)
%                     If negative, make stretch parts negative too!
%                #5 - (absolute value used) positive: bottom separation after heading,
%                      negative: amount to indent main text after heading
%                Both #4 and #5 negative means to indent main text and use negative top separation
%                #6 - font control
% You've got to have \normalfont\normalsize in the font specs below to prevent
% trouble when you do something like:
% \section{Note}{\ttfamily TT-TEXT} is known to ... 
% The JIIST sometimes REALLY stretches the area before a section
% heading by up to about 0.5in. However, it may not be a good
% idea to let LaTeX have quite this much rubber.
\ifCLASSOPTIONconference%
% The JIIST wants section heading spacing to decrease for conference mode
\def\section{\@startsection{section}{1}{\z@}{1.5ex plus 1.5ex minus 0.5ex}%
{0.7ex plus 1ex minus 0ex}{\normalfont\normalsize\centering\scshape}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{1.5ex plus 1.5ex minus 0.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\itshape}}%
\else % for journals
\def\section{\@startsection{section}{1}{\z@}{3.0ex plus 1.5ex minus 1.5ex}% V1.6 3.0ex from 3.5ex
{0.7ex plus 1ex minus 0ex}{\normalfont\normalsize\centering\scshape}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{3.5ex plus 1.5ex minus 1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\itshape}}%
\fi

% for both journals and conferences
% decided to put in a little rubber above the section, might help somebody
\def\subsubsection{\@startsection{subsubsection}{3}{\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize\itshape}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize\itshape}}%


% compsoc
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference
% compsoc conference
\def\section{\@startsection{section}{1}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\large\bfseries}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\sublargesize\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{0ex}{\normalfont\normalsize\bfseries}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize}}%
\else% compsoc journals
% use negative top separation as compsoc journals do not indent paragraphs after section titles
\def\section{\@startsection{section}{1}{\z@}{-3.5ex plus -2ex minus -1.5ex}%
{0.7ex plus 1ex minus 0ex}{\normalfont\sublargesize\sffamily\bfseries\scshape}}%
% Note that subsection and smaller may not be correct for the Computer Society,
% I have to look up an example.
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.5ex plus -1.5ex minus -1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\sffamily\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-2.5ex plus -1ex minus -1ex}%
{0.5ex plus 0.5ex minus 0ex}{\normalfont\normalsize\sffamily\itshape}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{-0ex plus -0.1ex minus -0.1ex}%
{0ex}{\normalfont\normalsize}}%
\fi\fi

% transmag
\ifCLASSOPTIONtransmag
\def\subsection{\@startsection{subsection}{2}{0.75\parindent}{3.5ex plus 1.5ex minus 1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\itshape}}%
\def\subsubsection{\@startsection{subsubsection}{3}{1.25\parindent}{0.1ex plus 0.1ex minus 0.1ex}%
{0.1ex}{\normalfont\normalsize\itshape}}%
\fi


% V1.8a provide for a raised line Introduction section for use with Computer
% Society papers. We have to remove any spacing glue after the section
% heading and then remove the blank line for the new paragraph after it.
% LaTeX's section handler alters \everypar and we need to propogate those
% changes outside of the \parbox lest there be spacing problems at the top
% of the next section.
\def\JIISTraisesectionheading#1{\noindent\raisebox{1.5\baselineskip}[0pt][0pt]{\parbox[b]{\columnwidth}{#1\unskip\global\everypar=\everypar}}\vspace{-1\baselineskip}\vspace{-\parskip}\par}



%% ENVIRONMENTS
% "box" symbols at end of proofs
\def\JIISTQEDclosed{\mbox{\rule[0pt]{1.3ex}{1.3ex}}} % for a filled box
% V1.6 some journals use an open box instead that will just fit around a closed one
\def\JIISTQEDopen{{\setlength{\fboxsep}{0pt}\setlength{\fboxrule}{0.2pt}\fbox{\rule[0pt]{0pt}{1.3ex}\rule[0pt]{1.3ex}{0pt}}}}
\ifCLASSOPTIONcompsoc
\def\JIISTQED{\JIISTQEDopen}   % default to open for compsoc
\else
\def\JIISTQED{\JIISTQEDclosed} % otherwise default to closed
\fi

%V1.8 flag to indicate if QED symbol is to be shown
\newif\if@JIISTQEDshow  \@JIISTQEDshowtrue
\def\JIISTproofindentspace{2\parindent}% V1.8 allow user to change indentation amount if desired
% v1.7 name change to avoid namespace collision with amsthm. Also add support
% for an optional argument.
\def\JIISTproof{\@ifnextchar[{\@JIISTproof}{\@JIISTproof[\JIISTproofname]}}
\def\@JIISTproof[#1]{\@JIISTQEDshowtrue\par\noindent\hspace{\JIISTproofindentspace}{\itshape #1: }}
\def\endJIISTproof{\if@JIISTQEDshow\hspace*{\fill}\nobreakspace\JIISTQED\fi\par}
% qedhere for equation environments, similar to AMS \qedhere
\def\JIISTQEDhereeqn{\global\@JIISTQEDshowfalse\eqno\let\eqno\relax\let\leqno\relax
                    \let\veqno\relax\hbox{\JIISTQED}}
% JIIST style qedhere for JIISTeqnarray and other environments
\def\JIISTQEDhere{\global\@JIISTQEDshowfalse\JIISTQED}
% command to disable QED at end of JIISTproof
\def\JIISTQEDoff{\global\@JIISTQEDshowfalse}


%\itemindent is set to \z@ by list, so define new temporary variable
\newdimen\@JIISTtmpitemindent

\ifCLASSOPTIONcompsoc
% V1.8a compsoc uses bold theorem titles, a period instead of a colon, vertical spacing, and hanging indentation
% V1.8 allow long theorem names to break across lines.
% Thanks to Miquel Payaro for reporting this.
\def\@begintheorem#1#2{\@JIISTtmpitemindent\itemindent\relax
    \topsep 0.2\@JIISTnormalsizeunitybaselineskip plus 0.26\@JIISTnormalsizeunitybaselineskip minus 0.05\@JIISTnormalsizeunitybaselineskip
    \rmfamily\trivlist\hangindent\parindent%
    \item[]\textit{\bfseries\noindent #1\ #2.} \itemindent\@JIISTtmpitemindent\relax}
\def\@opargbegintheorem#1#2#3{\@JIISTtmpitemindent\itemindent\relax
\topsep 0.2\@JIISTnormalsizeunitybaselineskip plus 0.26\@JIISTnormalsizeunitybaselineskip minus 0.05\@JIISTnormalsizeunitybaselineskip
\rmfamily\trivlist\hangindent\parindent%
% V1.6 The JIIST is back to using () around theorem names which are also in italics
% Thanks to Christian Peel for reporting this.
    \item[]\textit{\bfseries\noindent #1\ #2\ (#3).} \itemindent\@JIISTtmpitemindent\relax}
% V1.7 remove bogus \unskip that caused equations in theorems to collide with
% lines below.
\def\@endtheorem{\endtrivlist\vskip 0.25\@JIISTnormalsizeunitybaselineskip plus 0.26\@JIISTnormalsizeunitybaselineskip minus 0.05\@JIISTnormalsizeunitybaselineskip}
\else
%
% noncompsoc
% 
% V1.8 allow long theorem names to break across lines.
% Thanks to Miquel Payaro for reporting this.
\def\@begintheorem#1#2{\@JIISTtmpitemindent\itemindent\relax\topsep 0pt\rmfamily\trivlist%
    \item[]\textit{\indent #1\ #2:} \itemindent\@JIISTtmpitemindent\relax}
\def\@opargbegintheorem#1#2#3{\@JIISTtmpitemindent\itemindent\relax\topsep 0pt\rmfamily \trivlist%
% V1.6 The JIIST is back to using () around theorem names which are also in italics
% Thanks to Christian Peel for reporting this.
    \item[]\textit{\indent #1\ #2\ (#3):} \itemindent\@JIISTtmpitemindent\relax}
% V1.7 remove bogus \unskip that caused equations in theorems to collide with
% lines below.
\def\@endtheorem{\endtrivlist}
\fi



% V1.6
% display command for the section the theorem is in - so that \thesection
% is not used as this will be in Roman numerals when we want arabic.
% LaTeX2e uses \def\@thmcounter#1{\noexpand\arabic{#1}} for the theorem number
% (second part) display and \def\@thmcountersep{.} as a separator.
% V1.7 intercept calls to the section counter and reroute to \@JIISTthmcounterinsection
% to allow \appendix(ices} to override as needed.
%
% special handler for sections, allows appendix(ices) to override
\gdef\@JIISTthmcounterinsection#1{\arabic{#1}}
% string macro
\edef\@JIISTstringsection{section}

% redefine the #1#2[#3] form of newtheorem to use a hook to \@JIISTthmcounterinsection
% if section in_counter is used
\def\@xnthm#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \edef\@JIISTstringtmp{#3}
     \ifx\@JIISTstringtmp\@JIISTstringsection
     \expandafter\xdef\csname the#1\endcsname{%
     \noexpand\@JIISTthmcounterinsection{#3}\@thmcountersep
          \@thmcounter{#1}}%
     \else
     \expandafter\xdef\csname the#1\endcsname{%
       \expandafter\noexpand\csname the#3\endcsname \@thmcountersep
          \@thmcounter{#1}}%
     \fi
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}



%% SET UP THE DEFAULT PAGESTYLE
\pagestyle{headings}
\pagenumbering{arabic}

% normally the page counter starts at 1
\setcounter{page}{1}
% however, for peerreview the cover sheet is page 0 or page -1
% (for duplex printing)
\ifCLASSOPTIONpeerreview
   \if@twoside
      \setcounter{page}{-1}
   \else
      \setcounter{page}{0}
   \fi
\fi

% standard book class behavior - let bottom line float up and down as
% needed when single sided
\ifCLASSOPTIONtwoside\else\raggedbottom\fi
% if two column - turn on twocolumn, allow word spacings to stretch more and
% enforce a rigid position for the last lines
\ifCLASSOPTIONtwocolumn
% the peer review option delays invoking twocolumn
   \ifCLASSOPTIONpeerreview\else
      \twocolumn
   \fi
\sloppy 
\flushbottom
\fi




% \APPENDIX and \APPENDICES definitions

% This is the \@ifmtarg command from the LaTeX ifmtarg package
% by Peter Wilson (CUA) and Donald Arseneau
% \@ifmtarg is used to determine if an argument to a command
% is present or not.
% For instance:
% \@ifmtarg{#1}{\typeout{empty}}{\typeout{has something}}
% \@ifmtarg is used with our redefined \section command if
% \appendices is invoked.
% The command \section will behave slightly differently depending
% on whether the user specifies a title: 
% \section{My appendix title}
% or not:
% \section{}
% This way, we can eliminate the blank lines where the title
% would be, and the unneeded : after Appendix in the table of
% contents 
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\endgroup
% end of \@ifmtarg defs


% V1.7
% command that allows the one time saving of the original definition
% of section to \@JIISTappendixsavesection for \appendix or \appendices 
% we don't save \section here as it may be redefined later by other
% packages (hyperref.sty, etc.)
\def\@JIISTsaveoriginalsectiononce{\let\@JIISTappendixsavesection\section
\let\@JIISTsaveoriginalsectiononce\relax}

% neat trick to grab and process the argument from \section{argument}
% we process differently if the user invoked \section{} with no
% argument (title)
% note we reroute the call to the old \section*
\def\@JIISTprocessthesectionargument#1{%
\@ifmtarg{#1}{%
\@JIISTappendixsavesection*{\appendixname\nobreakspace\thesectiondis}%
\addcontentsline{toc}{section}{\appendixname\nobreakspace\thesection}}{%
\@JIISTappendixsavesection*{\appendixname\nobreakspace\thesectiondis\\* #1}%
\addcontentsline{toc}{section}{\appendixname\nobreakspace\thesection: #1}}}

% we use this if the user calls \section{} after
% \appendix-- which has no meaning. So, we ignore the
% command and its argument. Then, warn the user.
\def\@JIISTdestroythesectionargument#1{\typeout{** WARNING: Ignoring useless
\protect\section\space in Appendix (line \the\inputlineno).}}


% remember \thesection forms will be displayed in \ref calls
% and in the Table of Contents.
% The \sectiondis form is used in the actual heading itself

% appendix command for one single appendix
% normally has no heading. However, if you want a 
% heading, you can do so via the optional argument:
% \appendix[Optional Heading]
\def\appendix{\relax}
\renewcommand{\appendix}[1][]{\@JIISTsaveoriginalsectiononce\par
    % v1.6 keep hyperref's identifiers unique
    \gdef\theHsection{Appendix.A}%
    % v1.6 adjust hyperref's string name for the section
    \xdef\Hy@chapapp{appendix}%
    \setcounter{section}{0}%
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{paragraph}{0}%
    \gdef\thesection{A}%
    \gdef\thesectiondis{}% 
    \gdef\thesubsection{\Alph{subsection}}%
    \gdef\@JIISTthmcounterinsection##1{A}
    \refstepcounter{section}% update the \ref counter
    \@ifmtarg{#1}{\@JIISTappendixsavesection*{\appendixname}%
                  \addcontentsline{toc}{section}{\appendixname}}{%
             \@JIISTappendixsavesection*{\appendixname\nobreakspace\\* #1}%
             \addcontentsline{toc}{section}{\appendixname: #1}}%
    % redefine \section command for appendix
    % leave \section* as is
    \def\section{\@ifstar{\@JIISTappendixsavesection*}{%
                    \@JIISTdestroythesectionargument}}% throw out the argument
                                                     % of the normal form
}



% appendices command for multiple appendices
% user then calls \section with an argument (possibly empty) to
% declare the individual appendices
\def\appendices{\@JIISTsaveoriginalsectiononce\par
    % v1.6 keep hyperref's identifiers unique
    \gdef\theHsection{Appendix.\Alph{section}}%
    % v1.6 adjust hyperref's string name for the section
    \xdef\Hy@chapapp{appendix}%
    \setcounter{section}{-1}% we want \refstepcounter to use section 0
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{paragraph}{0}%
    \ifCLASSOPTIONromanappendices%
    \gdef\thesection{\Roman{section}}%
    \gdef\thesectiondis{\Roman{section}}%
    \@JIISTcompsocconfonly{\gdef\thesectiondis{\Roman{section}.}}%
    \gdef\@JIISTthmcounterinsection##1{A\arabic{##1}}
    \else%
    \gdef\thesection{\Alph{section}}%
    \gdef\thesectiondis{\Alph{section}}%
    \@JIISTcompsocconfonly{\gdef\thesectiondis{\Alph{section}.}}%
    \gdef\@JIISTthmcounterinsection##1{\Alph{##1}}
    \fi%
    \refstepcounter{section}% update the \ref counter
    \setcounter{section}{0}% NEXT \section will be the FIRST appendix
    % redefine \section command for appendices
    % leave \section* as is
    \def\section{\@ifstar{\@JIISTappendixsavesection*}{% process the *-form
                    \refstepcounter{section}% or is a new section so,
                    \@JIISTprocessthesectionargument}}% process the argument 
                                                 % of the normal form
}



% V1.7 compoc uses nonbold drop cap and small caps word style
\ifCLASSOPTIONcompsoc
  \def\JIISTPARstartFONTSTYLE{\mdseries}
  \def\JIISTPARstartWORDFONTSTYLE{\scshape}
  \def\JIISTPARstartWORDCAPSTYLE{\relax}
\fi
%
%
% \JIISTPARstart
% Definition for the big two line drop cap letter at the beginning of the
% first paragraph of journal papers. The first argument is the first letter
% of the first word, the second argument is the remaining letters of the
% first word which will be rendered in upper case.
% In V1.6 this has been completely rewritten to:
% 
% 1. no longer have problems when the user begins an environment
%    within the paragraph that uses \JIISTPARstart.
% 2. auto-detect and use the current font family
% 3. revise handling of the space at the end of the first word so that
%    interword glue will now work as normal.
% 4. produce correctly aligned edges for the (two) indented lines.
% 
% We generalize things via control macros - playing with these is fun too.
% 
% V1.7 added more control macros to make it easy for JIISTjrnltools.sty users
% to change the font style.
% 
% the number of lines that are indented to clear it
% may need to increase if using decenders
\providecommand{\JIISTPARstartDROPLINES}{2}
% minimum number of lines left on a page to allow a \@JIISTPARstart
% Does not take into consideration rubber shrink, so it tends to
% be overly cautious
\providecommand{\JIISTPARstartMINPAGELINES}{2}
% V1.7 the height of the drop cap is adjusted to match the height of this text
% in the current font (when \JIISTPARstart is called).
\providecommand{\JIISTPARstartHEIGHTTEXT}{T}
% the depth the letter is lowered below the baseline
% the height (and size) of the letter is determined by the sum
% of this value and the height of the \JIISTPARstartHEIGHTTEXT in the current
% font. It is a good idea to set this value in terms of the baselineskip
% so that it can respond to changes therein.
\providecommand{\JIISTPARstartDROPDEPTH}{1.1\baselineskip}
% V1.7 the font the drop cap will be rendered in,
% can take zero or one argument.
\providecommand{\JIISTPARstartFONTSTYLE}{\bfseries}
% V1.7 any additional, non-font related commands needed to modify
% the drop cap letter, can take zero or one argument.
\providecommand{\JIISTPARstartCAPSTYLE}{\MakeUppercase}
% V1.7 the font that will be used to render the rest of the word,
% can take zero or one argument.
\providecommand{\JIISTPARstartWORDFONTSTYLE}{\relax}
% V1.7 any additional, non-font related commands needed to modify
% the rest of the word, can take zero or one argument.
\providecommand{\JIISTPARstartWORDCAPSTYLE}{\MakeUppercase}
% This is the horizontal separation distance from the drop letter to the main text.
% Lengths that depend on the font (e.g., ex, em, etc.) will be referenced
% to the font that is active when \JIISTPARstart is called. 
\providecommand{\JIISTPARstartSEP}{0.15em}
% V1.7 horizontal offset applied to the left of the drop cap.
\providecommand{\JIISTPARstartHOFFSET}{0em}
% V1.7 Italic correction command applied at the end of the drop cap.
\providecommand{\JIISTPARstartITLCORRECT}{\/}

% width of the letter output, set globally. Can be used in \JIISTPARstartSEP
% or \JIISTPARstartHOFFSET, but not the height lengths.
\newdimen\JIISTPARstartletwidth
\JIISTPARstartletwidth 0pt\relax

% definition of \JIISTPARstart
% THIS IS A CONTROLLED SPACING AREA, DO NOT ALLOW SPACES WITHIN THESE LINES
% 
% The token \@JIISTPARstartfont will be globally defined after the first use
% of \JIISTPARstart and will be a font command which creates the big letter
% The first argument is the first letter of the first word and the second
% argument is the rest of the first word(s).
\def\JIISTPARstart#1#2{\par{%
% if this page does not have enough space, break it and lets start
% on a new one
\@JIISTjrnlneedspace{\JIISTPARstartMINPAGELINES\baselineskip}{\relax}%
% V1.7 move this up here in case user uses \textbf for \JIISTPARstartFONTSTYLE
% which uses command \leavevmode which causes an unwanted \indent to be issued
\noindent
% calculate the desired height of the big letter
% it extends from the top of \JIISTPARstartHEIGHTTEXT in the current font
% down to \JIISTPARstartDROPDEPTH below the current baseline
\settoheight{\@JIISTjrnltmpdimenA}{\JIISTPARstartHEIGHTTEXT}%
\addtolength{\@JIISTjrnltmpdimenA}{\JIISTPARstartDROPDEPTH}%
% extract the name of the current font in bold
% and place it in \@JIISTPARstartFONTNAME
\def\@JIISTPARstartGETFIRSTWORD##1 ##2\relax{##1}%
{\JIISTPARstartFONTSTYLE{\selectfont\edef\@JIISTPARstartFONTNAMESPACE{\fontname\font\space}%
\xdef\@JIISTPARstartFONTNAME{\expandafter\@JIISTPARstartGETFIRSTWORD\@JIISTPARstartFONTNAMESPACE\relax}}}%
% define a font based on this name with a point size equal to the desired
% height of the drop letter
\font\@JIISTPARstartsubfont\@JIISTPARstartFONTNAME\space at \@JIISTjrnltmpdimenA\relax%
% save this value as a counter (integer) value (sp points)
\@JIISTjrnltmpcountA=\@JIISTjrnltmpdimenA%
% now get the height of the actual letter produced by this font size
\settoheight{\@JIISTjrnltmpdimenB}{\@JIISTPARstartsubfont\JIISTPARstartCAPSTYLE{#1}}%
% If something bogus happens like the first argument is empty or the
% current font is strange, do not allow a zero height.
\ifdim\@JIISTjrnltmpdimenB=0pt\relax%
\typeout{** WARNING: JIISTPARstart drop letter has zero height! (line \the\inputlineno)}%
\typeout{ Forcing the drop letter font size to 10pt.}%
\@JIISTjrnltmpdimenB=10pt%
\fi%
% and store it as a counter
\@JIISTjrnltmpcountB=\@JIISTjrnltmpdimenB%
% Since a font size doesn't exactly correspond to the height of the capital
% letters in that font, the actual height of the letter, \@JIISTjrnltmpcountB,
% will be less than that desired, \@JIISTjrnltmpcountA
% we need to raise the font size, \@JIISTjrnltmpdimenA 
% by \@JIISTjrnltmpcountA / \@JIISTjrnltmpcountB
% But, TeX doesn't have floating point division, so we have to use integer
% division. Hence the use of the counters.
% We need to reduce the denominator so that the loss of the remainder will
% have minimal affect on the accuracy of the result
\divide\@JIISTjrnltmpcountB by 200%
\divide\@JIISTjrnltmpcountA by \@JIISTjrnltmpcountB%
% Then reequalize things when we use TeX's ability to multiply by
% floating point values
\@JIISTjrnltmpdimenB=0.005\@JIISTjrnltmpdimenA%
\multiply\@JIISTjrnltmpdimenB by \@JIISTjrnltmpcountA%
% \@JIISTPARstartfont is globaly set to the calculated font of the big letter
% We need to carry this out of the local calculation area to to create the
% big letter.
\global\font\@JIISTPARstartfont\@JIISTPARstartFONTNAME\space at \@JIISTjrnltmpdimenB%
% Now set \@JIISTjrnltmpdimenA to the width of the big letter
% We need to carry this out of the local calculation area to set the
% hanging indent
\settowidth{\global\@JIISTjrnltmpdimenA}{\@JIISTPARstartfont
\JIISTPARstartCAPSTYLE{#1\JIISTPARstartITLCORRECT}}}%
% end of the isolated calculation environment
\global\JIISTPARstartletwidth\@JIISTjrnltmpdimenA\relax%
% add in the extra clearance we want
\advance\@JIISTjrnltmpdimenA by \JIISTPARstartSEP\relax%
% add in the optional offset
\advance\@JIISTjrnltmpdimenA by \JIISTPARstartHOFFSET\relax%
% V1.7 don't allow negative offsets to produce negative hanging indents
\@JIISTjrnltmpdimenB\@JIISTjrnltmpdimenA
\ifnum\@JIISTjrnltmpdimenB < 0 \@JIISTjrnltmpdimenB 0pt\fi
% \@JIISTjrnltmpdimenA has the width of the big letter plus the
% separation space and \@JIISTPARstartfont is the font we need to use
% Now, we make the letter and issue the hanging indent command
% The letter is placed in a box of zero width and height so that other
% text won't be displaced by it.
\hangindent\@JIISTjrnltmpdimenB\hangafter=-\JIISTPARstartDROPLINES%
\makebox[0pt][l]{\hspace{-\@JIISTjrnltmpdimenA}%
\raisebox{-\JIISTPARstartDROPDEPTH}[0pt][0pt]{\hspace{\JIISTPARstartHOFFSET}%
\@JIISTPARstartfont\JIISTPARstartCAPSTYLE{#1\JIISTPARstartITLCORRECT}%
\hspace{\JIISTPARstartSEP}}}%
{\JIISTPARstartWORDFONTSTYLE{\JIISTPARstartWORDCAPSTYLE{\selectfont#2}}}}




% determines if the space remaining on a given page is equal to or greater
% than the specified space of argument one
% if not, execute argument two (only if the remaining space is greater than zero)
% and issue a \newpage
% 
% example: \@JIISTjrnlneedspace{2in}{\vfill}
% 
% Does not take into consideration rubber shrinkage, so it tends to
% be overly cautious
% Based on an example posted by Donald Arseneau
% Note this macro uses \@JIISTjrnltmpdimenB internally for calculations,
% so DO NOT PASS \@JIISTjrnltmpdimenB to this routine
% if you need a dimen register, import with \@JIISTjrnltmpdimenA instead
\def\@JIISTjrnlneedspace#1#2{\penalty-100\begingroup%shield temp variable
\@JIISTjrnltmpdimenB\pagegoal\advance\@JIISTjrnltmpdimenB-\pagetotal% space left
\ifdim #1>\@JIISTjrnltmpdimenB\relax% not enough space left
\ifdim\@JIISTjrnltmpdimenB>\z@\relax #2\fi%
\newpage%
\fi\endgroup}



% JIISTbiography ENVIRONMENT
% Allows user to enter biography leaving place for picture (adapts to font size)
% As of V1.5, a new optional argument allows you to have a real graphic!
% V1.5 and later also fixes the "colliding biographies" which could happen when a 
% biography's text was shorter than the space for the photo.
% MDS 7/2001
% V1.6 prevent multiple biographies from making multiple TOC entries
\newif\if@JIISTbiographyTOCentrynotmade
\global\@JIISTbiographyTOCentrynotmadetrue

% biography counter so hyperref can jump directly to the biographies
% and not just the previous section
\newcounter{JIISTbiography}
\setcounter{JIISTbiography}{0}

% photo area size
\def\@JIISTBIOphotowidth{1.0in}    % width of the biography photo area
\def\@JIISTBIOphotodepth{1.25in}   % depth (height) of the biography photo area
% area cleared for photo
\def\@JIISTBIOhangwidth{1.14in}    % width cleared for the biography photo area
\def\@JIISTBIOhangdepth{1.25in}    % depth cleared for the biography photo area
                                  % actual depth will be a multiple of 
                                  % \baselineskip, rounded up
\def\@JIISTBIOskipN{4\baselineskip}% nominal value of the vskip above the biography

\newenvironment{JIISTbiography}[2][]{\normalfont\@JIISTcompsoconly{\sffamily}\footnotesize%
\unitlength 1in\parskip=0pt\par\parindent 1em\interlinepenalty500%
% we need enough space to support the hanging indent
% the nominal value of the spacer
% and one extra line for good measure
\@JIISTjrnltmpdimenA=\@JIISTBIOhangdepth%
\advance\@JIISTjrnltmpdimenA by \@JIISTBIOskipN%
\advance\@JIISTjrnltmpdimenA by 1\baselineskip%
% if this page does not have enough space, break it and lets start
% with a new one
\@JIISTjrnlneedspace{\@JIISTjrnltmpdimenA}{\relax}%
% nominal spacer can strech, not shrink use 1fil so user can out stretch with \vfill
\vskip \@JIISTBIOskipN plus 1fil minus 0\baselineskip%
% the default box for where the photo goes
\def\@JIISTtempbiographybox{{\setlength{\fboxsep}{0pt}\framebox{%
\begin{minipage}[b][\@JIISTBIOphotodepth][c]{\@JIISTBIOphotowidth}\centering PLACE\\ PHOTO\\ HERE \end{minipage}}}}%
%
% detect if the optional argument was supplied, this requires the
% \@ifmtarg command as defined in the appendix section above
% and if so, override the default box with what they want
\@ifmtarg{#1}{\relax}{\def\@JIISTtempbiographybox{\mbox{\begin{minipage}[b][\@JIISTBIOphotodepth][c]{\@JIISTBIOphotowidth}%
\centering%
#1%
\end{minipage}}}}% end if optional argument supplied
% Make an entry into the table of contents only if we have not done so before
\if@JIISTbiographyTOCentrynotmade%
% link labels to the biography counter so hyperref will jump
% to the biography, not the previous section
\setcounter{JIISTbiography}{-1}%
\refstepcounter{JIISTbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@JIISTbiographyTOCentrynotmadefalse%
\fi%
% one more biography
\refstepcounter{JIISTbiography}%
% Make an entry for this name into the table of contents 
\addcontentsline{toc}{subsection}{#2}%
% V1.6 properly handle if a new paragraph should occur while the
% hanging indent is still active. Do this by redefining \par so
% that it will not start a new paragraph. (But it will appear to the
% user as if it did.) Also, strip any leading pars, newlines, or spaces.
\let\@JIISTBIOORGparCMD=\par% save the original \par command
\edef\par{\hfil\break\indent}% the new \par will not be a "real" \par
\settoheight{\@JIISTjrnltmpdimenA}{\@JIISTtempbiographybox}% get height of biography box
\@JIISTjrnltmpdimenB=\@JIISTBIOhangdepth%
\@JIISTjrnltmpcountA=\@JIISTjrnltmpdimenB% countA has the hang depth
\divide\@JIISTjrnltmpcountA by \baselineskip%  calculates lines needed to produce the hang depth
\advance\@JIISTjrnltmpcountA by 1% ensure we overestimate
% set the hanging indent
\hangindent\@JIISTBIOhangwidth%
\hangafter-\@JIISTjrnltmpcountA%
% reference the top of the photo area to the top of a capital T
\settoheight{\@JIISTjrnltmpdimenB}{\mbox{T}}%
% set the photo box, give it zero width and height so as not to disturb anything
\noindent\makebox[0pt][l]{\hspace{-\@JIISTBIOhangwidth}\raisebox{\@JIISTjrnltmpdimenB}[0pt][0pt]{%
\raisebox{-\@JIISTBIOphotodepth}[0pt][0pt]{\@JIISTtempbiographybox}}}%
% now place the author name and begin the bio text
\noindent\textbf{#2\ }\@JIISTgobbleleadPARNLSP}{\relax\let\par=\@JIISTBIOORGparCMD\par%
% 7/2001 V1.5 detect when the biography text is shorter than the photo area
% and pad the unused area - preventing a collision from the next biography entry
% MDS
\ifnum \prevgraf <\@JIISTjrnltmpcountA\relax% detect when the biography text is shorter than the photo
    \advance\@JIISTjrnltmpcountA by -\prevgraf% calculate how many lines we need to pad
    \advance\@JIISTjrnltmpcountA by -1\relax% we compensate for the fact that we indented an extra line
    \@JIISTjrnltmpdimenA=\baselineskip% calculate the length of the padding
    \multiply\@JIISTjrnltmpdimenA by \@JIISTjrnltmpcountA%
    \noindent\rule{0pt}{\@JIISTjrnltmpdimenA}% insert an invisible support strut
\fi%
\par\normalfont}



% V1.6
% added biography without a photo environment
\newenvironment{JIISTbiographynophoto}[1]{%
% Make an entry into the table of contents only if we have not done so before
\if@JIISTbiographyTOCentrynotmade%
% link labels to the biography counter so hyperref will jump
% to the biography, not the previous section
\setcounter{JIISTbiography}{-1}%
\refstepcounter{JIISTbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@JIISTbiographyTOCentrynotmadefalse%
\fi%
% one more biography
\refstepcounter{JIISTbiography}%
% Make an entry for this name into the table of contents 
\addcontentsline{toc}{subsection}{#1}%
\normalfont\@JIISTcompsoconly{\sffamily}\footnotesize\interlinepenalty500%
\vskip 4\baselineskip plus 1fil minus 0\baselineskip%
\parskip=0pt\par%
\noindent\textbf{#1\ }\@JIISTgobbleleadPARNLSP}{\relax\par\normalfont}


% provide the user with some old font commands
% got this from article.cls
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


% SPECIAL PAPER NOTICE COMMANDS
% 
% holds the special notice text
\def\@JIISTspecialpapernotice{\relax}
 
% for special papers, like invited papers, the user can do:
% \JIISTspecialpapernotice{(Invited Paper)} before \maketitle
\def\JIISTspecialpapernotice#1{\ifCLASSOPTIONconference%
\def\@JIISTspecialpapernotice{{\sublargesize\textit{#1}\vspace*{1em}}}%
\else%
\def\@JIISTspecialpapernotice{{\\*[1.5ex]\sublargesize\textit{#1}}\vspace*{-2ex}}%
\fi}




% PUBLISHER ID COMMANDS
% to insert a publisher's ID footer
% V1.6 \JIISTpubid has been changed so that the change in page size and style
% occurs in \maketitle. \JIISTpubid must now be issued prior to \maketitle
% use \JIISTpubidadjcol as before - in the second column of the title page
% These changes allow \maketitle to take the reduced page height into
% consideration when dynamically setting the space between the author 
% names and the maintext.
%
% the amount the main text is pulled up to make room for the
% publisher's ID footer
% The JIIST uses about 1.3\baselineskip for journals, 
% dynamic title spacing will clean up the fraction
\def\@JIISTpubidpullup{1.3\baselineskip}
\ifCLASSOPTIONtechnote
% for technotes it must be an integer of baselineskip as there can be no
% dynamic title spacing for two column mode technotes (the title is in the
% in first column) and we should maintain an integer number of lines in the
% second column
% There are some examples (such as older issues of "Transactions on
% Information Theory") in which the JIIST really pulls the text off the ID for
% technotes - about 0.55in (or 4\baselineskip). We'll use 2\baselineskip
% and call it even.
\def\@JIISTpubidpullup{2\baselineskip}
\fi

% V1.7 compsoc does not use a pullup
\ifCLASSOPTIONcompsoc
\def\@JIISTpubidpullup{0pt}
\fi

% holds the ID text
\def\@JIISTpubid{\relax}

% flag so \maketitle can tell if \JIISTpubid was called
\newif\if@JIISTusingpubid
\global\@JIISTusingpubidfalse
% issue this command in the page to have the ID at the bottom
% V1.6 use before \maketitle
\def\JIISTpubid#1{\def\@JIISTpubid{#1}\global\@JIISTusingpubidtrue}


% command which will pull up (shorten) the column it is executed in
% to make room for the publisher ID. Place in the second column of
% the title page when using \JIISTpubid
% Is smart enough not to do anything when in single column text or
% if the user hasn't called \JIISTpubid
% currently needed in for the second column of a page with the
% publisher ID. If not needed in future releases, please provide this
% command and define it as \relax for backward compatibility
% v1.6b do not allow command to operate if the peer review option has been 
% selected because \JIISTpubidadjcol will not be on the cover page.
% V1.7 do nothing if compsoc
\def\JIISTpubidadjcol{\ifCLASSOPTIONcompsoc\else\ifCLASSOPTIONpeerreview\else
\if@twocolumn\if@JIISTusingpubid\enlargethispage{-\@JIISTpubidpullup}\fi\fi\fi\fi}

% Special thanks to Peter Wilson, Daniel Luecking, and the other
% gurus at comp.text.tex, for helping me to understand how best to
% implement the JIISTpubid command in LaTeX.



%% Lockout some commands under various conditions

% general purpose bit bucket
\newsavebox{\@JIISTjrnlrubishbin}

% flags to prevent multiple warning messages
\newif\if@JIISTWARNthanks
\newif\if@JIISTWARNJIISTPARstart
\newif\if@JIISTWARNJIISTbiography
\newif\if@JIISTWARNJIISTbiographynophoto
\newif\if@JIISTWARNJIISTpubid
\newif\if@JIISTWARNJIISTpubidadjcol
\newif\if@JIISTWARNJIISTmembership
\newif\if@JIISTWARNJIISTaftertitletext
\@JIISTWARNthankstrue
\@JIISTWARNJIISTPARstarttrue
\@JIISTWARNJIISTbiographytrue
\@JIISTWARNJIISTbiographynophototrue
\@JIISTWARNJIISTpubidtrue
\@JIISTWARNJIISTpubidadjcoltrue
\@JIISTWARNJIISTmembershiptrue
\@JIISTWARNJIISTaftertitletexttrue


%% Lockout some commands when in various modes, but allow them to be restored if needed
%%
% save commands which might be locked out
% so that the user can later restore them if needed
\let\@JIISTSAVECMDthanks\thanks
\let\@JIISTSAVECMDJIISTPARstart\JIISTPARstart
\let\@JIISTSAVECMDJIISTbiography\JIISTbiography
\let\@JIISTSAVECMDendJIISTbiography\endJIISTbiography
\let\@JIISTSAVECMDJIISTbiographynophoto\JIISTbiographynophoto
\let\@JIISTSAVECMDendJIISTbiographynophoto\endJIISTbiographynophoto
\let\@JIISTSAVECMDJIISTpubid\JIISTpubid
\let\@JIISTSAVECMDJIISTpubidadjcol\JIISTpubidadjcol
\let\@JIISTSAVECMDJIISTmembership\JIISTmembership
\let\@JIISTSAVECMDJIISTaftertitletext\JIISTaftertitletext


% disable \JIISTPARstart when in draft mode
% This may have originally been done because the pre-V1.6 drop letter
% algorithm had problems with a non-unity baselinestretch
% At any rate, it seems too formal to have a drop letter in a draft
% paper.
\ifCLASSOPTIONdraftcls
\def\JIISTPARstart#1#2{#1#2\if@JIISTWARNJIISTPARstart\typeout{** ATTENTION: \noexpand\JIISTPARstart
 is disabled in draft mode (line \the\inputlineno).}\fi\global\@JIISTWARNJIISTPARstartfalse}
\fi
% and for technotes
\ifCLASSOPTIONtechnote
\def\JIISTPARstart#1#2{#1#2\if@JIISTWARNJIISTPARstart\typeout{** WARNING: \noexpand\JIISTPARstart
 is locked out for technotes (line \the\inputlineno).}\fi\global\@JIISTWARNJIISTPARstartfalse}
\fi


% lockout unneeded commands when in conference mode
\ifCLASSOPTIONconference
% when locked out, \thanks, \JIISTbiography, \JIISTbiographynophoto, \JIISTpubid,
% \JIISTmembership and \JIISTaftertitletext will all swallow their given text. 
% \JIISTPARstart will output a normal character instead
% warn the user about these commands only once to prevent the console screen
% from filling up with redundant messages
\def\thanks#1{\if@JIISTWARNthanks\typeout{** WARNING: \noexpand\thanks
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@JIISTWARNthanksfalse}
\def\JIISTPARstart#1#2{#1#2\if@JIISTWARNJIISTPARstart\typeout{** WARNING: \noexpand\JIISTPARstart
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@JIISTWARNJIISTPARstartfalse}


% LaTeX treats environments and commands with optional arguments differently.
% the actual ("internal") command is stored as \\commandname 
% (accessed via \csname\string\commandname\endcsname )
% the "external" command \commandname is a macro with code to determine
% whether or not the optional argument is presented and to provide the 
% default if it is absent. So, in order to save and restore such a command
% we would have to save and restore \\commandname as well. But, if LaTeX
% ever changes the way it names the internal names, the trick would break.
% Instead let us just define a new environment so that the internal
% name can be left undisturbed.
\newenvironment{@JIISTbogusbiography}[2][]{\if@JIISTWARNJIISTbiography\typeout{** WARNING: \noexpand\JIISTbiography
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@JIISTWARNJIISTbiographyfalse%
\setbox\@JIISTjrnlrubishbin\vbox\bgroup}{\egroup\relax}
% and make biography point to our bogus biography
\let\JIISTbiography=\@JIISTbogusbiography
\let\endJIISTbiography=\end@JIISTbogusbiography

\renewenvironment{JIISTbiographynophoto}[1]{\if@JIISTWARNJIISTbiographynophoto\typeout{** WARNING: \noexpand\JIISTbiographynophoto
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@JIISTWARNJIISTbiographynophotofalse%
\setbox\@JIISTjrnlrubishbin\vbox\bgroup}{\egroup\relax}

\def\JIISTpubid#1{\if@JIISTWARNJIISTpubid\typeout{** WARNING: \noexpand\JIISTpubid 
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@JIISTWARNJIISTpubidfalse}
\def\JIISTpubidadjcol{\if@JIISTWARNJIISTpubidadjcol\typeout{** WARNING: \noexpand\JIISTpubidadjcol
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@JIISTWARNJIISTpubidadjcolfalse}
\def\JIISTmembership#1{\if@JIISTWARNJIISTmembership\typeout{** WARNING: \noexpand\JIISTmembership
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@JIISTWARNJIISTmembershipfalse}
\def\JIISTaftertitletext#1{\if@JIISTWARNJIISTaftertitletext\typeout{** WARNING: \noexpand\JIISTaftertitletext
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@JIISTWARNJIISTaftertitletextfalse}
\fi


% provide a way to restore the commands that are locked out
\def\JIISToverridecommandlockouts{%
\typeout{** ATTENTION: Overriding command lockouts (line \the\inputlineno).}%
\let\thanks\@JIISTSAVECMDthanks%
\let\JIISTPARstart\@JIISTSAVECMDJIISTPARstart%
\let\JIISTbiography\@JIISTSAVECMDJIISTbiography%
\let\endJIISTbiography\@JIISTSAVECMDendJIISTbiography%
\let\JIISTbiographynophoto\@JIISTSAVECMDJIISTbiographynophoto%
\let\endJIISTbiographynophoto\@JIISTSAVECMDendJIISTbiographynophoto%
\let\JIISTpubid\@JIISTSAVECMDJIISTpubid%
\let\JIISTpubidadjcol\@JIISTSAVECMDJIISTpubidadjcol%
\let\JIISTmembership\@JIISTSAVECMDJIISTmembership%
\let\JIISTaftertitletext\@JIISTSAVECMDJIISTaftertitletext}



% need a backslash character for typeout output
{\catcode`\|=0 \catcode`\\=12
|xdef|@JIISTbackslash{\}}


% hook to allow easy disabling of all legacy warnings
\def\@JIISTlegacywarn#1#2{\typeout{** ATTENTION: \@JIISTbackslash #1 is deprecated (line \the\inputlineno).
Use \@JIISTbackslash #2 instead.}}


% provide some legacy JIISTjrnl commands
\def\JIISTcompsoctitleabstractindextext{\@JIISTlegacywarn{JIISTcompsoctitleabstractindextext}{JIISTtitleabstractindextext}\JIISTtitleabstractindextext}
\def\JIISTdisplaynotcompsoctitleabstractindextext{\@JIISTlegacywarn{JIISTdisplaynotcompsoctitleabstractindextext}{JIISTdisplaynontitleabstractindextext}\JIISTdisplaynontitleabstractindextext}
% provide some legacy JIISTjrnl environments


% V1.8a no more support for these legacy commands
%\def\authorblockA{\@JIISTlegacywarn{authorblockA}{JIISTauthorblockA}\JIISTauthorblockA}
%\def\authorblockN{\@JIISTlegacywarn{authorblockN}{JIISTauthorblockN}\JIISTauthorblockN}
%\def\authorrefmark{\@JIISTlegacywarn{authorrefmark}{JIISTauthorrefmark}\JIISTauthorrefmark}
%\def\PARstart{\@JIISTlegacywarn{PARstart}{JIISTPARstart}\JIISTPARstart}
%\def\pubid{\@JIISTlegacywarn{pubid}{JIISTpubid}\JIISTpubid}
%\def\pubidadjcol{\@JIISTlegacywarn{pubidadjcol}{JIISTpubidadjcol}\JIISTpubidadjcol}
%\def\specialpapernotice{\@JIISTlegacywarn{specialpapernotice}{JIISTspecialpapernotice}\JIISTspecialpapernotice}
% and environments
%\def\keywords{\@JIISTlegacywarn{keywords}{JIISTkeywords}\JIISTkeywords}
%\def\endkeywords{\endJIISTkeywords}
% V1.8 no more support for legacy IED list commands
%\let\labelindent\JIISTlabelindent
%\def\calcleftmargin{\@JIISTlegacywarn{calcleftmargin}{JIISTcalcleftmargin}\JIISTcalcleftmargin}
%\def\setlabelwidth{\@JIISTlegacywarn{setlabelwidth}{JIISTsetlabelwidth}\JIISTsetlabelwidth}
%\def\usemathlabelsep{\@JIISTlegacywarn{usemathlabelsep}{JIISTusemathlabelsep}\JIISTusemathlabelsep}
%\def\iedlabeljustifyc{\@JIISTlegacywarn{iedlabeljustifyc}{JIISTiedlabeljustifyc}\JIISTiedlabeljustifyc}
%\def\iedlabeljustifyl{\@JIISTlegacywarn{iedlabeljustifyl}{JIISTiedlabeljustifyl}\JIISTiedlabeljustifyl}
%\def\iedlabeljustifyr{\@JIISTlegacywarn{iedlabeljustifyr}{JIISTiedlabeljustifyr}\JIISTiedlabeljustifyr}
% V1.8 no more support for QED and proof stuff
%\def\QED{\@JIISTlegacywarn{QED}{JIISTQED}\JIISTQED}
%\def\QEDclosed{\@JIISTlegacywarn{QEDclosed}{JIISTQEDclosed}\JIISTQEDclosed}
%\def\QEDopen{\@JIISTlegacywarn{QEDopen}{JIISTQEDopen}\JIISTQEDopen}
%\AtBeginDocument{\def\proof{\@JIISTlegacywarn{proof}{JIISTproof}\JIISTproof}\def\endproof{\endJIISTproof}}
% V1.8 no longer support biography or biographynophoto
%\def\biography{\@JIISTlegacywarn{biography}{JIISTbiography}\JIISTbiography}
%\def\biographynophoto{\@JIISTlegacywarn{biographynophoto}{JIISTbiographynophoto}\JIISTbiographynophoto}
%\def\endbiography{\endJIISTbiography}
%\def\endbiographynophoto{\endJIISTbiographynophoto}
% V1.7 and later no longer supports \overrideJIISTmargins
%\def\overrideJIISTmargins{%
%\typeout{** WARNING: \string\overrideJIISTmargins \space no longer supported (line \the\inputlineno).}%
%\typeout{** Use the \string\CLASSINPUTinnersidemargin, \string\CLASSINPUToutersidemargin \space controls instead.}}

\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of JIISTjrnl.cls  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% That's all folks!

