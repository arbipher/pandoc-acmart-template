# Makefile inclusion

.DEFAULT_GOAL := all
.PHONY: all demo snippet

BUILD = build
PD = pandoc.exe

include makefiles/dependency.make
include makefiles/pandoc-config.make

# Tasks
all:
	mkdir -p $(BUILD)

clean:
	rm -f $(BUILD)/*

snippet: feature1.snp feature2.snp

%.snp: snippet/%.md
	$(PD) $< -o $(BUILD)/$*.html $(ARGS-HTML) --resource-path=snippet
	$(PD) $< -o $(BUILD)/$*.tex  $(ARGS-PDF-MINIMAL) --resource-path=snippet
	$(PD) $< -o $(BUILD)/$*.pdf  $(ARGS-PDF-MINIMAL) --resource-path=snippet

gallary: snippet/gallary.md
	$(PD) $< -o $(BUILD)/gallary.html $(ARGS-HTML) -s --resource-path=snippet
	$(PD) $< -o $(BUILD)/gallary.tex $(ARGS-PDF-MINIMAL) --resource-path=snippet
	$(PD) $< -o $(BUILD)/gallary.pdf $(ARGS-PDF-MINIMAL) --resource-path=snippet

binding: demo/binding_map.md
	$(PD) $< -o $(BUILD)/$@.tex  $(ARGS-PDF-MINIMAL)  --resource-path=demo
	$(PD) $< -o $(BUILD)/$@.pdf  $(ARGS-PDF-MINIMAL)  --resource-path=demo

demo: demo/main.md
	$(PD) $< -o $(BUILD)/$@.html $(ARGS-HTML) -s --resource-path=demo
	$(PD) $< -o $(BUILD)/$@.tex  $(ARGS-PDF)  --resource-path=demo
	$(PD) $< -o $(BUILD)/$@.pdf  $(ARGS-PDF)  --resource-path=demo

play : demo-pllab/main.md
	$(PD) $< -o $(BUILD)/$@.pdf $(ARGS-PDF) --resource-path=demo-pllab

project : project-checkedc/main.md
	$(PD) $< -o $(BUILD)/$@.html $(ARGS-HTML) --resource-path=project-checkedc
	$(PD) $< -o $(BUILD)/$@.tex  $(ARGS-PDF)  --resource-path=project-checkedc
	$(PD) $< -o $(BUILD)/$@.pdf  $(ARGS-PDF)  --resource-path=project-checkedc

p0 :
	cd dbmc-orig && pdflatex main.tex
	mv dbmc-orig/main.pdf $(BUILD)/dbmc_orig.pdf

p :
	cd dbmc && pdflatex main.tex
	mv dbmc/main.pdf $(BUILD)/dbmc.pdf

# Not used
#
# -f markdown+implicit_header_references \
# -V 'mainfont:DejaVuSerif' \
# -V 'sansfont:DejaVuSans' \
# -V 'monofont:DejaVuSansMono' \
# -V 'mathfont:TeXGyreDejaVuMath-Regular'
