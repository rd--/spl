# booleSparseArray

- _booleSparseArray([i₁ i₂ …], ⍴, x=[0 1])_

Answer a `SparseArray` of shape _⍴_ where the indicies _i_ indicate non-zero (one) positions.

The five free tetrominoes:

~~~spl svg=A
[
	1 1; 1 2; 1 3; 2 2:;
	1 1; 1 2; 2 1; 3 1:;
	1 2; 2 1; 2 2; 3 1:;
	1 1; 1 2; 2 1; 2 2:;
	1 1; 1 2; 1 3; 1 4
].collect { :i |
	i.booleSparseArray([4 4])
	.normal
}.catenate.transpose.arrayMesh
~~~

![](Help/Image/booleSparseArray-A.svg)

The twelve free pentominos:

~~~spl svg=B
[
	1 2; 1 3; 2 1; 2 2; 3 2:;
	1 1; 2 1; 3 1; 4 1; 5 1:;
	1 1; 2 1; 3 1; 4 1; 4 2:;
	1 2; 2 1; 2 2; 3 1; 4 1:;
	1 1; 1 2; 2 1; 2 2; 3 1:;
	1 1; 1 2; 1 3; 2 2; 3 2:;
	1 1; 1 3; 2 1; 2 2; 2 3:;
	1 1; 2 1; 3 1; 3 2; 3 3:;
	1 1; 2 1; 2 2; 3 2; 3 3:;
	1 2; 2 1; 2 2; 2 3; 3 2:;
	1 2; 2 1; 2 2; 3 2; 4 2:;
	1 1; 1 2; 2 2; 3 2; 3 3
].collect { :i |
	i.booleSparseArray([4 4])
	.normal.transpose
}.catenate.transpose.arrayMesh
~~~

![](Help/Image/booleSparseArray-B.svg)

* * *

See also: SparseArray, boole

Guides: Array Functions
