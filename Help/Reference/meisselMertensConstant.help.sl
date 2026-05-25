# meisselMertensConstant

- _meisselMertensConstant(n)_

Answer _n_ times the Meissel-Mertens constant.

```
>>> 1.meisselMertensConstant
0.2615
```

The binary form answers a `Decimal` value to the indicated precision,
OEIS [A077761](https://oeis.org/A077761):

>>> 1.meisselMertensConstant(32)
0.26149721284764278375542683860869D
```

In the limit, the sum of the reciprocals of the primes less than _n_,
and the function _ln(ln(n))_ are separated by the Meissel–Mertens constant:

```
>>> let k = 2000;
>>> let p = k.primesList;
>>> let n = p.last;
>>> (1 / p).sum - (n + 1).log.log
0.26223
```

* * *

See also: eulerGamma

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MertensConstant.html),
_OEIS_
[1](https://oeis.org/A077761),
_W_
[1](https://en.wikipedia.org/wiki/Meissel%E2%80%93Mertens_constant)
