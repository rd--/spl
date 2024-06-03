# randomComplex

- _randomComplex(r, min, max)_
- _randomComplex(r, alpha)_ => _randomComplex(r, 0j0, alpha)_

Answer a pseudo-random complex number in the rectangle with corners given by the complex numbers _min_ and _max_.

```
>>> system.randomComplex(0j0, 1j1).arg <= 0.5.pi
true
```

* * *

See also: randomFloat

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomComplex.html)
