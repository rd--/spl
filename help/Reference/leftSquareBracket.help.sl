# [


`[` is a syntax token, it is not an operator.

`[` is a part of `List Syntax`,
where it begins a `List` that is subsequently closed by `]`.

```
>>> [1, 2, 3].isList
true
```

It is also a part of `Vector Syntax`, `Matrix Syntax` and `Volume Syntax`.

```
>>> [1 2 3].isVector
true

>>> [1 2 3; 4 5 6].isMatrix
true

>>> [1 2 3; 4 5 6:; 7 8 9; 1 2 3].shape
[2 2 3]
```

The name of this syntax token is `leftSquareBracket`.

* * *

See also: ], List Syntax, Matrix Syntax, Vector Syntax, Volume Syntax
