# =

- _anObject = anotherObject_

`=` is both a syntax token and an operator.

As an operator it represents _structural equality_.
It answers `true` if _anObject_ is equal to _anotherObject_, else `false`.
The meaning of equality is determined by the type of _anObject_.

At `SmallFloat`:

```
>>> 3 = 1
false

>>> 2 = 2
true
```

At `List`:

```
>>> [3 2 1] = [1 2 3]
false

>>> [4 5] = [4 5]
true
```

To compare element-wise use `each`:

```
>>> [3 2 1] =.each [1 2 3]
[false true false]
```

At `String`:

```
>>> 'x' = 'x'
true

>>> '321' =.each '123'
[false true false]
```

At `Complex`:

```
>>> 1j1 = 1j1
true

>>> [3j2 2j2 1j2] =.each [2j2]
[false true false]

>>> 1j0 = 1
true
```

At `Fraction`:

```
>>> 6/4 = 3/2
true
```

At `SmallFloat` and `Fraction`:

```
>>> 3/2 = 1.5 & { 1.5 = 3/2 }
true
```

When the arguments to `=` are `boole`, it is the logical biconditional function:

```
>>> ([0 1] =.table [0 1]).boole
[1 0; 0 1]
```

The `=` method is not implemented at `Object`.

As a syntax token the `=` symbol is a part of `Let Syntax`.

The name of this operator and syntax token is `equalsSign`.

* * *

See also: <, <=, >, >=, ~=, ==, ~, :=, hasEqualSlots, Let Syntax

Guides: Let Syntax

References:
_Apl_
[1](https://aplwiki.com/wiki/Equal_to),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Eq),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/eq#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/Equal.html)
[2](https://mathworld.wolfram.com/Equivalent.html)
[3](https://reference.wolfram.com/language/ref/Equal.html),
_Smalltalk_
5.3.1.1,
_W_
[1](https://en.wikipedia.org/wiki/Logical_biconditional)

Categories: Comparing
