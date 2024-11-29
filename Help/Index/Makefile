print-summary:
	(for i in [*.sl ; do cat $$i | awk 'NR==1{gsub("#", "-"); print}' ; done) | LC_COLLATE=C sort -d

eval-inline-code:
	grep -h -P '^\t' [a-z]*.sl | (cd ../../cmd; make spl-repl-sc-verbose)

lint:
	deno run --allow-read --allow-env --allow-sys npm:markdownlint-cli2 --config ../../config/spl.markdownlint.jsonc *.help.sl
