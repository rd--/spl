# nearest

- _nearest(aCollection, anObject, aBlock:/2)_

Answer the items in _aCollection_ that are the nearest to _anObject_ according to the absolute value of the metric _aBlock_.

Find the elements in a list nearest to twenty:

```
>>> [1 2 4 8 16 32].nearest(20, -)
[16]
```

There may be elements that are equally near:

```
>>> [1 2 4 8 16 32].nearest(6, -)
[4 8]
```

Plot the `nearest` of a list of:

~~~spl svg=A
(0 -- 10).functionPlot { :x |
	[1 3 4 7 8].nearest(x, -).first
}
~~~

![](sw/spl/Help/Image/nearest-A.svg)


* * *

See also: -, abs

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Nearest.html)
