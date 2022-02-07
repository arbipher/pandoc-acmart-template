# basic

BUILD = build

.PHONY: demo

all:
	mkdir -p $(BUILD)

dependency:
	wget -O filter/columns.lua  https://raw.githubusercontent.com/jdutant/columns/master/columns.lua

clean :
		rm -f $(BUILD)/*

# pandoc args

OPT-CITEPROC = \
	--csl=acm-sig-proceedings.csl --citeproc \
	
OPT-PDF = \
	--template=template.tex \
	--pdf-engine=lualatex

ARGS-BASIC = \
	--filter pandoc-include \
	--lua-filter columns.lua \
	--listings \
	--metadata-file default.yaml

ARGS-HTML = \
	$(OPT-CITEPROC) \
	--standalone \
	$(ARGS-BASIC)

# `--filter` should be ahead of `--citeproc`
ARGS-PDF = \
	$(ARGS-BASIC) \
	$(OPT-CITEPROC) \
	$(OPT-PDF)

# projects

demo : demo/main.md
	pandoc $< -o $(BUILD)/$@.html $(ARGS-HTML) --resource-path=demo
	pandoc $< -o $(BUILD)/$@.pdf $(ARGS-PDF) --resource-path=demo

# Not used
#
# -f markdown+implicit_header_references \
# -V 'mainfont:DejaVuSerif' \
# -V 'sansfont:DejaVuSans' \
# -V 'monofont:DejaVuSansMono' \
# -V 'mathfont:TeXGyreDejaVuMath-Regular'
