# positiveResidue

- _positiveResidue(n, m)_

Answer the positive residue of the integer _n_ modulo _m_,
in which _m_ is the representive in place of `zero`,
as in `commonResidue`.

```
>>> (0, 5 .. 20).collect { :each |
>>> 	each.positiveResidue(4)
>>> }
[4 1 2 3 4]
```

* * *

See also: %, minimalResidue, positiveResidue, Residue
