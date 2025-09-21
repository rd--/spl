# fabiusFunction

- _fabiusFunction(x, n)_

Answer the Fabius function at _x_,
to a precision decided by _n_.

```
>>> fabiusFunction(5/16, 8)
>>> .roundTo(0.01)
0.15

>>> fabiusFunction(2/3, 8)
>>> .roundTo(0.01)
0.82

>>> fabiusFunction(0.775, 8)
>>> .roundTo(0.01)
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
_W_
[1](https://en.wikipedia.org/wiki/Fabius_function)
