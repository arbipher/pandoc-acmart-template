# basic

BUILD = build

all:
	mkdir -p $(BUILD)

clean :
		rm -f $(BUILD)/*

# pandoc args

OPT-CITEPROC = \
	--csl=acm-sig-proceedings.csl --citeproc \
	
OPT-PDF = \
	--listings \
	--template=template.tex \
	--pdf-engine=lualatex

ARGS-BASIC = \
	--filter pandoc-include \
	--listings \
	--metadata-file default.yaml

ARGS-HTML = \
	$(OPT-CITEPROC) \
	$(ARGS-BASIC)

# `--filter` should be ahead of `--citeproc`
ARGS-PDF = \
	$(ARGS-BASIC) \
	$(OPT-CITEPROC) \
	$(OPT-PDF)

# projects

demo : demo/main.md
	pandoc $< -o $(BUILD)/$@.pdf $(ARGS-PDF) --resource-path=demo

# Not used
#
# -f markdown+implicit_header_references \
# -V 'mainfont:DejaVuSerif' \
# -V 'sansfont:DejaVuSans' \
# -V 'monofont:DejaVuSansMono' \
# -V 'mathfont:TeXGyreDejaVuMath-Regular'
