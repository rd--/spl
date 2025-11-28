# stringInsert

- _stringInsert(s₁, s₂, n)_

Answer a string with _s₂_ inserted starting at position _n_ in _s₁_.
If _n_ is negative it indicates the position from the end.

Insert 'ABC' at position four:

```
>>> 'abcdefghijkl'.stringInsert('ABC', 4)
'abcABCdefghijkl'
```

Insert 'ABC' at position four from the end:

```
>>> 'abcdefghijkl'.stringInsert('GHI', -4)
'abcdefghiGHIjkl'
```

At the end of the existing string:

```
>>> 'abcdef'.stringInsert('ghi', 7)
'abcdefghi'

>>> 'abcdef'.stringInsert('ghi', -1)
'abcdefghi'
```

* * *

See also: insertAt, String

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringInsert.html)
