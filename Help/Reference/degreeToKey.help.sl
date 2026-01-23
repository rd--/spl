# degreeToKey

- _degreeToKey(s, degree)_
- _degreeToKey(degree, scale, stepsPerOctave)_

Convert from degree to key.

In the binary case,
the scale _s_ is an instance of `Scale`,
and both and indices are counted from `one`:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> 1:7.collect { :each |
>>> 	s.degreeToKey(each)
>>> }
[1 3 5 6 8 10 12]
```

Threads over lists:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> s.degreeToKey(1:7)
[1 3 5 6 8 10 12]
```

Multiple octaves:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> s.degreeToKey(1:15)
[
	1 3 5 6 8 10 12
	13 15 17 18 20 22 24
	25
]
```

Negative (and zero) degrees:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> s.degreeToKey(-13:8)
[
	-23
	-21 -19 -18 -16 -14 -12
	-11 -9 -7 -6 -4 -2 0
	1 3 5 6 8 10 12
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
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
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
>>> let s = Scale(1, [2 1 2 2 1 2 2], 'Min.');
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
>>> let s = Scale(1, [2 1 2 2 1 2 2], 'Min.');
>>> let d = [
>>> 	1 2.flat 2 3 3.cancelFlat 4
>>> 	5.flat 5 6 6.cancelFlat 7 7.cancelFlat
>>> ];
>>> s.degreeToKey(d)
[1 .. 12]
```

In the ternary case, which follows the _SuperCollider_ definition,
_scale_ is specified as a `List` and _stepsPerOctave_ separately,
and degrees are _zero-indexed_:

```
>>> 2.degreeToKey([1 3 6 8 10], 12)
6
```

Threads over lists:

```
>>> [0 .. 7].degreeToKey([0 2 4 5 7 9 11], 12)
[0 2 4 5 7 9 11 12]
```

Indices wrap around the table and shift octaves as they do:

```
>>> [1 .. 15].degreeToKey([0 1 5 9 11], 12)
[
	01 05 09 11 12
	13 17 21 23 24
	25 29 33 35 36
]
```

Negative degrees:

```
>>> -12.degreeToKey([0 2 4 6 7 9 11], 12)
-20

>>> [-14, -12 .. 14]
>>> .degreeToKey([0, 2, 4, 6, 7, 9, 11], 12)
[
	-24 -20 -17 -13
	-10 -6 -3
	0 4 7 11
	14 18 21 24
]
```

* * *

See also: cancelFlat, cancelSharp, DegreeToKey, flat, Scale, sharp

Guides: Scale Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SimpleNumber.html#-degreeToKey)
[2](https://doc.sccode.org/Classes/DegreeToKey.html)

Categories: Converting
