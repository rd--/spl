# && (ampersandAmpersand)

- _aBoolean && anotherBoolean_
- _aCollection.&&_

Evaluating conjunction.
The _evaluating_ form of `&`.
The operand must be a `Boolean`.

```
>>> true && true
true

>>> true && false
false
```

Collects over lists:

```
>>> let u = [false false true true];
>>> let v = [false true false true];
>>> u && v
[false false false true]
```

As a reduction decides if all elements are `true`:

```
>>> [true true true true true].reduce(&&)
true

>>> [true false false true true].reduce(&&)
false
```

Combine assertions with `&&`:

```
>>> (2 > 1) && (1.pi > 3)
true
```

`&&` is defined for the integers `zero` and `one`, which are the `boole` of `false` and `true`:

```
>>> &&.table([0 1], [0 1])
[0 0; 0 1]
```

The name of this operator is `ampersandAmpersand`.

* * *

See also: &, |, ||, allTrue, lcm

Guides: Boolean Functions, Logical Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/And),
_Smalltalk_
5.3.3.1,
_W_
[1](https://en.wikipedia.org/wiki/Logical_conjunction)

Categories: Logic, Operator
