# angleVector

- _angleVector(aNumber)_

Answer the `List` representing the two-dimensional unit vector at angle _aNumber_, in radians, relative to the _x_-axis.

Unit vector at angle one-sixth of pi:

```
>>> (pi / 6).angleVector
[3.sqrt / 2, 1/2]
```

Unit vector at angle 30°:

```
>>> 30.degree.angleVector
[3.sqrt / 2, 1/2]
```

Unit vector at angle _pi / 3_:

```
>>> (pi / 3).angleVector
[1/2, 3.sqrt / 2]
```

Equal answer given degrees:

```
>>> 60.degree.angleVector
[1/2, 3.sqrt / 2]
```

C.f. `vector` at `Angle`:

```
>>> 60.degrees.vector
[1/2, 3.sqrt / 2]
```

* * *

See also: absArg, cos, degree, fromPolarCoordinates, sin, unitVector, vectorAngle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AngleVector.html)

Categories: Geometry
