# ; (semicolon)

`;` is a syntax token, it is not an operator.

A semicolon separates statements in `Block Syntax`:

```
>>> { let x = 2; x }.value
2
```

A semicolon separates vectors in `Matrix Syntax`:

```
>>> [1 3; 5 7]
[[1, 3], [5, 7]]
```

A semicolon separates step size item in `Range Syntax`:

```
>>> (1 .. 9; 2)
Range(1, 9, 2)

>>> [1 .. 9; 2]
[1 3 5 7 9]
```

The name of this syntax token is `semicolon`.

* * *

See also: :, ,, .

Guides: Block Syntax, Matrix Syntax, Syntax Tokens

Unicode: U+0003B ; Semicolon

Categories: Syntax
