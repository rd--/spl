# product

- _product(aCollection)_ ⟹ _reduce(aCollection, *)_

Answer the product of all the elements in _aCollection_

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

Plot the sequence of partial products:

~~~spl svg=A
(1 -- 50).functionPlot { :i |
	let z = 2 + (i * 2 * pi / 15).sin;
	(11 / 12) ^ i * z
}
~~~

![](sw/spl/Help/Image/product-A.svg)

~~~spl svg=B
1:50.functionPlot { :j |
	1:j.collect { :i |
		let z = 2 + (i * 2 * pi / 15).sin;
		(11 / 12) ^ i * z
	}.product
}
~~~

![](sw/spl/Help/Image/product-B.svg)

Where supported `product` is displayed as Π.

* * *

See also: *, injectInto, reduce, sum

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Product.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.prod.html),
_W_
[1](https://en.wikipedia.org/wiki/Empty_product)

Unicode: U+03A0 Π Greek capital letter pi

Categories: Math, Operator
