# fabiusFunction

- _fabiusFunction(x, n)_

Answer the Fabius function at _x_,
to a precision decided by _n_.

```
>>> fabiusFunction(0.0, 8L)
0.0

>>> fabiusFunction(1.0, 8L)
1.0

>>> fabiusFunction(3.0, 8L)
-1.0

>>> fabiusFunction(3/16, 8L)
>>> .round(0.01)
0.02

>>> fabiusFunction(1.pi, 8L)
>>> .round(0.01)
-0.99

>>> fabiusFunction(5/16, 8L)
>>> .round(0.01)
0.15

>>> fabiusFunction(2/3, 8)
>>> .round(0.01)
0.82

>>> fabiusFunction(0.775, 8L)
>>> .round(0.01)
0.95
```

Threads over lists:

```
>>> [0.0 2.0 4.0].fabiusFunction(8L)
[0.0 0.0 0.0]

>>> [1.0 3.0 5.0].fabiusFunction(8L)
[1.0 -1.0 -1.0]
```

Plot over _(0,1)_:

~~~spl svg=A
(0.0 -- 1.0).functionPlot { :x |
	x.fabiusFunction(6L)
}
~~~

![](Help/Image/fabiusFunction-A.svg)

Plot over _(0,10)_:

~~~spl svg=B
(0.0 -- 10.0).functionPlot { :x |
	x.fabiusFunction(6L)
}
~~~

![](Help/Image/fabiusFunction-B.svg)

Plot over _(0,2)_:

~~~spl svg=C
(0.0 -- 2.0).functionPlot { :x |
	x.fabiusFunction(6L)
}
~~~

![](Help/Image/fabiusFunction-C.svg)

* * *

See also: digitSum

Guides: Sigmoid Functions

References:
_OEIS_
[1](https://oeis.org/A272755)
[2](https://oeis.org/A272757),
_W_
[1](https://en.wikipedia.org/wiki/Fabius_function)
