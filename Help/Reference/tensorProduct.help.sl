# tensorProduct

- _tensorProduct([t₁ t₂ …])_

Answer the tensor product of _t_.

The product of a two vector, a 2×2 matrix and a two vector is a 2×2×2×2 array:

```
>>> let a = [2 3];
>>> let b = [4 5; 6 7];
>>> let c = [8 9];
>>> [a b c].tensorProduct
[
	[
		[
			[2 * 4 * 8, 2 * 4 * 9],
			[2 * 5 * 8, 2 * 5 * 9]
		],
		[
			[2 * 6 * 8, 2 * 6 * 9],
			[2 * 7 * 8, 2 * 7 * 9]
		]
	],
	[
		[
			[3 * 4 * 8, 3 * 4 * 9],
			[3 * 5 * 8, 3 * 5 * 9]
		],
		[
			[3 * 6 * 8, 3 * 6 * 9],
			[3 * 7 * 8, 3 * 7 * 9]
		]
	]
]
```

The product of a 2×5 matrix and a 3×4 matrix is a 2×5×3×4 array:

```
>>> let a = [
>>> 	7 9 3 0 3;
>>> 	6 8 10 10 4
>>> ];
>>> let b = [
>>> 	5 4 10 4;
>>> 	8 4 3 4;
>>> 	9 4 5 7
>>> ];
>>> let c = [a b].tensorProduct;
>>> (c.shape, c)
(
	[2 5 3 4],
	[
		[
			35 28 70 28;
			56 28 21 28;
			63 28 35 49
			:;
			45 36 90 36;
			72 36 27 36;
			81 36 45 63
			:;
			15 12 30 12;
			24 12 9 12;
			27 12 15 21
			:;
			0 0 0 0;
			0 0 0 0;
			0 0 0 0
			:;
			15 12 30 12;
			24 12 9 12;
			27 12 15 21
		],
		[
			30 24 60 24;
			48 24 18 24;
			54 24 30 42
			:;
			40 32 80 32;
			64 32 24 32;
			72 32 40 56
			:;
			50 40 100 40;
			80 40 30 40;
			90 40 50 70
			:;
			50 40 100 40;
			80 40 30 40;
			90 40 50 70
			:;
			20 16 40 16;
			32 16 12 16;
			36 16 20 28
		]
	]
)
```

The tensor product is not commutative:

```
>>> [3 5; 11 7].tensorProduct
[33 21; 55 35]

>>> [11 7; 3 5].tensorProduct
[33 55; 21 35]

>>> [33 21; 55 35].transpose
[33 55; 21 35]
```

At singleton list:

```
>>> [1I].tensorProduct
1I

>>> [1I].foldRight(outerProduct:/2)
1I
```

At empty list:

```
>>> [].tensorProduct
1
```

Count distinct products,
OEIS [A322967](https://oeis.org/A322967):

```
>>> 1:8.collect { :n |
>>> 	n:1:-1.collect { :k |
>>> 		let m = n - k + 1;
>>> 		let t = [k].constantArray(
>>> 			[1 .. m]
>>> 		);
>>> 		t.tensorProduct
>>> 		.flatten.nub.size
>>> 	}
>>> }
[
	1;
	1 2;
	1 3 3;
	1 4 6 4;
	1 5 10 9 5;
	1 6 15 16 14 6;
	1 7 21 25 30 18 7;
	1 8 28 36 55 40 25 8
]
```

Plot count of distinct products,
OEIS [A322967](https://oeis.org/A322967):

~~~spl svg=A
OeisEntry('A322967').then { :e |
	e.bFileData
	.first(135)
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/tensorProduct-A.svg)

* * *

See also: *, foldRight, outer, outerProduct

Guides: Array Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TensorDirectProduct.html)
[2](https://reference.wolfram.com/language/ref/TensorProduct.html),
_W_
[1](https://en.wikipedia.org/wiki/Tensor_product)
