# isUnimodal

- _isUnimodal([x₁ x₂ …], f:/2)_

Answer `true` if the sequence _x_ is unimodal,
according to the predicate _f_,
else `false`.
A sequence is unimodal if it first increases and then decreases.
If _f_ is elided it is set to `<=`.

Decide if lists are weakly, or non-strictly, unimodal:

```
>>> [
>>> 	0;
>>> 	0 1;
>>> 	0 1 0;
>>> 	0 1 1;
>>> 	0 1 2;
>>> 	0 1 0 1;
>>> 	0 0 0;
>>> 	1 0 1
>>> ].collect { :x |
>>> 	x -> x.isUnimodal
>>> }
[
	[0] -> false,
	[0 1] -> false,
	[0 1 0] -> true,
	[0 1 1] -> true,
	[0 1 2] -> false,
	[0 1 0 1] -> false,
	[0 0 0] -> true,
	[1 0 1] -> false
]
```

The sequence of binomial coefficients for fixed _n_ and _0<=k<=n_ is unimodal:

```
>>> let n = 7;
>>> let x = 0:7.collect { :k |
>>> 	binomial(n, k)
>>> };
>>> (x, x.isUnimodal)
([1 7 21 35 35 21 7 1], true)
```

Unimodal sequences have one peak:

```
>>> [1 7 21 35 35 21 7 1].findPeaks
[[4, 35]]
```

* * *

See also: findPeaks, isLogarithmicallyConcave, isMonotonicallyIncreasing, isStrictlyIncreasing

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnimodalSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Unimodality)
