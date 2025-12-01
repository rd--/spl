# mahonianNumber

- _mahonianNumber(n, k)_

Answer the Mahonian number,
telling the number of permutations of length _n_ with major index _k_.

Table of Mahonian numbers,
OEIS [A008302](https://oeis.org/A008302):

```
>>> 1:5.collect { :n |
>>> 	let m = (n - 1).triangularNumber;
>>> 	0:m.collect { :k |
>>> 		mahonianNumber(n, k)
>>> 	}
>>> }
[
	1;
	1 1;
	1 2 2 1;
	1 3 5 6 5 3 1;
	1 4 9 15 20 22 20 15 9 4 1
]
```

Plot:

~~~spl svg=A
1:6.collect { :n |
	let m = (n - 1).triangularNumber;
	0:m.collect { :k |
		mahonianNumber(n, k)
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/mahonianNumber-A.svg)

* * *

See also: descents, majorIndex

Guides: Permutation Functions

References:
_OEIS_
[1](https://oeis.org/A008302),
_W_
[1](https://en.wikipedia.org/wiki/Major_index)
