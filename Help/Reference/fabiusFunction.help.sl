# fabiusFunction

- _fabiusFunction(x, n)_

Answer the Fabius function at _x_,
to a precision decided by _n_.

```
>>> fabiusFunction(0L, 8L)
0/1

>>> fabiusFunction(1L, 8L)
1/1

>>> fabiusFunction(3L, 8L)
-1/1

>>> fabiusFunction(3/16, 8L)
>>> .round(1/100)
1/50

>>> fabiusFunction(1.pi, 8L)
>>> .round(0.01)
-0.99

>>> fabiusFunction(5/16, 8L)
>>> .round(0.01)
0.15

>>> fabiusFunction(2/3, 8)
>>> .round(1/100)
41/50

>>> fabiusFunction(0.775, 8L)
>>> .round(0.01)
0.95
```

Threads over lists:

```
>>> [0 2 4].fabiusFunction(8L)
[0 0 0]

>>> [1 3 5].fabiusFunction(8L)
[1 -1 -1]
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

* * *

See also: digitSum

Guides: Sigmoid Functions

References:
_OEIS_
[1](https://oeis.org/A272755)
[2](https://oeis.org/A272757),
_W_
[1](https://en.wikipedia.org/wiki/Fabius_function)
