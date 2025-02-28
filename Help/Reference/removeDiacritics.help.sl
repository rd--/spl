# removeDiacritics

- _removeDiacritics(aString)_

Answer a `String` with diacritic marks removed, and the characters they mark retained.

```
>>> 'Mačiūnas'.removeDiacritics
'Maciunas'

>>> 'Creme Brulée'.removeDiacritics
'Creme Brulee'

>>> 'naïve'.removeDiacritics
'naive'

>>> 'háček'.removeDiacritics
'hacek'
```

Threads over lists:

```
>>> [
>>> 	'daïs' 'reëlect' 'hôtel' 'cañón'
>>> 	'doppelgänger' 'Brontë'
>>> ].removeDiacritics
[
	'dais' 'reelect' 'hotel' 'canon'
	'doppelganger' 'Bronte'
]
```

This method also simplifies some, but not all, ligatures:

```
>>> 'ﬁnal'.removeDiacritics
'final'

>>> '!!‼'.removeDiacritics
'!!!!'

>>> 'Cœur'.removeDiacritics
'Cœur'
```

This method also removes some _formatting_ marks, i.e.:

```
>>> '3²'.removeDiacritics
'32'
```

Identity at string without diacritics:

```
>>> 'ascii'.removeDiacritics
'ascii'
```

* * *

See also: String

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RemoveDiacritics.html)


Categories: Converting
