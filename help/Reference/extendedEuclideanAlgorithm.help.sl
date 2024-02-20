# extendedEuclideanAlgorithm

_extendedEuclideanAlgorithm(n1, n2)_

Answer greatest common divisor and Bézout coefficients.

```
>>> 2.extendedEuclideanAlgorithm(3)
[1 [-1 1]]

>>> 6.extendedEuclideanAlgorithm(15)
[3 [-2 1]]

>>> 3.extendedEuclideanAlgorithm(5)
[1 [2 -1]]

>>> 3.extendedEuclideanAlgorithm(15)
[3 [1 0]]

>>> 42823.extendedEuclideanAlgorithm(6409)
[17 [-22 147]]

>>> (-22 * 42823) + (147 * 6409)
17

>>> 240.extendedEuclideanAlgorithm(46)
[2 [-9 47]]

>>> (-9 * 240) + (47 * 46)
2

>>> 8.extendedEuclideanAlgorithm(11)
[1 [-4 3]]
```

* * *

See also: euclideanAlgorithm, gcd

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ExtendedGCD.html)
