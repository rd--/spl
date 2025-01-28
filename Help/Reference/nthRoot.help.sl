# nthRoot

- _nthRoot(x, n)_

Answer the real-valued _n_-th root of _x_.

```
>>> -32.nthRoot(5)
-2

>>> -2 ^ 5
-32

>>> 5.nthRoot(3)
1.70998

>>> 1.70998 ^ 3
5

>>> 2.nthRoot(8)
1.09051

>>> 1.09051 ^ 8
2

>>> 3.nthRoot(3)
1.44225
```

Note that this is not the same as _x ^ (1 / n)_.

```
>>> -4.5.nthRoot(3)
-1.65096

>>> -4.5J0 ^ (1 / 3)
0.82548J1.42978

>>> -1J0 ^ (1 / 3)
0.5J0.866
```

Threads elementwise over lists and matrices:

```
>>> [0 1.5 8 Infinity].nthRoot(3)
[0 1.14471 2 Infinity]

>>> [2 3 6].collect { :n | 729.nthRoot(n) }
[27 9 3]
```

Plot over a subset of the reals:

~~~spl svg=A
(-1 -- 1).functionPlot { :x | x.nthRoot(3) }
~~~

![](sw/spl/Help/Image/nthRoot-A.svg)

Where supported `nthRoot` is displayed as √.

* * *

See also: ^, sqrt, cubeRoot

References:
_Apl_
[1](https://aplwiki.com/wiki/Root),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/percentco#dyadic),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=root)
[2](https://www.maplesoft.com/support/help/Maple/view.aspx?path=surd),
_Mathematica_
[1](https://mathworld.wolfram.com/Surd.html)
[2](https://reference.wolfram.com/language/ref/Surd.html)

Unicode: U+221A √ Square Root
