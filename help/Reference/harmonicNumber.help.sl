# harmonicNumber

- _harmonicNumber(anInteger | aCollection)_

The _n_th harmonic number is the `sum` of the `reciprocal` of the range _1:n_.

```
>>> 11.harmonicNumber
1:11.reciprocal.sum

>>> 1:9.harmonicNumber
[1 3/2 11/6 25/12 137/60 49/20 363/140 761/280 7129/2520]
```

Plot over a subset of the integers:

~~~
1:100.functionPlot(harmonicNumber:/1)
~~~

* * *

See also: harmonicMean

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HarmonicNumber.html)
[2](https://reference.wolfram.com/language/ref/HarmonicNumber.html)
