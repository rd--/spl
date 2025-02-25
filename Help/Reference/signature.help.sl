# signature

- _signature(aPermutation | aList)_

Answer the signature of _aPermutation_ needed to place the elements of in canonical order.
The signature of the permutation is _-1 ^ n_,
where _n_ is the number of transpositions of pairs of elements that must be composed to build up the permutation.

```
>>> [1 2 3].signature
1

>>> [1 3 2].signature
-1
```

At `List`,
if any two elements of list are the same `signature` answers `zero`:

```
>>> [1 2 2].signature
0
```

Find even permutations:

```
>>> [1 2 3 4].permutations.select { :each |
>>> 	each.signature = 1
>>> }
[
	1 2 3 4; 1 3 4 2; 1 4 2 3;
	2 1 4 3; 2 3 1 4; 2 4 3 1;
	3 2 4 1; 3 1 2 4; 3 4 1 2;
	4 2 1 3; 4 3 2 1; 4 1 3 2
]
```

Rank-3 totally antisymmetric (Levi-Civita) tensor:

```
>>> { :i :j :k |
>>> 	[i j k].signature
>>> }.array([3 3 3])
[
	 0  0  0;
	 0  0  1;
	 0 -1  0
	:;
	 0  0 -1;
	 0  0  0;
	 1  0  0
	:;
	 0  1  0;
	-1  0  0;
	 0  0  0
]
```

~~~spl svg=A
let m = signature:/1.map(
	(4 # 4).shapeIndices
).partition(4 ^ 2);
(m * 0.5 + 0.5).matrixPlot
~~~

![](sw/spl/Help/Image/signature-A.svg)

~~~spl svg=B
let m = signature:/1.map(
	(5 # 5).shapeIndices
).partition(5 ^ 3);
(m * 0.5 + 0.5).matrixPlot
~~~

![](sw/spl/Help/Image/signature-B.svg)

~~~spl png=C
let m = signature:/1.map(
	(6 # 6).shapeIndices
).partition(6 ^ 3);
(m * 0.5 + 0.5).Graymap
~~~

![](sw/spl/Help/Image/signature-C.png)

* * *

See also: cross, minors, determinant, kroneckerDelta, order, isSorted, permutations

References:
_Mathematica_
[1](http://mathworld.wolfram.com/PermutationSymbol.html)
[2](https://reference.wolfram.com/language/ref/Signature.html.en)
