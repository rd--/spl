# isLogarithmicallyConcave

- _isLogarithmicallyConcave([x₁ x₂ …])_

Answer `true` if the sequence _x_ is logarithmically concave,
else `false`.

Decide if a list is logarithmically concave:

```
>>> [1 1 0 0 1]
>>> .isLogarithmicallyConcave
true
```

The sequence of binomial coefficients for fixed _n_ and _0<=k<=n_ is logarithmically concave:

```
>>> let n = 7;
>>> let x = 0:7.collect { :k |
>>> 	binomial(n, k)
>>> };
>>> (
>>> 	x,
>>> 	x.isLogarithmicallyConcave
>>> )
([1 7 21 35 35 21 7 1], true)
```

```
>>> 11.pascalTriangle
>>> .allSatisfy(
>>> 	isLogarithmicallyConcave:/1
>>> )
true
```

* * *

See also: findPeaks, isMonotonicallyIncreasing, isStrictlyIncreasing, isUnimodal

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogarithmicallyConcaveSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Logarithmically_concave_sequence)
