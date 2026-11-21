# leftCurlyBracket

`{` is a balanced syntax token, closed by `}`.
It is not an operator.
`{` begins a block that is subsequently ended by `}`.

`Function Syntax`:

```
>>> { 3.141 }
>>> .isFunction
true
```

`Trailing Function Syntax`:

```
>>> 1:9.product { :x | x * 2 + 1 }
654_729_075
```

The name of this syntax token is `leftCurlyBracket`.

* * *

See also: leftParenthesis, leftSquareBracket, rightCurlyBracket

Guides: Function Syntax, Syntax Tokens, Trailing Function Syntax
