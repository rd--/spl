# Patterns, Streams

# LsOnce

- _LsOnce(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ once and then end.

	LsOnce(1).upToEnd = [1]
	LsOnce(LsSeries(1, 1, 3)).upToEnd = [1 2 3]

* * *

See also: LsConstant, LsForever

# LsForever

- _LsForever(anObject)_

If _anObject_ is a stream, answer a stream that will reset and continue whenever it ends,
else answer a stream that will answer _anObject_ forever.

	LsForever(1).next(9) = [1 1 1 1 1 1 1 1 1]
	LsForever(LsSeries(1, 1, 3)).next(9) = [1 2 3 1 2 3 1 2 3]

* * *

See also: LsConstant, LsOnce

# LsConstant

- _LsConstant(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ forever.

	LsConstant(1).next(3) = [1 1 1]
	LsConstant(LsSeries(1, 1, 3)).upToEnd = [1 2 3]

* * *

See also: LsForever, LsOnce

# LsUnfold

- _LsUnfold(aBlock:/1, start)_
- _LsUnfold(α, β, γ)_ ⟹ _LsUnfold(α, β).take(γ)_

Answer a stream that is first _start_, and applies _aBlock_ to the previous value to derive each next value.

	LsUnfold({ :each | each + 1 }, 1, 9).upToEnd = [1 .. 9]

* * *

See also: LsCollect, LsSelect

# LsSeries

- _LsSeries(start, step, length)_

Arithmetic series from _start_, incrementing by _step_, for _length_ places.

	LsSeries(1, 1, 9).upToEnd = [1 .. 9]

* * *

See also: LsGeom, LsUnfold

# LsGeom

- _LsGeom(start, grow, length)_

Geometric series from _start_, incrementing by _grow_, for _length_ places.

	LsGeom(1, 2, 9).upToEnd = [1 2 4 8 16 32 64 128 256]

* * *

See also: LsSeries, LsUnfold

# LsRand

- _LsRand(aCollection)_
- _LsRand(α, β)_ ⟹ Lrand(α).take(β)

Select elements from _aCollection_ at random.

	LsRand([1 3 5 7 9], 99).upToEnd.asSet = [1 3 5 7 9].asSet

* * *

See also: LsXRand, LsWhite

# LsAt

- _LsAt(list, indices)_

At each step answer _at_ of _indices_ into _list_.

	let l = [1, 3 .. 23]; Lat(l, Librown(1, l.size, 2, 99)).upToEnd.plot

* * *

See also: LsAtFold, LsAtWrap

# LsAtFold

- _LsAtFold(list, indices)_

At each step answer _atFold_ of _indices_ into _list_.

	LsAtFold([1 3 5 7 9], Lseries(1, 1, 11)).upToEnd = [1 3 5 7 9 7 5 3 1 3 5]

* * *

See also: LsAt, LsAtWrap

# LsAtWrap

- _LsAtWrap(list, indices)_

At each step answer _atWrap_ of _indices_ into _list_.

	LsAtWrap([1 3 5 7 9], Lseries(1, 1, 11)).upToEnd = [1 3 5 7 9 1 3 5 7 9 1]

* * *

See also: LsAt, LsAtWrap

# LsScan

- _LsScan(input, aBlock:/2)_

A stream that accumulates the succesive applications of _aBlock_ to the elements of _input_.
Can be used to calculate the prefix sum and product.

	LsScan(LsSeries(1, 1, 9), +).upToEnd = [1 3 6 10 15 21 28 36 45]
	LsScan(LsSeries(1, 1, 9), *).upToEnd = [1 2 6 24 120 720 5040 40320 362880]
	LsScan(LsSeries(1, 1, 9), -).upToEnd = [1 -1 -4 -8 -13 -19 -26 -34 -43]

* * *

See also: LsAccum, LsFold

# LsLast

- _LsLast(input)_

Answer the last element of _input_.
There is no last element of an infinite Stream.

	LsLast(LsSeries(1, 1, 9)) = 9

# LsFold

- _LsFold(α, β)_ ⟹ LsLast(LsScan(α, β))

Answer the last element of an LsScan.

	LsFold(LsSeries(1, 1, 9), +) = 45
	LsFold(LsSeries(1, 1, 9), *) = 362880
	LsFold(LsSeries(1, 1, 9), -) = -43

# LsAccum

- _LsAccum(input)_

Answer the prefix or partial sum of _input_, a stream that accumulates the sum of _input_.

	LsAccum(LsSeries(1, 1, 9)).upToEnd = [1 3 6 10 15 21 28 36 45]

# LsCat

- _LsCat(list)_

Apply _LsOnce_ at each element in _list_ and sequence the answers.

	LsCat([Lgeom(1, 3, 3), -1, Lseries(1, 3, 3)]).upToEnd = [1 3 9 -1 1 4 7]

# LsCons

- _LsCons(anObject, aStream)_

Answer the stream that is first _anObect_ and thereafter _aStream_.

	LsCons(1, LsSeries(2, 1, 8)).upToEnd = [1 .. 9]

* * *

See also: LsCat

# LsN

- _LsN(α, β)_ ⟹ _α.repeat(β)_

Repeat α β times.

	LsSeries(1, 3, 3).repeat(2).upToEnd [1 4 7 1 4 7]

# LsSeq

- _LsSeq(α, β)_ ⟹ _LsN(LsCat(α), β)_

Repeat the _LsCat_ of α β times.

	LsSeq([Lgeom(1, 3, 3), -1, Lseries(1, 3, 3)], 2).upToEnd = [1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]

# LsCyc

- _LsCyc(α)_ ⟹ _LsSeq(α, inf)_

Infinite _LsSeq_.

	LsCyc([Lgeom(1, 3, 3), -1]).next(8) = [1 3 9 -1 1 3 9 -1]

# LsTuple

- _LsTuple(list, repeats)_

Apply _LsForever_ at each element in _list_, and at each iteration answer an array of the next answer of each list item.
When any of list item ends, that repeat and all of the list items are reset.

	LsTuple([Lcyc([1 .. 5]), Lseq([5 6 7], 2)], 1).upToEnd = [1 5; 2 6; 3 7; 4 5; 5 6; 1 7; 1 5]

# LsLace

- _LsLace(list, length)_

Apply _LsForever_ at each element in _list_ and interlace the elements of the answers.
This is a kind of _transposition_

	LsLace([1, Lcyc([2 5]), Lcyc([3 4])], 8).upToEnd = [1 2 3 1 5 4 1 2]

# LsDupEach

- _LsDupEach(input, repeats)_

Duplicate each _input_ item _repeats_ number of times.

	LsDupEach(LsSeries(1, 3, 5), Lseq([2 3], inf)).upToEnd = [1 1 4 4 4 7 7 10 10 10 13 13]

# LsRemDup

- _LsRemDup(input)_

Remove successive duplicates from _input_.

	LsRemDup(LsDupEach(LsSeries(1, 3, 5), 2)).upToEnd = [1 4 7 10 13]

# LsTake

- _LsTake(α, β)_ ⟹ _α.take(β)_

Answer a stream that answers at most β elements of α and thereafter answers _nil_.

	LsTake(LsForever(1), 9).upToEnd = [1 1 1 1 1 1 1 1 1]
	LsForever(1).take(9).upToEnd = [1 1 1 1 1 1 1 1 1]

* * *

See also: LsFin, take

# LsFin

- _LsFin(α, β)_ ⟹ _β.take(α)_

Answer a stream that answers at most α elements of β and thereafter answers _nil_.

	LsFin(9, LsForever(1)).upToEnd = [1 1 1 1 1 1 1 1 1]

* * *

See also: LsTake

# LsCollect

- _LsCollect(α, β)_ ⟹ _α.collect(β)_

Answer a stream that applies β at each element of α.

	LsSeries(1, 1, 5).collect { :each | each * each }.upToEnd = [1 4 9 16 25]

# LsSelect

- _LsSelect(α, β)_ ⟹ _α.select(β)_

Answer a stream that skips over items from α that do not answer true for the predicate β.

	LsSeries(1, 1, 9).select(even:/1).upToEnd = [2 4 6 8]

# LsWhite

- _LsWhite(low, high, length)_

Random values that follow a uniform distribution.

	LsWhite(-1, 1, 99).upToEnd.plot

# LsBrown

- _LsBrown(low, high, step, length)_

Brownian motion between _low_ and _high_ with maximum step size _step_.
Steps have uniform distribution.

	LsBrown(-1, 1, 1 / 100, 99).upToEnd.plot

# LsIbrown

- _LsIbrown(low, high, step, length)_

Integer brownian motion between _low_ and _high_ with maximum step size _step_.
Steps have uniform distribution, and exclude the possibility of a zero step.

	LsIbrown(1, 99, 3, 99).upToEnd.plot

# LsBeta

- _LsBeta(low, high, p1, p2, length)_

Random values that follow an Eulerian Beta distribution.

Biased low:

	LsBeta(0, 1, 1 / 3, 3, 99).upToEnd.plot

Biased high:

	LsBeta(0, 1, 3, 1 / 3, 99).upToEnd.plot

# LsCauchy

- _LsCauchy(mean, spread, length)_

Random values that follow a Cauchy distribution.

	LsCauchy(0, 1 / 9, 99).upToEnd.plot

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
