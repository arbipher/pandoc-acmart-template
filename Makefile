# basic

BUILD = build

.PHONY: demo snippet

all:
	mkdir -p $(BUILD)

dependency:
	wget -O filter/columns.lua https://raw.githubusercontent.com/jdutant/columns/master/columns.lua

clean :
	rm -f $(BUILD)/*

# pandoc args

OPT-CITEPROC = \
	--csl=acm-sig-proceedings.csl --citeproc \
	
OPT-PDF = \
	--template=template.tex \
	--pdf-engine=lualatex

# -f gfm+yaml_metadata_block \

ARGS-BASIC = \
	--filter pandoc-include \
	--lua-filter filter/columns.lua \
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

ARGS-PDF-MINIMAL = \
	--template=template.tex \
	--pdf-engine=lualatex

snippet : feature1.snp feature2.snp

%.snp: snippet/%.md
	pandoc $< -o $(BUILD)/$*.html $(ARGS-HTML) --resource-path=snippet
	pandoc $< -o $(BUILD)/$*.tex  $(ARGS-PDF-MINIMAL) --resource-path=snippet
	pandoc $< -o $(BUILD)/$*.pdf  $(ARGS-PDF-MINIMAL) --resource-path=snippet

gallary: snippet/gallary.md
	pandoc $< -o $(BUILD)/gallary.html $(ARGS-HTML) -s --resource-path=snippet
	pandoc $< -o $(BUILD)/gallary.tex $(ARGS-PDF-MINIMAL) --resource-path=snippet
	pandoc $< -o $(BUILD)/gallary.pdf $(ARGS-PDF-MINIMAL) --resource-path=snippet

demo : demo/main.md
	pandoc $< -o $(BUILD)/$@.html $(ARGS-HTML) -s --resource-path=demo
	pandoc $< -o $(BUILD)/$@.tex  $(ARGS-PDF)  --resource-path=demo
	pandoc $< -o $(BUILD)/$@.pdf  $(ARGS-PDF)  --resource-path=demo


# Not used
#
# -f markdown+implicit_header_references \
# -V 'mainfont:DejaVuSerif' \
# -V 'sansfont:DejaVuSans' \
# -V 'monofont:DejaVuSansMono' \
# -V 'mathfont:TeXGyreDejaVuMath-Regular'
