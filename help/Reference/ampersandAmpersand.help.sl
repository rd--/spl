# &&

- _aBoolean && anotherBoolean_

Evaluating conjunction.
The _evaluating_ form of &.
The operand must be a Boolean.

```
>>> true && true
true

>>> true && false
false
```

Collects over lists:

```
>>> [false false true true] && [false true false true]
[false false false true]
```

As a reduction decides if all elements are true:

```
>>> [true true true true true].reduce(&&)
true

>>> [true false false true true].reduce(&&)
false
```

Combine assertions with &&:

```
>>> (2 > 1) && (pi > 3)
true
```

The name of this operator is _ampersandAmpersand_.

* * *

See also: &, |, ||

Categories: Logic, Operator
