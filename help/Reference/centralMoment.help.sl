# centralMoment

- _centralMoment(aCollection, r)_

Answer the order _r_ central moment of _aCollection_.

```
>>> 1:4.centralMoment(4)
(41 / 16)

>>> [pi e 2].centralMoment(2)
(2 / 9 * (4 - 2.e + e.squared - 2.pi - (e * pi) + pi.squared))

>>> 1:4.centralMoment(2)
1.25
```

* * *

See also: kurtosis, moment, skewness, variance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CentralMoment.html)
