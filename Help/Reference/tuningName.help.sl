# tuningName

- _tuningName([r₁ r₂ …])_

Answer a `String` naming the tuning specified by the list of ratios _r_ according to the Scala tuning database.

```
>>> [1/1 9/8 32/27 4/3 3/2 128/81 16/9]
>>> .tuningName
'aeolic'
```

Tunings not in the database answer as un-named:

```
>>> [1 2 3 4 5 6 7].tuningName
'*unnamed tuning*'
```

_Note:_
The database is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: LibraryItem, namedTuning, scalaTuningArchive

Categories: Tuning
