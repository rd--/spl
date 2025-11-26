# | (verticalLine)

- _b | f:/0_
- _c.|_

The operator form of `or`.

```
>>> false | { true }
or(false, { true })
```

`|` is both an operator and a syntax token.
As a syntax token `|` separates the parameter list from the body in `Block Syntax`.
It also encloses and slot names in `Type Definition Syntax`.

The name of this operator and syntax token is `verticalLine`.

_Note:_
In Smalltalk the evaluting form is called _or:_ and the non-evaluating form _|_.
In Sᴘʟ the names are `|` and `||`.
Note that `|` is never displayed as ∨ because it is part of the `Block Syntax`.

* * *

See also: &, &&, ||, anySatisfy

Guides: Boolean Functions, Binary Operators, Logical Operators, Syntax Tokens

References:
_Apl_
[1](https://aplwiki.com/wiki/Or),
_Mathematica_
[1](https://mathworld.wolfram.com/OR.html)
[2](https://reference.wolfram.com/language/ref/Or.html),
_Smalltalk_
5.3.3.10,
_W_
[1](https://en.wikipedia.org/wiki/Logical_disjunction)

Unicode: U+0007C | Vertical Line

Categories: Logic, Operator
