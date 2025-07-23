# ScalaTuning

- _ScalaTuning(aRecord)_

A `Type` holding a `Tuning` stored in the form of the scales held in the Scala tuning archive.

The `scalaTuningArchive` stores items as `ScalaTuning` objects.

The `asCentsTuning` and `asRatioTuning` methods convert between tuning types.

The `octave` method answers the octave as a ratio,
though not necessarily a fraction.

```
>>> let t = ScalaTuning(
>>> 	name: 'alves_slendro',
>>> 	degree: 5,
>>> 	description: 'Bill Alves, Slendro',
>>> 	limit: 7,
>>> 	octave: [2 1],
>>> 	pitches: [8 7; 4 3; 14 9; 16 9]
>>> );
>>> (t.asRatios, t.octave)
([1/1 8/7 4/3 14/9 16/9], 2/1)
```

* * *

See also: asCents, asCentsTuning, asRatios, asRatioTuning, CentsTuning, RatioTuning, scalaTuningArchive, Tuning

Guides: Tuning Functions
