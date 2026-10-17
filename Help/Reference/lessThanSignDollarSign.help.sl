# <$ (lessThanSignDollarSign)

- _f/1 <$ x_

Sometimes define as the operator form of `unaryApply`:

```
>>> let <$ = unaryApply/2;
>>> { :x |
>>> 	x * x * x
>>> } <$ 3
27

>>> { :x |
>>> 	x * x * x
>>> }.unaryApply(3)
27

>>> let <$ = unaryApply/2;
>>> cube/1 <$ 3
27

>>> cube/1.unaryApply(3)
27
```

The name of this operator is `lessThanSignDollarSign`.

* * *

See also: $>

Guides: Apply Syntax, Binary Operators, Block Functions, Value Apply Syntax
