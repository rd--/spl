all:
	make update-cache tidy-cache

update-cache:
	spl cacheRewriteFile */*.sl

tidy-cache:
	(cd ../.cache ; make format ; make lint)

clean:
	rm -f ../.cache/*.js

mk-tags:
	etags --regex='/\t\([^ ]+\)/\1/' */*.sl */*/*.sl
