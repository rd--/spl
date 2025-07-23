# namedTuning

- _namedTuning(aString)_

Answer the `ScalaTuning` which is the tuning named by _aString_,
according to the Scala tuning archive.

Lookup rational tuning:

```
>>> 'wilson_class'.namedTuning.asRatios
[
	1/1 25/24 28/25 7/6 5/4
	4/3  7/5  35/24 8/5 5/3
	7/4 28/15
]
```

Lookup cents tuning:

```
>>> 'trawas'.namedTuning.asCents
[0 306.15 541.49 711.39 1039.53]
```

It is an `error` if the name is not in the archive:

```
>>> {
>>> 	'*unnamed tuning*'.namedTuning
>>> }.ifError { true }
true
```

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: LibraryItem, scalaTuningArchive, ScalaTuning
