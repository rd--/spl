# asRatioTuning

- _asRatioTuning(x)_

Answer a `RatioTuning` for either a `List` of interval values from a reference pitch,
or a `ScalaTuning`.

At `List`,
an alias for the unary form of `RatioTuning`:

```
>>> [63 72 84 98 112].asRatioTuning
>>> .ratios
[1/1 8/7 4/3 14/9 16/9]
```

At `ScalaTuning`:

```
>>> ScalaTuning(
>>> 	name: 'alves_pelog',
>>> 	description: 'Pelog, 1/1 Vol.9 No.4',
>>> 	octave: [2 1],
>>> 	pitches: [8 7; 6 5; 21 16; 3 2; 8 5; 7 4],
>>> 	limit: 7
>>> ).asRatioTuning
RatioTuning(
	'alves_pelog',
	'Pelog, 1/1 Vol.9 No.4',
	[1 8/7 6/5 21/16 3/2 8/5 7/4],
	2/1
)
```

* * *

See also: asCents, asIntegers, asRatios, CentsTuning, limit, RatioTuning, ScalaTuning, Tuning

Categories: Converting
