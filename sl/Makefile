all:
	spl cacheRewriteFile */*.sl
	(cd ../.cache ; make format ; make lint)

clean:
	rm -f ../.cache/*.js

mk-tags:
	etags --regex='/\t\([^ ]+\)/\1/' */*.sl */*/*.sl
