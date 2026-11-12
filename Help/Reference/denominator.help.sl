# denominator

- _denominator(n/d)_

Answer the denominator of the `Fraction` _n/d_,
or `one` for an `Integer`.
Also called the _divisor_.

At `Fraction`:

```
>>> 2/3.denominator
3L
```

At `Integer`:

```
>>> 2L.denominator
1L
```

At `Float`,
it is an error if the value is not an integer:

```
>>> 2.0.denominator
1L

>>> {
>>> 	3.141.denominator
>>> }.hasError
true
```

At negative fractions the `denominator` is positive:

```
>>> -3/4.denominator
4L

>>> -3/4.numerator
-3L

>>> Fraction(3, -4).denominator
4L
```

Threads over lists:

```
>>> [4/6 5/7].denominator
[3L 7L]
```

Largest odd divisor of _n!_,
OEIS [A049606](https://oeis.org/A049606):

```
>>> let n = 0:16;
>>> ((2L ^ n) / n.!)
>>> .denominator
[
	1 1 1 3 3 15 45 315 315 2835 14175
	155925 467775 6081075 42567525
	638512875 638512875
]
```

Wavelengths in hydrogen spectrum are given by Rydberg’s formula,
OEIS [A061036](https://oeis.org/A061036):

~~~spl svg=A oeis=A061036
(1L .. 16L).collect { :n |
	let a = 1L / (n ^ 2L);
	(n .. 1L; -1L).collect { :m |
		let b = 1L / (m ^ 2L);
		(b - a).denominator
	}
}.++.scatterPlot
~~~

![](Help/Image/denominator-A.svg)

Denominator of _1/4-1/n^2_,
OEIS [A061038](https://oeis.org/A061038):

~~~spl svg=B oeis=A061038
2L:85L.collect { :n |
	1/4 - (1L / (n ^ 2L))
}.denominator.discretePlot
~~~

![](Help/Image/denominator-B.svg)

* * *

See also: Fraction, numerator, numeratorDenominator

Guides: Fraction Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Denominator.html)
[2](https://reference.wolfram.com/language/ref/Denominator.html),
_OEIS_
[1](https://oeis.org/A061036),
_Smalltalk_
5.6.3.1
