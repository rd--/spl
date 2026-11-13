# \( (leftParenthesis)

`(` is a balanced syntax token,
closed by `)`,
it is not an operator.
Parentheses are a part of many syntactic forms.

`Record Syntax`:

```
>>> (x: 1, y: 2, z: 3)
>>> .isRecord
true
```

`Record Contructor Syntax`:

```
>>> Map(x: 1, y: 2, z: 3)
>>> .isMap
true
```

`Tuple Syntax`:

```
>>> (1, 2, 3)
>>> .isTuple
true
```

`Apply Syntax`,
a tuple holding the arguments to a procedure:

```
>>> max(-3, 3)
3
```

`Method Syntax`:

```
>>> -3.max(3)
3
```

Operators are evaluated left to right.
Parentheses group expression for defining order of evaluation:

```
>>> 5 + 2 * 3 - 7.5
13.5

>>> 5 + (2 * 3) - 7.5
3.5

>>> ((5 - 3) ^ (1 + 2)) / 4
2
```

The name of this syntax token is `leftParenthesis`.

* * *

See also: leftCurlyBracket, leftSquareBracket, rightParenthesis

Guides: Apply Syntax, Method Syntax, Record Syntax, Tuple Syntax
