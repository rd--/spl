# and

- _b & f:/0_
- _c.&_

Nonevaluating conjunction.
`true` if the boolean _b_ is `true` and the block _f_ evaluates to `true`, else `false`.
If _b_ is `false` then _f_ is not evaluated.
The operator form is `&`.

```
>>> true & { true }
true

>>> true & { false }
false
```

The unary form of `and`,
defined for collections,
is `allSatisfy` of `blockValue`:

```
>>> [
>>> 	{ 1 > 0 },
>>> 	{ 2 > 1 },
>>> 	{ 3 > 2 }
>>> ].&
true
```

Applicative syntax:

```
>>> and(
>>> 	[
>>> 		{ 1 > 0 },
>>> 		{ 2 > 1 },
>>> 		{ 3 > 2 }
>>> 	]
>>> )
true
```

* * *

See also: &, |, &&, allSatisfy, or, value

Guides: Boolean Functions, Binary Operators, Logical Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/And),
_Mathematica_
[1](https://mathworld.wolfram.com/AND.html)
[2](https://reference.wolfram.com/language/ref/And.html),
_Smalltalk_
5.3.3.3,
_W_
[1](https://en.wikipedia.org/wiki/Logical_conjunction)

Categories: Logic, Operator
