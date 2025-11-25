# removeDiacritics

- _removeDiacritics(s)_

Answer a copy of the string _s_ with diacritic marks removed, and the characters they mark retained.

```
>>> 'Mačiūnas'.removeDiacritics
'Maciunas'

>>> 'Creme Brulée'.removeDiacritics
'Creme Brulee'

>>> 'naïve'.removeDiacritics
'naive'

>>> 'háček'.removeDiacritics
'hacek'

>>> 'smörgåsbord'.removeDiacritics
'smorgasbord'

>>> 'rôle'.removeDiacritics
'role'
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

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RemoveDiacritics.html),
_W_
[1](https://en.wikipedia.org/wiki/Diacritic)

Categories: Converting
