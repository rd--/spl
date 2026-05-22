# asCentsTuning

- _asCentsTuning(t)_

Answer a `CentsTuning` given either a `List` of intervals in _cents_,
or a `ScalaTuning` value.

At `List`, an alias for the unary form of `CentsTuning`:

```
>>> [100 300 600 800 1000].asCentsTuning
>>> .asRatios.ratioToSavarts.round
[25 75 151 201 251]
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
