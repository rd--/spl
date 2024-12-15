# ratioToCents

- _ratioToCents(aNumber)_

Answer the size of the interval represented by the ratio _aNumber_ in _cents_.
There are 1200 cents in an octave.

The perfect fifth is 702 cents:

```
>>> 3/2.ratioToCents
701.995

>>> (3 / 2).log2 * 1200
701.995
```

The octave is 1200 cents:

```
>>> 2.ratioToCents
1200
```

One step in 16-EDO is 75¢:

```
>>> (2 ^ (1 / 16)).ratioToCents
75
```

Threads over lists:

```
>>> [1 9/8 5/4 4/3 3/2 2]
>>> .ratioToCents
>>> .rounded
[0 204 386 498 702 1200]

>>> [40/39 39/38 36/35 28/27]
>>> .ratioToCents
>>> .rounded
[44 45 49 63]

>>> [1/1 9/8 5/4 4/3 3/2 5/3 15/8]
>>> .ratioToCents
>>> .rounded
[0 204 386 498 702 884 1088]
```

* * *

See also: centsToRatio, Tuning

References:
_W_
[1](https://en.wikipedia.org/wiki/Cent_(music))
_Xenharmonic_
[1](https://en.xen.wiki/w/Cent)

Categories: Converting, Tuning
