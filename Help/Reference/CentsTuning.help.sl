# CentsTuning

- _CentsTuning(name='', description='', cents, octave=2)_

A `Type` for a `Tuning` where the non-_octave_ intervals are stored as _cents_ values.

At `List` of intervals in _cents_:

```
>>> CentsTuning[100 300 600 800 1000]
>>> .approximateRatios.ratioToSavarts.round
[25 75 151 201 251]
```

At `ScalaTuning`, with ratio octave:

```
>>> ScalaTuning(
>>> 	name: '05-19',
>>> 	description: '5 out of 19-tET',
>>> 	pitches: [252.6 505.3 757.9 1010.5],
>>> 	octave: [2, 1]
>>> ).CentsTuning
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
>>> ).CentsTuning
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

`equalTemperamentTuning` answers a `CentsTuning`:

```
>>> 12.equalTemperamentTuning
CentsTuning(
	'ET-12',
	'Twelve tone equal-temperament',
	[
		  0  100  200  300   400  500
		600  700  800  900  1000 1100
	],
	2
)
```

The unary form requires only the list of _cents_ values:

```
>>> CentsTuning([0 .. 11] * 100)
>>> .approximateRatios
>>> .rationalize(1E-2)
[
	1/1 16/15 9/8 13/11 5/4 4/3
	17/12 3/2 19/12 27/16 16/9 17/9
]
```

Translate the simplified ratios to cents courtesy `cents`:

```
>>> RatioTuning[
>>> 	1/1 16/15 9/8 13/11 5/4 4/3
>>> 	17/12 3/2 19/12 27/16 16/9 17/9
>>> ].cents.round
[
	0 112 204 289 386 498 603
	702 796 906 996 1101
]
```

* * *

See also: RatioTuning, ScalaTuning, Tuning, cents, equalTemperamentTuning

Guides: Tuning Functions

Categories: Tuning
