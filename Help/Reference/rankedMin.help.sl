# rankedMin

- _rankedMin(aList, anInteger)_

Answer the _n_-th smallest element in _aList_.
If the integer is negative answer the _n_-th largest element in _aList_.

The second smallest of three numbers:

```
>>> [12 13 11].rankedMin(2)
12
```

The third smallest of four numbers:

```
>>> [1.pi 2.sqrt 1.e 3].rankedMin(3)
3
```

The fourth smallest,
i.e. the largest,
of four numbers:

```
>>> [12 13 48.5 1.pi].rankedMin(4)
48.5
```

The second largest of five numbers:

```
>>> [2.5 1.e 12 15 485].rankedMin(-2)
15
```

The fourth largest of five numbers:

```
>>> [2.5 1.e 12 15 485].rankedMin(-4)
1.e
```

Plot the second-largest function over a subset of the reals:

~~~spl svg=A
(0 -- 2.pi).functionPlot { :x |
	[0.5, x.cos, -0.5].rankedMin(2)
}
~~~

![](sw/spl/Help/Image/rankedMin-A.svg)

Plot the second-largest function over a subset of the reals:

~~~spl svg=B
(-5 -- 6).functionPlot { :x |
	[x.sin, x.cos, x.exp].rankedMin(2)
}
~~~

![](sw/spl/Help/Image/rankedMin-B.svg)

Plot the second-largest function over a subset of the reals:

~~~spl svg=C
(0 -- 2.pi).functionPlot { :x |
	[x.sin, x.cotangent, x.tan]
	.rankedMin(2)
}
~~~

![](sw/spl/Help/Image/rankedMin-C.svg)

* * *

See also: quantile, rankedMax, sort

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RankedMin.html)

Categories: Statistics
