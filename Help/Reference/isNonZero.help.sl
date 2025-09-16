# isNonZero

- _isNonZero(x)_

Answer `true` if _x_ is not equal to `zero`.

At `SmallFloat`:

```
>>> 0.isNonZero
false

>>> -0.isNonZero
false

>>> 1.isNonZero
true
```

At `Fraction`:

```
>>> 3/4.isNonZero
true

>>> 0/3.isNonZero
false
```

At `Complex`:

```
>>> 0J0.isNonZero
false

>>> 0J1.isNonZero
true

>>> 1J0.isNonZero
true
```

Number that are very close to zero are not zero:

```
>>> 1E-53.isNonZero
true
```

Are all elements of a `List` non-zero:

```
>>> [-1 0 1].allSatisfy(isNonZero:/1)
false

>>> [-1 0 1].collect(isNonZero:/1)
[true false true]
```

* * *

See also: isEven, isNegative, isOdd, isOne, isPositive, isZero

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Nonzero.html),
_W_
[1](https://en.wikipedia.org/wiki/0)
[2](https://en.wikipedia.org/wiki/Zero_element)

Categories: Testing, Math
