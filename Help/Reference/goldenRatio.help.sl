# goldenRatio

- _goldenRatio(aNumber)_

Answer _aNumber_ × the golden ratio, usually written as Phi or phi, also as tau.

```
>>> 1.goldenRatio
1.61803
```

φ is half of the square root of five plus one:

```
>>> 2.goldenRatio
(5.sqrt + 1)
```

The golden ratio is the `metallicMean` of `one`:

```
>>> 1.metallicMean
1.61803
```

φ is the number whose inversion is itself minus `one`:

```
>>> let x = 1.goldenRatio;
>>> 1 / x
(x - 1)
```

φ has minimal polynomial:

```
>>> let phi = 1.goldenRatio;
>>> phi.squared - phi - 1
0
```

Equivalently:

```
>>> let phi = 1.goldenRatio;
>>> 1 + phi
phi.squared
```

Compute the Fibonacci numbers:

```
>>> 1:20.collect { :n |
>>> 	(1.goldenRatio ^ n / 5.sqrt).rounded
>>> }
[
	1 1 2 3 5 8 13 21 34 55
	89 144 233 377 610 987 1597 2584 4181 6765
]

>>> 20.fibonacciSequence
[
	1 1 2 3 5 8 13 21 34 55
	89 144 233 377 610 987 1597 2584 4181 6765
]
```

Position of 1s in a Fibonacci substitution system:

```
>>> 1:30.collect { :n |
>>> 	let p = (n + 1).goldenRatio.floor;
>>> 	let q = n.goldenRatio.floor;
>>> 	2 - (p - q)
>>> }
[
	0 1 0 0 1 0 1 0 0 1
	0 0 1 0 1 0 0 1 0 1
	0 0 1 0 0 1 0 1 0 0
]

>>> [
>>> 	0 1 0 0 1 0 1 0 0 1
>>> 	0 0 1 0 1 0 0 1 0 1
>>> 	0 0 1 0 0 1 0 1 0 0
>>> ].scan(+)
[
	0  1  1  1  2  2  3  3  3  4
	4  4  5  5  6  6  6  7  7  8
	8  8  9  9  9 10 10 11 11 11
]
```

Compute the effective "inverse" of the Fibonacci numbers:

```
>>> 1:25.collect { :n |
>>> 	(n * 5.sqrt)
>>> 	.log(1.goldenRatio)
>>> 	.rounded
>>> }
[
	2 3 4 5 5 5 6 6 6 6
	7 7 7 7 7 7 8 8 8 8
	8 8 8 8 8
]
```

As a continued fraction:

```
>>> 1.goldenRatio.continuedFraction(20)
(1 # 20)
```

Plot the fractional part of multiples of the golden ratio:

~~~
1:100.functionPlot { :n |
	n.goldenRatio.fractionPart
}
~~~

![](sw/spl/Help/Image/goldenRatio-A.svg)

* * *

See also: e, goldenAngle, metallicMean, pi, plasticRatio, supergoldenRatio

Guides: Mathematical Constants

Unicode: U+03C6 φ Greek Small Letter Phi

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GoldenRatio.html)
[2](https://reference.wolfram.com/language/ref/GoldenRatio.html),
_W_
[1](https://en.wikipedia.org/wiki/Golden_ratio)

Categories: Math, Constant
