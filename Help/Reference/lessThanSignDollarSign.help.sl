# <$ (lessThanSignDollarSign)

- _f/1 <$ x_

Apply the unary block _f_ to the object _x_.

```
>>> { :x |
>>> 	x * x * x
>>> } <$ 3
27

>>> cube/1 <$ 3
27
```

This is the operator form of `unaryApply`:

```
>>> { :x |
>>> 	x * x * x
>>> }.unaryApply(3)
27

>>> cube/1.unaryApply(3)
27
```

The name of this operator is `lessThanSignDollarSign`.

* * *

See also: $>, value

Guides: Apply Syntax, Binary Operators, Block Functions, Value Apply Syntax
