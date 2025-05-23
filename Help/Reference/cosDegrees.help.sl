# cosDegrees

- _cosDegrees(θ)_

Answer the cosine of _θ_ taken as an angle in degrees.

```
>>> 60.cosDegrees
1/2

>>> 45.cosDegrees
1 / 2.sqrt

>>> 11.2.cosDegrees
0.980955
```

Threads over lists:

```
>>> [0 30 45 60 90 180].cosDegrees
[1, 3.sqrt / 2, 1 / 2.sqrt, 1/2, 0, -1]
```

Cf. `degree`:

```
>>> 90.cosDegrees
0

>>> 90.degree.cos
0
```

Non-commensurate waves (quasiperiodic function):

~~~spl svg=A
(0 -- (20 * 360)).functionPlot { :x |
	x.cosDegrees + (x * 2.sqrt).cosDegrees
}
~~~

![](sw/spl/Help/Image/cosDegrees-A.svg)

* * *

See also: cos, sinDegrees, sin

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CosDegrees.html)

Categories: Trigonometry
