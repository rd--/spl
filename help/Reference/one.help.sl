# one

- _one(anObject)_

Answer a unit value of the same type as _anObject_.

```
>>> (2 + 3.i).one
Complex(1, 0)

>>> 1/3.one
Fraction(1, 1)

>>> 3.141.one
1.0
```

List answers with a unit collection of the same shape:

```
>>> [1 2 3; 4 5 6; 7 8 9].one
[1 1 1; 1 1 1; 1 1 1]
```

* * *

See also: zero

References:
_Mathematica_
[1](https://mathworld.wolfram.com/1.html)

Categories: Instance Creation
