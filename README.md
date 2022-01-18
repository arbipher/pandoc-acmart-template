# Origin

The repo starts by forking [adilakhter/pandoc-acm-journal-template](https://github.com/adilakhter/pandoc-acm-journal-template). Its latest update is 3 years ago. I make some changes, update the template files, and have this writeup. My start point is to update the template to support `--citeproc` instead of `--filter pandoc-citeproc`, [introduced](https://github.com/jgm/pandoc/blob/master/changelog.md#pandoc-211-2020-10-11) at `pandoc 2.11`.

It works with `pandoc 2.17`. 

# Usage

`make main-full` to build pdf from a standalone `main-full.md`
`make main-outline` to build pdf from a outline file `main-outline.md`, which includes `main-section-intro.md`.

See [Makefile](./Makefile).

# To-do

- [ ] explain more about `template.tex`
- [ ] update `example.md` to make it a base for my daily work

# Notes

Here is the note for my attempt to understand the tool chain. It works under my current understanding and assumptions of tools used.

## acmart

`acmart` ([CTAN](https://ctan.org/pkg/acmart?lang=en), [github](https://github.com/borisveytsman/acmart)) is [required](https://www.sigplan.org/Resources/Author/) by sigplan and other ACM groups. The official doc is [here](https://www.acm.org/binaries/content/assets/publications/consolidated-tex-template/acmart.pdf). acm also provides the source code with sample pdfs in this zip [file](https://www-acm-org.proxy1.library.jhu.edu/binaries/content/assets/publications/consolidated-tex-template/acmart-primary.zip).

`acmart` is usually included in the TeX distribution, so I remove `acmart.cls` `acmart.bib` from the original repo.

## pandoc

[`pandoc`](https://pandoc.org/) is a fancy tool to convert files between many markup format including `markdown` `latex` `pdf`. To convert to `pdf`, it uses tools in the Tex distribution e.g. `pdflatex`.

## citation

From the perspective of `acmart`, one can use `natbib` (by [default](https://github.com/borisveytsman/acmart/blob/0fc7666839026f055eff3432eb3953c7c1a0624d/acmart.dtx?_pjax=%23js-repo-pjax-container%3Afirst-of-type%2C%20div%5Bitemtype%3D%22http%3A%2F%2Fschema.org%2FSoftwareSourceCode%22%5D%20main%3Afirst-of-type%2C%20%5Bdata-pjax-container%5D%3Afirst-of-type#L1420)). Package `natbib` is for formatting references and `BibTex` style file `ACM-Reference-Format.bst` is for `BibTex` processing. One can also use `Biblatex` (with setting `natbib=false`).

From the perspective of `pandoc`, when generating a latex file from markdown, an option and a template are used to determine which commands to generate for references. The option can be set from command-line argument `pandoc --natbib` or `pandoc --biblatex` or YAML metadata. The template contains fragments `$if(natbib)$ ... $endif$` `$if(biblatex)$ ... $endif$` which are enabled by these options. You can see `\bibliographystyle{ACM-Reference-Format} \bibliography{references}` for `natbib` and `\printbibliography` for `biblatex` to render the bibliography.

However, `pandoc` won't do the bibliography rendering by just specifying the pdf engine. See this [discussion](https://groups.google.com/g/pandoc-discuss/c/MgQ050t21W0/m/i1vgmRbLBQAJ) in 2018:

> Pandoc doesn't run bibtex/biber for you when producing
> a PDF. If you use pandoc-citeproc, you can get a nice
> bibliography in PDF output (and maybe that's what you
> were doing when it worked before), but if you want to use
> native biblatex, you'll have to produce a .tex file
> and run latex and biber yourself.
> -- jgm

and this [issue](https://github.com/jgm/pandoc/issues/2795#issuecomment-198560703) in 2016:

> If you want pandoc to use pandoc-citeproc to generate the bibliography, don't use the --biblatex option.
> If you use --biblatex, pandoc will generate biblatex citation commands instead of resolved citations. You'll need to process the resulting latex file using biber, just as you would normally if you were using biblatex. If you want to go this way, you'll need to use pandoc to produce a latex file and issue the latex and biber commands manually. Pandoc doesn't attempt to run bibtex or biber if you choose a PDF output file.
> -- jgm

In short, with either `natbib` or `biblatex`, you may not have the bibliography in the pdf directly from `pandoc`. It also applies for output format since after all `pandoc` doesn't read the bibliography file. 

This is what `citeproc` solves and that's why you need to choose one [cite-method](https://pandoc.org/MANUAL.html#citations) from `citeproc`, `natbib`, or `biblatex`. With `citeproc`, `pandoc` reads the bibliography file from the metadata and renders it according to the provided `CSL(Citation Style Language)` file. `acm-sig-proceedings.csl` can be found on [GitHub](https://github.com/citation-style-language/styles/blob/master/acm-sig-proceedings.csl).

## template

The default latex template can be checked via `pandoc -D latex`.

## metadata-files and default

These are multiple places to set key-values pairs in a YAML format. However, not any pairs are effective.

`pandoc --default=FILE` accepts a default file with [restricted](https://pandoc.org/MANUAL.html#default-files) keys. `metadata-files` are used in default file, but not [YAML metadata block](https://pandoc.org/MANUAL.html#extension-yaml_metadata_block) of a document.

## inclusion

`pandoc` support merging files sequentially by `pandoc section1.md section2.md ...`. To include a file, you may use a filter e.g. [pandoc-include](https://github.com/DCsunset/pandoc-include) (used in this repo) or [pandoc/lua-filter](https://github.com/pandoc/lua-filters/blob/master/include-files/README.md) (not used here).

## unicode

`albatross 0x222A` can check which font contain `u+222A`.

I hope to use unicode in markdown and have them rendered correctly in the pdf. It's more tricky if I also hope to keep the unicode in the html output, which means I would prefer to use `∪`(U+222A) rather than `$\cup$` in the markdown. Let's assume it's a valid requirement. This set-union symbol is not included in `\usepackage[utf8]{inputenc}`. Even it's in `\usepackage[utf8x]{inputenc}`, `utf8x` is not suggested any more.

# Reference

https://ulriklyngs.com/post/2018/07/18/how-to-write-acm-articles-with-r-markdown/
https://github.com/PDA-UR/mdpubs/blob/master/README.md
https://github.com/wgroeneveld/brainbaking/blob/master/content/post/2021/02/writing-academic-papers-in-markdown.md