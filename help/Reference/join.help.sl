# join

- _join(aList, separator=[])_

Join _list_ (which must be of lists or strings) into a list or a string, intercalating _separator_ between each.
The list must be of uniform element type.

Join a matrix into a vector:

```
>>> [1 2 3; 4 5 6; 7 8 9].join
[1 2 3 4 5 6 7 8 9]
```

With a separator vector:

```
>>> [1 2 3; 4 5 6; 7 8 9].join([0 0])
[1 2 3 0 0 4 5 6 0 0 7 8 9]
```

Join a list of strings into a string, this form is equal to `stringConcatenation`:

```
>>> ['x' 'y' 'z'].join
'xyz'
```

With a separator string:

```
>>> ['x' 'y' 'z'].join(', ')
'x, y, z'
```

* * *

See also: ++, +++, concatenation, flatten, splitBy, stringConcatenation, stringJoin

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Join.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#sec-array.prototype.join)

Categories: String
