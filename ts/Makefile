dist:
	deno run --allow-net --allow-read --allow-env mk-dist.js | grep -v "//#" > ../dist/sl.js

check-ts:
	deno check --config deno.json *.ts

deno=rlwrap --always-readline deno
cli=$(deno) run --allow-read --allow-env --allow-net --unstable cli.ts --dir=../sl

spl-repl-core:
	$(cli) replPerLine --strict

spl-repl:
	$(cli) replPerLine Meta-StandardLibrary --strict

spl-repl-non-strict:
	$(cli) replPerLine Meta-StandardLibrary

spl-repl-unsafe:
	$(cli) replPerLine --unsafe

spl-repl-verbose:
	$(cli) replPerLine --strict --verbose

spl-repl-bm:
	$(cli) replPerLine Meta-StandardLibrary Meta-BenchmarkLibrary --strict

spl-repl-bm-unsafe:
	$(cli) replPerLine Meta-StandardLibrary Meta-BenchmarkLibrary --unsafe

spl-repl-sc:
	$(cli) replPerLine Meta-StandardLibrary Meta-SuperColliderLibrary --strict

spl-repl-ui:
	$(cli) replPerLine Meta-StandardLibrary Meta-SuperColliderLibrary Meta-SmallKansasLibrary --strict

spl-server:
	$(cli) sc udpServer 3010

ln-stc:
	ln -s ~/sw/stsc3 lib/
	ln -s ~/sw/jssc3 lib/

clean:
	rm -f *~
