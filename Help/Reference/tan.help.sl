# tan

- _tan(aNumber)_

Answers the tangent of _aNumber_.

```
>>> (pi / 6).tan
(1 / 3.sqrt)

>>> 30.degrees.tan
(1 / 3.sqrt)
```

`tan` can take `Complex` number inputs:

```
>>> 2.5j1.tan
-0.237014j0.896438
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].tan
[2.57215 14.10142 -4.28626]
```

Plot over a subset of the reals:

~~~
(0 -- 2.pi).functionPlot { :x |
	x.tan.clip(-6, 6)
}
~~~

![](sw/spl/Help/Image/tan-A.svg)

* * *

See also: arcTan, cos, sin, tanh

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Tangent.html)
[2](https://reference.wolfram.com/language/ref/Tan.html),
_Smalltalk_
5.6.7.14

Categories: Trigonometry, Math
