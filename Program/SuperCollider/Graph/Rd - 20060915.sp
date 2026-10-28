/* 20060915 ; rd */
{
	let np = 12;
	let tr = dust(0.075);
	let prt = { :d :a |
		{ :cf |
			let rln = { :r :a :b |
				tLine(a + tRand(0, r, tr), b, d, tr)
			};
			let f = [
				cf,
				tRand(cf, cf + 2, tr)
			] + (sinOsc(rln(1, 5, 0.01), 0) * rln(10, 20, 0));
			sinOsc(f, 0) * decay2(tr, tRand(0.1, 0.2, tr), d) * a
		}
	};
	let fp = { tRand(220, 660, tr) } ! np;
	fp.collect(prt(tRand(4, 7, tr), tRand(0.01, 0.05, tr))).sum
} !> 5
