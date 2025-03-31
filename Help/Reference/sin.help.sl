# sin

- _sin(z)_

Answers the sin of _z_.

```
>>> 1/3.pi.sin
3.sqrt / 2

>>> 1/5.pi.sin
((5 / 8) - (5.sqrt / 8)).sqrt

>>> 60.degree.sin
3.sqrt / 2
```

Prefix notation:

```
>>> sin(1.2)
0.932039
```

`sin` can take `Complex` number inputs:

```
>>> 2.5J1.sin
0.923491J-0.941505

>>> let a = 2.5;
>>> let b = 1;
>>> (a.sin * b.cosh) + (a.cos * b.sinh).i
2.5J1.sin
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].sin
[0.932039 0.997495 0.973848]
```

Values of `sin` at fixed points:

```
>>> 0:6.collect { :n |
>>> 	(n / 6).pi.sin
>>> }
[0, 1 / 2, 3.sqrt / 2, 1, 3.sqrt / 2, 1 / 2, 0]
```

`sin` is an odd function:

```
>>> let n = (0 -- 2.pi).atRandom;
>>> n.negated.sin
n.sin.negated
```

`sin` has the mirror property:

```
>>> let n = (0 -- 2.pi).atRandom.j(1);
>>> n.conjugated.sin
n.sin.conjugated
```

Fixed point:

```
>>> 0.sin
0
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 2.pi).functionPlot(sin:/1)
~~~

![](sw/spl/Help/Image/sin-A.svg)

Noncommensurate waves (quasiperiodic function):

~~~spl svg=B
(0 -- 16.pi).functionPlot { :x |
	x.sin + (x * 2.sqrt).sin
}
~~~

![](sw/spl/Help/Image/sin-B.svg)

Draw the `sin` function at integer points:

~~~spl png=C
{ :x :y |
	(x * y).sin
}.table(-40:40, -40:40).abs.Graymap
~~~

![](sw/spl/Help/Image/sin-C.png)

Plot `sin` alongside a Padé approximation:

~~~spl svg=D
(-1.pi -- 1.pi).functionPlot([
	sin:/1,
	sinApproximation:/1
])
~~~

![](sw/spl/Help/Image/sin-D.svg)

* * *

See also: arcSin, cos, cosecant, haversine, sinh, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Sine.html)
[2](https://reference.wolfram.com/language/ref/Sin.html),
_Smalltalk_
5.6.7.13

Categories: Math, Trigonometry
