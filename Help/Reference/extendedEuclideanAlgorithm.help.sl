# extendedEuclideanAlgorithm

- _extendedEuclideanAlgorithm(a, b)_

Answer greatest common divisor and Bézout coefficients.

The first element of the answer is the `gcd`:

```
>>> 6.extendedEuclideanAlgorithm(21)
[3, [-3, 1]]

>>> 6.gcd(21)
3
```

The extended greatest common divisor of two and three:

```
>>> 2.extendedEuclideanAlgorithm(3)
[1, [-1, 1]]
```

Illustrate coefficients:

```
>>> 2.extendedEuclideanAlgorithm(3)
[1, [-1, 1]]

>>> (2 * -1) + (3 * 1)
1

>>> 6.extendedEuclideanAlgorithm(15)
[3, [-2, 1]]

>>> (6 * -2) + (15 * 1)
3

>>> 3.extendedEuclideanAlgorithm(5)
[1, [2, -1]]

>>> (3 * 2) + (5 * -1)
1

>>> 3.extendedEuclideanAlgorithm(15)
[3, [1, 0]]

>>> (3 * 1) + (5 * 0)
3

>>> 32.extendedEuclideanAlgorithm(10)
[2, [1, -3]]

>>> (32 * 1) + (10 * -3)
2

>>> 111.extendedEuclideanAlgorithm(10)
[1, [1, -11]]

>>> (111 * 1) + (10 * -11)
1

>>> 42823.extendedEuclideanAlgorithm(
>>> 	6409
>>> )
[17, [-22, 147]]

>>> (-22 * 42823) + (147 * 6409)
17

>>> 240.extendedEuclideanAlgorithm(46)
[2, [-9, 47]]

>>> (-9 * 240) + (47 * 46)
2

>>> 8.extendedEuclideanAlgorithm(11)
[1, [-4, 3]]

>>> (-4 * 8) + (3 * 11)
1

>>> 12.extendedEuclideanAlgorithm(42)
[6, [-3, 1]]

>>> (-3 * 12) + (1 * 42)
6
```

* * *

See also: euclideanAlgorithm, extendedGcd, gcd

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ExtendedGCD.html),
_W_
[1](https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm)
[2](https://en.wikipedia.org/wiki/B%C3%A9zout%27s_identity)
