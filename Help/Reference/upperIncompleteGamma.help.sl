# upperIncompleteGamma

- _upperIncompleteGamma(z, α, r=⊤)_

Answer the upper incomplete gamma function,
regularized unless _r_ is set to `false`.

```
>>> 1.5.upperIncompleteGamma(1)
0.22313

>>> 1.5.upperIncompleteGamma(2)
0.5578

>>> 3.3.upperIncompleteGamma(2)
0.1586

>>> 0.22.upperIncompleteGamma(2 / 5)
0.42124
```

The regularized upper incomplete gamma function is the `survivalFunction` of the gamma distribution,
it starts at 1 and monotonically decreases to 0:

```
>>> [0 0.5 1 10].collect { :x |
>>> 	upperIncompleteGamma(x, 0.5)
>>> }
[1 0.3173 0.1573 0]
```

The regularized upper incomplete gamma function is equal to one minus the regularized lower incomplete gamma function:

```
>>> let a = 0.5;
>>> let x = 0.4;
>>> (
>>> 	x.upperIncompleteGamma(a),
>>> 	 1 - x.lowerIncompleteGamma(a)
>>> )
(0.3711, 0.3711)
```

Plot regularized upper incomplete gamma function:

~~~spl svg=A
(0 -- 10).functionPlot(
	[0.5 1 1.5 2 5].collect { :a |
		{ :x |
			x.upperIncompleteGamma(a)
		}
	}
)
~~~

![](sw/spl/Help/Image/upperIncompleteGamma-A.svg)

* * *

See also: gamma, lowerIncompleteGamma

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IncompleteGammaFunction.html)
[2](https://reference.wolfram.com/language/ref/Gamma.html)
[3](https://reference.wolfram.com/language/ref/GammaRegularized.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/gammainc.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.special.gammaincc.html),
_W_
[1](https://en.wikipedia.org/wiki/Incomplete_gamma_function)
