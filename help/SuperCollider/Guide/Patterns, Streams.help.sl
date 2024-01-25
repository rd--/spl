# Patterns, Streams

- Lonce(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ once and then end.

	Lonce(1).upToEnd = [1]
	Lonce(Lseries(1, 1, 3)).upToEnd = [1 2 3]

- Lforever(anObject)_

If _anObject_ is a stream, answer a stream that will reset and continue whenever it ends,
else answer a stream that will answer _anObject_ forever.

	Lforever(1).next(9) = [1 1 1 1 1 1 1 1 1]
	Lforever(Lseries(1, 1, 3)).next(9) = [1 2 3 1 2 3 1 2 3]

- Lconstant(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ forever.

	Lconstant(1).next(3) = [1 1 1]
	Lconstant(Lseries(1, 1, 3)).upToEnd = [1 2 3]

- _Lseries(start, step, length)_

Arithmetic series from _start_, incrementing by _step_, for _length_ places.

	Lseries(1, 1, 9).upToEnd = [1 .. 9]

- _Lgeom(start, grow, length)_

Geometric series from _start_, incrementing by _grow_, for _length_ places.

	Lgeom(1, 2, 9).upToEnd = [1 2 4 8 16 32 64 128 256]

- _Lrand(aCollection)_
- _Lrand(aCollection, anInteger)_ ⟹ Lrand(aCollection).take(anInteger)

Select elements from _aCollection_ at random.

	Lrand([1 3 5 7 9], 99).upToEnd.asSet = [1 3 5 7 9].asSet

- _collect(aStream, aBlock:/1)_

Answer a stream that applies _aBlock_ at each element of _aStream_.

	Lseries(1, 1, 5).collect { :each | each * each }.upToEnd = [1 4 9 16 25]

- _select(aStream, aBlock:/1)_

Answer a stream that skips over items from _aStream_ that do not answer true for the predicate _aBlock_.

	Lseries(1, 1, 9).select(even:/1).upToEnd = [2 4 6 8]

- _Lbind(aDictionary)_

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
Lbind(
	instrument: 'saw',
	dur: Lxrand(1 / [23 19 17 13 11 7 5 3 1], inf),
	release: Lrand(5 / [17 13 11 7 5 3 1], inf),
	freq: Lxrand([1 .. 23] * 111, inf),
	amp: Lrand(1 / [99 77 55 33 11], inf),
	detune: Lrand([3 2 1.5 1 0.5] / 100 + 1, inf),
	cutoff: Lrand(1000 * [1 .. 9], inf)
).play
```

Dyads courtesy array expansion:

```
Lbind(
	instrument: 'saw',
	dur: 1 / 5,
	sustain: 3,
	freq: Ltuple({ Lxrand([1 .. 23] * 55, inf) } ! 2, inf),
	amp: Lrand(1 / [99 77 55 33 11], inf),
	detune: Lrand([3 2 1.5 1 0.5] / 100 + 1, inf)
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

```
Lbind(
	instrument: 'saw',
	gate: 1,
	dur: Lxrand(1 / [23 19 17 13 11 7 5 3 1], inf),
	sustain: Lrand(3 / [17 13 11 7 5 3 1], inf),
	release: Lrand(5 / [17 13 11 7 5 3 1], inf),
	freq: Lxrand([1 .. 23] * 111, inf),
	amp: Lrand(1 / [99 77 55 33 11], inf),
	detune: Lrand([3 2 1.5 1 0.5] / 100 + 1, inf),
	cutoff: Lrand(1000 * [1 .. 9], inf)
).play
```

- _Lbeta(low, high, p1, p2, length)_

Random values that follow an Eulerian Beta Distribution.

Biased low:

	Lbeta(0, 1, 1 / 3, 3, 99).upToEnd.plot

Biased high:

	Lbeta(0, 1, 3, 1 / 3, 99).upToEnd.plot

- Lcauchy(mean, spread, length)_

Random values that follow a Cauchy Distribution.

	Lcauchy(0, 1 / 9, 99).upToEnd.plot
