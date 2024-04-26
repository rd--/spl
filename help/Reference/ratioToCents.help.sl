# ratioToCents

- _ratioToCents(aNumber)_

Answer the size of the interval represented by the ratio _aNumber_ in _cents_.
There are 1200 cents in an octave.

```
>>> 3/2.ratioToCents
701.995

>>> (3 / 2).log2 * 1200
701.995

>>> 2.ratioToCents
1200
```

Threads over lists:

```
>>> [1 9/8 5/4 4/3 3/2 2].ratioToCents.rounded
[0 204 386 498 702 1200]
```

* * *

See also: centsToRatio, Tuning

References:
_W_
[1](https://en.wikipedia.org/wiki/Cent_(music))
_Xenharmonic_
[1](https://en.xen.wiki/w/Cent)

Categories: Converting, Tuning
