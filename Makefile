main-full : main-full.md
		pandoc $< -o build/$@.pdf --template=template.tex \
			--csl=acm-sig-proceedings.csl --citeproc \
			--metadata-file default.yaml

# `--filter` should be ahead of `--citeproc`
main-outline : main-outline.md
		pandoc $< -o build/$@.pdf --template=template.tex \
			--filter pandoc-include \
			--csl=acm-sig-proceedings.csl --citeproc \
			--metadata-file default.yaml

debug : main.md
		pandoc $< -o main.html -s --csl=acm-sig-proceedings.csl --citeproc

clean :
		rm -f build/*