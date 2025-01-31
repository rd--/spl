# stringJoin

- _stringJoin(aSequence, anObject)_
- _stringJoin(alpha)_ ⟹ _stringJoin(alpha, '')_

First `flatten` and then join together the items of _aSequence_ (objects that implement `asString`) into a `String`,
intercalating _anObject_ between each.

At `List` of `String`:

```
>>> ['x' 'y' 'z'].stringJoin
'xyz'
```

At `List` of `Integer`:

```
>>> [1 2 3].stringJoin
'123'
```

At a tree flattens list structure:

```
>>> [['x', 'y'], 'z'].stringJoin
'xyz'
```

With separator:

```
>>> ['two' 'words'].stringJoin(' ')
'two words'

>>> ['x' 'y' 'z'].stringJoin(', ')
'x, y, z'

>>> ['p' 'q' 'r'].stringJoin('/')
'p/q/r'
```

The unary form will undo `contents`:

```
>>> 'xyz'.contents.stringJoin
'xyz'
```

The binary form will undo `splitBy`:

```
>>> 'x, y, z'.splitBy(', ').stringJoin(', ')
'x, y, z'
```

At the empty list:

```
>>> [].stringJoin(', ')
''
```

* * *

See also: join, splitBy, stringConcatenation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StringJoin.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#sec-array.prototype.join)

Categories: String
