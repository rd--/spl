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

Plot the sequence of partial products:

~~~
1:50.functionPlot { :i | (11 / 12) ^ i * (2 + (i * 2 * pi / 15).sin) }

1:50.functionPlot { :j | 1:j.collect { :i | (11 / 12) ^ i * (2 + (i * 2 * pi / 15).sin) }.product }
~~~

Where supported `product` is displayed as Π.

* * *

See also: *, injectInto, reduce, sum

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Product.html),
_W_
[1](https://en.wikipedia.org/wiki/Empty_product)

Unicode: U+03A0 Π Greek capital letter pi

Categories: Math, Operator
