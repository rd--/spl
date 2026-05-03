# cumulativeAverages

- _cumulativeAverages([x₁ x₂ …])_

Answer the cumulative averages of the list _x_.

Find the averages up to the _n_-th element:

```
>>> [1 2 3 2 3 2 1 2 3 4 3 2]
>>> .cumulativeAverages
[1 3/2 2 2 11/5 13/6 2 2 19/9 23/10 26/11 7/3]
```

Plot the cumulative average of the Champernowne sequence:

~~~spl svg=A
10.champernowneSequence(150)
.cumulativeAverages
.linePlot
~~~

![](Help/Image/cumulativeAverages-A.svg)

* * *

See also: accumulate, mean, movingAverage, movingMedian, movingMap

Guides: List Functions
