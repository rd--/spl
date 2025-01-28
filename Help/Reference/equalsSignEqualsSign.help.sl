# == (equalsSignEqualsSign)

- _anObject == anotherObject_

Answers `true` if _anObject_ is identical to _anotherObject_, else `false`.

This is the _identitical to_ operator.
It decides if two values are references to the same object.

Equal strings are identical, at `String`:

```
>>> 'abc' == 'abc'
true
```

Equal integers are identical, at `SmallFloat`:

```
>>> 123 == 123
true
```

Equal complex numbers, fractions and lists are not identical.
At `Complex`:

```
>>> 1J1 == 1J1
false
```

At `Fraction`:

```
>>> 1/3 == 1/3
false
```

At `List`:

```
>>> [1 2 3] == [1 2 3]
false
```

Negative zero is equal to, and therefore identical to, zero:

```
>>> -0 == 0
true
```

`Block`s can be compared for identity,
including the block `==`:

```
>>> == == ==
true
```

The name of this operator is `equalsSignEqualsSign`.

Where supported `==` is displayed as ≡.

* * *

See also: =, ~~, ~

Unicode: U+2261 ≡ Identical To

References:
_Lisp_
[1](https://www.lispworks.com/documentation/HyperSpec/Body/f_eq.htm#eq)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SameQ.html),
_Smalltalk_
5.3.1.2

Categories: Comparing
