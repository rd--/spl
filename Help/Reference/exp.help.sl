# exp

- _exp(x)_

Answers the exponential of _x_,
that is _e^x_.

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

>>> 3J4.exp
3J0.exp * 0J4.exp
```

`exp` threads elementwise over lists and matrices:

```
>>> [1 2].exp
[2.71828 7.38906]

>>> [0, 1.5, 1.pi.i, Infinity].exp
[1 4.48169 -1J0 Infinity]

>>> [-1 0 1].exp
[0.367879 1 2.71828]

>>> [1 2 1.e].^
[2.71828 7.38906 15.15426]
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

>>> 123.45.log.exp
123.45
```

Power series:

```
>>> let n = 11;
>>> let x = 1.5;
>>> 0:n.sum { :i | (x ^ i) / i.! }
4.48169

>>> 1.5.exp
4.48169
```

Functional equation:

```
>>> let x = 1.5;
>>> let y = 2.9;
>>> (x + y).exp
x.exp * y.exp
```

Euler’s forumula:

```
>>> let x = 1.5;
>>> x.cos + x.sin.i
x.i.exp

>>> let x = 1.5;
>>> (x.i.exp + x.-.i.exp) / 2
x.cos

>>> let x = 1.5;
>>> (x.i.exp - x.-.i.exp) / 2.i
x.sin

>>> let x = 1.5;
>>> let a = 1 - (2 * x).i.exp;
>>> let b = 1 + (2 * x).i.exp;
>>> (a / b).i
x.tan
```

At `Symbol`:

```
>> `m`.^
(^ 2.718281828459045 m)
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

Plot over a subset of the complexes:

~~~spl png=C
[-2J-2 2J2].complexPlot { :z |
	z.exp
}
~~~

![](sw/spl/Help/Image/exp-C.png)

* * *

See also: ^, log

Guides: Mathematical Functions

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
5.6.7.7,
_W_
[1](https://en.wikipedia.org/wiki/Exponential_function)

Categories: Math
