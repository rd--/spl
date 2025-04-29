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

* * *

See also: List

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Tabular.html)
