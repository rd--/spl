# scalaTuningArchive

- _scalaTuningArchive(aSystem)_

Answer a `Record` holding the _Scala_ tuning archive.

Count number of entries:

```
>>> system.scalaTuningArchive.size
5231
```

The keys are the names of the tunings,
the values are `ScalaTuning` objects.

```
>>> system
>>> .scalaTuningArchive
>>> .anyOne
>>> .isScalaTuning
true
```

Count the rational tunings:

```
>>> system
>>> .scalaTuningArchive
>>> .count { :each |
>>> 	each.isRational
>>> }
2738
```

Count the tunings where the octave is non-standard:

```
>>> system
>>> .scalaTuningArchive
>>> .counts { :each |
>>> 	each.octave ~= 2
>>> }
806
```

Look up an entry in the archive by name, and fetch the pitches as ratios:

```
>>> system
>>> .scalaTuningArchive
>>> .at('wilson_class')
>>> .asRatios
[
	1 25/24 28/25 7/6 5/4 4/3 7/5
	35/24 8/5 5/3 7/4 28/15
]
```

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: categorizedTuningArchive, LibraryItem, namedTuning, scalaRationalTuningArchive, ScalaTuning
