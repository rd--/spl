# centralMoment

- _centralMoment(aCollection, r)_

Answer the order _r_ central moment of _aCollection_.

```
>>> 1:4.centralMoment(4)
(41 / 16)

>>> [pi e 2].centralMoment(2)
(2 / 9 * (4 - 2.e + e.squared - 2.pi - (e * pi) + pi.squared))

>>> 1:4.centralMoment(2)
1.25
```

Third-order central moment:

```
>>> [
>>> 	+0.5377 +0.3188  3.5784
>>> 	+1.8339 -1.3077  2.7694
>>> 	-2.2588 -0.4336 -1.3499
>>> 	+0.8622 +0.3426  3.0349
>>> 	+0.7254 -0.1241 +0.6715
>>> 	-0.0631 +1.4897 -1.2075
>>> 	+0.7147 +1.4090 +0.7172
>>> 	-0.2050 +1.4172 +1.6302
>>> ].centralMoment(3)
0.2431
```

* * *

See also: kurtosis, moment, skewness, variance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CentralMoment.html),
_Mathworks_
[1](https://mathworks.com/help/stats/moment.html)

Categories: Statistics
