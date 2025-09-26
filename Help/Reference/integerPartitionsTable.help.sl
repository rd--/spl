# integerPartitionsTable

- _integerPartitionsTable(p)_

Answer an `Html` value containg a rectangular table of the integer partitions at the list _p_.
Each integer occupies as many columns as its value.

Integer partitions:

```
>>> 6.integerPartitions
[
	6           ;
	5         1 ;
	4       2   ;
	4       1 1 ;
	3     3     ;
	3     2   1 ;
	3     1 1 1 ;
	2   2   2   ;
	2   2   1 1 ;
	2 1 1 1 1   ;
	1 1 1 1 1 1
]
```

Integer partitions table:

~~~spl html=A
6.integerPartitions
.integerPartitionsTable
~~~

<table style="width: 100%; border: solid 1px black">
<tbody>
<tr><td colspan="6">6</td></tr>
<tr><td colspan="5">5</td><td>1</td></tr>
<tr><td colspan="4">4</td><td colspan="2">2</td></tr>
<tr><td colspan="4">4</td><td>1</td><td>1</td></tr>
<tr><td colspan="3">3</td><td colspan="3">3</td></tr>
<tr><td colspan="3">3</td><td colspan="2">2</td><td>1</td></tr>
<tr><td colspan="3">3</td><td>1</td><td>1</td><td>1</td></tr>
<tr><td colspan="2">2</td><td colspan="2">2</td><td colspan="2">2</td></tr>
<tr><td colspan="2">2</td><td colspan="2">2</td><td>1</td><td>1</td></tr>
<tr><td colspan="2">2</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
<tr><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
</tbody>
</table>

* * *

See also: circularPartitionsDrawing, Html, integerPartitions, rectangularPartitionsDrawing

Guides: Combinatorial Functions
