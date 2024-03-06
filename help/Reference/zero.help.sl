# zero

- _zero(anObject)_

Answer a zero value of the same type as _anObject_.

```
>>> (2 + 3.i).zero
Complex(0, 0)

>>> 1/3.zero
Fraction(0, 1)

>>> 3.141.zero
0.0
```

List answers with a zeroed collection of the same shape:

```
>>> [1 2 3; 4 5 6; 7 8 9].zero
[0 0 0; 0 0 0; 0 0 0]
```

* * *

See also: one

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Zero.html)

Categories: Instance Creation
