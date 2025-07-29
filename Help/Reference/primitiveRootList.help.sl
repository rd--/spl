# primitiveRootList

- _primitiveRootList(n)_

Answer a list of primitive roots of _n_.

Lists of primitive roots:

```
>>> 9.primitiveRootList
[2 5]

>>> 14.primitiveRootList
[3 5]
```

Table of first few primitive roots:

```
>>> 2:31.collect(primitiveRootList:/1)
[
	1;
	2;
	3;
	2 3;
	5;
	3 5;
	;
	2 5;
	3 7;
	2 6 7 8;
	;
	2 6 7 11;
	3 5;
	;
	;
	3 5 6 7 10 11 12 14;
	5 11;
	2 3 10 13 14 15;
	;
	;
	7 13 17 19;
	5 7 10 11 14 15 17 19 20 21;
	;
	2 3 8 12 13 17 22 23;
	7 11 15 19;
	2 5 11 14 20 23;
	;
	2 3 8 10 11 14 15 18 19 21 26 27;
	;
	3 11 12 13 17 21 22 24
]
```

If n has a primitive root, then it has exactly _phi(phi(n))_ of them:

```
>>> 2:31.collect(primitiveRootList:/1)
>>> .collect(size:/1)
[
	1  1  1  2  1  2  0  2  2  4
	0  4  2  0  0  8  2  6  0  0
	4 10  0  8  4  6  0 12  0  8
]

>>> 2:31.collect { :n |
>>> 	n.eulerPhi.eulerPhi
>>> }
[
	1  1  1  2  1  2  2  2  2  4
	2  4  2  4  4  8  2  6  4  4
	4 10  4  8  4  6  4 12  4  8
]
```

* * *

See also: mangoldtLambda, welchCostasArrayList

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimitiveRoot.html)
[2](https://reference.wolfram.com/language/ref/PrimitiveRootList.html),
_OEIS_
[1](https://oeis.org/A033948)
[2](https://oeis.org/A046144),
_W_
[1](https://en.wikipedia.org/wiki/Primitive_root_modulo_n)
