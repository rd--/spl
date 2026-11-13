# \[ (leftSquareBracket)

`[` is a balanced syntax token, closed by `]`, it is not an operator.
Brackets are a part of many syntactic forms.

`List Syntax`:

```
>>> [1, 2, 3]
>>> .isList
true
```

`Vector Syntax`:

```
>>> [1 2 3]
>>> .isVector
true
```

`Matrix Syntax`:

```
>>> [1 2 3; 4 5 6]
>>> .isMatrix
true
```

`Volume Syntax`:

```
>>> [
>>> 	1 2 3; 4 5 6:;
>>> 	7 8 9; 1 2 3
>>> ].shape
[2 2 3]
```

The name of this syntax token is `leftSquareBracket`.

* * *

See also: leftCurlyBracket, leftParenthesis, rightSquareBracket

Guides: List Syntax, Matrix Syntax, Vector Syntax, Volume Syntax
