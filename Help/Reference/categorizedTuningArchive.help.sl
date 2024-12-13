# categorizedTuningArchive

- _categorizedTuningArchive(aSystem)_

Answer a `Record` where the keys are categories and the associated values are `List`s of tuning names.

Count the number of entries:

```
>>> system.categorizedTuningArchive.size
33
```

Count the number of entries at a particular key:

```
>>> system
>>> .categorizedTuningArchive
>>> .at('Wilson, Erv')
>>> .size
113
```

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: LibraryItem, scalaTuningArchive, ScalaTuning
