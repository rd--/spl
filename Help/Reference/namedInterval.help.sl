# namedInterval

- _namedInterval(s)_

Answer the `Fraction` which is the interval named by the string _s_,
according to the Scala interval name database.

```
>>> 'major whole tone'.namedInterval
9/8

>>> 'minor diatonic semitone'.namedInterval
16/15
```

The inverse is `intervalName`:

```
>>> 9/8.intervalName
'major whole tone'

>>> 16/15.intervalName
'minor diatonic semitone'
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
