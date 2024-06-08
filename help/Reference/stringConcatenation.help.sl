# stringConcatenation

- _stringConcatenation(aSequence, aString)_

Join together the items of _aSequence_, which must each be a `String`,
intercalating _aString_ between each.

At `List`:

```
>>> ['x' 'y' 'z'].stringConcatenation(',')
'x,y,z'
```

The inverse is `splitBy`:

```
>>> ['x' 'y' 'z'].stringJoin(', ').splitBy(', ')
['x' 'y' 'z']
```

* * *

See also: concatenation, join, splitBy, stringJoin

Categories: String
