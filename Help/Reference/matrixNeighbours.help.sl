# matrixNeighbours

- _matrixNeighboursDo(⍴, [n₁ n₂ …], i)_

Given shape _⍴_, neighbour indices _n_, and matrix index _i_,
answer the in bounds neighbours of _i_.

```
>>> [4 4].matrixNeighbours(
>>> 	2.mooreNeighborhood(1),
>>> 	[1 2]
>>> )
[1 1; 2 1; 2 2; 1 3; 2 3]

>>> [4 4].matrixNeighbours(
>>> 	2.vonNeumannNeighborhood(1),
>>> 	[1 2]
>>> )
[1 1; 2 2; 1 3]
```

* * *

See also: matrixNeighboursDo, mooreNeighborhood, vonNeumannNeighborhood

Guides: Matrix Functions
