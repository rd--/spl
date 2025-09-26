# transposeTableau

- _transposeTableau(t)_

Answer the transpose of the Young tableau _t_.

```
>>> [1 4 6 7; 2 5 9; 3; 8]
>>> .transposeTableau
[
	1 2 3 8;
	4 5;
	6 9;
	7
]

>>> [1 2 3 8; 4 5; 6 9; 7]
>>> .transposeTableau
[
	1 4 6 7;
	2 5 9;
	3;
	8
]
```

If the matrix is regular this is equal to `transpose`:

```
>>> [3 3].iota.transposeTableau
[
	1 4 7;
	2 5 8;
	3 6 9
]
```

* * *

See also: transpose, transposeIrregular

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/YoungTableau.html),
_W_
[1](https://en.wikipedia.org/wiki/Young_tableau)
