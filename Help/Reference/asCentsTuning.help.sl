# asCentsTuning

- _asCentsTuning(aList | aTuning)_

Answer a `CentsTuning` given either a `List` of intervals in _cents_,
or a `Record` holding a Scala tuning description.

```
>>> let c = [0 .. 11] * 100;
>>> let t = c.asCentsTuning;
>>> t.asRatios.collect { :each |
>>> 	each.asFraction(1E-2)
>>> }
[
	1/1 16/15 9/8 13/11 5/4 4/3
	17/12 3/2 19/12 27/16 16/9 17/9
]
```

Translate the simplified ratios to cents courtesy `asRatioTuning` and `asCents`:

```
>>> let r = [
>>> 	1/1 16/15 9/8 13/11 5/4 4/3
>>> 	17/12 3/2 19/12 27/16 16/9 17/9
>>> ];
>>> let t = r.asRatioTuning;
>>> t.asCents.rounded
[
	0 112 204 289 386 498 603
	702 796 906 996 1101
]
```

At `ScalaTuning`, with ratio octave:

```
>>> ScalaTuning(
>>> 	name: '05-19',
>>> 	description: '5 out of 19-tET',
>>> 	pitches: [252.6 505.3 757.9 1010.5],
>>> 	octave: [2, 1]
>>> ).asCentsTuning
CentsTuning(
	'05-19',
	'5 out of 19-tET',
	[0 252.6 505.3 757.9 1010.5],
	2/1
)
```

At `ScalaTuning`, with cents octave:

```
>>> ScalaTuning(
>>> 	name: 'angklung',
>>> 	description: 'From Tasikmalaya',
>>> 	pitches: [
>>> 		206.1 382.3 610.0 823.6
>>> 		1234.5 1406.1 1633.4
>>> 	],
>>> 	octave: 1841.2
>>> ).asCentsTuning
CentsTuning(
	'angklung',
	'From Tasikmalaya',
	[
		0 206.1 382.3 610 823.6
		1234.5 1406.1 1633.4
	],
	2.8965
)
```

* * *

See also: asCents, asRatioTuning, CentsTuning, RatioTuning, ScalaTuning, Tuning

Categories: Converting
