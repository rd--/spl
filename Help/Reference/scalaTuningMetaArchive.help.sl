# scalaTuningMetaArchive

- _scalaTuningMetaArchive(aSystem)_

Answer a `Record` where the keys are categories and the associated values are `List`s of tuning names.

The names of the tunings correspond to entries in the `scalaTuningArchive`,
and thereby also in the `scalaRationalTuningArchive`.

Count the number of entries:

```
>>> system
>>> .scalaTuningMetaArchive
>>> .size
33
```

Count the number of entries at a particular key:

```
>>> system
>>> .scalaTuningMetaArchive
>>> .at('Wilson, Erv')
>>> .size
113
```

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: LibraryItem, scalaRationalTuningArchive, scalaTuningArchive, ScalaTuning
