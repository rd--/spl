# denominator

- _denominator(n/d)_

Answer the denominator of the `Fraction` _n/d_,
or `one` for an `Integer`.

```
>>> 2/3.denominator
3

>>> 2.denominator
1
```

At negative fractions the `denominator` is positive:

```
>>> -3/4.denominator
4

>>> -3/4.numerator
-3

>>> Fraction(3, -4).denominator
4
```

Threads over lists:

```
>>> [4/6 5/7].denominator
[3 7]
```

Largest odd divisor of _n!_,
OEIS [A049606](https://oeis.org/A049606):

```
>>> let n = 0:16;
>>> ((2L ^ n) / n.!).denominator
[
	1 1 1 3 3 15 45 315 315 2835 14175
	155925 467775 6081075 42567525
	638512875 638512875
]
```

Wavelengths in hydrogen spectrum are given by Rydberg’s formula,
OEIS [A061036](https://oeis.org/A061036):

~~~spl svg=A
1:16.collect { :n |
	let a = 1 \ (n ^ 2);
	n:1:-1.collect { :m |
		let b = 1 \ (m ^ 2);
		(b - a).denominator
	}
}.++.scatterPlot
~~~

![](sw/spl/Help/Image/denominator-A.svg)

* * *

See also: Fraction, numerator

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Denominator.html)
[2](https://reference.wolfram.com/language/ref/Denominator.html),
_OEIS_
[1](https://oeis.org/A061036),
_Smalltalk_
5.6.3.1

Categories: Arithmetic
