# centsToRatio

- _centsToRatio(aNumber)_

Answer the size of the interval represented by the cents value _aNumber_ as a ratio.
There are 1200 cents in an octave.

```
>>> 1200.centsToRatio
2
```

Threads over lists:

```
>>> [0 203.9 386.3 498 701.9 1200].centsToRatio
[1 9/8 5/4 4/3 3/2 2]
```

* * *

See also: centsToRatio, Tuning

References:
_W_
[1](https://en.wikipedia.org/wiki/Cent_(music))

Categories: Converting, Tuning
