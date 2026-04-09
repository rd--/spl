# modularDistance

- _modularDistance(i, j, m)_

Answer the distance between _i_ and _j_ modulo _m_.

On a circle there are two distances between two points,
the arcs traversed clockwise and counterclockwise.
The modular distance is the least of the two arcs:

```
>>> modularDistance(11, 2, 12)
3

>>> (11 - 2) % 12
9

>>> (2 - 11) % 12
3
```

* * *

See also: -, %, mod, subtract

Guides: Modular Arithmetic Functions
