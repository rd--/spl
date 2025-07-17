# intervalName

- _intervalName(aFraction)_

Answer a `String` naming the interval _aFraction_ according to the Scala interval name database.

Three commas:

```
>>> 81/80.intervalName
'syntonic comma, Didymus comma'

>>> 531441/524288.intervalName
'Pythagorean comma, ditonic comma'

>>> 2048/2025.intervalName
'diaschisma'

>>> 32805/32768.intervalName
'schisma'
```

Two fourths:

```
>>> 4/3.intervalName
'perfect fourth'

>>> 11/8.intervalName
'undecimal semi-augmented fourth'
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
and this function requires the item be in the interpreter cache.

* * *

See also: LibraryItem, namedInterval, scalaIntervalArchive

Categories: Tuning
