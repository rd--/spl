# joinSeparatedBy

- _joinSeparatedBy(aList, aString)_

Join _aList_ of `String`s into a `String`, separating each by _aString_

```
>>> ['x' 'y' 'z'].joinSeparatedBy(',')
'x,y,z'
```

The inverse is `splitBy`:

```
>>> ['x' 'y' 'z'].joinSeparatedBy(',').splitBy(',')
['x' 'y' 'z']
```

* * *

See also: contents, join, splitBy

Categories: String
