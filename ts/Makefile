dist:
	deno run --allow-net --allow-read --allow-env mk-dist.js | grep -v "//#" > ../dist/sl.js

check-ts:
	deno check --config deno.json *.ts

deno=rlwrap --always-readline deno
cli=$(deno) run --allow-read --allow-env --allow-net --unstable cli.ts --dir=../sl

spl-repl:
	$(cli) replPerLine --strict

spl-repl-non-strict:
	$(cli) replPerLine

spl-repl-unsafe:
	$(cli) replPerLine --unsafe

spl-repl-verbose:
	$(cli) replPerLine --strict --verbose

spl-repl-bm:
	$(cli) replPerLine bm.sl --strict

spl-repl-sc:
	$(cli) replPerLine sc.sl --strict

spl-repl-ui:
	$(cli) replPerLine sc.sl sk.sl --strict

spl-server:
	$(cli) sc udpServer 3010

ln-stc:
	ln -s ~/sw/stsc3 lib/
	ln -s ~/sw/jssc3 lib/

clean:
	rm -f *~
