# zigzagIndices

- _zigzagIndices([m n])_

Answer the zigzag indices into an _m×n_ matrix.

Indices for a _3×3_ square matrix:

```
>>> [3 3].zigzagIndices
[
	1 1;
	1 2; 2 1;
	3 1; 2 2; 1 3;
	2 3; 3 2;
	3 3
]

>>> [3 3].zigzagIndices
>>> .collect(sum:/1)
[2 3 3 4 4 4 5 5 6]
```

Plot square matrix index path:

~~~spl svg=A
[9 9].zigzagIndices.Line
~~~

![](sw/spl/Help/Image/zigzagIndices-A.svg)

Plot rectangular matrix index path, _m<n_:

~~~spl svg=B
[7 13].zigzagIndices.Line
~~~

![](sw/spl/Help/Image/zigzagIndices-B.svg)

Plot rectangular matrix index path, _m>n_:

~~~spl svg=C
[13 7].zigzagIndices.Line
~~~

![](sw/spl/Help/Image/zigzagIndices-C.svg)

* * *

See also: zigzagMatrix, zigzagScan
