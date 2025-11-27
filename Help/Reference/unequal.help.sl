# unequal

- _x != y_

This is the structural inequality operator,
it answers `false` if the object _x_ is equal to another object _y_, else `true`.
The meaning is determined by the type of _x_.
The operator form is `!=`.

At `SmallFloat`:

```
>>> 2 != 2.5
true
```

At `Fraction`:

```
>>> 2/3 != 3/5
true
```

Across elements of sequences:

```
>>> [2 2.5 3 3.5] !=.each [2.5]
[true false true true]
```

When the arguments to `!=` are `boole`, it is the exclusive or function:

```
>>> ([0 1] !=.table [0 1]).boole
[0 1; 1 0]
```

* * *

See also: =, !, ==, ~~, <, <=, >=, equal

Guides: Binary Operators, Comparison Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Not_Equal_to),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/tildeco#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Unequal.html),
_Smalltalk_
5.3.1.3,
_W_
[1](https://en.wikipedia.org/wiki/Inequation)
[2](https://en.wikipedia.org/wiki/Exclusive_or)

Categories: Comparing
