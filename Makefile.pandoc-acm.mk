__safe:
	@echo pandoc-acm

dependency:
	wget -O filter/columns.lua https://raw.githubusercontent.com/jdutant/columns/master/columns.lua
	pip3 install pandoc-include

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