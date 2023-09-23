print-summary:
	(for i in *.sl ; do cat $$i | awk 'NR==1{gsub("#", "-"); print}' ; done) | LC_COLLATE=C sort -d

eval-inline-code:
	grep -h -P '^\t' *.sl | (cd ../../ts; make spl-repl-verbose)
