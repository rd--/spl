# sierpinskiConstant

- _sierpinskiConstant(n)_

The Sierpiński constant _S_.

```
>>> 1.sierpinskiConstant
0.822826

>>> let a = 1.pi ^ 3;
>>> let b = 2.eulerGamma.exp;
>>> log(4 * a * b / (gamma(1 / 4) ^ 4))
0.822826
```

The Sierpiński constant _K_ is _Sπ_:

```
>>> 1.sierpinskiConstant * 1.pi
2.584982

>>> let a = 1.pi ^ 2;
>>> let b = 2.eulerGamma.exp;
>>> let c = 2 * (1.lemniscateConstant ^ 2);
>>> (a * b / c).log * 1.pi
2.584982
```

* * *

See also: exp, eulerGamma, lemniscateConstant, log, pi

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SierpinskiConstant.html),
_OEIS_
[1](https://oeis.org/A241017)
[2](https://oeis.org/A062089),
_W_
[1](https://en.wikipedia.org/wiki/Sierpi%C5%84ski%27s_constant)
