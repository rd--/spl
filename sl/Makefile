all:
	spl cacheRewriteFile */*.sl

clean:
	rm -f .cache/*.js

mk-tags:
	etags --regex='/\t\([^ ]+\)/\1/' */*.sl */*/*.sl
