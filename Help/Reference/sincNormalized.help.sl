# sincNormalized

- _sincNormalized(z)_

The normalized `sinc` function.

_sincNormalized(z)_ is equivalent to _sinc(z * π)_,
which is equivalent to _sin(z * π) / (z * π)_,
except at zero where it is one.

```
>>> 0.5.sincNormalized
(2 / pi)

>>> (pi / 2).sinc
(2 / pi)
```

Threads elementwise over lists and matrices:

```
>>> (1 / [2 3 4]).sincNormalized
[
	2 / pi,
	3 * 3.sqrt / 2.pi,
	2 * 2.sqrt / pi
]
```

Plot:

~~~spl svg=A
(-10, -9.9 .. 10).sincNormalized.linePlot
~~~

![](sw/spl/Help/Image/sincNormalized-A.svg)

* * *

See also: sin, sinc

Categories: Math, Trigonometry
