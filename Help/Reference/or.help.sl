# or

- _b | f:/0_
- _c.|_

Non-evaluating disjunction.
It answers `true` if the boolean _b_ is `true`,
or if _b_ is `false` or the block _f_ evaluates to `true`,
else `false`.
If _b_ is `true` then _f_ is not evaluated.

Combine assertions:

```
>>> true | { true }
true

>>> true | { false }
true

>>> false | { true }
true

>>> false | { false }
false

>>> (1 > 2) | { 1.pi > 3 }
true
```

The unary form of `or` is `anySatisfy` of `blockValue`:

```
>>> [
>>> 	{ 1 < 0 },
>>> 	{ 2 < 1 },
>>> 	{ 3 < 2 }
>>> ].or
false
```

Applicative syntax:

```
>>> or(
>>> 	[
>>> 		{ 1 < 0 },
>>> 		{ 2 < 1 },
>>> 		{ 3 < 2 }
>>> 	]
>>> )
false
```

Where supported `or` is displayed as ∨.

_Note:_
In Smalltalk the evaluting form is called _or:_ and the non-evaluating form _|_.
In Sᴘʟ the names are `|` and `||`.
Note that `|` is not displayed as ∨ because it is part of the `Block Syntax`.

* * *

See also: &, &&, |, ||, and, or

Guides: Boolean Functions, Binary Operators, Logical Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/Or),
_Mathematica_
[1](https://mathworld.wolfram.com/OR.html)
[2](https://reference.wolfram.com/language/ref/Or.html),
_Smalltalk_
5.3.3.10,
_W_
[1](https://en.wikipedia.org/wiki/Logical_disjunction)

Unicode: U+2228 ∨ Logical or

Categories: Logic, Operator
