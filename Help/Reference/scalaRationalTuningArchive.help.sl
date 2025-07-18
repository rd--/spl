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
>>> .scalaRationalTuningArchive
>>> .at('aeolic')
>>> .asRatios
[1/1 9/8 32/27 4/3 3/2 128/81 16/9]
```

Look up an entry in the archive by ratios, and fetch the names:

```
>>> let r = [1/1 9/8 32/27 4/3 3/2 128/81 16/9];
>>> system
>>> .scalaRationalTuningArchive
>>> .select { :each | each.asRatios ~ r }
>>> .collect { :each | each.description }
(
	aeolic:
	'Ancient Greek Aeolic, also tritriadic scale of the 54:64:81 triad'
)
```

_Note:_
The underlying archive is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: LibraryItem, RatioTuning, scalaTuningArchive
