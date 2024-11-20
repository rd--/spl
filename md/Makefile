all:
	python3 $(HOME)/rf/ref-cf/py/cf.py $(HOME)/rf/ref/ref.bib reading.cf reading.html
	pandoc reading.html -o reading.md

clean:
	rm -f reading.html reading.md
