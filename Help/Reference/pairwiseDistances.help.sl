# pairwiseDistances

- _pairwiseDistances(u, f:/2)_
- _pairwiseDistances(u)_

Answer the specified distance function,
or the Euclidean distance if elided,
between pairs of observations in _u_.

```
>>> [2 0 2; 2 2 3; -2 4 5; 0 1 9; 2 2 4]
>>> .pairwiseDistances
[
	2.2361 6.4031 7.3485 2.8284 4.8990
	6.4031 1.0000 5.3852 4.5826 5.4772
]
```

Specify a distance function:

```
>>> [2 0 2; 2 2 3; -2 4 5; 0 1 9; 2 2 4]
>>> .pairwiseDistances(
>>> 	minkowskiDistance(3.5)
>>> )
[
	2.0490 5.1155 7.0270 2.4380 4.1904
	6.0396 1.000 4.4513 4.1064 5.0620
]
```

* * *

See also: condensedDistanceMatrix, distanceMatrix, euclideanDistance, squareForm

Guides: Distance Functions

References:
_Mathworks_
[1](https://au.mathworks.com/help/stats/pdist.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.spatial.distance.pdist.html)
