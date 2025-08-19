# harmoniousNumber

- _harmoniousNumber(n)_

Answer the _n_-th harmonius number,
the unique positive solution of _x^(n+1)=x+1_.

```
>>> 1.harmoniousNumber
1.goldenRatio

>>> let k = 1.harmoniousNumber;
>>> (k ^ 2) - k - 1
0

>>> 2.harmoniousNumber
1.plasticRatio

>>> let k = 2.harmoniousNumber;
>>> (k ^ 3) - k - 1
0

>>> 3.harmoniousNumber
1.22074

>>> let k = 3.harmoniousNumber;
>>> (k ^ 4) - k - 1
0

>>> 4.harmoniousNumber
1.16730

>>> let k = 4.harmoniousNumber;
>>> (k ^ 5) - k - 1
0

>>> 5.harmoniousNumber
1.13472

>>> let k = 5.harmoniousNumber;
>>> (k ^ 6) - k - 1
0

>>> 6.harmoniousNumber
1.11278

>>> let k = 6.harmoniousNumber;
>>> (k ^ 7) - k - 1
0
```

Plot first few terms:

~~~spl svg=A
1:23.collect(harmoniousNumber:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/harmoniousNumber-A.svg)

* * *

See also: goldenRatio, plasticRatio

References:
_OEIS_
[1](https://oeis.org/A001622)
[2](https://oeis.org/A060006)
[3](https://oeis.org/A060007)
[4](https://oeis.org/A160155)
[5](https://oeis.org/A230159)
[6](https://oeis.org/A230160)
