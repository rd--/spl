# degreeToKey

- _degreeToKey(s, n)_
- _degreeToKey(s, n, m)_

Convert from degree _n_ to key in the context of the scale _s_,
which has _m_ steps per octave.

In the binary case,
the scale _s_ is an instance of `Scale`,
indices are counted from `one`:

```
>>> let s = Scale([2 2 1 2 2 2 1], 'Maj.');
>>> 1:7.collect { :n |
>>> 	s.degreeToKey(n)
>>> }
[1 3 5 6 8 10 12]
```

Threads over lists:

```
>>> let s = Scale([2 2 1 2 2 2 1], 'Maj.');
>>> s.degreeToKey(1:7)
[1 3 5 6 8 10 12]
```

Multiple octaves:

```
>>> let s = Scale([2 2 1 2 2 2 1], 'Maj.');
>>> s.degreeToKey(1:15)
[
	 1  3  5  6  8 10 12
	13 15 17 18 20 22 24
	25
]
```

Negative (and zero) degrees:

```
>>> let s = Scale([2 2 1 2 2 2 1], 'Maj.');
>>> s.degreeToKey(-13:8)
[
	-23
	-21 -19 -18 -16 -14 -12
	-11  -9  -7  -6  -4  -2  0
	  1   3   5   6   8  10 12
	 13
]
```

Allows fractional degrees, where 0.1 indicates a one step alteration.
The methods `sharp` and `flat` answer appropriately modified degrees:

```
>>> (1.sharp, 3.flat)
(1.1, 2.9)
```

At major scale:

```
>>> let s = Scale([2 2 1 2 2 2 1], 'Maj.');
>>> let allSharps = [
>>> 	1 1.sharp 2 2.sharp 3 4
>>> 	4.sharp 5 5.sharp 6 6.sharp 7
>>> ];
>>> let allFlats = [
>>> 	1 2.flat 2 3.flat 3 4
>>> 	5.flat 5 6.flat 6 7.flat 7
>>> ];
>>> (
>>> 	s.degreeToKey(allSharps),
>>> 	s.degreeToKey(allFlats)
>>> )
(
	[1 .. 12],
	[1 .. 12]
)
```

At minor scale:

```
>>> let s = Scale([2 1 2 2 1 2 2], 'Min.');
>>> let d = [
>>> 	1 2.flat 2 3 3.sharp 4
>>> 	5.flat 5 6 6.sharp 7 7.sharp
>>> ];
>>> s.degreeToKey(d)
[1 .. 12]
```

Likewise the methods `cancelFlat` and `cancelSharp`:

```
>>> (1.cancelFlat, 3.cancelSharp)
(1.1, 2.9)
```

At minor scale:

```
>>> let s = Scale([2 1 2 2 1 2 2], 'Min.');
>>> let d = [
>>> 	1 2.flat 2 3 3.cancelFlat 4
>>> 	5.flat 5 6 6.cancelFlat 7 7.cancelFlat
>>> ];
>>> s.degreeToKey(d)
[1 .. 12]
```

In the ternary case, which follows the _SuperCollider_ definition,
the _scale_ is specified in two parts,
as a list of zero-indexed step locations,
with the steps per octave count given separately.
The lookup degrees are also zero-indexed:

```
>>> let s = [1 3 6 8 10];
>>> s.degreeToKey(2, 12)
6
```

Threads over lists:

```
>>> let s = [0 2 4 5 7 9 11];
>>> s.degreeToKey([0 .. 7], 12)
[0 2 4 5 7 9 11 12]
```

Indices wrap around the table and shift octaves as they do:

```
>>> let s = [0 1 5 9 11];
>>> s.degreeToKey([1 .. 15], 12)
[
	01 05 09 11 12
	13 17 21 23 24
	25 29 33 35 36
]
```

Negative degrees:

```
>>> let s = [0 2 4 6 7 9 11];
>>> s.degreeToKey(-12, 12)
-20

>>> let s = [0 2 4 6 7 9 11];
>>> s.degreeToKey([-14 .. 14; 2], 12)
[
	-24 -20 -17 -13
	-10 -6 -3
	0 4 7 11
	14 18 21 24
]
```

Modal space, mouse controls discrete pitch in dorian mode:

```
let b = LocalBuf[0 2 3.2 5 7 9 10];
let x = MouseX(0, 15, 0, 0.1);
let k = degreeToKey(b, x, 12);
let c = { :n :r |
	let o = SinOsc(
		(r + k + (n * 0.04)).midiCps,
		0
	) * 0.1;
	let t = LfPulse(
		[48 55].midiCps,
		0,
		0.15
	);
	let f = (
		SinOsc(0.1, 0) * 10 + r
	).midiCps;
	let d = Rlpf(t, f, 0.1) * 0.1;
	let m = o + d;
	CombN(m, 0.31, 0.31, 2) + m
};
let n = LfNoise1([3, 3]);
(c(n, 48) + c(n, 72)) * 0.25
```

* * *

See also: Scale, cancelFlat, cancelSharp, flat, sharp

Guides: Scale Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SimpleNumber.html#-degreeToKey)
[2](https://doc.sccode.org/Classes/DegreeToKey.html)

Categories: Converting
