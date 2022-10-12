# Makefile inclusion

.DEFAULT_GOAL := all
.PHONY: all demo snippet

BUILD = build
include Makefile.pandoc-acm.mk

# Tasks
all:
	mkdir -p $(BUILD)

clean:
	rm -f $(BUILD)/*

snippet: feature1.snp feature2.snp

%.snp: snippet/%.md
	pandoc $< -o $(BUILD)/$*.html $(ARGS-HTML) --resource-path=snippet
	pandoc $< -o $(BUILD)/$*.tex  $(ARGS-PDF-MINIMAL) --resource-path=snippet
	pandoc $< -o $(BUILD)/$*.pdf  $(ARGS-PDF-MINIMAL) --resource-path=snippet

gallary: snippet/gallary.md
	pandoc $< -o $(BUILD)/gallary.html $(ARGS-HTML) -s --resource-path=snippet
	pandoc $< -o $(BUILD)/gallary.tex $(ARGS-PDF-MINIMAL) --resource-path=snippet
	pandoc $< -o $(BUILD)/gallary.pdf $(ARGS-PDF-MINIMAL) --resource-path=snippet

demo: demo/main.md
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
