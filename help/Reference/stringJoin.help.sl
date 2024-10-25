# stringJoin

- _stringJoin(aSequence, anObject)_
- _stringJoin(alpha)_ => _stringJoin(alpha, '')_

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
[['x' 'y'] 'z'].stringJoin
'xyz'
```

With separator:

```
>>> ['x' 'y' 'z'].stringJoin(', ')
'x, y, z'
```

The inverse of the unary form is `contents`:

```
>>> ['x' 'y' 'z'].stringJoin.contents
['x' 'y' 'z']
```

The inverse of the binary form is `splitBy`:

```
>>> ['x' 'y' 'z'].stringJoin(', ').splitBy(', ')
['x' 'y' 'z']
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
