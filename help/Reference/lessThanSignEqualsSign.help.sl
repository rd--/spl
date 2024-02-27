# <=

- _aMagnitude <= anotherMagnitude_

Answers _true_ if _aMagnitude_ is less than or equal to _anotherMagnitude_.

```
>>> e <= pi
true

>>> e <= e
true
```

Element-wise at `Sequence`:

```
>>> [1 3 5 7 9] <= [3 4 5 6 7]
[true true true false false]
```

When the arguments to `<=` are `boole`, it is the material implication `Boolean` function:

```
>>> ([0 1] <=.table [0 1]).boole
[1 1; 0 1]
```

Where supported this operator is displayed as ≤.

The name of this operator is _lessThanSignEqualsSign_.

* * *

See also: <, >, >=, =

References:
_Apl_
[1](https://aplwiki.com/wiki/Less_than_or_Equal_to),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/ltco#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LessEqual.html)

Unicode: U+2264 ≤ Less-than or equal to

Categories: Comparison operator
