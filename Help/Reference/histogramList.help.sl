# histogramList

- _histogramList(aCollection)_

Answer a list of bins boundaries and histogram heights of the values in _aCollection_.
The number of bins is derived from the square root of the number of data points.

Histogram of the first ten integers:

```
>>> 1:10.histogramList
[0 2 4 6 8 10; 2 2 2 2 2]
```

Histogram of the first fifteen integers:

```
>>> 1:15.histogramList
[0 2.5 5 7.5 10 12.5 15; 2 3 2 3 2 3]
```

Histogram of the first one-hundred integers:

```
>>> 1:100.histogramList
[
	0 10 20 30 40 50 60 70 80 90 100;
	10 10 10 10 10 10 10 10 10 10
]
```

Plot histogram of random numbers with normal distribution:

~~~
let l = { system.nextRandomFloatGaussianDistribution(0, 1) } ! 500;
l.histogramList.second.discretePlot
~~~

* * *

See also: findDivisions, niceNumberAbove, niceNumberNear

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HistogramList.html)
