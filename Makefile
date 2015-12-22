MainFile = Main
Target = NameHere.pdf

all: $(MainFile).tex
	make available; make pdf; make clean; make rename

pdf: $(MainFile).tex
	pdflatex $(MainFile).tex 
	biber $(MainFile)
	pdflatex $(MainFile).tex

rename:
	mv $(MainFile).pdf $(Target)

available:
	mv Generated_Files/* .

clean:
	mv *.log *.aux *.xml *.bcf *.toc *.blg *.bbl Generated_Files/

init:
	mkdir Generated_Files/
	mkdir Figures/