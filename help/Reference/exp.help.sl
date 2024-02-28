# exp

- _exp(aNumber)_

Answers the exponential of _aNumber_,
that is _e ^ n_.

```
>>> 1.5.exp
4.48169

>>> e ^ 1.5
4.48169

>>> 3.4.exp
29.9641

>>> -1.exp
0.367879

>>> 1.379.exp
3.970929
```

Exp can take complex number inputs:

```
>>> 2.5j1.exp
6.58223j10.2512
```

Exp threads elementwise over lists and matrices:

```
>>> [1 2].exp
[2.71828 7.38906]

>>> [0 1.5 pi.i inf].exp
[1 4.48169 -1j0 inf]
```

The values at zero, one & infinity:

```
>>> 0.exp
1

>>> 1.exp
e

>>> inf.exp
inf
```

The inverse of `exp` is `log`:

```
>>> 123.45.exp.log
123.45
```

Plot over a subset of the reals:

~~~
(-1, -0.99 .. 1).exp.plot
~~~

* * *

See also: ^, log

References:
_Apl_
[1](https://aplwiki.com/wiki/Exponential)
_Dlmf_
[1](https://dlmf.nist.gov/4.2#iii),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/hat),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=exp),
_Mathematica_
[1](https://mathworld.wolfram.com/ExponentialFunction.html)
[2](https://reference.wolfram.com/language/ref/Exp.html)
