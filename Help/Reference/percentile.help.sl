# percentile

- _percentile(data, p, [a b; c d])_

The `percentile` method calls `quantile` rescaling _p_ by _0.01_.
If the parameters are elided they are set to _[0 1; 0 1]_,
which is not the value selected by `quantile`.

Calculate percentile using the parameters suggested by NIST,
and the parameters suggested by Hyndman and Fan.

```
>>> let x = [
>>> 	95.1772
>>> 	95.1567
>>> 	95.1937
>>> 	95.1959
>>> 	95.1442
>>> 	95.0610
>>> 	95.1591
>>> 	95.1195
>>> 	95.1065
>>> 	95.0925
>>> 	95.1990
>>> 	95.1682
>>> ];
>>> (
>>> 	x.percentile(90),
>>> 	x.percentile(90, [0 1; 0 1]),
>>> 	x.percentile(90, [1/3 1/3; 0 1])
>>> )
(95.1981, 95.1981, 95.1972)
```

* * *

See also: quantile, quartiles

Guides: Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Quantile.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/prctile.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/prc/section2/prc262.htm),
_W_
[1](https://en.wikipedia.org/wiki/Percentile)

Further Reading: Hyndman and Fan 1996
