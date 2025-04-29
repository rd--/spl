# Table

- _Table(data)_
- _Table(data, labels)_

A type representing a rectangular table of values where columns are labeled and have types.

If the column types are unspecified they are inferred:

```
>>> let t = Table(
>>> 	[1 2 3; 4 5 6],
>>> 	['a' 'b' 'c']
>>> );
>>> (
>>> 	t.contents,
>>> 	t.columnLabels,
>>> 	t.columnTypes
>>> )
(
	[1 2 3; 4 5 6],
	['a' 'b' 'c'],
	['SmallFloat' 'SmallFloat' 'SmallFloat']
)
```

If the column labels are unspecified they are inferred:

```
>>> Table([1 2 3; 4 5 6])
>>> .columnLabels
['1' '2' '3']
```

The `asHtml` method answers an Html table:

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

* * *

See also: List

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Tabular.html)
