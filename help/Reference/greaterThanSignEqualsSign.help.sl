# >=

- _aMagnitude >= anotherMagnitude_

Answers _true_ if _aMagnitude_ is greater than or equal to _anotherMagnitude_.

```
>>> pi >= e
true

>>> pi >= pi
true
```

Element-wise at `Sequence`:

```
>>> [1 3 5 7 9] >= [3 4 5 6 7]
[false false true true true]
```

When the arguments to `>=` are `boole`, it is the converse implication `Boolean` function:

```
>>> ([0 1] >=.table [0 1]).boole
[1 0; 1 1]
```

Where supported `>=` is displayed as ≥.

The name of this operator is _greaterThanSignEqualsSign_.

* * *

See also: <, >, <=, =, ~=, <=>, Magnitude

References:
_Apl_
[1](https://aplwiki.com/wiki/Greater_than_or_Equal_to),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/gtco#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GreaterEqual.html),
_Smalltalk_
5.6.1.4,
_W_
[1](https://en.wikipedia.org/wiki/Converse_(logic))

Unicode: U+2265 ≥ Greater-than or equal to

Categories: Comparison, Operator
