PRESENTATION=couchbase-and-rails

compress: $(PRESENTATION).pdf
	pdftk $(PRESENTATION).pdf dump_data_utf8 > $(PRESENTATION).meta.txt
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(PRESENTATION)-compressed.pdf $(PRESENTATION).pdf
	pdftk $(PRESENTATION)-compressed.pdf update_info_utf8 $(PRESENTATION).meta.txt output $(PRESENTATION).pdf
	rm $(PRESENTATION)-compressed.pdf $(PRESENTATION).meta.txt

$(PRESENTATION).pdf: $(PRESENTATION).tex beamerthemecouchbase.sty
	lualatex $(PRESENTATION).tex
