# = (equalsSign)

- _x = y_
- _c.=_

The binary operator form of `equal`:

```
>>> 3 = 1
equal(3, 1)
```

The unary operator form of `allEqual`:

```
>>> [2 + 1, 4 - 1, 6 / 2].=
true
```

The name of this operator and syntax token is `equalsSign`:

```
>>> 'x = y'.splSimplify
'equalsSign(x, y)'

>>> 'c.='.splSimplify
'equalsSign(c)'
```

`=` is both a syntax token and an operator.
As a syntax token the `=` symbol is a part of `Let Syntax`.

* * *

See also: <, <=, >, >=, !=, ==, ~, :=, allEqual, equal

Guides: Comparison Functions, Let Syntax, Syntax Tokens

Categories: Comparing
