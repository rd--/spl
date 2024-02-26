# product

- _product(aCollection)_ ⟹ _reduce(aCollection, *)_

Answer the product of all the elements in _aCollection_

```
>>> [1 2 3 5 7 9].product
1890

>>> [1 2 3 5 7 9].reduce(*)
1890
```

The product of an empty collection is one:

```
>>> [].product
1
```

Factorial is product of a Range:

```
>>> 9.factorial
1:9.product

>>> 1:9.product
362880
```

Where supported this method is displayed as Π.

* * *

See also: *, injectInto, reduce, sum

Unicode: U+03A0 Π Greek capital letter pi

Categories: Math, Operator
