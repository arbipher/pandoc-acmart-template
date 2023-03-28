ifeq ($(OS),Windows_NT)     # is Windows_NT on XP, 2000, 7, Vista, 10...
	detected_OS := Windows
else
	detected_OS := $(shell uname)
endif

ifeq ($(detected_OS),Linux)
	LD := ldd
else
	LD := echo
endif

echo:
	echo $(detected_OS)
	echo $(LD)
	@pwd


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