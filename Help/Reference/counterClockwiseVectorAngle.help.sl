# counterClockwiseVectorAngle

- _counterClockwiseVectorAngle(u, v)_

Answers the counterClockwise angle between the vectors _u_ and _v_.
The answer is in _(0, 2π)_.

The counterClockwise angle between two vectors in two-dimensions:

```
>>> let [u, v] = [1 0; 1 1];
>>> counterClockwiseVectorAngle(u, v)
1/4.pi

>>> let [u, v] = [1 1; 1 0];
>>> counterClockwiseVectorAngle(u, v)
7/4.pi
```

* * *

See also: atan2, signedVectorAngle, vectorAngle

Guides: Geometry Functions
