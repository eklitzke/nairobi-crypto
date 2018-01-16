.PHONY: all clean nairobi-crypto.pdf

all: nairobi-crypto.pdf

supply.dat: supply.py
	python supply.py

supply.tex: supply.dat makegraph.plt
	gnuplot makegraph.plt

# run pdflatex twice to force pagination to be correct
nairobi-crypto.pdf: nairobi-crypto.tex supply.tex
	pdflatex $<

clean:
	git clean -fX
