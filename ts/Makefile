dist:
	deno bundle --no-check sl.ts ../dist/sl.js

check-ts:
	deno check --config deno.json *.ts

spl-repl-kernel:
	rlwrap --always-readline deno run --allow-read --allow-env cli.ts --dir=../sl replPerLine

spl-repl-stdlib:
	rlwrap --always-readline deno run --allow-read --allow-env cli.ts --dir=../sl --stdlib replPerLine

spl-repl-sc:
	rlwrap --always-readline deno run --allow-read --allow-env cli.ts --dir=../sl --sc replPerLine

spl-server:
	deno run --allow-read --allow-env --allow-net --unstable cli.ts --dir=../sl --sc sc udpServer 3010

ln-stc:
	ln -s ~/sw/stsc3 lib/
	ln -s ~/sw/jssc3 lib/

clean:
	rm -f *~
