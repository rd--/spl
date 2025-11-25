# nistData

- _nistData(system)_
- _nistData(system, name, columns)_

A dictionary of datasets from the NIST
(National Institute of Standards and Technology)
Engineering Statistics Handbook.
The unary form answers a `Record` of named data sets.
The ternary form answers a matrix of the specified columns of the named dataset.
If a single column is selected the answer is a vector, else it is a matrix.

The list of data sets:

```
>>> system.nistData.size
31

>>> system.nistData.keys.sort
[
	'BERGER1'
	'BIRNSAUN'
	'CHWIRUT2'
	'CURRIE'
	'DZIUBA1'
	'FLICKER'
	'FULLER2'
	'HSU12'
	'JAHANMI2'
	'LEW'
	'LEW3'
	'LUTHER'
	'MAVRO'
	'MICHELSO'
	'MORALES'
	'MPC61'
	'NORMAL'
	'NORMAL2'
	'PBF11'
	'PONTIUS'
	'PR1'
	'RANDDEX'
	'RANDU'
	'RANDWALK'
	'RANDWEIB'
	'SOULEN'
	'SPLETT2'
	'SUNSPOT'
	'TUKLAMB'
	'ZARR13'
	'ZARR14'
]
```

Plot the first two columns of the _LEW3_ data set,
which show a strong linear (positive correlation) relationship:

~~~spl svg=A
system.nistData('LEW3', [1 2])
.scatterPlot
~~~

![](sw/spl/Help/Image/nistData-A.svg)

Plot the first two columns of the _CHWIRUT2_ data set,
which show an exponential relationship:

~~~spl svg=B
system.nistData('CHWIRUT2', [1 2])
.scatterPlot
~~~

![](sw/spl/Help/Image/nistData-B.svg)

Plot the intial values of the _LUTHER_ data set,
which show a damped sinusoidal relationship:

~~~spl svg=C
system.nistData('LUTHER', [1])
.first(200)
.scatterPlot
~~~

![](sw/spl/Help/Image/nistData-C.svg)

Plot the first two columns of the _BERGER1_ data set,
which shows heteroscedasticity,
a nonconstant variation in _y_ over the values of _x_,
small values of _x_ yield small scatter in _y_,
while large values of _x_ result in large scatter in _y_:

~~~spl svg=D
system.nistData('BERGER1', [2 1])
.scatterPlot
~~~

![](sw/spl/Help/Image/nistData-D.svg)

To clear the library item from the cache:

~~~spl cache
system
.libraryItem(
	'NistEngineeringStatisticsHandbookData'
).clearCache
~~~

* * *

See also: LibraryItem

Guides: Library Catalogue, Plotting Functions, Statistics Functions
