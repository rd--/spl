# Patterns, Streams

# Lonce

- _Lonce(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ once and then end.

	Lonce(1).upToEnd = [1]
	Lonce(Lseries(1, 1, 3)).upToEnd = [1 2 3]

# Lforever

- _Lforever(anObject)_

If _anObject_ is a stream, answer a stream that will reset and continue whenever it ends,
else answer a stream that will answer _anObject_ forever.

	Lforever(1).next(9) = [1 1 1 1 1 1 1 1 1]
	Lforever(Lseries(1, 1, 3)).next(9) = [1 2 3 1 2 3 1 2 3]

# Lconstant

- _Lconstant(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ forever.

	Lconstant(1).next(3) = [1 1 1]
	Lconstant(Lseries(1, 1, 3)).upToEnd = [1 2 3]

# Lunfold

- _Lunfold(aBlock:/1, start)_
- _Lunfold(α, β, γ)_ ⟹ _Lunfold(α, β).take(γ)_

Answer a stream that is first _start_, and applies _aBlock_ to the previous value to derive each next value.

	Lunfold({ :each | each + 1 }, 1, 9).upToEnd = [1 .. 9]

# Lseries

- _Lseries(start, step, length)_

Arithmetic series from _start_, incrementing by _step_, for _length_ places.

	Lseries(1, 1, 9).upToEnd = [1 .. 9]

# Lgeom

- _Lgeom(start, grow, length)_

Geometric series from _start_, incrementing by _grow_, for _length_ places.

	Lgeom(1, 2, 9).upToEnd = [1 2 4 8 16 32 64 128 256]

# Lrand

- _Lrand(aCollection)_
- _Lrand(α, β)_ ⟹ Lrand(α).take(β)

Select elements from _aCollection_ at random.

	Lrand([1 3 5 7 9], 99).upToEnd.asSet = [1 3 5 7 9].asSet

# Lat

- _Lat(list, indices)_

At each step answer _at_ of _indices_ into _list_.

	let l = [1, 3 .. 23]; Lat(l, Librown(1, l.size, 2, 99)).upToEnd.plot

# LatFold

- _LatFold(list, indices)_

At each step answer _atFold_ of _indices_ into _list_.

	LatFold([1 3 5 7 9], Lseries(1, 1, 11)).upToEnd = [1 3 5 7 9 7 5 3 1 3 5]

# LatWrap

- _LatWrap(list, indices)_

At each step answer _atWrap_ of _indices_ into _list_.

	LatWrap([1 3 5 7 9], Lseries(1, 1, 11)).upToEnd = [1 3 5 7 9 1 3 5 7 9 1]

# Laccum

- Laccum(input)_

Answer a stream that accumulates the sum of _input_.

	Laccum(Lseries(1, 1, 9)).upToEnd = [1 3 6 10 15 21 28 36 45]

# Lcat

- _Lcat(list)_

Apply _Lonce_ at each element in _list_ and sequence the answers.

	Lcat([Lgeom(1, 3, 3), -1, Lseries(1, 3, 3)]).upToEnd = [1 3 9 -1 1 4 7]

# Ln

- _Ln(α, β)_ ⟹ _α.repeat(β)_

Repeat α β times.

	Lseries(1, 3, 3).repeat(2).upToEnd [1 4 7 1 4 7]

# Lseq

- _Lseq(α, β)_ ⟹ _Ln(Lcat(α), β)_

Repeat the _Lcat_ of α β times.

	Lseq([Lgeom(1, 3, 3), -1, Lseries(1, 3, 3)], 2).upToEnd = [1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]

# Lcyc

- _Lcyc(α)_ ⟹ _Lseq(α, inf)_

Infinite _Lseq_.

	Lcyc([Lgeom(1, 3, 3), -1]).next(8) = [1 3 9 -1 1 3 9 -1]

# Ltuple

- _Ltuple(list, repeats)_

Apply _Lforever_ at each element in _list_, and at each iteration answer an array of the next answer of each list item.
When any of list item ends, that repeat and all of the list items are reset.

	Ltuple([Lcyc([1 .. 5]), Lseq([5 6 7], 2)], 1).upToEnd = [1 5; 2 6; 3 7; 4 5; 5 6; 1 7; 1 5]

# Llace

- _Llace(list, length)_

Apply _Lforever_ at each element in _list_ and interlace the elements of the answers.
This is a kind of _transposition_

	Llace([1, Lcyc([2 5]), Lcyc([3 4])], 8).upToEnd = [1 2 3 1 5 4 1 2]

# LdupEach

- _LdupEach(input, repeats)_

Duplicate each _input_ item _repeats_ number of times.

	LdupEach(Lseries(1, 3, 5), Lseq([2 3], inf)).upToEnd = [1 1 4 4 4 7 7 10 10 10 13 13]

# LremDup

- _LremDup(input)_

Remove successive duplicates from _input_.

	LremDup(LdupEach(Lseries(1, 3, 5), 2)).upToEnd = [1 4 7 10 13]

# Ltake

- _Ltake(α, β)_ ⟹ _α.take(β)_

Answer a stream that answers at most β elements of α and thereafter answers _nil_.

	Lforever(1).take(9).upToEnd = [1 1 1 1 1 1 1 1 1]

# Lcollect

- _Lcollect(α, β)_ ⟹ _α.collect(β)_

Answer a stream that applies β at each element of α.

	Lseries(1, 1, 5).collect { :each | each * each }.upToEnd = [1 4 9 16 25]

# Lselect

- _Lselect(α, β)_ ⟹ _α.select(β)_

Answer a stream that skips over items from α that do not answer true for the predicate β.

	Lseries(1, 1, 9).select(even:/1).upToEnd = [2 4 6 8]

# Lwhite

- _Lwhite(low, high, length)_

Random values that follow a uniform distribution.

	Lwhite(-1, 1, 99).upToEnd.plot

# Lbrown

- _Lbrown(low, high, step, length)_

Brownian motion between _low_ and _high_ with maximum step size _step_.
Steps have uniform distribution.

	Lbrown(-1, 1, 1 / 100, 99).upToEnd.plot

# Librown

- _Librown(low, high, step, length)_

Integer brownian motion between _low_ and _high_ with maximum step size _step_.
Steps have uniform distribution, and exclude the possibility of a zero step.

	Librown(1, 99, 3, 99).upToEnd.plot

# Lbeta

- _Lbeta(low, high, p1, p2, length)_

Random values that follow an Eulerian Beta distribution.

Biased low:

	Lbeta(0, 1, 1 / 3, 3, 99).upToEnd.plot

Biased high:

	Lbeta(0, 1, 3, 1 / 3, 99).upToEnd.plot

# Lcauchy

- _Lcauchy(mean, spread, length)_

Random values that follow a Cauchy distribution.

	Lcauchy(0, 1 / 9, 99).upToEnd.plot

# Lbind

- _Lbind(aRecord)_

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

A random linear sequence:

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
