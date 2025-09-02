# || (verticalLineVerticalLine)

- _b₁ || b₂_
- _c.||_

Evaluating disjunction, that is the evaluating form of `|`.
The operand _b₂_ must be a `Boolean`.

```
>>> false || true
true

>>> true || false
true
```

Collects over lists:

```
>>> let u = [false false true true];
>>> let v = [false true false true];
>>> u || v
[false true true true]
```

As a reduction decides if any element is `true`:

```
>>> [false false false true].reduce(||)
true

>>> [false false false true].reduce(||)
true
```

Combine assertions with `||`:

```
>>> (2 < 1) || (1.pi > 3)
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

`||` is defined for the integers `zero` and `one`, which are the `boole` of `false` and `true`:

```
>>> ||.table([0 1], [0 1])
[
	0 1;
	1 1
]
```

The name of this operator is `verticalLineVerticalLine`.

* * *

See also: &, &&, |, gcd

Guides: Boolean Functions, Logical Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/Or),
_Smalltalk_
5.3.3.2,
_W_
[1](https://en.wikipedia.org/wiki/Logical_disjunction)

Unicode: U+2228 ∨ Logical or

Categories: Logic, Operator
