# Two root problem

There is only one `root` directory for pandoc.
Assume I don't want to copy the pandoc tools per document, I put the pandoc tools in `PANDOC_PATH` and the document to build in `DOC_PATH`.
Pandoc finds the file based on the root, e.g. `template.tex` includes `unicode-to-latex.tex`.
The document also finds the files based on the root, e.g. `main.md` includes `section-related-works`.

# To-do

- [ ] Make a demo on https://www.logicmatters.net/latex-for-logicians/
- [ ] Try to use `algorithem2e`.
- [ ] Read https://www.flutterbys.com.au/stats/tut/tut17.3.html
- [ ] Test Definition list (See https://www.flutterbys.com.au/stats/tut/tut17.3.html)
- [ ] Support custom languages in `listings` (See https://github.com/jgm/pandoc/issues/4116)
- [ ] Testing embed latex with [--mathjax](https://pandoc.org/MANUAL.html#option--mathjax).
- [ ] Inline code `example` in the caption of code block (See https://github.com/jgm/pandoc/issues/4846#issuecomment-414493096).
- [ ] Section id referencing and generation `\ref`.
- [ ] Bugfix: `lstinline` doesn't break at page boundary.
- [ ] Bugfix: Unicode-to-latex cannot apply on inline code with only a leading unicode symbol, e.g. `∪` will result in `l.459 \passthrough{\lstinline!∪1!}`
- [ ] Bugfix: using `-f gfm`, email in the template `\email{$author.email$}` will render as `\email{\href{mailto:weng@cs.jhu.edu}{\nolinkurl{weng@cs.jhu.edu}}}` (the correct result is `\email{weng@cs.jhu.edu}`).
- [ ] explain more about `template.tex`
- [ ] read author details from a separate file, instead of hardcode it (however, change the template is easier)