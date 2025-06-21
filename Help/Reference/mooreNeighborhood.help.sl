# mooreNeighborhood

- _mooreNeighborhood(d, r)_

Answer the coordinates,
or indices,
of the _d_-dimensional Moore neighborhood of range,
or extent,
_r_.

In one dimension:

```
>>> mooreNeighborhood(1, 1)
[-1; 1]

>>> mooreNeighborhood(1, 2)
[-2; -1; 1; 2]
```

In two dimensions:

```
>>> mooreNeighborhood(2, 1)
[
	-1 -1; 0 -1; 1 -1;
	-1  0;       1  0;
	-1  1; 0  1; 1  1
]

>>> mooreNeighborhood(2, 2)
[
	-2 -2; -1 -2; 0 -2; 1 -2; 2 -2;
	-2 -1; -1 -1; 0 -1; 1 -1; 2 -1;
	-2  0; -1  0;       1  0; 2  0;
	-2  1; -1  1; 0  1; 1  1; 2  1;
	-2  2; -1  2; 0  2; 1  2; 2  2
]
```

* * *

See also: vonNeumannNeighborhood

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MooreNeighborhood.html),
_W_
[1](https://en.wikipedia.org/wiki/Moore_neighborhood)
