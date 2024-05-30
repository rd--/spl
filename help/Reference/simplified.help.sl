# simplified

- simplified(anObject)_

Answer a simplified form of an _anObject_, without changing an _anOject_ in the process.

At `Fraction`:

```
>>> let p = ReducedFraction(2, 4);
>>> let q = p.simplified;
>>> (q, p ~= q)
(1/2, true)
```

* * *

See also: Fraction, ReducedFraction, simplify
