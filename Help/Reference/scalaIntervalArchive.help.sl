# scalaIntervalArchive

- _scalaIntervalArchive(aSystem)_

Count entries:

```
>>> system.scalaIntervalArchive.size
545
```

Keys are rational intervals written as _n/d_:

```
>>> system
>>> .scalaIntervalArchive
>>> .includesKey(81/80.printString)
true
```

Values are interval names:

```
>>> system
>>> .scalaIntervalArchive
>>> .at('81/64')
'Pythagorean major third'
```

Multiple names are separated by commas:

```
>>> system
>>> .scalaIntervalArchive
>>> .at('135/128')
'major chroma, major limma'
```

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

The archive is stored in the file _intnam.par_ in the Scala distribution.

* * *

See also: Fraction, intervalName, LibraryItem, namedInterval

Guides: Xenharmonic Functions
