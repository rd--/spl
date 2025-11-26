# evaluatingAnd

- _b₁ && b₂_
- _c.&&_

Evaluating conjunction, that is the evaluating form of `and`.
The operand _b₂_ must be a `Boolean`.
It is called _evaluating_ because the operand is not delayed.
The operator form is `&&`.

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

* * *

See also: &, &&, |, ||, allTrue, and, evaluatingOr, lcm, or

Guides: Boolean Functions, Logical Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/And),
_Smalltalk_
5.3.3.1,
_W_
[1](https://en.wikipedia.org/wiki/Logical_conjunction)

Categories: Logic, Operator
