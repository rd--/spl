# simplified

- _simplified(x)_

Answer a simplified form of an the object _x_,
without changing an _x_ in the process.

At `Fraction`:

```
>>> let p = ReducedFraction(2, 4);
>>> let q = p.simplified;
>>> (q, p != q)
(1/2, true)
```

* * *

See also: Fraction, normal, ReducedFraction, simplify
