# centerArray

- _centerArray(a, ⍴, x)_

Center the array _a_ in an array of shape _⍴_ with the object _x_ elsewhere.

Center a list, one one and four zeroes:

```
>>> [1].centerArray([5], 0)
[0 0 1 0 0]
```

Empty the empty list:

```
>>> [].centerArray([5], 0)
[0 0 0 0 0]
```

If the prefix and suffix cannot be equal,
bias left:

```
>>> [1 2].centerArray([3], 0)
[1 2 0]

>>> [1].centerArray([6], 0)
[0 0 1 0 0 0]
```

Two ones and six zeroes:

```
>>> [1 1].centerArray([8], 0)
[0 0 0 1 1 0 0 0]
```

Centre a 2×2 matrix in a 4×4 matrix:

```
>>> [1 2; 3 4].centerArray([4 4], 0)
[
	0 0 0 0;
	0 1 2 0;
	0 3 4 0;
	0 0 0 0
]
```

Centre a 3×3 matrix in a 5×5 matrix:

~~~spl svg=A
[3 3].iota
.centerArray([5 5], 2)
.matrixPlot
~~~

![](Help/Image/centerArray-A.svg)

Abelian sandpile model:

~~~spl svg=B
let k = 13;
let h = (k / 2).ceiling;
let p = [[300]].centerArray([k k], 0);
let n = 2.vonNeumannNeighborhood(1);
let f = { :x :y |
	(p[x][y] >= 4).ifTrue {
		p[x][y] := p[x][y] - 4;
		[k k].matrixNeighboursDo(
			n, [x y]
		) { :i :j |
			p[i][j] := p[i][j] + 1;
			(p[i][j] >= 4).ifTrue {
				f(i, j)
			}
		};
		f(x, y)
	}
};
f(h, h);
p.colourMatrixPlot
~~~

![](Help/Image/centerArray-B.svg)

* * *

See also: centerList, centerMatrix, padLeft, padRight, reshape

Guides: Array Functions, Matrix Functions, List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CenterArray.html)
