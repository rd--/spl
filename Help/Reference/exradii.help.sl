# exradii

- _exradii(t)_

Answer the radii of the `excircles` of the triangle _t_.

Exradii of an equilateral triangle:

```
>>> let r = 2/3.pi.sin;
>>> sssTriangle(1, 1, 1)
>>> .exradii
[r r r]
```

Exradii of a right triangle:

```
>>> sssTriangle(3, 4, 5)
>>> .exradii
[2 3 6]
```

* * *

See also: excenters, excircles, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Exradius.html),
