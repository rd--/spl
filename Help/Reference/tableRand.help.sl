# tableRand

- _tableRand([x₁ x₂ …], r)_
- _tableRand(b, t)_

At `List`,
_x_ is a cumulative distribution function and _r_ a random number generator.

At `Ugen`,
select random value in (0,1) at each trigger input _t_.
The value follows the probability density function given in the associated table _b_.

- trig: generate new random output value on each trigger
- bufNum: table giving probability density function for random number generation

Randomly set the frequency of a sine oscillator according to an indicated probablity table:

~~~spl syn=A
let k = 8;
let tbl = [
	0 0 0 0 1 0 1
	0 1 0 1 0 1 0
].randomTable(1111).localBuf;
let w = trigRoundRobin(
	k * 2,
	impulse(k, 0).kr
);
let f = tbl.tableRand(w).linExp(
	0, 1, 111, 1111
);
let e = perc(w, 1 / 111, 1, -1);
let o = sinOsc(f, 0) * e;
o.splay / 3
~~~

Generate two distinct probablity tables for each of the inputs to a frequency modulation granular system,
carrier and modulation frequencies and modulation index:

~~~spl syn=B
let tbl = { :trig :dist :lo :hi |
	dist
	.randomTable(128)
	.localBuf.tableRand(
		trig
	).linExp(0, 1, lo, hi)
};
let x = mouseX(7, [7 * 11, 11 * 23], 1, 0.2);
let tr = dust(x).kr;
let carFreq = [
	tbl(tr, [0 1 0 0 1 0 0 0 1 0], 55, 555),
	tbl(tr, [1 0 1 1 0 1 1 1 0 1], 55, 555)
];
let modFreq = carFreq * [
	tbl(tr, [1 0 0 1 0 0 1], 1, 23),
	tbl(tr, [0 1 1 0 1 1 0], 1, 23)
].round(1);
let index = [
	tbl(tr, [0 0 0 1], 1, 23),
	tbl(tr, [1 0 0 0], 1, 23)
];
grainFm(
	1,
	tr,
	7 / x,
	carFreq,
	modFreq,
	index,
	0,
	-1,
	512
).mix / 23 / 7
~~~

* * *

See also: randomTable

Guides: Unit Generators

Categories: Ugen
