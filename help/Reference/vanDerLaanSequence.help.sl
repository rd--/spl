# vanDerLaanSequence

- _vanDerLaanSequence(anInteger)_

Answer the first _anInteger_ items of the van der Laan sequence.

The first 23 entries, c.f. OEIS A182097:

```
>>> 23.vanDerLaanSequence
[1 0 1 1 1 2 2 3 4 5 7 9 12 16 21 28 37 49 65 86 114 151 200]
```

The table of the eight van der Laan measures:

```
>>> let m = [1 4/3 7/4 7/3 3/1 4/1 16/3 7/1];
>>> m.ratios
[4/3 21/16 4/3 9/7 4/3 4/3 21/16]
```

The measures approximate seven iterations of multiplication by the plastic ratio:

```
>>> { :n |
>>> 	n * 1.plasticRatio
>>> }.nestList(1, 7).collect { :n |
>>> 	n.asFraction(0.08)
>>> }
[1/1 4/3 7/4 7/3 3/1 4/1 16/3 36/5]
```

The defining ratio is given by the expression:

```
>>> let r = 2 / ((3 / 4) + ((1 / 7) ^ (1 / 7)));
>>> r - 1.plasticRatio < 0.005
true
```

* * *

See also: plasticRatio

References:
_OEIS_
[1](https://oeis.org/A182097)

Further Reading: Spinadel 2009
