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

Factorial is product of a `Range`:

```
>>> 9.factorial
1:9.product

>>> 1:9.product
362880
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

Where supported `product` is displayed as Π.

* * *

See also: *, injectInto, reduce, sum

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
