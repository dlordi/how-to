
## Line and Page Breaking

The first thing LaTeX does when processing ordinary text is to translate your input file into a string of glyphs and spaces. To produce a printed document, this string must be broken into lines, and these lines must be broken into pages. In some environments, you do the line breaking yourself with the `\\` command, but LaTeX usually does it for you. The available commands are:

```tex
\\ % start a new paragraph.
\\* % start a new line but not a new paragraph.
\- % OK to hyphenate a word here.
\cleardoublepage % flush all material and start a new page, start new odd numbered page.
\clearpage % plush all material and start a new page.
\hyphenation % enter a sequence pf exceptional hyphenations.
\linebreak % allow to break the line here.
\newline % request a new line.
\newpage % request a new page.
\nolinebreak % no line break should happen here.
\nopagebreak % no page break should happen here.
\pagebreak % encourage page break.
```
