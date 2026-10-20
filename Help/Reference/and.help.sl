# and

- _b & f/0_
- _c.&_

Nonevaluating logical conjunction.
`true` if the boolean _b_ is `true` and the block _f_ evaluates to `true`, else `false`.
If _b_ is `false` then _f_ is not evaluated.
The operator form is `&`.

```
>>> true & { true }
true

>>> true & { false }
false
```

Truth table for `and`,

```
>>> { :a :b |
>>> 	a & { b }
>>> }.table([true false], [true false])
[
	true false;
	false false
]
```

The unary form of `and`,
defined for collections,
is `allSatisfy` of `nullaryApply`:

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

The truth table for _implies_,
equal to `<=` at `boole`:

```
>>> { :p :q |
>>> 	(p & { q.not }).not
>>> }.table([false true], [false true])
[true true; false true]

>>> <=.table([0 1], [0 1])
[true true; false true]
```

* * *

See also: &, |, &&, allSatisfy, or

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
