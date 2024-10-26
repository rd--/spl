# ~=

- _anObject ~= anotherObject_

This is the _structural inequality_ operator,
it answers _false_ if _anObject_ is equal to _anotherObject_, else _true_.
The meaning of _notEquals_ is determined by the _typeOf(anObject)_.

```
>>> 2 ~= 2.5
true

>>> [2 2.5 3 3.5] ~=.each [2.5]
[true false true true]
```

When the arguments to `~=` are `boole`, it is the exclusive or function:

```
>>> ([0 1] ~=.table [0 1]).boole
[0 1; 1 0]
```

Where supported `~=` is displayed as ≠.

The name of this operator is `tildeEqualsSign`.

* * *

See also: =, ==, ~~, <, <=, >=

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
[1](https://en.wikipedia.org/wiki/Exclusive_or)

Unicode: U+2260 ≠ Not equal to

Categories: Comparing
