all:
	spl rewriteFile */*.sl

clean:
	rm -f */*.sl.js

mk-tags:
	etags --regex='/\t\([^ ]+\)/\1/' */*.sl */*/*.sl
