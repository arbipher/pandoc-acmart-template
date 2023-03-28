FILTER = filter
REFERENCE = reference

pandoc-filters:
	wget -O $(FILTER)/columns.lua https://raw.githubusercontent.com/jdutant/columns/master/columns.lua
	pip3 install pandoc-include

reference-acmart:
	wget -O $(REFERENCE)/acmart.zip https://github.com/borisveytsman/acmart/archive/primary.zip
	rm -rf $(REFERENCE)/acmart-primary
	unzip $(REFERENCE)/acmart.zip -d $(REFERENCE)
	rm $(REFERENCE)/acmart.zip

reference-acm-csl:
	wget -O acm-sig-proceedings.csl https://raw.githubusercontent.com/citation-style-language/styles/master/acm-sig-proceedings.csl

dependency: pandoc-filters reference-acmart reference-acm-csl
	@echo All dependency is set.