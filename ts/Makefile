dist:
	deno run --allow-net --allow-read --allow-env mk-dist.js | grep -v "//#" > ../dist/sl.js

check-ts:
	deno check --config deno.json *.ts

format-ts:
	deno fmt --use-tabs --single-quote

lint-ts:
	deno lint

ln-stc:
	ln -s ~/sw/stsc3 lib/
	ln -s ~/sw/jssc3 lib/

clean:
	rm -f *~
