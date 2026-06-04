# forteNumber

- _forteNumber(p)_

Answer the Forte number of the pitch-class set _p_.

```
>>> [0 4 7].forteNumber
'3-11'

>>> [0 2 4 5 7 9 11].forteNumber
'7-35'
```

The all-trichord twelve-tone row:

```
>>> [0 1 11 3 8 10 4 9 7 6 2 5]
>>> .partition(3, 1)
>>> .collect(forteNumber:/1)
[
	'3-1' '3-6' '3-11' '3-9' '3-8'
	'3-5' '3-7' '3-2'  '3-4' '3-3'
]
```

A set-type saturated row due to Robert Morris:

```
>>> [0 1 4 7 8 10 11 2 5 6 9 3 0 1 4 7 8]
>>> .partition(6, 2)
>>> .collect(forteNumber:/1)
[
	'6-Z28' '6-Z49'
	'6-Z28' '6-Z49'
	'6-Z28' '6-Z49'
]
```

* * *

See also: rahnNormalForm, rahnPrimeForm

Guides: Atonal Theory Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Forte_number)

Further Reading: Forte 1973
