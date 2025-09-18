# Comparison Functions

Equalities:

- `=`
- `==`

Inequalities:

- `!=`
- `!==`

Orderings:

- `<`
- `<=`
- `>`
- `>=`
- `precedes`

Similarities:

- `~`
- `!~`
- `<~`
- `>~`

Ternary:

- `between`
- `betweenAnd`

Collation:

- `<=>`
- `compare`

A comparison function is one whose result is a `Boolean` determined by the numerical ordering of the arguments.

The comparison functions can be subdivided into two equalities `=` and `!=`,
which depend only on whether the arguments are equal and not on the ordering of the arguments,
and may be applied to values that do not implement `Magnitude`,
and four inequalities `<` `<=` `>=` `>`, which depend on ordering.

Comparisons are subject to comparison tolerance,
for which there are the distinct operators `<~` `~` `>~` `!~`.

Because comparison functions have `Boolean` results on `boole` arguments they are Boolean functions.

_Classification_:
The result of a comparison function on real numbers is determined by their ordering,
which falls into one of three possible cases:
the left argument is smaller (more negative),
the arguments are equal,
or the right argument is larger.

A particular comparison function can thus be thought of as a choice of one `Boolean` value (0 or 1) for each of these three cases,
which implies that there are eight total possibilities.

Two of the possibilities, all 0 and all 1, are trivial and cannot be said to depend on the ordering of the arguments;
they are not considered comparison functions.

Every remaining possibility is one of the comparisons:

```
>>> [
>>> 	<, <=, =, >=, >, !=
>>> ].collect { :f:/2 |
>>> 	[f(0, 1), f(0, 0), f(1, 0)]
>>> }.boole
[
	1 0 0;
	1 1 0;
	0 1 0;
	0 1 1;
	0 0 1;
	1 0 1
]
```

The distinction between `<` and `<|` is subtle:

```
>>> 1 < 3
true

>>> 1 <| 3
true

>>> 3 <= 3
true

>>> 3 <=| 3
true

>>> 2 < [1 2 3]
[false false true]

>>> 2 <= [1 2 3]
[false true true]

>>> {
>>> 	2 <| [1 2 3]
>>> }.ifError { true }
true

>>> [2 2 2] < [1 2 3]
[false false true]

>>> [2 2 2] <= [1 2 3]
[false true true]

>>> [2 2 2] <| [1 2 3]
false

>>> [2 2 2] <=| [1 2 3]
false

>>> {
>>> 	1J1 < 2J2
>>> }.ifError { true }
true

>>> 1J1 <| 2J2
true

>>> {
>>> 	'bcd' < 'abc'
>>> }.ifError { true }
true

>>> 'bcd' <| 'abc'
false
```

* * *

See also: <, <=, =, >=, >, !=, <~, ~, >~, !~, boole, Boolean, Magnitude, Number, String

References:
_Apl_
[1](https://aplwiki.com/wiki/Comparison_function)
