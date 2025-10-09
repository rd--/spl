# qPochhammer

- _qPochhammer(a, q, n)_

Answer the the _q_-Pochhammer symbol _(a;q)ₙ_.

Evaluate numerically:

```
>>> -1.2.qPochhammer(0.2, 5)
2.89193

>>> 3L.qPochhammer(5, 9)
-175258163137268414822846915072L

>>> 0.3J1.qPochhammer(0.5J-1, 9)
18.73027J14.24067

>>> 0.4.qPochhammer(0.2, 9)
0.540997
```

Plot over a subset of the reals:

~~~spl svg=A
(-1 -- 1).functionPlot { :q |
	q.qPochhammer(q, 9)
}
~~~

![](sw/spl/Help/Image/qPochhammer-A.svg)

Plot over a subset of the complexes with _q=0.5_:

~~~spl png=B
[-1J-1 1J1].complexPlot { :z |
	(z ^ 2).qPochhammer(0.5, 9)
}
~~~

![](sw/spl/Help/Image/qPochhammer-B.png)

Plot over a subset of the complexes with _q=a_:

~~~spl png=C
[-1J-1 1J1].complexPlot { :z |
	(z.abs < 1).if {
		z.qPochhammer(z, 9)
	} {
		1J0
	}
}
~~~

![](sw/spl/Help/Image/qPochhammer-C.png)

* * *

See also: pochhammer

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/q-PochhammerSymbol.html)
[2](https://reference.wolfram.com/language/ref/QPochhammer.html),
_W_
[1](https://en.wikipedia.org/wiki/Q-Pochhammer_symbol)
[2](https://en.wikipedia.org/wiki/Euler_function)
