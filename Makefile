all:
	echo "spl"

clean:
	rm -f js/sl.js

push-all:
	r.gitlab-push.sh spl
