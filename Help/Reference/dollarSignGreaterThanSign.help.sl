# $> (dollarSignGreaterThanSign)

- _x $> f/1_

Apply the unary block _f_ to the object _x_.
This is the operator form of `in` and `with`.

```
>>> 3 $> { :x |
>>> 	x * x * x
>>> }
27

>>> 3 * 3 * 3 $> cubeRoot/1
3
```

The name of this operator is `dollarSignGreaterThanSign`.

* * *

See also: <$, in, with

Guides: Apply Syntax, Binary Operators, Block Functions, Value Apply Syntax
