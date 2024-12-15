# intervalName

- _intervalName(aFraction)_

Answer a `String` naming the interval _aFraction_ according to the Scala interval name database.

Two commas:

```
>>> 81/80.intervalName
'syntonic comma, Didymus comma'

>>> 531441/524288.intervalName
'Pythagorean comma, ditonic comma'
```

The first nine superparticular ratios:

```
>>> 1:9.collect { :each |
>>> 	Fraction(each + 1, each)
>>> 	.intervalName
>>> }
[
	'octave'
	'perfect fifth'
	'perfect fourth'
	'major third'
	'minor third'
	'septimal minor third'
	'septimal whole tone'
	'major whole tone'
	'minor whole tone'
]
```

Threads over lists:

```
>>> [
>>> 	128/125 648/625 256/243
>>> ].intervalName
[
	'minor diesis, diesis'
	'major diesis'
	'limma, Pythagorean minor second'
]
```

Intervals not in the database answer as un-named:

```
>>> 27/28.intervalName
'*unnamed interval*'
```

_Note:_
The database is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: LibraryItem, namedInterval, scalaIntervalArchive
