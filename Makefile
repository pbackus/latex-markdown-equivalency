all: latex-markdown-equivalency.pdf

%.pdf: %.tex
	latexmk -pdf $<

clean:
	latexmk -c
