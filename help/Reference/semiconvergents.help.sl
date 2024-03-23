# semiconvergents

- _semiconvergents(aList, epsilon)_

Answer a `List` of the semiconvergents corresponding to the continued fraction terms in _aList_.
Stop when the current semiconvergent is within _epsilon_ of the last convergent.

```
>>> 27/32.continuedFraction
[0 1 5 2 2]

>>> [0 1 5 2 2].convergents
[0 1/1 5/6 11/13 27/32]

>>> [0 1 5 2 2].semiconvergents(1E-3)
[1/1 3/4 4/5 5/6 11/13 16/19 27/32]
```

The best rational approximations to _(3 / 2).log2_ define equal divisions of the octave that have especially good approximations to the just fifth:

```
>>> let n = (3 / 2).log2;
>>> let c = n.continuedFraction(7);
>>> c.semiconvergents(1E-4)
[1/1 1/2 2/3 3/5 4/7 7/12 17/29 24/41 31/53]


>>> 53.equalTemperamentTuning.asCents[31 + 1]
701.89
```

Semiconvergents to the 600-cent interval:

```
>>> let n = 2.sqrt;
>>> let c = n.continuedFraction(7);
>>> c.semiconvergents(1E-5)
[1/1 3/2 4/3 7/5 17/12 24/17 41/29 99/70 140/99 239/169]

>>> 17/12.ratioToCents
603
```

Semiconvergents to the 300-cent interval:

```
>>> let n = 2 ^ (1 / 4);
>>> let c = n.continuedFraction(4);
>>> c.semiconvergents(1E-3)
[1/1 4/3 5/4 6/5 13/11 19/16 25/21]

>>> 25/21.ratioToCents
301.85
```

* * *

See also: /, continuedFraction, convergents, fromContinuedFraction, rationalize

References:
_W_
[1](https://en.wikipedia.org/wiki/Continued_fraction#Best_rational_approximations)
