# join

- _join(sequences, sequence)_
- _join(alpha)_ => _join(alpha, [])_

Join _sequences_ (a sequence of sequences) into a sequence, intercalating _sequence_ between each.

At `List` of `Integer`:

```
>>> [1 2 3; 4 5 6; 7 8 9].join
[1 2 3 4 5 6 7 8 9]
```

With separator:

```
>>> [1 2 3; 4 5 6; 7 8 9].join([0 0])
[1 2 3 0 0 4 5 6 0 0 7 8 9]
```

At `List` of `String`:

```
>>> ['x' 'y' 'z'].join
'xyz'
```

With separator:

```
>>> ['x' 'y' 'z'].join(', ')
'x, y, z'
```

The inverse of the unary form at a `List` of `String` is `contents`:

```
>>> ['x' 'y' 'z'].join.contents
['x' 'y' 'z']
```

The inverse of the binary form at a `List` of `String` is `splitBy`:

```
>>> ['x' 'y' 'z'].join(', ').splitBy(', ')
['x' 'y' 'z']
```

* * *

See also: ++, +++, concatenation, flatten, splitBy, stringJoin

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Join.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#sec-array.prototype.join)

Categories: String
