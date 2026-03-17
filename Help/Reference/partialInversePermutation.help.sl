# partialInversePermutation

- _partialInversePermutation([x₁ x₂ …])_

Answer the partial inverse permutation for the permutation partially defined by the permutation list _x_,
up to one less than the minimum excluded value of _x_.

```
>>> [1 3 5 2].partialInversePermutation
[1 4 2]
```

If _x_ is a complete permutation, answer the complete inverse permutation:

```
>>> [1 3 5 2 4].partialInversePermutation
[1 4 2 5 3]

>>> [1 3 5 2 4].inversePermutation
>>> .permutationList
[1 4 2 5 3]
```

Partial inverse of self-inverse permutation of the positive integers,
OEIS [A122111](https://oeis.org/A122111),
the first two hundred terms gives the first eighteen places of the inverse permutation:

```
>>> let a = 1:200.collect(
>>> 	'A122111'.oeisFunction
>>> );
>>> let b = a.partialInversePermutation;
>>> let c = b.size;
>>> (b, c, a.first(c) = b)
(
	[
		 1  2  4  3  8  6  16  5  9 12
		32 10 64 24 18  7 128 15
	],
	18,
	true
)
```

Given the initial terms of a permutation of the positive integers,
OEIS [A101369](https://oeis.org/A101369),
derive the partial inverse permutation,
OEIS [A101438](https://oeis.org/A101438):

~~~spl svg=A oeis=A101438
let m = 2.sqrt;
1:85.collect { :n |
	n.isEven.if {
		n + (n / m - (1 / m)).floor
	} {
		1 + (n / m).floor
	}
}.partialInversePermutation.discretePlot
~~~

![](Help/Image/partialInversePermutation-A.svg)

* * *

See also: inversePermutation, permutationList

Guides: Permutation Functions
