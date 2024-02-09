# ||

- _aBoolean || anotherBoolean_

Evaluating conjunction.
The evaluating form of |.
The operand must be a Boolean.

```
>>> false || true
true

>>> true || false
true
```

Collects over lists:

```
>>> [false false true true] || [false true false true]
[false true true true]
```

As a reduction decides if any element is true:

```
>>> [false false false true].reduce(||)
true

>>> [false false false true].reduce(||)
true
```

Combine assertions with ||:

```
>>> (2 < 1) || (pi > 3)
true
```

The name of this operator is _verticalLineVerticalLine_.

* * *

See also: &, &&, |

Unicode: U+2228 ∨ Logical or

Categories: Logic, Operator
