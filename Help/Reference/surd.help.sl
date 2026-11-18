# surd

- _surd(x, n)_

Answer the real-valued _n_-th root of _x_.

Negative _x_:

```
>>> -32.0.surd(5.0)
-2.0

>>> -32.0 ^ (1.0 / 5.0)
1.61803J1.17557

>>> -4.5.surd(3.0)
-1.65096

>>> -4.5 ^ (1.0 / 3.0)
0.825482J1.42978
```

Positive _x_:

```
>>> 5.0.surd(3.0)
1.70998

>>> 2.0.surd(8.0)
1.09051
```

Values at fixed points:

```
>>> [-2.0 .. 2.0].collect { :x |
>>> 	x.surd(3)
>>> }
[-1.2599 -1.0 0.0 1.0 1.2599]
```

Decimal expansion of the fundamental frequency of the note _C4_ in Hertz,
in twelve-tone equal temperament,
when _A4_ is tuned to _440Hz_,
OEIS [A329207](https://oeis.org/A329207):

```
>>> 220.0 * 2.0.surd(4.0)
261.6255653005986
```

Continued fraction for cube root of seventy-one,
OEIS [A010299](https://oeis.org/A010299):

```
>>> 71.0.surd(3.0)
>>> .continuedFraction(15L)
[4 7 9 1 6 2 1 3 1 1 2 4 7 1 5]
```

Plot a composition of `surd`:

~~~spl svg=A
(-5.0 -- 5.0).functionPlot { :x |
	{ :n |
		(1.0 + n).surd(3.0)
	}.iterate(x, 5L)
}
~~~

![](Help/Image/surd-A.svg)

* * *

See also: nthRoot, power

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Surd.html)
[2](https://reference.wolfram.com/language/ref/Surd.html),
_W_
[1](https://en.wikipedia.org/wiki/Nth_root)
