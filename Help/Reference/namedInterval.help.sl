# namedInterval

- _namedInterval(aString)_

Answer the `Fraction` which is the interval named by _aString_,
according to the Scala interval name database.

```
>>> 'major whole tone'.namedInterval
9/8
```

It is an `error` if the name is not in the database:

```
>>> {
>>> 	'*unnamed interval*'.namedInterval
>>> }.hasError
true
```

_Note:_
The database is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: LibraryItem, intervalName, intervalNameList, scalaIntervalArchive

Guides: Tuning Functions
