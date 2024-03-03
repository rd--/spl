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

When combined with `reduce`, `||` can be used to test if any value in a `Boolean` vector is `true`:

```
>>> [false false true false false].reduce(||)
true

>>> [false false false false false].reduce(||)
false
```

`||` is logical disjunction in `Boolean` logic:

```
>>> [false true] ||.table [false true]
[false true; true true]
```

The name of this operator is _verticalLineVerticalLine_.

* * *

See also: &, &&, |

References:
_Apl_
[1](https://aplwiki.com/wiki/Or),
_Smalltalk_
5.3.3.2

Unicode: U+2228 ∨ Logical or

Categories: Logic, Operator
