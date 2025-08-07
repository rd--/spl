# lowerIncompleteGamma

- _lowerIncompleteGamma(z, α, r=⊤)_

Answer the lower incomplete gamma function,
regularized unless _r_ is set to `false`.

```
>>> 1.5.lowerIncompleteGamma(2)
0.442175

>>> 2.gammaRegularized(0, 1.5)
0.442175
```

The regularized lower incomplete gamma function is the `cdf` of the gamma distribution,
it starts at 0 and monotonically increases to 1:

```
>>> [0 0.5 1 10 100].collect { :x |
>>> 	lowerIncompleteGamma(x, 0.5)
>>> }
[0 0.6827 0.8427 0.9999 1]

>>> [0 0.5 1 10 100].collect { :x |
>>> 	0.5.gammaRegularized(0, x)
>>> }
[0 0.682689 0.842701 0.999992 1]
```

The regularized lower incomplete gamma function is equal to one minus the upper incomplete gamma function:

```
>>> let a = 0.5;
>>> let x = 0.4;
>>> (
>>> 	x.lowerIncompleteGamma(a),
>>> 	1 - x.upperIncompleteGamma(a)
>>> )
(0.6289, 0.6289)
```

Plot regularized lower incomplete gamma function:

~~~spl svg=A
(0 -- 10).functionPlot(
	[0.5 1 1.5 2 5].collect { :a |
		{ :x |
			x.lowerIncompleteGamma(a)
		}
	}
)
~~~

![](sw/spl/Help/Image/lowerIncompleteGamma-A.svg)

* * *

See also: gamma, upperIncompleteGamma

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IncompleteGammaFunction.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/gammainc.html),
_NIST_
[1](https://dlmf.nist.gov/8.2),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.special.gammainc.html),
_W_
[1](https://en.wikipedia.org/wiki/Incomplete_gamma_function)
