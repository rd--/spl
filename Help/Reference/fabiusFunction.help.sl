# fabiusFunction

- _fabiusFunction(x, n)_

Answer the Fabius function at _x_,
to a precision decided by _n_.

```
>>> fabiusFunction(0, 8)
0

>>> fabiusFunction(1, 8)
1

>>> fabiusFunction(7, 8)
1

>>> fabiusFunction(3/16, 8)
>>> .round(0.01)
0.02

>>> fabiusFunction(1.pi, 8)
>>> .round(0.01)
-0.99

>>> fabiusFunction(5/16, 8)
>>> .round(0.01)
0.15

>>> fabiusFunction(2/3, 8)
>>> .round(0.01)
0.82

>>> fabiusFunction(0.775, 8)
>>> .round(0.01)
0.95
```

Plot over _(0,1)_:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	x.fabiusFunction(6)
}
~~~

![](sw/spl/Help/Image/fabiusFunction-A.svg)

Plot over _(0,10)_:

~~~spl svg=B
(0 -- 10).functionPlot { :x |
	x.fabiusFunction(6)
}
~~~

![](sw/spl/Help/Image/fabiusFunction-B.svg)

* * *

See also: digitSum

Guides: Sigmoid Functions

References:
_OEIS_
[1](https://oeis.org/A272755)
[2](https://oeis.org/A272757),
_W_
[1](https://en.wikipedia.org/wiki/Fabius_function)
