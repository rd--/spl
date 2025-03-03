# gamma

- _gamma(z)_

Answer the Euler gamma function.

Positive integer values:

```
>>> 1:10.collect(gamma:/1)
[1 1 2 6 24 120 720 5040 40320 362880]
```

Half-integer values:

```
>>> (1.5 .. 5.5).collect(gamma:/1)
[
	1.pi.sqrt / 2,
	(3 * 1.pi.sqrt) / 4,
	(15 * 1.pi.sqrt) / 8,
	(105 * 1.pi.sqrt) / 16,
	(945 * 1.pi.sqrt) / 32
]
```

Evaluate numerically:

```
>>> (22 / 10).gamma
1.101802

>>> -1.4.gamma
2.659272

>>> 2.5.gamma
1.32934

>>> 0.5.gamma
1.7725
```

Evaluate several values of the gamma function between [-3.5 3.5]:

```
>>> (-3.5, -2.5 .. 3.5).gamma
[
	0.2701 -0.9453 2.3633 -3.5449
	1.7725 0.8862 1.3293 3.3234
]
```

The gamma function interpolates the factorial function.
For integers, _n.gamma = (n - 1).!_:

```
>>> 9:13.gamma
8:12.factorial
```

Plot the Euler gamma function:

~~~spl svg=A
(-4 -- 4).functionPlot { :z |
	z.gamma.clip(-10, 10)
}
~~~

![](sw/spl/Help/Image/gamma-A.svg)

Plot γ with _γ + sin_, note intersection at positive integers:

~~~spl svg=B
(-4 -- 4).functionPlot([
	{ :z | z.gamma.clip(-1, 5) },
	{ :z | (z.gamma + z.pi.sin).clip(-1, 5) }
])
~~~

![](sw/spl/Help/Image/gamma-B.svg)

* * *

See also: factorial, logGamma

References:
_Dlmf_
[1](https://dlmf.nist.gov/5.2),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=GAMMA),
_Mathematica_
[1](http://mathworld.wolfram.com/GammaFunction.html)
[2](https://reference.wolfram.com/language/ref/Gamma.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/gamma.html),
_W_
[1](https://en.wikipedia.org/wiki/Gamma_function)

Unicode: U+03B3 γ Greek Small Letter Gamma; U+1D6FE 𝛾 Mathematical Italic Small Gamma
