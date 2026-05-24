# scalaIntervalArchive

- _scalaIntervalArchive(system)_

Answer a `Record` holding the Scala interval name archive.

Count entries:

```
>>> system.scalaIntervalArchive.size
545
```

Keys are interval names:

```
>>> system
>>> .scalaIntervalArchive
>>> .at('Pythagorean major third')
81/64
```

Values are rational intervals written as _n/d_:

```
>>> system
>>> .scalaIntervalArchive
>>> .keyAtValue(81/64)
'Pythagorean major third'
```

Multiple names are separated by commas:

```
>>> system
>>> .scalaIntervalArchive
>>> .keyAtValue(135/128)
'major chroma, major limma'
```

The keys are, by definition, duplicate free,
the individual entries at each key are also duplicate free:

```
>>> system
>>> .scalaIntervalArchive
>>> .keys
>>> .collect { :key | key.splitBy(', ') }
>>> .catenate
>>> .isDuplicateFree
true
```

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

The archive is stored in the file _intnam.par_ in the Scala distribution.

* * *

See also: Fraction, intervalName, intervalNameList, LibraryItem, namedInterval

Guides: Library Catalogue, Xenharmonic Functions
