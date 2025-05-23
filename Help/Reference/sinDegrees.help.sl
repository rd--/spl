# sinDegrees

- _sinDegrees(θ)_

Answer the sine of _θ_ taken as an angle in degrees.

```
>>> 60.sinDegrees
3.sqrt / 2

>>> 45.sinDegrees
1 / 2.sqrt

>>> 11.2.sinDegrees
0.19423
```

Threads over lists:

```
>>> [0 30 45 60 90 180].sinDegrees
[0, 1/2, 1 / 2.sqrt, 3.sqrt / 2, 1, 0]
```

Cf. `degree`:

```
>>> 90.sinDegrees
1

>>> 90.degree.sin
1
```

* * *

See also: cos, cosDegrees, sin

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SinDegrees.html)

Categories: Trigonometry
