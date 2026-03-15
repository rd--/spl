# kempnerFunction

- _kempnerFunction(n)_

Answer the Kempner function _S(n)_,
also called the Smarandache function,
the smallest number _s_ such that _n_ divides _s!_.

First few terms of Kempner function,
threads over lists,
OEIS [A002034](https://oeis.org/A002034):

```
>>> 1:19.kempnerFunction
[1 2 3 4 5 3 7 4 6 5 11 4 13 7 5 6 17 6 19]
```

Record values,
the prime numbers plus one and four,
OEIS [A046022](https://oeis.org/A046022):

```
>>> 1:45.kempnerFunction.recordValues
[1 2 3 4 5 7 11 13 17 19 23 29 31 37 41 43]
```

Low water marks,
OEIS [A094404](https://oeis.org/A094404)
and
OEIS [A094372](https://oeis.org/A094372):

```
>>> let n = 1:200;
>>> let a = n.kempnerFunction;
>>> let b = Fraction(a, n);
>>> b.reciprocal.recordValues.reciprocal
[
	1/1 1/2 1/3 1/4 1/6
	1/8 1/12 3/40 1/15 1/16
	1/24 1/30
]
```

The Kempner function,
OEIS [A002034](https://oeis.org/A002034):

~~~spl svg=A oeis=A002034
1:65.kempnerFunction.stepPlot
~~~

![](sw/spl/Help/Image/kempnerFunction-A.svg)

* * *

See also: !, divisible, factorial

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SmarandacheFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Kempner_function)
