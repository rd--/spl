# numerator

- _numerator(n/d)_

Answer the numerator _n_ of a `Fraction` _n/d_,
or the identity for an `Integer`.

```
>>> 2/3.numerator
2

>>> 2.numerator
2
```

At negative fractions the `numerator` is negative:

```
>>> -3/4.numerator
-3

>>> -3/4.denominator
4

>>> Fraction(3, -4).numerator
-3
```

Threads over lists:

```
>>> [4/6 5/7].numerator
[2 5]
```

Numerator of _n/12_,
OEIS [A051724](https://oeis.org/A051724):

```
>>> Fraction(0:13, 12).numerator
[0 1 1 1 1 5 1 7 2 3 5 11 1 13]
```

Plot first few terms of
OEIS [A051724](https://oeis.org/A051724):

~~~spl svg=A
Fraction(0:36, 12).numerator.stepPlot
~~~

![](sw/spl/Help/Image/numerator-A.svg)

Plot segment of least sequence where every term divides the product of its neighbors,
OEIS [A075075](https://oeis.org/A075075):

~~~spl svg=B
let a = [1 2];
2:350.do { :n |
	let d = Fraction(a[n], a[n - 1]);
	let m = d.numerator;
	let k = m;
	{
		a.includes(k)
	}.whileTrue {
		k := k + m
	};
	a.add(k)
};
a.drop(100).scatterPlot
~~~

![](sw/spl/Help/Image/numerator-B.svg)

* * *

See also: denominator, Fraction, isFraction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Numerator.html)
[2](https://reference.wolfram.com/language/ref/Numerator.html),
_Smalltalk_
5.6.3.2,
_W_
[1](https://en.wikipedia.org/wiki/Fraction)

Categories: Arithmetic
