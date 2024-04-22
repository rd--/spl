# positiveResidue

- _positiveResidue(anInteger, modulus)_

Answer the positive residue of _anInteger_ (mod _modulus_),
in which _modulus_ is the representive in place of `zero`,
as in `commonResidue`.

```
>>> (0, 5 .. 20).collect { :each |
>>> 	each.positiveResidue(4)
>>> }
[4 1 2 3 4]
```

* * *

See also: %, minimalResidue, positiveResidue
