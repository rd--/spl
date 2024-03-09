# |

- _aCollection.|_
- _aBoolean | aBlock:/0_

Nonevaluating conjunction.
`true` if _aBoolean_ is `true` or _aBlock_ evaluates to `true`, else `false`.
If _aBoolean_ is `true` then _aBlock_ is not evaluated.

Combine assertions:

```
>>> true | { true }
true

>>> true | { false }
true

>>> false | { false }
false

>>> (1 > 2) | { pi > 3 }
true
```

The unary form of `|` is `anySatisfy` of `value`:

```
>>> [1 < 0, { 2 < 1 }, { 3 < 2 }].|
false
```

The first element may also be a `Block`,
and the unary operator syntax may be used:

```
>>> [{ 1 < 0 }, { 2 < 1 }, { 3 < 2 }].|
false
```

The name of this operator is _verticalLine_.

Where supported _or_ is displayed as ∨.

Note that _|_ is not displayed as ∨ because it is part of the `Block Syntax`.

_Note:_
In Smalltalk the evaluting form is called _or:_ and the non-evaluating form _|_.
In Spl the names are `|` and `||`.

* * *

See also: &, &&, ||, anySatisfy

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

Unicode: U+2228 ∨ Logical or

Categories: Logic, Operator
