# signedArea

- _signedArea(t)_

Answer the signed area of the triangle _t_.

The answer is positive if the vertex coordinates are in counter-clockwise order:

```
>>> Triangle[0 0; 1 0; 1 1]
>>> .signedArea
0.5

>>> [0 0; 1 0; 1 1]
>>> .shoelaceFormula
0.5
```

The answer is negative if the vertex coordinates are in clockwise order:

```
>>> Triangle[0 0; 1 1; 1 0]
>>> .signedArea
-0.5

>>> [0 0; 1 1; 1 0]
>>> .shoelaceFormula
-0.5
```

* * *

See also: area, shoelaceFormula, Triangle

Guides: Geometry Functions
