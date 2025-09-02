# <= (lessThanSignEqualsSign)

- _x <= y_

Answers `true` if _x_ is less than or equal to _y_.

```
>>> 1.e <= 1.pi
true

>>> 1.e <= 1.e
true
```

Element-wise at `List`:

```
>>> [1 3 5 7 9] <= [3 4 5 6 7]
[true true true false false]
```

When the arguments to `<=` are `boole`, it is the material implication `Boolean` function:

```
>>> ([0 1] <=.table [0 1]).boole
[1 1; 0 1]
```

Where supported `<=` is displayed as ≤.

The name of this operator is `lessThanSignEqualsSign`.

* * *

See also: <, >, >=, =

Guides: Comparison Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Less_than_or_Equal_to),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/ltco#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LessEqual.html),
_Smalltalk_
5.6.1.2

Unicode: U+2264 ≤ Less-than or equal to

Categories: Comparison
