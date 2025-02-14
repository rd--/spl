dist:
	deno run --allow-net --allow-read --allow-write --allow-env ./mk-dist.js ./sl.ts ../dist/sl.js

check-ts:
	deno check --allow-import --config deno.json *.ts

format-ts:
	deno fmt --use-tabs --single-quote

lint-ts:
	deno lint

mk-ln:
	ln -s ~/sw/stsc3 lib/
	ln -s ~/sw/jssc3 lib/
	ln -s ~/sw/jssc3/ts/mk-dist.js .

clean:
	rm -f *~
