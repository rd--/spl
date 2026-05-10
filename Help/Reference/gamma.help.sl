# gamma

- _gamma(z)_

Answer the Euler gamma function.

Positive integer values, threads over lists:

```
>>> 1:10.gamma
[1 1 2 6 24 120 720 5040 40320 362880]
```

The values of the γ function on half-integers are integer multiples of the square root of π,
threads over lists:

```
>>> (1.5 .. 5.5).gamma
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

Relation to the double factorial:

```
>>> 2:16:2.collect { :n |
>>> 	let m = n / 2;
>>> 	(2 ^ m) * (m + 1).gamma
>>> }
[2 8 48 384 3840 46080 645120 10321920]

>>> 2:16:2.!!
[2 8 48 384 3840 46080 645120 10321920]

>>> 1:15:2.collect { :n |
>>> 	let m = n / 2;
>>> 	(1.pi ^ -1/2) * (2 ^ (m + 1/2)) * (m + 1).gamma
>>> }
[1 3 15 105 945 10395 135135 2027025]

>>> 1:15:2.!!
[1 3 15 105 945 10395 135135 2027025]
```

Recurrence, for all _z_:

```
>>> let z = 2.1;
>>> (z + 1).gamma
z * z.gamma
```

Reflection, for all _z_:

```
>>> let z = 2.1;
>>> z.gamma * (1 - z).gamma
1.pi / z.pi.sin
```

At `Complex`:

```
>>> 10J0.gamma
362880

>>> 2.3J1.gamma
0.719141J0.540614
```

At `one` and `zero` and one half:

```
>>> 1.gamma
1

>>> [0 0J0].gamma
[Infinity Infinity]

>>> 0.5.gamma
1.7725

>>> 1.pi ^ 1/2
1.7725
```

At `Fraction`:

```
>>> 1/3.gamma
2.6789

>>> 2/3.gamma
1.3541

>>> 1/4.gamma
3.6256

>>> 3/4.gamma
1.2254
```

Minimum value:

```
>>> gamma(1.461632)
0.885603
```

The _alternating Euler constant_,
OEIS [A094640](https://oeis.org/A094640),
and it’s continued fraction,
OEIS [A094641](https://oeis.org/A094641):

```
>>> (4 / 1.pi).log
0.241564

>>> (4 / 1.pi).log
>>> .continuedFraction(14)
[0 4 7 6 3 1 1 9 1 1 4 26 1 2]
```

Plot the Euler gamma function:

~~~spl svg=A
(-4 -- 4).functionPlot { :z |
	z.gamma.clip([-10 10])
}
~~~

![](Help/Image/gamma-A.svg)

Plot γ with _γ + sin_, note intersection at positive integers:

~~~spl svg=B
(-4 -- 4).functionPlot([
	{ :z | z.gamma.clip([-1 5]) },
	{ :z | (z.gamma + z.pi.sin).clip([-1 5]) }
])
~~~

![](Help/Image/gamma-B.svg)

Plot over a subset of the complexes:

~~~spl png=C
[-2J-2 2J2].complexPlot(gamma:/1)
~~~

![](Help/Image/gamma-C.png)

* * *

See also: factorial, logGamma, lowerIncompleteGamma, upperIncompleteGamma

Guides: Special Functions

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
_NIST_
[1](https://dlmf.nist.gov/5)
_W_
[1](https://en.wikipedia.org/wiki/Gamma_function)

Unicode: U+03B3 γ Greek Small Letter Gamma; U+1D6FE 𝛾 Mathematical Italic Small Gamma
