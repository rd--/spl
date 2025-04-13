# extract

- _extract(c, p)_

Extracts a list of parts of the collection _c_ specified in the list of positions at _p_.

Extract the second and fourth items of a `List`:

```
>>> [1 3 5 7 9].extract([2; 4])
[3 7]

>>> [2 4].collect { :p |
>>> 	[1 3 5 7 9].part([p])
>>> }
[3 7]

>>> [1 3 5 7 9].part([[2 4]])
[3 7]
```

Extract the first and third rows of a matrix:

```
>>> [3 3].iota.extract([1; 3])
[1 2 3; 7 8 9]

>>> [1 3].collect { :p |
>>> 	[3 3].iota.part([p])
>>> }
[1 2 3; 7 8 9]

>>> [3 3].iota.part([[1 3]])
[1 2 3; 7 8 9]
```

Extract several elements of a matrix:

```
>>> [3 3].iota.extract([1 2; 3 3; 2 1])
[2 9 4]

>>> [1 2; 3 3; 2 1].collect { :p |
>>> 	[3 3].iota.part(p)
>>> }
[2 9 4]
```

* * *

See also: part

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Extract.html)
