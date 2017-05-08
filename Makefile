
slides.pdf: slides.md
	pandoc -s --latex-engine=xelatex \
	 -t beamer --slide-level 2 \
	 --bibliography=bibliography.bib \
	 --csl=acm-sig-proceedings.csl \
	 $^ -o $@

# slides.pdf: slides.tex
# 	xelatex slides
# 	biber slides
# 	xelatex slides

slides.tex: slides.md
	pandoc -s --latex-engine=xelatex \
	 -t beamer --slide-level 2 \
	 --biblatex --bibliography=bibliography.bib \
	 --csl=acm-sig-proceedings.csl \
	 $^ -o $@

clean:
	rm -f slides.tex
	rm -f slides.pdf
	rm -f *.py
	rm -f *.html
	rm -f *.aux
	rm -f *.bbl
	rm -f *bcf
	rm -f *.log
	rm -f *.nav
	rm -f *.out
	rm -f *.run.xml
	rm -f *.snm
	rm -f *.tex
	rm -f *.toc

commit:
	git add slides.md
	git commit -m "Update"

