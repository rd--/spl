all:
	echo "spl"

clean:
	rm -f js/sl.js

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
	spl-indent Program/SuperCollider/Graph/*.sp Program/SuperCollider/Ugen/*.help.sl

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
