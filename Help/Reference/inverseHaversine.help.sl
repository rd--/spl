# inverseHaversine

- _inverseHaversine(z)_

Answers the inverse haversine of _z_.

```
>>> 0.0612087.inverseHaversine
0.5

>>> 0.151647.inverseHaversine
0.8
```

Relation to `arcSin`:

```
>>> 0.151647.inverseHaversine
2 * 0.151647.sqrt.arcSin
```

`haverssine` can take `Complex` number inputs:

```
>>> -0.271055J0.020835.inverseHaversine
0.035465J1
```

Threads elementwise over lists and matrices:

```
>>> [0 0.46463 -0.754589J0]
>>> .inverseHaversine
[0, 1.5, 0.5.i.pi]
```

* * *

See also: cos, haversine, sin, tan

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseHaversine.html)
[2](https://reference.wolfram.com/language/ref/InverseHaversine.html),
_W_
[1](https://en.wikipedia.org/wiki/Haversine_formula)

Categories: Math, Trigonometry
