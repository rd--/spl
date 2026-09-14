# simplified

- _simplified(x)_

Answer a simplified form of an the object _x_,
without changing _x_ in the process.

At `Fraction`:

```
>>> let p = uncheckedFraction(2, 4);
>>> let q = p.simplified;
>>> (q, p != q)
(1/2, true)
```

* * *

See also: Fraction, normal, simplify, uncheckedFraction
