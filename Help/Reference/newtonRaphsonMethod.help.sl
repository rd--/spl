# newtonRaphsonMethod

- _newtonRaphsonMethod(ε, 𝑡, k, x₀, f, f′)_

Implement the Newton-Raphson method for root-finding.
It uses the first few terms of the Taylor series of a function _f(x)_ in the vicinity of a suspected root.
ε specifies the minima _f′_ may answer,
𝑡 specifies the tolerance at which the answer is accepted,
_k_ specifies the maximum number of iterations,
_f_ is the function to analyse, and _f′_ is its derivative.

Implementation of `sqrt` using `newtonRaphsonMethod`:

```
>>> let squareRoot = { :n |
>>> 	newtonRaphsonMethod(
>>> 		1E-9, 1E-9, 1E4, 1
>>> 	) { :x |
>>> 		(x ^ 2) - n
>>> 	} { :x |
>>> 		x * 2
>>> 	}
>>> };
>>> (2.squareRoot, 612.squareRoot)
(2.sqrt, 612.sqrt)
```

Find a non-zero solution of _x = 2 × sin(x)_:

```
>>> newtonRaphsonMethod(
>>> 	1E-9, 1E-9, 1E4, 1.5
>>> ) { :x |
>>> 	x - (2 * x.sin)
>>> } { :x |
>>> 	1 - (2 * x.cos)
>>> }
1.8955

>>> 1.8955 - (2 * 1.8955.sin)
0
```

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NewtonsMethod.html),
_W_
[1](https://en.wikipedia.org/wiki/Newton%27s_method)
