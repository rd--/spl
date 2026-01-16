# greater

- _x > y_

Answers `true` if _x_ is greater than _y_, else `false`.
The operator form is `>`.

```
>>> 1.pi > 1.e
true

>>> 3 ^ 3 > 23
true
```

Element-wise at `List`:

```
>>> [1 3 5 7 9] > [3 4 5 6 7]
[false false false true true]

>>> [1 .. 9] > [1 3 5 1 5 9 1 7 13]
[
	false false false true false
	false true true false
]
```

When the arguments to `>` are `boole`, it is the material non-implication `Boolean` function:

```
>>> ([0 1] >.table [0 1]).boole
[0 0; 1 0]
```

* * *

See also: >, >=, |>, <, <=, greaterEqual, less, Magnitude

Guides: Comparison Functions, Sort Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Greater_than),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/gt#dyadic)
[2](https://code.jsoftware.com/wiki/Vocabulary/gtdot),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Greater.html),
_Smalltalk_
5.6.1.3,
_W_
[1](https://en.wikipedia.org/wiki/Material_nonimplication)

Unicode: U+003e > Greater-Than Sign

Categories: Comparing
