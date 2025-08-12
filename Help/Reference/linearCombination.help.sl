# linearCombination

- _linearCombination(v, c)_

Answer the linear combiniation of the terms _v_ and the constants _c_.
Multiplies each term at _v_ by the constants at _c_ and sums the answers.

```
>>> let v = [1 2 3; 4 5 6; 7 8 9];
>>> let c = [3 5 7];
>>> (
>>> 	linearCombination(v, c),
>>> 	(c * v).sum
>>> )
(
	[72 87 102],
	[72 87 102]
)
```

The unit vectors along each axis form the identity:

```
>>> let v = [1 0 0; 0 1 0; 0 0 1];
>>> let c = [3 5 7];
>>> linearCombination(v, c)
[3 5 7]
```

* * *

See also: *, sum

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LinearCombination.html),
_W_
[1](https://en.wikipedia.org/wiki/Linear_combination)
