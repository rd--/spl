# equalTemperamentTuning

- _equalTemperamentTuning(anInteger)_

Answer a `CentsTuning` holding an equal tempered tuning of _anInteger_ places.

Twelve tone equal temperament:

```
>>> let t = 12.equalTemperamentTuning;
>>> (t.isTuning, t.isCentsTuning, t.name, t.description)
(true, true, 'ET-12', 'Twelve tone equal-temperament')

>>> let t = 12.equalTemperamentTuning;
>>> (t.octave, t.asCents)
(2, [0 100 200 300 400 500 600 700 800 900 1000 1100])

>>> 12.equalTemperamentTuning.asRatios.collect(asFraction:/1)
[1 18/17 46/41 107/90 63/50 4/3 140/99 3/2 73/46 37/22 139/78 185/98]
```

Seven tone equal temperament:

```
>>> let t = 7.equalTemperamentTuning;
>>> (t.asCents.rounded, t.asRatios.collect(asFraction:/1))
(
	[0 171 343 514 686 857 1029],
	[1 85/77 89/73 35/26 107/72 64/39 163/90]
)
```

* * *

See also: CentsTuning, Tuning
