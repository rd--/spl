# |

- _or(aCollection)_
- _aBoolean | aBlock:/0_

true if _aBoolean_ is true or _aBlock_ evaluates to true, else false.
If _aBoolean_ is true then _aBlock_ is not evaluated.

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

The name of this operator is _verticalLine_.

The unary form of or is _anySatisfy_ of _value_:

```
>>> [1 < 0, { 2 < 1 }, { 3 < 2 }].|
false
```

The first element may also be a Block,
and the unary operator syntax may be used:

```
>>> [{ 1 < 0 }, { 2 < 1 }, { 3 < 2 }].|
false
```

Where supported _or_ is displayed as ∨.

Note that _|_ is not displayed as ∨ because it is part of the [Block Syntax].

_Note:_
In Smalltalk _|_ and _or:_ have different behaviour,
the former is _evaluating_ and the latter not.
If _|_ were named _verticalBar_ this behaviour could be adopted.
However for the moment _||_ is the name of the non-evaluating form.

* * *

See also: &, &&, ||, and, anySatisfy, or

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OR.html)
[2](https://reference.wolfram.com/language/ref/Or.html)

Unicode: U+2228 ∨ Logical or

Categories: Logic operator
