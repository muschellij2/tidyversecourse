all: _book/_main.epub _book/_main.mobi _book/_main.pdf _book/introduction.html Objectives.md Plan.md

_book/_main.pdf: index.Rmd *.Rmd *.bib
	Rscript -e 'options(tinytex.verbose = TRUE); bookdown::render_book(".", output_format = "bookdown::pdf_book",  output_options=list(latex_engine = "xelatex"), encoding = "UTF-8")'

Objectives.md: Objectives.Rmd
	Rscript -e 'rmarkdown::render("Objectives.Rmd", output_format = rmarkdown::github_document())'

Plan.md: Plan.Rmd
	Rscript -e 'rmarkdown::render("Plan.Rmd", output_format = rmarkdown::github_document())'

_book/_main.pdf: index.Rmd *.Rmd *.bib
	Rscript -e 'options(tinytex.verbose = TRUE); bookdown::render_book(".", output_format = "bookdown::pdf_book",  output_options=list(latex_engine = "xelatex"), encoding = "UTF-8")'

_book/introduction.html: index.Rmd *.Rmd *.bib
	Rscript -e 'bookdown::render_book(".", output_format = "bookdown::gitbook", encoding = "UTF-8")'

_book/_main.epub: index.Rmd *.Rmd *.bib 
	Rscript -e 'bookdown::render_book(".", output_format = "bookdown::epub_book", encoding = "UTF-8")'

_book/_main.mobi: _book/_main.epub
	Rscript -e 'bookdown::calibre("_book/_main.epub", "_book/_main.mobi")'

clean:
	rm -rf *.md
	rm -rf _book/*
	rm -f _main.*
	rm -f _main.Rmd
	