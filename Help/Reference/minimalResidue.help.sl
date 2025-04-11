# minimalResidue

- _minimalResidue(anInteger, modulus)_

Answer the minimal residue of _anInteger_ (mod _modulus_).

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

See also: %, commonResidue

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MinimalResidue.html)
