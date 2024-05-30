# arrayRules

- _arrayRules(aMatrix, anObject)_

Answer an `Association` `List` indicating the values at _aMatrix_ that are not equal to _anObject_.
This is one form of sparse representation of a matrix.

A 3×3 matrix with six `zero` elements answers a list of three places:

```
>>> 3.identityMatrix.arrayRules(0)
[
	[1 1] -> 1,
	[2 2] -> 1,
	[3 3] -> 1
]
```

A 3×3 matrix with three `zero` elements answers a list of six places:

```
>>> [2 0 1; 2 2 0; 1 0 1].arrayRules(2)
[
	[1 2] -> 0,
	[1 3] -> 1,
	[2 3] -> 0,
	[3 1] -> 1,
	[3 2] -> 0,
	[3 3] -> 1
]
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayRules.html)
