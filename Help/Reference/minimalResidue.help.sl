# minimalResidue

- _minimalResidue(n, m)_

Answer the minimal residue of the integer _n_ modulo _m_.

```
>>> (0, 5 .. 20).collect { :each |
>>> 	each.minimalResidue(4)
>>> }
[0 1 -2 -1 0]

>>> (-1 .. 4).collect { :each |
>>> 	each.minimalResidue(4)
>>> }
[-1 0 1 -2 -1 0]

>>> (-1 .. 4).collect { :each |
>>> 	each.commonResidue(4)
>>> }
[3 0 1 2 3 0]
```

* * *

See also: %, commonResidue, positiveResidue, Residue

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MinimalResidue.html)
