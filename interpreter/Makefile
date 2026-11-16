spl = (cd ../Package ; make update-cache) ; sh ./spl.sh

symlink-cli:
	rm -f ~/opt/bin/spl
	ln -s ~/sw/spl/interpreter/spl.sh ~/opt/bin/spl

spl-repl:
	$(spl) replPerLine --lib=StandardLibrary --strict

spl-repl-core:
	$(spl) replPerLine --strict

spl-repl-non-strict:
	$(spl) replPerLine --lib=StandardLibrary

spl-repl-unsafe:
	$(spl) replPerLine --unsafe

spl-repl-verbose:
	./spl replPerLine --lib=StandardLibrary --strict --verbose

spl-repl-bm:
	$(spl) replPerLine --lib=StandardLibrary --lib=BenchmarkLibrary --strict

spl-repl-bm-unsafe:
	$(spl) replPerLine --lib=StandardLibrary --lib=BenchmarkLibrary --unsafe

spl-repl-sc:
	$(spl) replPerLine --lib=StandardLibrary --lib=SuperColliderLibrary --strict

spl-repl-sc-verbose:
	./spl replPerLine --lib=StandardLibrary --lib=SuperColliderLibrary --strict --verbose

spl-repl-ui:
	$(spl) replPerLine --lib=StandardLibrary --lib=SuperColliderLibrary --lib=SmallKansasLibrary --strict

spl-server:
	$(spl) sc tcpServer --port=3010

dist:
	deno run \
	--allow-net \
	--allow-read \
	--allow-write \
	--allow-env \
	../utilities/mk-dist.js \
	../interpreter/sl.ts \
	../dist/sl.js

check-ts:
	deno check --allow-import --config deno.json *.ts

format-ts:
	deno fmt --use-tabs --single-quote

lint-ts:
	deno lint

mk-ln:
	ln -s ~/sw/stsc3 interpreter/libraries/
	ln -s ~/sw/jssc3 interpreter/libraries/
	ln -s ~/sw/jssc3/utilities/mk-dist.js .

clean:
	rm -f *~
