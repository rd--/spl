# nthRoot

- _nthRoot(x, n)_

Answer the real-valued _n_-th root of _x_.

At `SmallFloat`:

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

>>> 152.2756.nthRoot(2)
12.34

>>> 4192.nthRoot(3)
16.124

>>> (27.nthRoot(5) - 2.nthRoot(5)).nthRoot(3)
0.92228
```

At `LargeInteger`:

```
>>> 27L.nthRoot(3)
3

>>> 3L.nthRoot(3)
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

>>> -32.nthRoot(5)
-2

>>> -32J0 ^ (1 / 5)
1.61803J1.17557
```

Threads elementwise over lists and matrices:

```
>>> [0 1.5 8 Infinity].nthRoot(3)
[0 1.14471 2 Infinity]

>>> [2 3 6].collect { :n |
>>> 	729.nthRoot(n)
>>> }
[27 9 3]

>>> [-2 .. 2].nthRoot(3)
[-1.2599 -1 0 1 1.2599]
```

Unlike `sqrt`, does not answer `Complex` values:

```
>>> { -8.nthRoot(2) }.ifError { true }
true

>>> -8.sqrt
0J2.8284
```

On the negative real axis, `nthRoot` is undefined for even _n_:

```
>>> { -3.nthRoot(2) }.ifError { true }
true
```

Plot over a subset of the reals:

~~~spl svg=A
(-1 -- 1).functionPlot(
	[1 3 5 7].collect { :n |
		{ :x |
			x.nthRoot(n)
		}
	}
)
~~~

![](sw/spl/Help/Image/nthRoot-A.svg)

Plot a composition of `nthRoot`:

~~~spl svg=B
(-5 -- 5).functionPlot { :x |
	{ :n |
		(1 + n).nthRoot(3)
	}.iterate(x, 5)
}
~~~

![](sw/spl/Help/Image/nthRoot-B.svg)

Polar plot:

~~~spl svg=C
(0 -- 6.pi).polarPlot { :theta |
	theta.nthRoot(3)
}
~~~

![](sw/spl/Help/Image/nthRoot-C.svg)

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
[2](https://mathworld.wolfram.com/nthRoot.html)
[3](https://reference.wolfram.com/language/ref/Surd.html),
_W_
[1](https://en.wikipedia.org/wiki/Nth_root)

Unicode: U+221A √ Square Root
