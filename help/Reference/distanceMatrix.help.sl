# distanceMatrix

- _distanceMatrix(aSequence, anotherSequence, aBlock:/1)_
- _distanceMatrix(alpha, beta)_ => _distanceMatrix(alpha, beta, euclideanDistance:/2)_
- _distanceMatrix(alpha)_ => _distanceMatrix(alpha, alpha)_

Answer the matrix of distances between each pair of elements.

Compute a distance matrix from a list of integers:

```
>>> [1 2 3 4].distanceMatrix
[
	0 1 2 3;
	1 0 1 2;
	2 1 0 1;
	3 2 1 0
]
```

Compute a distance matrix from two lists of integers:

```
>>> [1 2 3 4].distanceMatrix([5 6 7])
[
	4 5 6;
	3 4 5;
	2 3 4;
	1 2 3
]
```

Compute a distance matrix from real-valued numerical vectors:

```
>>> let u = [1.5 4.3; 2.1 5.6; 6.2 4.5];
>>> let v = [1.6 4.2; 2.3 5.4];
>>> u.distanceMatrix(v)
[
	0.141421 1.360147;
	1.486607 0.282843;
	4.609772 4.002499
]
```

Compute a distance matrix from strings:

```
>>> let u = ['abcd' 'bcde' 'xyz'];
>>> u.distanceMatrix(u, editDistance:/2)
[
	0 2 4;
	2 0 4;
	4 4 0
]
```

Distance matrix of cartesian coordinates for lattice using `manhattanDistance` measure:

```
>>> let x = [1 1; 2 1; 3 1; 4 1; 1 2; 2 2; 3 2; 4 2];
>>> x.distanceMatrix(x, manhattanDistance:/2)
[
	0 1 2 3 1 2 3 4;
	1 0 1 2 2 1 2 3;
	2 1 0 1 3 2 1 2;
	3 2 1 0 4 3 2 1;
	1 2 3 4 0 1 2 3;
	2 1 2 3 1 0 1 2;
	3 2 1 2 2 1 0 1;
	4 3 2 1 3 2 1 0
]
```

* * *

See also: adjacencyMatrix, norm, outer
