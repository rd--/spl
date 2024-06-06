# singularValueDecomposition

- _singularValueDecomposition(aMatrix)_

Answer the singular value decomposition for _aMatrix_ as a list of matrices _[u, σ, v]_,
where σ is a diagonal matrix.

At 2×2 integer matrix:

```
>>> [1 2; 1 2].singularValueDecomposition.second.diagonal
[10.sqrt 0]
```

At 2×2 integer matrix:

```
>>> [2 3; 0 2].singularValueDecomposition.second.diagonal
[4 1]
```

At 2×2 real matrix:

```
>>> [0.76 -0.32; 0.26 -0.75].singularValueDecomposition.second.diagonal
[1.04564 0.46555]
```

At 2×2 real matrix:

```
>>> [0.5 1; 2 2.5].singularValueDecomposition.second.diagonal
[3.38391 0.22163]
```

At 3×3 integer matrix:

```
>>> [1 0 1; -1 -2 0; 0 1 -1].singularValueDecomposition.second.diagonal
[2.4605 1.6996 0.2391]
```

At 3×3 real matrix:

```
>>> let m = [1.1 1.3 2.1; 2.2 2.2 3.3; 3.3 -3.0 4.7];
>>> m.singularValueDecomposition.second.diagonal
[7.41607 3.84912 0.21464]
```

At 3×3 real matrix:

```
>>> let m = [-0.069 0.35 0.98; 0.5 -0.072 0.64; 0.92 0.93 0.15];
>>> m.singularValueDecomposition.second.diagonal
[1.49805 0.99772 0.49661]
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SingularValueDecomposition.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/double.svd.html),
_W_
[1](https://en.wikipedia.org/wiki/Singular_value_decomposition)
