# cayleyMengerMatrix

- _cayleyMengerMatrix(p)_

Answer the Cayley-Menger matrix of the simplex spanned by points _p_.
The Cayley-Menger matrix is the matrix of squared distances between each pair of vertices,
bordered by ones at left and on top, and zero in the upper left corner.
The Cayley-Menger matrix is symmetric.

The Cayley-Menger matrix of a triangle:

```
>>> [0 0; 11/10 1; 3/2 0]
>>> .cayleyMengerMatrix
[
	0    1    1    1;
	1    0    2.21 2.25;
	1    2.21 0    1.16;
	1    2.25 1.16 0
]
```

The Cayley-Menger matrix of a tetrahedron:

```
>>> [
>>> 	0 0 1;
>>> 	1 0 0;
>>> 	1 0 1;
>>> 	1 1 1
>>> ].cayleyMengerMatrix
[
	0 1 1 1 1;
	1 0 2 1 2;
	1 2 0 1 2;
	1 1 1 0 1;
	1 2 2 1 0
]
```

Compute the content of a four-dimensional simplex:

```
>>> let m = [
>>> 	0 0 0 0;
>>> 	1 0 0 0;
>>> 	1 1 0 0;
>>> 	1 1 1 0;
>>> 	1 1 1 1
>>> ];
>>> let d = m.size - 1;
>>> let cm = m.cayleyMengerMatrix;
>>> let z = d.factorial * (2 * d).doubleFactorial;
>>> (cm.determinant / z).abs.sqrt
1/24
```

* * *

See also: arrayPad, cayleyMengerDeterminant, distanceMatrix, squaredEuclideanDistance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cayley-MengerDeterminant.html),
_W_
[1](https://en.wikipedia.org/wiki/Cayley%E2%80%93Menger_determinant)
