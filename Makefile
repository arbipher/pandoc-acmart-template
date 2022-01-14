%.pdf : %.md
		pandoc $< -o build/$@ --template=template.tex --csl=acm-sig-proceedings.csl --citeproc

debug : example.md
		pandoc $< -o example_wsl.html -s --csl=acm-sig-proceedings.csl --citeproc

clean :
		rm -f build/*