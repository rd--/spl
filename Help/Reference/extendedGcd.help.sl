# extendedGcd

- _extendedGcd(c)_
- _extendedGcd(m, n)_

Answer greatest common divisor and Bézout coefficients,
either of the collection _c_,
or of the two number _m_ and _n_.

```
>>> 2.extendedGcd(3)
[1, [-1, 1]]

>>> (2 * -1) + (3 * 1)
1

>>> 6.extendedGcd(15)
[3, [-2, 1]]

>>> 3.extendedGcd(30)
[3, [1, 0]]

>>> 3.extendedGcd(5)
[1, [2, -1]]

>>> 3.extendedGcd(15)
[3, [1, 0]]

>>> 6.extendedGcd(21)
[3, [-3, 1]]

>>> -12.extendedGcd(9)
[3, [-1, -1]]
```

At `Collection`:

```
>>> [6 15 30].extendedGcd
[3, [-2, 1, 0]]

>>> (6 * -2) + (15 * 1) + (30 * 0)
3

>>> [2 6 10].extendedGcd
[2, [1, 0, 0]]

>>> (2 * 1) + (6 * 0) + (10 * 0)
2

>>> [-12 9 57].extendedGcd
[3, [-1, -1, 0]]

>>> (-12 * -1) + (9 * -1) + (57 * 0)
3
```

Plot matrix:

~~~spl png=A
{ :m :n |
	let [_, c] = extendedGcd(m, n);
	c[1].abs
}.table(1:100, 1:100)
.rescale
.Graymap
~~~

![](sw/spl/Help/Image/extendedGcd-A.png)

* * *

See also: extendedEuclideanAlgorithm, gcd

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestCommonDivisor.html)
[2](https://mathworld.wolfram.com/BezoutsIdentity.html)
[3](https://reference.wolfram.com/language/ref/ExtendedGCD.html),
_W_
[1](https://en.wikipedia.org/wiki/Greatest_common_divisor)
[2](https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm)
[3](https://en.wikipedia.org/wiki/B%C3%A9zout%27s_identity)
