# ==

- _anObject == anotherObject_

Answers `true` if _anObject_ is identical to _anotherObject_, else `false`.

This is the _identitical to_ operator.
It decides if two values are references to the same object.

Equal strings are identical:

```
>>> 'abc' == 'abc'
true
```

Equal integers are identical:

```
>>> 123 == 123
true
```

Equal complex numbers, fractions and lists are not identical:

```
>>> 1j1 == 1j1
false

>>> 1/3 == 1/3
false

>>> [1 2 3] == [1 2 3]
false
```

Negative zero is equal to, and therefore identical to, zero:

```
>>> -0 == 0
true
```

The name of this operator is `equalsSignEqualsSign`.

Where supported `==` is displayed as ≡.

* * *

See also: =, ~~, ~

Unicode: U+2261 ≡ Identical To

References:
_Mathematica_
[2](https://reference.wolfram.com/language/ref/SameQ.html),
_Smalltalk_
5.3.1.2

Categories: Comparing
