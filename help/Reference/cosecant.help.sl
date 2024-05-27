# cosecant

- _cosecant(aNumber)_

Answer the cosecant of _aNumber_.

Equal to the reciprocal of `sin`:

```
>>> (pi / 2).cosecant
(1 / (pi / 2).sin)
```

At `SmallFloat`:

```
>>> 1.2.cosecant
1.07292
```

At `Complex`:

```
>>> 2.5J1.cosecant
0.53096J0.54132
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].cosecant
[1.0729 1.0025 1.0269]
```

* * *

See also: cotangent, secant, sin

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Csc.html)
