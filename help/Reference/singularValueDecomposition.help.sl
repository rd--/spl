# singularValueDecomposition

- _singularValueDecomposition(aMatrix)_

Answer the singular value decomposition for _aMatrix_ as a list of matrices _[u, σ, v]_,
where σ is a diagonal matrix.

At 2×2 integer matrix:

```
>>> [1 2; 1 2].singularValueDecomposition(1E-4).second
[10.sqrt 0; 0 0]
```

At 2×2 integer matrix:

```
>>> [2 3; 0 2].singularValueDecomposition(1E-4).second
[4 0; 0 1]
```

At 2×2 real matrix:

```
>>> [0.76 -0.32; 0.26 -0.75].singularValueDecomposition(1E-4).second
[1.04564 0; 0 0.46555]
```

At 2×2 real matrix:

```
>>> [0.5 1; 2 2.5].singularValueDecomposition(1E-4).second
[3.38391 0; 0 0.22163]
```

At 3×3 real matrix:

```
>>> let m = [1.1 1.3 2.1; 2.2 2.2 3.3; 3.3 -3.0 4.7];
>>> m.singularValueDecomposition(1E-4).second
[
	7.41607 0       0;
	0       3.84912 0;
	0       0       0.21464
]
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SingularValueDecomposition.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/double.svd.html),
_W_
[1](https://en.wikipedia.org/wiki/Singular_value_decomposition)
