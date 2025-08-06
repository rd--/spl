# supergoldenRatio

- _supergoldenRatio(n)_

Answer _n_ times the supergolden ratio, written ψ.

The supergolden ratio is a geometrical proportion close to 85/58:

```
>>> 1.supergoldenRatio
85/58

>>> (1.supergoldenRatio, 85 / 58)
(1.4656, 1.4655)
```

Its true value is the real solution of the equation _x^3=x^2+1_:

```
>>> let x = 1.supergoldenRatio;
>>> x ^ 2 + 1
(x ^ 3)
```

It has the closed form:

```
>>> (2 / 3)
>>> *
>>> (1 / 3 * 14.5J0.arcCos).cos
>>> +
>>> (1 / 3)
1.supergoldenRatio
```

The continued fraction of its square begins as a permutation of the first six natural numbers,
and the next term is equal to their sum plus one:

```
>>> 1.supergoldenRatio
>>> .continuedFraction(8)
[1 2 6 1 3 5 4 22]

>>> [1 2 6 1 3].convergents
[1/1 3/2 19/13 22/15 85/58]

>>> (1.supergoldenRatio ^ 2)
>>> .continuedFraction(7)
[2 6 1 3 5 4 22]
```

Limit ratio of the Narayana sequence and related sequences:

```
>>> 21.narayanaSequence.last(3)
[595 872 1278]

>>> [595 872 1278].ratios
[1.4655 1.4656]

>>> linearRecurrence([1 0 1], [1 1 4], 19)
[
	  1   1   4   5   6
	 10  15  21  31  46
	 67  98 144 211 309
	453 664 973 1426
]

>>> [664 973 1426].ratios
[1.4654 1.4656]
```

The sum of the first eight subharmonics:

```
>>> 0:7.collect { :n |
>>> 	1.supergoldenRatio ^ n.negated
>>> }.sum
3
```

Supergolden rectangle:

~~~spl svg=A
Rectangle([0, 0], [1.supergoldenRatio 1])
~~~

![](sw/spl/Help/Image/supergoldenRatio-A.svg)

Supergolden spiral:

~~~spl svg=B
let b = 1.supergoldenRatio.log / 0.5.pi;
(0 -- 8.pi).discretize(
	200,
	logarithmicSpiral(1, b)
).Line
~~~

![](sw/spl/Help/Image/supergoldenRatio-B.svg)

* * *

See also: goldenRatio, narayanaSequence

Guides: Integer Sequences, Mathematical Constants

Unicode: U+003C8 ψ Greek Small Letter Psi

References:
_OEIS_
[1](https://oeis.org/A092526),
_W_
[1](https://en.wikipedia.org/wiki/Supergolden_ratio)

Categories: Math, Constant
