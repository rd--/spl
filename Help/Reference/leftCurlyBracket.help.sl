# \{ (leftCurlyBracket)

`{` is a balanced syntax token, closed by `}`, it is not an operator.
`{` begins a block that is subsequently ended by `}`.

`Block Syntax`:

```
>>> { 3.141 }
>>> .isBlock
true
```

`Trailing Block Syntax`:

```
>>> 1:9.product { :x | x * 2 + 1 }
654_729_075
```

The name of this syntax token is `leftCurlyBracket`.

* * *

See also: leftParenthesis, leftSquareBracket, rightCurlyBracket

Guides: Block Syntax, Syntax Tokens, Trailing Block Syntax
