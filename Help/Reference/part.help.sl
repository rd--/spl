# part

- _part(c, i)_

Answer the parts of _c_ specified by the indices at _i_.

Pick out the third part of a list:

```
>>> [1 3 5 7 9].part([3])
5
```

Obtain the second element from the end of a list:

```
>>> [1 3 5 7 9].part([-2])
7
```

Pick out a sequence of parts from two through four:

```
>>> [1 3 5 7 9].part([2:4])
[3 5 7]
```

Obtain a list of parts, including repeats:

```
>>> [1 3 5 7 9 11].part([[1 3 1 2 -1 6]])
[1 5 1 3 11 11]
```

Pick the last seven elements:

```
>>> [1, 3 .. 23].part([-7:-1])
[11 13 15 17 19 21 23]
```

Parts one through third-to-last:

```
>>> [1 3 5 7 9 11].part([1:-3])
[1 3 5 7]
```

Parts three through third-to-last extracted in steps of two:

```
>>> [1 3 5 7 9 11 13 15 17 19 21]
>>> .part([3:2:-3])
[5 9 13 17]
```

Parts extracted in steps of two starting at the beginning:

```
>>> [1 3 5 7 9 11 13 15 17 19 21]
>>> .part([1:2:-1])
[1 5 9 13 17 21]
```

Pick out parts one and three:

```
>>> [3 3].iota.part([[1 3]])
[1 2 3; 7 8 9]
```

Pick out parts two and three of parts one and three:

```
>>> [3 3].iota.part([1 3; 2 3])
[2 3; 8 9]
```

Use `part` to go to the second row and take the third element:

```
>>> [4 4].iota.part([2 3])
7
```

To take an entire row, use one index to specify the row:

```
>>> [4 4].iota.part([2])
[5 6 7 8]
```

To take an entire column, select all rows and specify the column:

```
>>> [4 4].iota.part([1:-1, 2])
[2 6 10 14]
```

Select a column as a column matrix:

```
>>> [4 4].iota.part([1:-1, 2:2])
[2; 6; 10; 14]
```

Select a 3×4 submatrix corresponding to rows _(1, 3)_ and columns _(1, 4)_ of a 3×4 matrix:

```
>>> [5 5].iota.part([1:3, 1:4])
[
	 1  2  3  4;
	 6  7  8  9;
	11 12 13 14
]
```

Extract all elements except the outermost rows and columns:

```
>>> [5 5].iota.part([2:-2, 2:-2])
[
	 7  8  9;
	12 13 14;
	17 18 19
]
```

Apply a permutation:

```
>>> [1 3 5 7 9].part([[4 5 1 2 3]])
[7 9 1 3 5]
```

Extract the first element of the second through fourth rows:

```
>>> [5 5].iota.part([2 3 4; 1])
[6; 11; 16]
```

Extract the first two elements from each list:

```
>>> [1 2; 3 4 5; 6 7].part([1:-1 1:2])
[1 2; 3 4; 6 7]
```

Extract the first element from each list:

```
>>> [1 2; 3 4 5; 6; 7 8 9 10].part([1:-1 1])
[1 3 6 7]
```

* * *

See also: at, atAll, atAllSymmetrical, atSymmetrical, extract, Range, Span

Guides: Indexing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Part.html)
