# condensedDistanceMatrix

- _condensedDistanceMatrix(v, f:/2)_

Answer the condensed distance matrix of the vector _v_ with itself,
given distance measure _f_.
This is the upper right triangle of the equivalent `distanceMatrix`.

```
>>> [
>>> 	2 0 2;
>>> 	2 2 3;
>>> 	-2 4 5;
>>> 	0 1 9;
>>> 	2 2 4
>>> ].condensedDistanceMatrix(
>>> 	euclideanDistance:/2
>>> )
[
	2.23607 6.40312 7.34847 2.82843;
	4.89898 6.40312 1.00000;
	5.38516 4.58258;
	5.47722
]
```

* * *

See also: distanceMatrix, pairwiseDistances

Guides: Distance Functions
