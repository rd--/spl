# haversine

- _haversine(z)_

Answers the haversine of _z_.

```
>>> 0.5.haversine
0.0612087

>>> 0.8.haversine
0.151647
```

`haverssine` can take `Complex` number inputs:

```
>>> 798J1.haversine
-0.271055J0.020835
```

Threads elementwise over lists and matrices:

```
>>> [0, 1.5, 0.5.i.pi].haversine
[0 0.46463 -0.75459J0]
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 5.pi).functionPlot(haversine:/1)
~~~

![](sw/spl/Help/Image/haversine-A.svg)

* * *

See also: cos, sin, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Haversine.html)
[2](https://reference.wolfram.com/language/ref/haversine.html)

Categories: Math, Trigonometry
