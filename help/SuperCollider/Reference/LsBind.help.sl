# LsBind

- _LsBind(aRecord)_

Transform a dictionary of streams into a stream of dictionaries.

An instrument that releases itself (ie. no gate):

```
let ctl = (
	freq: 440,
	amp: 0.1,
	release: 1,
	detune: 1.01,
	cutoff: 5000,
	q: 0.5
).localControls;
let env = Linen(Impulse(0, 0), 0, 1, ctl::release, 2);
let osc = Saw([ctl::freq, ctl::freq * ctl::detune]) * env;
let sig = Rlpf(osc, XLine(ctl::cutoff, 100, ctl::release), 1 / ctl::q) * ctl::amp;
UgenGraph('saw', sig).send
```

Random linear sequence:

```
LsBind(
	instrument: 'saw',
	dur: LsXRand(1 / [23 19 17 13 11 7 5 3 1], inf),
	release: LsRand(5 / [17 13 11 7 5 3 1], inf),
	freq: LsXRand([1 .. 23] * 111, inf),
	amp: LsRand(1 / [99 77 55 33 11], inf),
	detune: LsRand([3 2 1.5 1 0.5] / 100 + 1, inf),
	cutoff: LsRand(1000 * [1 .. 9], inf)
).play
```

Dyads courtesy array expansion:

```
LsBind(
	instrument: 'saw',
	dur: 1 / 5,
	sustain: 3,
	freq: LsTuple({ LsXRand([1 .. 23] * 55, inf) } ! 2, inf),
	amp: LsRand(1 / [99 77 55 33 11], inf),
	detune: LsRand([3 2 1.5 1 0.5] / 100 + 1, inf)
).play
```

A very similar instrument with a _gate_ control:

```
let ctl = (
	freq: 440,
	detune: 1.01,
	cutoff: 5000,
	q: 0.5,
	amp: 0.1,
	gate: 1,
	attack: 0.01,
	release: 1
).localControls;
let env = Asr(ctl::gate, ctl::attack, ctl::release, -4).FreeSelfWhenDone;
let osc = Saw([ctl::freq, ctl::freq * ctl::detune]) * env;
let sig = Rlpf(osc, ctl::cutoff, 1 / ctl::q) * ctl::amp;
UgenGraph('saw', sig).send
```

A very similar random linear sequence with _sustain_ and _gate_ parameters:

```
LsBind(
	instrument: 'saw',
	gate: 1,
	dur: LsXRand(1 / [23 19 17 13 11 7 5 3 1], inf),
	sustain: LsRand(3 / [17 13 11 7 5 3 1], inf),
	release: LsRand(5 / [17 13 11 7 5 3 1], inf),
	freq: LsXRand([1 .. 23] * 111, inf),
	amp: LsRand(1 / [99 77 55 33 11], inf),
	detune: LsRand([3 2 1.5 1 0.5] / 100 + 1, inf),
	cutoff: LsRand(1000 * [1 .. 9], inf)
).play
```
