# columns

- _columns(m, c)_

Answer the columns of the matrix _m_ specified in the list _c_ as a matrix.

The first and last column of a 3×3 matrix:

```
>>> [3 3].iota.columns([1 3])
[
	1 3;
	4 6;
	7 9
]
```

The middle column, i.e. a column vector:

```
>>> [3 3].iota.columns([2])
[
	2;
	5;
	8
]
```

At `Table`:

~~~spl html=A
Table([3 3].iota).columns([1 3]).asHtml
~~~

<table class="TableData">
<tr><th></th><th scope="col">1</th><th scope="col">3</th></tr>
<tr><th scope="row">1</th><td>1</td><td>3</td><tr>
<tr><th scope="row">2</th><td>4</td><td>6</td><tr>
<tr><th scope="row">3</th><td>7</td><td>9</td><tr>
</table>

* * *

See also: at, column, List, Matrix, rows, submatrix, transposed

Guides: Matrix Functions
