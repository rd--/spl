# exp

- _exp(aNumber)_

Answers the exponential of _aNumber_,
that is _e ^ n_.

```
>>> 1.5.exp
4.48169

>>> 1.e ^ 1.5
4.48169

>>> 3.4.exp
29.9641

>>> -1.exp
0.367879

>>> 1.379.exp
3.970929
```

`exp` can take complex number inputs:

```
>>> 2.5J1.exp
6.58223J10.2512

>>> (2.pi.i / 23).exp
0.9629J0.2698
```

`exp` threads elementwise over lists and matrices:

```
>>> [1 2].exp
[2.71828 7.38906]

>>> [0, 1.5, 1.pi.i, Infinity].exp
[1 4.48169 -1J0 Infinity]

>>> [-1 0 1].exp
[0.367879 1 2.71828]
```

The values at `zero`, `one` & `Infinity`:

```
>>> 0.exp
1

>>> 1.exp
1.e

>>> Infinity.exp
Infinity
```

The inverse of `exp` is `log`:

```
>>> 123.45.exp.log
123.45
```

Plot over a subset of the reals:

~~~spl svg=A
(-1 -- 1).functionPlot(exp:/1)
~~~

![](sw/spl/Help/Image/exp-A.svg)

Plot `exp` alongside a Padé approximation:

~~~spl svg=B
(-1 -- 1).functionPlot([
	exp:/1,
	expApproximation:/1
])
~~~

![](sw/spl/Help/Image/exp-B.svg)

* * *

See also: ^, log

References:
_Apl_
[1](https://aplwiki.com/wiki/Exponential),
_Dlmf_
[1](https://dlmf.nist.gov/4.2#iii),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/hat),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=exp),
_Mathematica_
[1](https://mathworld.wolfram.com/ExponentialFunction.html)
[2](https://reference.wolfram.com/language/ref/Exp.html),
_Smalltalk_
5.6.7.7

Categories: Math
