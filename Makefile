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

indent:
	spl-indent sl/*/*.sl

doctest:
	doctest -Wno-x-partial -Wno-incomplete-uni-patterns hs
