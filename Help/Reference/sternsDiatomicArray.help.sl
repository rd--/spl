# sternsDiatomicArray

- _sternsDiatomicArray(n)_

Answer the first _n_ rows of Stern’s diatomic array.

Stern’s diatomic array,
OEIS [A049456](https://oeis.org/A049456):

```
>>> 5.sternsDiatomicArray
[
	1 1;
	1 2 1;
	1 3 2 3 1;
	1 4 3 5 2 5 3 4 1;
	1 5 4 7 3 8 5 7 2 7 5 8 3 7 4 5 1
]
```

Row lengths,
OEIS [A000051](http://oeis.org/A000051):

```
>>> 9.sternsDiatomicArray
>>> .collect(size:/1)
[2 3 5 9 17 33 65 129 257]

>>> 2 ^ 0:8 + 1
[2 3 5 9 17 33 65 129 257]
```

Row sums,
OEIS [A034472](http://oeis.org/A034472):

```
>>> 9.sternsDiatomicArray
>>> .collect(sum:/1)
[2 4 10 28 82 244 730 2188 6562]

>>> 3 ^ 0:8 + 1
[2 4 10 28 82 244 730 2188 6562]
```

Least positive number missing from row _n_ of Stern’s diatomic array,
OEIS [A135510](http://oeis.org/A135510):

```
>>> let u = 1:Infinity;
>>> 9.sternsDiatomicArray.collect { :r |
>>> 	r.minimumExcludedValue(u)
>>> }
[2 3 4 6 6 14 20 28 38]
```

Count distinct terms of rows,
OEIS [A293160](http://oeis.org/A293160):

```
>>> 9.sternsDiatomicArray.collect { :r |
>>> 	r.countDistinct(=)
>>> }
[1 2 3 5 7 13 20 31 48]
```

Stern’s diatomic array,
second version,
OEIS [A070878](https://oeis.org/A070878):

```
>>> 5.sternsDiatomicArray('B')
[
	1 0;
	1 1 0;
	1 2 1 1 0;
	1 3 2 3 1 2 1 1 0;
	1 4 3 5 2 5 3 4 1 3 2 3 1 2 1 1 0
]
```

Stern’s diatomic array,
third version,
OEIS [A070879](https://oeis.org/A070879):

```
>>> 5.sternsDiatomicArray('C')
[
	1;
	1 1;
	1 2 1 1;
	1 3 2 3 1 2 1 1;
	1 4 3 5 2 5 3 4 1 3 2 3 1 2 1 1
]
```

Stern’s diatomic array,
discrete plot,
OEIS [A049456](https://oeis.org/A049456):

~~~spl svg=A oeis=A049456
6.sternsDiatomicArray
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-A.svg)

Stern’s diatomic array,
scatter plot,
OEIS [A049456](https://oeis.org/A049456):

~~~spl svg=B oeis=A049456
8.sternsDiatomicArray
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-B.svg)

Stern’s diatomic array,
version two,
OEIS [A070878](https://oeis.org/A070878):

~~~spl svg=C oeis=A070878
8.sternsDiatomicArray('B')
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-C.svg)

Stern’s diatomic array,
version three,
OEIS [A070879](https://oeis.org/A070879):

~~~spl svg=D oeis=A070879
8.sternsDiatomicArray('C')
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-D.svg)

* * *

See also: fareySequence, partition, sternBrocotNumber, sternBrocotSequence, sternBrocotTree

Guides: Integer Sequence Functions
