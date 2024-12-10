all:
	echo "spl"

clean:
	rm -f sl/*/*.sl.js
	rm -f js/sl.js

push-all:
	r.gitlab-push.sh spl

remote-update:
	ssh rd@rohandrape.net "(cd rohandrape.net/pub/spl ; git pull)"

remote-dist:
	sftp rd@rohandrape.net:rohandrape.net/pub/spl/dist/ <<< $'put dist/sl.js'

tags:
	etags --regex=@config/spl.tag sl/*/*.sl

indent-sl:
	spl-indent sl/*/*.sl

indent-help:
	spl-indent Help/Reference/*.sl

indent-programs:
	spl-indent Program/SuperCollider/Graph/*.sl Program/SuperCollider/Ugen/*.sl

indent-ts:
	(cd ts ; make format-ts)

doctest:
	doctest -Wno-x-partial -Wno-incomplete-uni-patterns hs

help-index:
	(cd Help; ls Guide/*.help.sl Reference/*.help.sl Index/*.help.sl Definitions/*.help.sl Terse/*.help.sl > Index.text)

update-cache:
	(cd sl; make)

clear-cache:
	rm -f .cache/*.js
