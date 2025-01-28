# secant

- _secant(aNumber)_

Answer the secant of _aNumber_.

Equal to the reciprocal of `cos`:

```
>>> 1/6.pi.secant
1 / 1/6.pi.cos
```

At `SmallFloat`:

```
>>> 1/6.pi.secant
2 / 3.sqrt
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].secant
[2.7597 14.1368 -4.4014]
```

* * *

See also: cosecant, sin

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Sec.html)
