# stringJoin

- _stringJoin([x₁ x₂ …], y='')_

First `flatten` and then join together the items of the sequence _x_,
objects that implement `asString`,
into a `String`,
intercalating the object _y_ between each.

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

At a heterogenous list:

```
>>> ['f' 1 'x' 2].stringJoin
'f1x2'
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

The unary form will undo `characters`:

```
>>> 'xyz'.characters.stringJoin
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

Join a list of words, after inserting spaces in between:

```
>>> ['dog' 'cat' 'sheep' 'cow']
>>> .riffle([' '])
>>> .stringJoin
'dog cat sheep cow'
```

* * *

See also: ++, join, splitBy, stringCatenate

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StringJoin.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#sec-array.prototype.join)

Categories: String
