# stolarskyHarborthConstant

- _stolarskyHarborthConstant(aNumber)_

Answer _aNumber_ times the Stolarsky-Harborth Constant.

```
>>> 1.stolarskyHarborthConstant
0.81256
```

The number of odd elements in the first _n_ rows of Pascal’s triangle,
OEIS [A006046](https://oeis.org/A006046):

```
>>> let b = { :k |
>>> 	k.digitCount(2, 1)
>>> };
>>> 1:15.collect { :n |
>>> 	(0 .. n - 1).collect { :k |
>>> 		2 ^ b(k)
>>> 	}.sum
>>> }
[1 3 5 9 11 15 19 27 29 33 37 45 49 57 65]
```

Plot of first two hundred terms of _f(n) / (n ^ theta)_:

~~~spl svg=A
let b = { :k |
	k.digitCount(2, 1)
};
let f = { :n |
	(0 .. n - 1).collect { :k |
		2 ^ b(k)
	}.sum
};
let n = 1:200;
(n.collect(f:/1) / (n ^ 3.log(2))).linePlot
~~~

![](sw/spl/Help/Image/stolarskyHarborthConstant-A.svg)

* * *

See also: binomial, digitCount, pascalTriangle

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Stolarsky-HarborthConstant.html),
_OEIS_
[1](https://oeis.org/A006046)
[2](https://oeis.org/A077464)
