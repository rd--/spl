all:
	echo "spl/doc/spl/Makefile"

lint:
	deno run \
	--allow-read \
	--allow-env \
	--allow-sys \
	npm:markdownlint-cli2 \
	--config ../../data/config/spl.markdownlint.jsonc \
	*.help.sl
