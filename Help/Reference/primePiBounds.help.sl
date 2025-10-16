# primePiBounds

- _primePiBounds(x)_

Answer an `Interval` giving an upper and lower bound for the value of `primePi` of _x_.

```
>>> 99999.primePiBounds
(7400 -- 13310)

>>> 99999.primePi
9592

>>> let x = 99999;
>>> x.primePiBounds
>>> .includes(x.primePi)
true
```

* * *

See also: primePi, primeBounds

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeNumberTheorem.html),
_W_
[1](https://en.wikipedia.org/wiki/Prime_number_theorem)
