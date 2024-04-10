# TableRand

- _TableRand(trig, bufNum)_

Select random value in (0,1) at each trigger input.
The value follows the probability density function given in the associated table.

- trig: generate new random output value on each trigger
- bufNum: table giving probability density function for random number generation

Randomly set the frequency of a sine oscillator according to an indicated probablity table:

```
let k = 8;
let tbl = [0 0 0 0 1 0 1 0 1 0 1 0 1 0].asRandomTable(1111).asLocalBuf;
let w = TrigRoundRobin(k * 2, Impulse(k, 0).kr);
let f = TableRand(w, tbl).LinExp(0, 1, 111, 1111);
let o = SinOsc(f, 0) * Perc(w, 1 / 111, 1, -1);
o.Splay / 3
```

Generate two distinct probablity tables for each of the inputs to a frequency modulation granular system,
carrier and modulation frequencies and modulation index:

```
let tbl = { :trig :dist :lo :hi |
	TableRand(trig, dist.asRandomTable(128).asLocalBuf).LinExp(0, 1, lo, hi)
};
let x = MouseX(7, [7 * 11, 11 * 23], 1, 0.2);
let tr = Dust(x).kr;
let carFreq = [
	tbl(tr, [0 1 0 0 1 0 0 0 1 0], 55, 555),
	tbl(tr, [1 0 1 1 0 1 1 1 0 1], 55, 555)
];
let modFreq = carFreq * [
	tbl(tr, [1 0 0 1 0 0 1], 1, 23),
	tbl(tr, [0 1 1 0 1 1 0], 1, 23)
].RoundTo(1);
let index = [
	tbl(tr, [0 0 0 1], 1, 23),
	tbl(tr, [1 0 0 0], 1, 23)
];
GrainFm(1, tr, 7 / x, carFreq, modFreq, index, 0, -1, 512).Mix / 23 / 7
```

* * *

See also: asRandomTable

Categories: Ugen
