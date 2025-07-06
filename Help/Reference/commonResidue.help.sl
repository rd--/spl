# commonResidue

- _commonResidue(n, m)_

Answer the common residue of _n_ (modulo _m_).

```
>>> (0, 5 .. 20).collect { :each |
>>> 	each.commonResidue(4)
>>> }
[0 1 2 3 0]

>>> (0, 5 .. 20) % 4
[0 1 2 3 0]
```

* * *

See also: %, minimalResidue, positiveResidue

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CommonResidue.html)
