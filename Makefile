ARGS = \
	--listings \
	--template=template.tex \
	--csl=acm-sig-proceedings.csl --citeproc \
	--metadata-file default.yaml \
	--pdf-engine=lualatex

# -V 'mainfont:DejaVuSerif' \
# -V 'sansfont:DejaVuSans' \
# -V 'monofont:DejaVuSansMono' \
# -V 'mathfont:TeXGyreDejaVuMath-Regular'

ARGS-INC = \
	--filter pandoc-include \
	$(ARGS)

ARGS-HTML = \
	--filter pandoc-include \
	--metadata-file default.yaml

main-full : main-full.md
		pandoc $< -o build/$@.pdf $(ARGS)

# `--filter` should be ahead of `--citeproc`
main-outline : main-outline.md
		pandoc $< -o build/$@.pdf $(ARGS-INC)

debug : main.md
		pandoc $< -o build/$@.tex $(ARGS-INC)
		pandoc $< -o build/$@.html $(ARGS-HTML)
		pandoc $< -o build/$@.pdf $(ARGS-INC)

clean :
		rm -f build/*