# ==

- _anObject == anotherObject_

Answers _true_ if _anObject_ is identical to _anotherObject_, else _false_.

This is the identity operator.
It decides if two values are the same.

String and integers are identical:

```
>>> 'abc' == 'abc'
true

>>> 123 == 123
true
```

Complex numbers, fractions and lists are not:

```
>>> 1j1 == 1j1
false

>>> 1/3 == 1/3
false

>>> [1 2 3] == [1 2 3]
false
```

The name of this operator is _equalsSignEqualsSign_

Where supported this operator is displayed as ≡.

* * *

See also: =, ~~, ~

Unicode: U+2261 ≡ Identical To

References:
_Mathematica_
[2](https://reference.wolfram.com/language/ref/SameQ.html)

Categories: Comparing
