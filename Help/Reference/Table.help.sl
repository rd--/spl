# Table

- _Table(data, labels, types)_

A type representing a rectangular table of values where columns are labeled and have types.

The `contents` method answers the table data as a `List` matrix,
the `columnLabels` and `columnTypes` answer the column labels and types:

```
>>> let t = Table(
>>> 	[1 2; 3 4],
>>> 	['A' 'B'],
>>> 	['SmallFloat' 'SmallFloat']
>>> );
>>> (
>>> 	t.contents,
>>> 	t.columnLabels,
>>> 	t.columnTypes
>>> )
(
	[1 2; 3 4],
	['A' 'B'],
	['SmallFloat' 'SmallFloat']
)
```

If the column labels are unspecified they are inferred:

```
>>> Table([1 2 3; 4 5 6])
>>> .columnLabels
['1' '2' '3']
```

If the column types are unspecified they are inferred:

```
>>> Table(['Third' 1/3; 'Half' 1/2])
>>> .columnTypes
['String', 'Fraction']
```

The `asHtml` method answers an `Html` table:

~~~spl html=A
Table(
	[
		4 9 2;
		3 5 7;
		8 1 6
	],
	['A' 'B' 'C']
).asHtml
~~~

<table class="TableData">
<tr><th></th><th scope="col">A</th><th scope="col">B</th><th scope="col">C</th></tr>
<tr><th scope="row">1</th><td>4</td><td>9</td><td>2</td><tr>
<tr><th scope="row">2</th><td>3</td><td>5</td><td>7</td><tr>
<tr><th scope="row">3</th><td>8</td><td>1</td><td>6</td><tr>
</table>

Create a `Table` with `String` and `Fraction` columns:

~~~spl html=B
Table(['Third' 1/3; 'Half' 1/2])
.asHtml
~~~

<table class="TableData"><tr><th></th><th scope="col">1</th><th scope="col">2</th></tr>
<tr><th scope="row">1</th><td>Third</td><td>1/3</td><tr>
<tr><th scope="row">2</th><td>Half</td><td>1/2</td><tr>
</table>

Create a `Table` from a list of `Record` values specifying rows,
with common keys:

~~~spl html=C
Table(
	[
		(A: 1, B: 2, C: 3),
		(A: 4, B: 5, C: 6)
	]
).asHtml
~~~

<table class="TableData">
<tr><th></th><th scope="col">A</th><th scope="col">B</th><th scope="col">C</th></tr>
<tr><th scope="row">1</th><td>1</td><td>2</td><td>3</td><tr>
<tr><th scope="row">2</th><td>4</td><td>5</td><td>6</td><tr>
</table>

Create a `Table` from a `Record` specifying the labeled columns:

~~~spl html=D
(A: [1 2], B: [3 4], C: [5 6])
.asTable
.asHtml
~~~

<table class="TableData">
<tr><th></th><th scope="col">A</th><th scope="col">B</th><th scope="col">C</th></tr>
<tr><th scope="row">1</th><td>1</td><td>3</td><td>5</td><tr>
<tr><th scope="row">2</th><td>2</td><td>4</td><td>6</td><tr>
</table>

Index into a table using row and column indices:

```
>>> Table([1 2 3; 4 5 6]).at(2, 2)
5
```

Index into a table using a row index and a column label:

```
>>> Table([1 2; 3 4], ['A' 'B'])
>>> .at(2, 'B')
4
```

Select columns, in the specified order:

~~~spl html=E
Table([3 3].iota, ['A' 'B' 'C'])
.columns(['C' 'A'])
.asHtml
~~~

<table class="TableData">
<tr><th></th><th scope="col">C</th><th scope="col">A</th></tr>
<tr><th scope="row">1</th><td>3</td><td>1</td><tr>
<tr><th scope="row">2</th><td>6</td><td>4</td><tr>
<tr><th scope="row">3</th><td>9</td><td>7</td><tr>
</table>

Select rows, in the specified order:

~~~spl html=F
Table([3 3].iota, ['A' 'B' 'C'])
.rows([3 1])
.asHtml
~~~

<table class="TableData">
<tr><th></th><th scope="col">A</th><th scope="col">B</th><th scope="col">C</th></tr>
<tr><th scope="row">1</th><td>7</td><td>8</td><td>9</td><tr>
<tr><th scope="row">2</th><td>1</td><td>2</td><td>3</td><tr>
</table>

* * *

See also: columns, Html, List, rows

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Tabular.html)
