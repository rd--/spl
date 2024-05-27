# secant

- _secant(aNumber)_

Answer the secant of _aNumber_.

Equal to the reciprocal of `cos`:

```
>>> (pi / 6).secant
(1 / (pi / 6).cos)
```

At `SmallFloat`:

```
>>> (pi / 6).secant
(2 / 3.sqrt)
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
