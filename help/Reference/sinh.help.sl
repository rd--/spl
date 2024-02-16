# sinh

_sinh(aNumber)_

Answer the hyperbolic sine of _aNumber_.

```
>>> 1.4.sinh
1.90430
```
Sinh can take complex number inputs:

```
>>> 2.5j1.sinh
3.26894j5.16014
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].sinh
[1.50946 2.12928 2.94217]
```

Plot over a subset of the reals:

```
(-4, -3.99 .. 4).sinh.plot
```

* * *

See also: arcSinh, cosh, csch

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HyperbolicSine.html)
[2](https://reference.wolfram.com/language/ref/Sinh.html)
