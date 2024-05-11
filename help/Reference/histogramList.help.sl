# histogramList

- _histogramList(aCollection)_

Answer a list of bins boundaries and histogram heights of the values in _aCollection_.
The number of bins is derived from the square root of the number of data points.

Histogram of ten first ten integers:

```
>>> 1:10.histogramList
[0 2 4 6 8 10; 2 2 2 2 2]
```

Histogram of ten first one-hundred integers:

```
>>> 1:100.histogramList
[
	0 10 20 30 40 50 60 70 80 90 100;
	10 10 10 10 10 10 10 10 10 10
]
```

~~~
({ randomFloatGaussianDistribution(0, 1) } ! 1000).histogramList.second.size
~~~


* * *

See also: findDivisions, niceNumberAbove, niceNumberNear

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HistogramList.html)
