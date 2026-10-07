# ScalaTuning

- _ScalaTuning(r)_

A `Type` holding a `Tuning` stored in the form of the scales held in the Scala tuning archive.

The `scalaTuningArchive` stores items as `ScalaTuning` objects.

The `CentsTuning` and `RatioTuning` methods convert between tuning types.

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
>>> (t.ratios, t.octave)
([1/1 8/7 4/3 14/9 16/9], 2/1)
```

* * *

See also: CentsTuning, RatioTuning, Tuning, cents, ratios, scalaTuningArchive

Guides: Tuning Functions
