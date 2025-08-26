# burrowsWheelerTransform

- _burrowsWheelerTransform(s, [d₁ d₂])_

Apply the Burrows–Wheeler transform to the string _s_ using the specified start and end delimiters.

```
>>> 'BANANA'
>>> .burrowsWheelerTransform(['^' '$'])
'$ANNB^AA'

>>> 'DOGWOOD'
>>> .burrowsWheelerTransform(['^' '$'])
'$DO^OODWG'
```

The inverse is give by `inverseBurrowWheelerTransform`:

```
>>> '$ANNB^AA'
>>> .inverseBurrowWheelerTransform('$')
'BANANA'

>>> '$DO^OODWG'
>>> .inverseBurrowWheelerTransform('$')
'DOGWOOD'
```

* * *

See also: lexicographicSort, rotateLeft

References:
_W_
[1](https://en.wikipedia.org/wiki/Burrows%E2%80%93Wheeler_transform)
