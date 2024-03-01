# join

- _join(alpha)_ => _join(alpha, '')_
- _join(aList, aString)_

Join _aList_ of `String`s into a `String`, intercalating `aString` between each element.

```
>>> ['x' 'y' 'z'].join
'xyz'

>>> ['x' 'y' 'z'].join(', ')
'x, y, z'
```

The inverse of the unary form is `contents`:

```
>>> ['x' 'y' 'z'].join.contents
['x' 'y' 'z']
```

The inverse of the binary form is `splitBy`:

```
>>> ['x' 'y' 'z'].join(', ').splitBy(', ')
['x' 'y' 'z']
```

* * *

See also: joinSeparatedBy, splitBy

Categories: String
