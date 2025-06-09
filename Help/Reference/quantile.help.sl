# quantile

- _quantile(data, p)_
- _quantile(data, p, [a b; c d])_

Answer the estimate of the _p-th_ quantile of the collection _data_,
using the quantile definition specified by parameters _a_, _b_, _c_ and _d_.
If the parameters are elided they are set to _[0 0; 1 0]_.

Find the halfway value of a list:

```
>>> 1:7.quantile(1 / 2)
4
```

Find the 20% and 80% quantiles of a list:

```
>>> 1:7.quantile([0.2 0.8])
[2 6]
```

Find the top percentile of a list:

```
>>> 1:100.quantile(0.99)
99
```

At `zero` and `one` equal to `minMax`:

```
>>> 1:7.quantile([0 1])
[1 7]
```

Quantile works with any real numeric quantities:

```
>>> [1.e 1.pi 2.sqrt 3.sqrt].quantile(1 / 4)
2.sqrt

>>> [5 10 4 25 2 1].quantile(2 / 3)
5
```

Compute results using other parametrizations:

```
>>> [5 10 4 25 2 1].quantile(1 / 5)
2

>>> [5 10 4 25 2 1].quantile(1 / 5, [0.5 0; 0 1])
17/10
```

Find quantiles of elements in each column:

```
>>> [1 2.pi; 2 1.pi; 3 3.pi].quantile(1 / 3)
[1 1.pi]
```

Find multiple quantiles of elements in each column:

```
>>> [1 2.pi; 2 1.pi; 3 3.pi].quantile([1 / 3, 4 / 5])
[1 3; 1.pi 3.pi]
```

Compute quantiles for the heights of children in a class:

```
>>> [
>>> 	134 143 131 140 145 136 131 136 143
>>> 	136 133 145 147 150 150 146 137 143
>>> 	132 142 145 136 144 135 141
>>> ].quantile([0.1 0.5 0.9])
[132 141 147]
```

With default parameters, quantile always returns an element of the list:

```
>>> 1:4.quantile(1 / 2)
2
```

Quartiles gives linearly interpolated quantile values for a list:

```
>>> let list = [1 3 4 2 5 6];
>>> (
>>> 	list.quartiles,
>>> 	list.quantile([1 2 3] / 4, [0.5 0; 0 1])
>>> )
(
	[2 3.5 5],
	[2 3.5 5]
)
```

At `SortedList`:

```
>>> [5 10 4 25 2 1]
>>> .asSortedList
>>> .quantile(1 / 5, [0.5 0; 0 1])
1.7
```

Ranked minimum:

```
>>> [12 13 11].quantile(2 / 3)
12

>>> [12 13 11].rankedMin(2)
12
```

Common choices of parameters:

```
>>> let d = [
>>> 	0.5377
>>> 	1.8339
>>> 	-2.2588
>>> 	0.8622
>>> 	0.3188
>>> 	-1.3077
>>> 	-0.4336
>>> ];
>>> [
>>> 	0 0; 1 0:;
>>> 	0 0; 0 1:;
>>> 	0.5 0; 0 0:;
>>> 	0.5 0; 0 1:;
>>> 	0 1; 0 1:;
>>> 	1 -1; 0 1:;
>>> 	1/3 1/3; 0 1:;
>>> 	3/8 1/4; 0 1
>>> ].collect { :o |
>>> 	d.quantile(0.42, o)
>>> }
[
	-0.43360
	-0.48600
	-0.43360
	-0.10254
	-0.16274
	-0.04235
	-0.12261
	-0.11759
]
```

* * *

See also: median, percentile, quartiles, variance, sort

Guides: Probability Distributions, Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Quantile.html)
[2](https://reference.wolfram.com/language/ref/Quantile.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/prctile.html),
_W_
[1](https://en.wikipedia.org/wiki/Quantile)

Categories: Statistics
