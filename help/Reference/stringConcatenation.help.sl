# stringConcatenation

- _stringConcatenation(aSequence, aString)_

Join together the items of _aSequence_, which must each be a `String`,
intercalating _aString_ between each.

At `List`:

```
>>> ['a' 'b'].stringConcatenation(' ')
'a b'

>>> ['x' 'y' 'z'].stringConcatenation(', ')
'x, y, z'

>>> ['p' 'q' 'r' 's'].stringConcatenation('/')
'p/q/r/s'
```

The inverse is `splitBy`:

```
>>> let l = ['x' 'y' 'z'];
>>> let s = ', ';
>>> l.stringConcatenation(s).splitBy(s)
l
```

At the empty list:

```
>>> [].stringConcatenation(', ')
''
```

* * *

See also: concatenation, join, interleave, intersperse, splitBy, stringJoin

Categories: Rearranging, String
