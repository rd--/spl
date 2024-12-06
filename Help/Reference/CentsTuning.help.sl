# CentsTuning

- _CentsTuning(name, description, cents, octave)_

A `Type` for a `Tuning` where the non-_octave_ intervals are stored as _cents_ values.

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

* * *

See also: asCents, asCentsTuning, equalTemperamentTuning, RatioTuning, Tuning

Categories: Tuning
