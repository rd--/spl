# $ (dollarSign)

- _aBlock:/1 $ anObject_

Apply _aBlock_ to _anObject_.

```
>>> { :x |
>>> 	x * x * x
>>> } $ 3
27

>>> cube:/1 $ 3
27
```

This is the operator form of `value`:

```
>>> { :x |
>>> 	x * x * x
>>> }.value(3)
27

>>> cube:/1.value(3)
27
```

The name of this operator is `dollarSign`.

* * *

See also: value

Guides: Apply Syntax, Value Apply Syntax
