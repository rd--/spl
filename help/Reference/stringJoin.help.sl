# stringJoin

- _stringJoin(strings, string)_
- _stringJoin(alpha)_ => _stringJoin(alpha, '')_

Join _strings_ (a sequence of strings, or objects that implement `asString`) into a `String`,
intercalating _string_ between each.

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

* * *

See also: join, splitBy

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StringJoin.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#sec-array.prototype.join)

Categories: String
