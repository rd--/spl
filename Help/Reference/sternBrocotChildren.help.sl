# sternBrocotChildren

- _sternBrocotChildren(n/d)_

Answer the children of the fraction _n/d_ in the Stern-Brocot tree,
in ascending order.

The children of _23/16_:

```
>>> 23/16.sternBrocotChildren
[33/23 36/25]

>>> [23/16 33/23 36/25]
>>> .continuedFraction
[
	1 2 3 2;
	1 2 3 3;
	1 2 3 1 2
]
```

The Stern-Brocot tree is `unfoldTree` of _1/1_ and `sternBrocotChildren`:

```
>>> 4.unfoldTree(
>>> 	1/1,
>>> 	sternBrocotChildren:/1
>>> ).levelOrderValues
[
	1/1
	1/2 2/1
	1/3 2/3 3/2 3/1
	1/4 2/5 3/5 3/4 4/3 5/3 5/2 4/1
]
```

* * *

See also: continuedFraction, Fraction, fromContinuedFraction, sternBrocotParent, sternBrocotTree
