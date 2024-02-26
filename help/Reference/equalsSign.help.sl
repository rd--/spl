# =

- _anObject = anotherObject_

The _structural equality_ operator.
Answers `true` if _anObject_ is equal to _anotherObject_, else `false`.
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
```

The _=_ method is not implemented at `Object`.

The name of this operator is _equalsSign_.

The _=_ symbol is also a part of `Let Syntax`.

* * *

See also: ~=, ==, ~, :=, equalSlots, Let Syntax

References:
_Apl_
[1](https://aplwiki.com/wiki/Equal_to),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Eq),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/eq#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/Equal.html)
[2](https://reference.wolfram.com/language/ref/Equal.html)

Categories: Comparing
