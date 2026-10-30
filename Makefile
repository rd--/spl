all:
	echo "spl"

clean:
	rm -f js/sl.js

add-images:
	git add Help/Image/*.svg
	git add Help/Image/*.png

add-help-files:
	git add Help/Reference/*.sl
	git add Help/Guide/*.sl

add-all: add-images add-help-files

push-all:
	r.gitlab-push.sh spl
	r.github-push.sh spl

push-rd:
	git push ssh://rd@rohandrape.net/~rd/sw/spl main

remote-update:
	ssh rd@rohandrape.net "(cd rohandrape.net/pub/spl ; git pull)"

remote-dist:
	sftp rd@rohandrape.net:rohandrape.net/pub/spl/dist/ <<< $'put dist/sl.js'

tags:
	etags --regex=@config/spl.tag Package/*/*.sl

indent-spl:
	spl-indent Package/*/*.sl

indent-help:
	spl-indent Help/Reference/*.sl

indent-programs:
	spl-indent Program/SuperCollider/Graph/*.sp Program/SuperCollider/Unit*/*.sp

indent-ts:
	(cd ts ; make format-ts)

doctest:
	doctest -Wno-x-partial -Wno-incomplete-uni-patterns hs

help-index:
	(cd Help; ls Guide/*.help.sl Reference/*.help.sl Index/*.help.sl Definitions/*.help.sl Terse/*.help.sl > Index.text)

update-cache:
	(cd Package; make)

clear-cache:
	rm -f .cache/*.js

check-method-spacing:
	python3 py/check-method-spacing.py Package/*/*.sl

check-doctest-prefixes:
	python3 py/check-doctest-prefixes.py Package/*/*.sl

check-consecutive-newlines:
	python3 py/check-consecutive-newlines.py Package/*/*.sl

check-commented-methods:
	python3 py/check-commented-methods.py Package/*/*.sl

check-reference-names:
	python3 py/check-reference-names.py Help/Reference/*.sl

check-case-sensitive-file-names:
	python3 py/check-case-sensitive-file-names.py Help

check-non-doctest-code-blocks:
	python3 py/check-non-doctest-code-blocks.py Help/Reference/*.sl

check-text-encoding:
	python3 py/check-text-encoding.py Package/*/*.sl Help/*/*.sl Program/SuperCollider/*/*.sp Help/Image/*.svg

check-all: \
	check-commented-methods \
	check-consecutive-newlines \
	check-doctest-prefixes \
	check-method-spacing \
	check-non-doctest-code-blocks \
	check-reference-names \
	check-text-encoding

sort-method-definitions:
	python3 py/sort-method-definitions.py Package/*/*.sl

sort-guides:
	python3 py/sort-guides.py Help/*/*.sl

sort-see-also:
	python3 py/sort-see-also.py Help/*/*.sl
