# | (verticalLine)

- _aCollection.|_
- _aBoolean | aBlock:/0_

`|` is both an operator and a syntax token.

As an operator,
`|` is non-evaluating conjunction.
It answers `true` if _aBoolean_ is `true` or _aBlock_ evaluates to `true`, else `false`.
If _aBoolean_ is `true` then _aBlock_ is not evaluated.

Combine assertions:

```
>>> true | { true }
true

>>> true | { false }
true

>>> false | { false }
false

>>> (1 > 2) | { 1.pi > 3 }
true
```

The unary form of `|` is `anySatisfy` of `value`:

```
>>> [1 < 0, { 2 < 1 }, { 3 < 2 }].|
false
```

Naturally, the first element may also be a `Block`:

```
>>> [{ 1 < 0 }, { 2 < 1 }, { 3 < 2 }].|
false
```

As a syntax token `|` separates the parameter list from the body in `Block Syntax`.
It also encloses and slot names in `Type Definition Syntax`.

The name of this operator and syntax token is `verticalLine`.

Where supported `or` is displayed as ∨.

_Note:_
In Smalltalk the evaluting form is called _or:_ and the non-evaluating form _|_.
In Spl the names are `|` and `||`.
Note that `|` is not displayed as ∨ because it is part of the `Block Syntax`.

* * *

See also: &, &&, ||, anySatisfy

Guides: Logical Operators, Syntax Tokens

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

Unicode: U+0007C | Vertical Line, U+2228 ∨ Logical or

Categories: Logic, Operator
