.PHONY: all clean paper

all:  paper 
#\
#    tikz/storage-traditional.pdf \
#    tikz/storage-disaggregated.pdf \
#    tikz/storage-disaggregated-ops.pdf \
#    tikz/ebpf-data.pdf \
#    paper

tikz/%.pdf: tikz/%.tex
	xelatex -output-directory=tikz/ $<
	pdfcrop $@

paper:
	latex-mk --pdflatex main.tex || true

clean:
	rm -f *out *aux *bbl *blg *log *.tex~ *.dvi *.fdb_lat* *.fls
	rm -rf ./tmp/
	rm -f *converted-to.pdf
	rm -f main.pdf
	kill -9 `pidof make` `pidof pdflatex`
