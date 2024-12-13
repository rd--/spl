# scalaRationalTuningArchive

- _scalaTuningArchive(aSystem)_

Answer a `Record` holding the rational entries of the `scalaTuningArchive`.

Count number of entries:

```
>>> system
>>> .scalaRationalTuningArchive
>>> .size
2738
```

Look up an entry in the archive by name, and fetch the pitches as ratios:

```
>>> system
>>> .scalaRationalTuningArchive['aeolic']
>>> .asRatios
[1/1 9/8 32/27 4/3 3/2 128/81 16/9]
```

_Note:_
The underlying archive is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: LibraryItem, RatioTuning, scalaTuningArchive
