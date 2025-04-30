# rows

- _rows(m, c)_

Answer the rows of the matrix _m_ specified in the list _r_ as a matrix.

The first and last row of a 3×3 matrix:

```
>>> [3 3].iota.rows([1 3])
[
	1 2 3;
	7 8 9
]
```

The middle row:

```
>>> [3 3].iota.rows([2])
[
	[4 5 6]
]
```

At `Table`:

~~~spl html=A
Table([3 3].iota).rows([1 3]).asHtml
~~~

<table class="TableData">
<tr><th></th><th scope="col">1</th><th scope="col">2</th><th scope="col">3</th></tr>
<tr><th scope="row">1</th><td>1</td><td>2</td><td>3</td><tr>
<tr><th scope="row">2</th><td>7</td><td>8</td><td>9</td><tr>
</table>

* * *

See also: at, column, List, Matrix, row, submatrix, transposed

Guides: Matrix Functions
