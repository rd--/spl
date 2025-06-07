# adaptiveSimpsonsMethod

- _adaptiveSimpsonsMethod(f:/1, [a b], ε)_

Implememt the adaptive Simpson’s method for calculating the integral of the unary block _f_ over the interval _(a,b)_ to tolerance ε.

```
>>> sin:/1.adaptiveSimpsonsMethod([0 1])
0.459698

>>> identity:/1.adaptiveSimpsonsMethod([0 9])
40.5

>>> { :x |
>>> 	x.sin.sin
>>> }.adaptiveSimpsonsMethod([0 2])
1.24706

>>> { :x |
>>> 	x ^ 2
>>> }.adaptiveSimpsonsMethod([0 4])
21.33333

>>> { :x |
>>> 	x ^ 3
>>> }.adaptiveSimpsonsMethod([0 9])
1640.25

>>> { :x |
>>> 	(0 - x).exp
>>> }.adaptiveSimpsonsMethod([0 10])
1

>>> { :x |
>>> 	(0 - x).exp.exp
>>> }.adaptiveSimpsonsMethod([0 5])
6.31115

>>> { :x |
>>> 	1 / (1 + x.sqrt)
>>> }.adaptiveSimpsonsMethod([0 1])
0.61371

>>> { :x |
>>> 	1 / (x.cubed - (2 * x) - 5)
>>> }.adaptiveSimpsonsMethod([0 2])
-0.46050

>>> { :x |
>>> 	0.besselJ(x) / (1 + x)
>>> }.adaptiveSimpsonsMethod([0 1])
0.646543
```

Compute the area between two curves as a one-dimensional integral of their difference:

```
>>> { :x |
>>> 	x.sin.exp - x.sin.sin
>>> }.adaptiveSimpsonsMethod([0 2])
2.98948
```

Fails for oscillatory and other complicated functions:

```
>>> {
>>> 	{ :x |
>>> 		(1 / x) * (x.log / x).cos
>>> 	}.adaptiveSimpsonsMethod([0 1])
>>> }.ifError { true }
true
```

* * *

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NIntegrate.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/quad.html),
_W_
[1](https://en.wikipedia.org/wiki/Adaptive_Simpson%27s_method)
