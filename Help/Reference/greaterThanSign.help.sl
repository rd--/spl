# > (greaterThanSign)

- _aMagnitude > anotherMagnitude_

Answers `true` if _aMagnitude_ is greater than _anotherMagnitude_, else `false`.

```
>>> 1.pi > 1.e
true

>>> 3 ^ 3 > 23
true
```

Element-wise at `Sequence`:

```
>>> [1 3 5 7 9] > [3 4 5 6 7]
[false false false true true]
```

When the arguments to `>` are `boole`, it is the material non-implication `Boolean` function:

```
>>> ([0 1] >.table [0 1]).boole
[0 0; 1 0]
```

The name of this operator is `greaterThanSign`.

* * *

See also: >=, <, <=, Magnitude

References:
_Apl_
[1](https://aplwiki.com/wiki/Greater_than),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/gt#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Greater.html),
_Smalltalk_
5.6.1.3,
_W_
[1](https://en.wikipedia.org/wiki/Material_nonimplication)

Unicode: U+003e > Greater-Than Sign

Categories: Comparing
