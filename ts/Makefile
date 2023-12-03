dist:
	deno run --allow-net --allow-read --allow-env mk-dist.js | grep -v "//#" > ../dist/sl.js

check-ts:
	deno check --config deno.json *.ts

fmt-ts:
	deno fmt --use-tabs --single-quote

deno=rlwrap --always-readline deno
cli=$(deno) run --allow-read --allow-env --allow-net --allow-run --allow-write --unstable cli.ts --dir=../sl

spl-repl-core:
	$(cli) replPerLine --strict

spl-repl:
	$(cli) replPerLine StandardLibrary --strict

spl-repl-non-strict:
	$(cli) replPerLine StandardLibrary

spl-repl-unsafe:
	$(cli) replPerLine --unsafe

spl-repl-verbose:
	$(cli) replPerLine StandardLibrary --strict --verbose

spl-repl-bm:
	$(cli) replPerLine StandardLibrary BenchmarkLibrary --strict

spl-repl-bm-unsafe:
	$(cli) replPerLine StandardLibrary BenchmarkLibrary --unsafe

spl-repl-sc:
	$(cli) replPerLine StandardLibrary SuperColliderLibrary --strict

spl-repl-ui:
	$(cli) replPerLine StandardLibrary SuperColliderLibrary SmallKansasLibrary --strict

spl-server:
	$(cli) sc tcpServer --port=3010

ln-stc:
	ln -s ~/sw/stsc3 lib/
	ln -s ~/sw/jssc3 lib/

clean:
	rm -f *~
