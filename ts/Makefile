dist:
	deno run --allow-net --allow-read --allow-env mk-dist.js | grep -v "//#" > ../dist/sl.js

check-ts:
	deno check --config deno.json *.ts

spl-repl:
	rlwrap --always-readline deno run --allow-read --allow-env --allow-net cli.ts --dir=../sl replPerLine --strict

spl-repl-sc:
	rlwrap --always-readline deno run --allow-read --allow-env cli.ts --dir=../sl replPerLine sc.sl --strict

spl-repl-ui:
	rlwrap --always-readline deno run --allow-read --allow-env cli.ts --dir=../sl replPerLine sc.sl sk.sl --strict

spl-server:
	deno run --allow-read --allow-env --allow-net --unstable cli.ts --dir=../sl sc udpServer 3010

ln-stc:
	ln -s ~/sw/stsc3 lib/
	ln -s ~/sw/jssc3 lib/

clean:
	rm -f *~
