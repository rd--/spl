# product

- _product(c)_
- _product(c, f:/1)_

Answer the product of all the elements in the collection _c_.

```
>>> [1 2 3 5 7 9].product
1890

>>> [1 2 3 5 7 9].reduce(*)
1890

>>> (1:6 ^ 2).product
518400
```

The product of an empty collection is one:

```
>>> [].product
1
```

Factorial is product of a `Range` from `one` with step size `one`:

```
>>> 9.factorial
1:9.product

>>> 1:9.product
362880
```

There is a closed form for arithmetic series:

```
>>> 1:19.product
121645100408832000L

>>> 1:19.reduce(*)
1.2165E+17

>>> 3:23.product
12926008369442488320000L

>>> 3:23.reduce(*)
1.2926E+22

>>> [5, 7 .. 31].product
6.3966E16

>>> [5L, 7 .. 31].reduce(*)
63966261320836875L

>>> [1, 1.05 .. 2].product
1599.155

>>> [1, 1.05 .. 2].reduce(*)
1599.155

>>> [-3, -1 .. 23].product
9.4870E11

>>> [-3, -1 .. 23].reduce(*)
948702429675
```

At a matrix answer the products of the columns:

```
>>> [3 3].iota.product
[28 80 162]

>>> [1 4 7; 2 5 8; 3 6 9]
>>> .collect(product:/1)
[28 80 162]
```

Collecting answers the products of the rows:

```
>>> [3 3].iota.collect(product:/1)
[6 120 504]

>>> [1 4 7; 2 5 8; 3 6 9].product
[6 120 504]
```

The binary form applies the block _f_ to each element before multiplying:

```
>>> 1:6.product(square:/1)
518400
```

Product representation of π:

```
>>> let n = 1E4;
>>> 2 * 1:n.product { :k |
>>> 	let m = 2 * k;
>>> 	(4 * (k ^ 2)) / ((m - 1) * (m + 1))
>>> }
3.1415
```

OEIS [A005701](https://oeis.org/A005701):

```
>>> 0:9.collect { :n |
>>> 	(n + [1 2 3 6]).product
>>> } / 12
[3 14 40 90 175 308 504 780 1155 1650]
```

Plot a function:

~~~spl svg=A
(1 -- 50).functionPlot { :i |
	let z = 2 + (i * 2.pi / 15).sin;
	(11 / 12) ^ i * z
}
~~~

![](sw/spl/Help/Image/product-A.svg)

Plot the sequence of partial products of the function:

~~~spl svg=B
1:50.collect { :j |
	1:j.collect { :i |
		let z = 2 + (i * 2.pi / 15).sin;
		(11 / 12) ^ i * z
	}.product
}.discretePlot
~~~

![](sw/spl/Help/Image/product-B.svg)

Plot cumulant expansion numbers,
OEIS [A127671](https://oeis.org/A127671):

~~~spl svg=C
let c = { :p |
	let s = p.unique;
	let k = p.size;
	let j = k - 1;
	let h = s.product { :x |
		p.occurrencesOf(x).!
	};
	let q = p.!.product * h;
	p.sum.! * j.! * (-1 ^ j) / q
};
1:11.collect { :n |
	n.integerPartitions.collect(c:/1)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/product-C.svg)

Where supported `product` is displayed as Π.

* * *

See also: *, injectInto, reduce, sum

Guides: Collection Functions, Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Product.html)
[2](https://reference.wolfram.com/language/ref/Product.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.prod.html),
_W_
[1](https://en.wikipedia.org/wiki/Product_(mathematics))
[2](https://en.wikipedia.org/wiki/Empty_product)

Unicode: U+03A0 Π Greek capital letter pi

Categories: Math, Operator
